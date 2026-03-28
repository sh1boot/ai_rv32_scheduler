"""
rv32_scheduler.py

RV32 instruction scheduler: reads assembly source, reorders instructions
within basic blocks to maximise pairing opportunities, and emits the
reordered assembly with PAIR+ annotations.

Usage
-----
    python rv32_scheduler.py input.s
    python rv32_scheduler.py input.s --scorer compact32
    python rv32_scheduler.py input.s --no-rename -v
    python rv32_scheduler.py --list-rules
    python rv32_scheduler.py -          # read from stdin

Python API
----------
    from rv32_scheduler import AssemblyScheduler
    from rv32_core import Instruction

    def my_score(a: Instruction, b: Instruction) -> float:
        if a.mnemonic == "fmul.s" and b.mnemonic == "fadd.s":
            return 5.0
        return 0.0

    sched = AssemblyScheduler(open("loop.s").read())
    print(sched.emit(pair_score=my_score))
"""

import re
import sys
import argparse
import copy
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Callable

from rv32_core import (
    Instruction,
    DepGraph,
    parse_line,
    build_dep_graph,
    compute_liveness,
    _INT_ABI, _FP_ABI,
)
from rv32_scorers import (
    PairScoreFn,
    can_compress,
    _compress_pair_score,
    COMPACT32_RULES,
    SCORERS,
)

# ---------------------------------------------------------------------------
# Pair statistics
# ---------------------------------------------------------------------------

@dataclass
class PairStats:
    """
    Summary statistics produced by a single emit() call.

    Per-rule counters
    -----------------
    All three counters operate on strict non-overlapping pair slots
    (0,1), (2,3), … only — the actual pairs the hardware would see.
    First-match priority is used throughout so the numbers add up cleanly
    and the rule list order becomes an explicit experiment axis.

    rule_counts  : {rule_name: int}
        Pairs *won* by this rule — it was the first rule to match and the
        pair slot was successfully filled.  This is the definitive measure
        of a rule's contribution.

    rule_shadow  : {rule_name: int}
        Pairs where this rule matched but a *higher-priority* rule in the
        list also matched and won the slot.  A high shadow count means the
        rule is being crowded out; promoting it in the list would convert
        shadows into wins (at the cost of the shadowing rule's wins).

    rule_missed  : {rule_name: int}
        Pair slots where this rule matched *neither* instruction combination
        in the slot (i.e. pair_score was 0 for the slot as a whole), but the
        rule *did* fire on the same two instructions when tested independently.
        A high missed count suggests the scheduler couldn't align this rule's
        matches to winnable slots, often due to dependency constraints.

    rvc_eligible : int
        Instructions in the final scheduled sequence satisfying can_compress().
        Reference ceiling: floor(rvc_eligible / 2) is the maximum achievable
        RVC pairs if every eligible instruction could be matched with another.

    Size estimate
    -------------
    estimated_bytes : 4 bytes per successful pair + 4 bytes per unpaired instr
    baseline_bytes  : 4 bytes × total_instrs (no pairing at all)
    saving_bytes    : baseline_bytes - estimated_bytes
    saving_pct      : saving_bytes / baseline_bytes × 100
    """
    total_instrs:     int
    paired_instrs:    int
    unpaired_instrs:  int
    possible_pairs:   int
    successful_pairs: int
    rule_counts:      dict   # {rule: pairs won}
    rule_shadow:      dict   # {rule: pairs matched but lost to higher-priority rule}
    rule_missed:      dict   # {rule: pairs matched but slot was already a non-pair}
    rvc_eligible:     int
    estimated_bytes:  int
    baseline_bytes:   int
    saving_bytes:     int
    saving_pct:       float

    def summary_lines(self) -> list:
        """Return comment lines suitable for appending to assembly output."""
        lines = [
            f"# pairs:     {self.successful_pairs}/{self.possible_pairs}"
            f"  ({self.paired_instrs} of {self.total_instrs} instructions paired)",
        ]
        all_rules = sorted(
            set(self.rule_counts) | set(self.rule_shadow) | set(self.rule_missed),
            key=lambda r: -self.rule_counts.get(r, 0)
        )
        for rule in all_rules:
            won    = self.rule_counts.get(rule, 0)
            shadow = self.rule_shadow.get(rule, 0)
            missed = self.rule_missed.get(rule, 0)
            label  = rule if rule else "(unnamed)"
            parts  = [f"{won} won"]
            if shadow: parts.append(f"{shadow} shadowed")
            if missed: parts.append(f"{missed} missed")
            lines.append(f"#   {label}: {'  '.join(parts)}")
        if self.rvc_eligible:
            lines.append(
                f"# rvc eligible: {self.rvc_eligible} instructions"
                f"  (ceiling {self.rvc_eligible // 2} rvc pairs)"
            )
        lines.append(
            f"# size est:  {self.estimated_bytes} bytes"
            f"  (baseline {self.baseline_bytes},"
            f" saving {self.saving_bytes} = {self.saving_pct:.1f}%)"
        )
        return lines


def count_pairs(sequence: list, pair_score: PairScoreFn) -> int:
    """
    Count successful pairs using the greedy-advance model.

    Walk the sequence left-to-right.  At each position, attempt to pair
    the current instruction with the next:

      - If pair_score(current, next) > 0: count one pair, advance by 2.
      - Otherwise: emit the current as a singleton, advance by 1.

    A singleton never prevents the following instruction from pairing.
    This gives 32-bit alignment: each singleton or pair occupies exactly
    one 32-bit word, and the next word boundary immediately follows.
    """
    count = 0
    i = 0
    while i < len(sequence) - 1:
        if pair_score(sequence[i], sequence[i + 1]) > 0:
            count += 1
            i += 2
        else:
            i += 1
    return count


# ---------------------------------------------------------------------------
# Branch-and-bound optimal scheduler
# ---------------------------------------------------------------------------

# Maximum window size for a single BnB pass.  Sequences longer than this are
# partitioned into windows of this size, each scheduled independently.
# Must be even so pair-slot alignment is preserved across window boundaries.
#
# Why windowing is necessary: even when the ready set is tiny (2-3 entries),
# a long sequence produces millions of search nodes because many orderings
# achieve the same optimal score and the pruning condition never fires — the
# tree exhausts all equivalent orderings rather than stopping at the first.
# Windowing bounds the search to a local region where this cannot happen.
_BNB_WINDOW = 16


def _bnb_schedule_window(
    instructions: list,
    graph: DepGraph,
    pair_score: PairScoreFn,
    pair_offset: int = 0,   # retained for API compatibility; unused internally
) -> list:
    """
    Run BnB over a contiguous slice *instructions* drawn from *graph*.

    Uses the greedy-advance pairing model: at each position, the current
    instruction pairs with the next if pair_score > 0, otherwise it is
    emitted as a singleton and the following instruction is a fresh
    candidate.  This means a singleton never prevents the next instruction
    from pairing.
    """
    idx_map: dict = {i.index: i for i in instructions}
    local_indices: set = set(idx_map)
    n = len(instructions)

    # Build in-degrees restricted to edges within the window.
    local_indeg: dict = {i.index: 0 for i in instructions}
    for instr in instructions:
        for succ in graph.successors[instr.index]:
            if succ in local_indices:
                local_indeg[succ] += 1

    best: list = [None]
    best_score: list = [-1]
    max_possible: int = n // 2
    # Search limits:
    # NODE_BUDGET  — hard cap on total nodes visited.
    # STAGNATION   — stop if best score hasn't improved in this many nodes.
    #               The BnB typically finds its best solution within the first
    #               few hundred nodes; the rest confirm no better exists.
    #               Stagnation catches the common case early so we don't spend
    #               50k nodes verifying an already-optimal result.
    nodes_visited:  list = [0]
    last_improved:  list = [0]
    NODE_BUDGET:    int  = 50_000
    STAGNATION:     int  = 5_000

    def bound(pos: int, prev_free: bool) -> int:
        remaining = n - pos
        if prev_free and remaining > 0:
            return 1 + (remaining - 1) // 2
        return remaining // 2

    def search(scheduled: list, ready: set, indeg: dict,
               current_score: int, prev_free: bool):
        """
        prev_free  – True when the last scheduled instruction was emitted as
                     a singleton and has not yet been paired.  It is a
                     candidate to pair with the next instruction chosen.
        """
        pos = len(scheduled)

        if current_score + bound(pos, prev_free) <= best_score[0]:
            return

        if pos == n:
            if current_score > best_score[0]:
                best_score[0] = current_score
                best[0] = list(scheduled)
                last_improved[0] = nodes_visited[0]
            return

        # Precompute pair_score for the free previous instruction against
        # every candidate in the ready set.  pair_score may be expensive
        # (e.g. compact32 with regex parsing); caching it here avoids
        # calling it twice per candidate (once for sorting, once in the loop).
        if prev_free and scheduled:
            prev = scheduled[-1]
            scores = {c: pair_score(prev, idx_map[c]) for c in ready}
            candidates = sorted(ready, key=lambda c: (-scores[c], c))
        else:
            scores = {}
            candidates = sorted(ready)

        for cand in candidates:
            if best_score[0] == max_possible:
                return

            nodes_visited[0] += 1
            if nodes_visited[0] > NODE_BUDGET:
                return
            if nodes_visited[0] - last_improved[0] > STAGNATION:
                return   # no improvement in STAGNATION nodes — bail early

            instr = idx_map[cand]

            if prev_free and scheduled and scores.get(cand, 0) > 0:
                score_delta = 1
                new_prev_free = False
            else:
                score_delta = 0
                new_prev_free = True

            scheduled.append(instr)
            ready.remove(cand)
            # Decrement in-degree for all local successors and track which
            # ones crossed zero (became ready).  The undo must restore ALL
            # decremented successors — not just the newly-ready ones — to
            # prevent indeg corruption across sibling candidates.
            decremented = []
            for succ in graph.successors[cand]:
                if succ in local_indices:
                    indeg[succ] -= 1
                    decremented.append(succ)
                    if indeg[succ] == 0:
                        ready.add(succ)

            search(scheduled, ready, indeg,
                   current_score + score_delta, new_prev_free)

            scheduled.pop()
            ready.add(cand)
            for succ in decremented:
                if indeg[succ] == 0:
                    ready.remove(succ)
                indeg[succ] += 1

    initial_ready = {idx for idx, d in local_indeg.items() if d == 0}
    search([], initial_ready, dict(local_indeg),
           current_score=0, prev_free=False)

    if best[0] is None:
        # Budget exhausted before finding any complete schedule, or cycle.
        # Fall back to a simple greedy topological sort.
        remaining_indeg = dict(local_indeg)
        result = []
        ready = set(initial_ready)
        while ready:
            # Greedy: prefer candidates that pair with the last instruction.
            if result:
                prev = result[-1]
                chosen = max(ready,
                             key=lambda c: (pair_score(prev, idx_map[c]), -c))
            else:
                chosen = min(ready)
            result.append(idx_map[chosen])
            ready.remove(chosen)
            for succ in graph.successors[chosen]:
                if succ in local_indices:
                    remaining_indeg[succ] -= 1
                    if remaining_indeg[succ] == 0:
                        ready.add(succ)
        return result

    if best[0] is None:
        raise ValueError(
            f"Cycle in window at instruction {instructions[0].index}."
        )
    return best[0]


def _bnb_schedule(
    graph: DepGraph,
    pair_score: PairScoreFn,
    window_size: int = _BNB_WINDOW,
) -> list:
    """
    Schedule all instructions in *graph*, maximising strict non-overlapping
    pair count via BnB within fixed-size windows.

    For short sequences (len <= window_size) a single BnB pass is exact.
    For longer sequences the instruction list is split into windows of
    *window_size* and each is scheduled independently.  Windows are aligned
    so that pair slots never straddle a boundary.

    *window_size* must be even (default 16).
    """
    assert window_size % 2 == 0, "window_size must be even"
    all_instrs = graph.instructions
    n = len(all_instrs)
    if n == 0:
        return []
    if n <= window_size:
        return _bnb_schedule_window(all_instrs, graph, pair_score,
                                    pair_offset=0)
    result: list = []
    pos = 0
    while pos < n:
        window = all_instrs[pos : pos + window_size]
        result.extend(_bnb_schedule_window(
            window, graph, pair_score, pair_offset=len(result)
        ))
        pos += len(window)
    return result


# ---------------------------------------------------------------------------
# Destination-register renaming
# ---------------------------------------------------------------------------

# All integer and FP architectural registers (excluding x0 / f0 which are
# special or hardwired).
_ALL_INT_REGS = frozenset(f"x{n}" for n in range(1, 32))
_ALL_FP_REGS  = frozenset(f"f{n}" for n in range(0, 32))


def _reg_family(reg: str) -> str:
    """Return 'int', 'fp', or 'vec' depending on register prefix."""
    if reg.startswith("x"):
        return "int"
    if reg.startswith("f"):
        return "fp"
    return "vec"


def rename_destinations(
    scheduled: list,
    graph: DepGraph,
    pair_score: PairScoreFn,
    max_trials: int = 5_000,
) -> list:
    """
    Improve the pair score by renaming destination registers in two phases.

    *max_trials* caps the total number of rename candidates evaluated across
    both phases.  When the budget is exhausted the best schedule found so far
    is returned.  This bounds latency for large blocks where the rename search
    space is too large to explore fully.

    Phase 1 — Divergent rename (free-register targeting)
    ----------------------------------------------------
    For each instruction whose destination is renameable (dead after its last
    consumer), try renaming it to any free register (not live in the window)
    and keep the rename if ``count_pairs`` improves.

    Phase 2 — Convergent rename (pairing-targeted)
    -----------------------------------------------
    For each strict pair at positions (2k, 2k+1), if the pair currently scores
    zero, attempt renames that make the two instructions share registers or
    both land in the ABI temporary pool, then re-score.  Specifically:

      a) **Destination convergence**: if instruction A's destination is
         renameable and instruction B has a register (def or use) that A could
         be renamed to, try that rename.

      b) **Temporary convergence**: if both instructions in the pair write
         dead destinations, try renaming both into the ABI temporary set
         (``t0``–``t2`` = x5–x7, ``t3``–``t6`` = x28–x31).

      c) **Joint rename of both A and B**.

    A register is *renameable* at position P when:
      - It is not architecturally reserved (x0, ra, sp, gp, tp).
      - It is not a vector register.
      - Its defined value is dead: either no later instruction in the block
        reads it before the next write, or it is only read by instructions
        that are within the rename window.

    Safety invariant: no rename is ever applied unless ``count_pairs``
    strictly increases, so correctness is preserved by construction.

    Returns the (possibly modified) scheduled list.
    """
    scheduled = [copy.copy(i) for i in scheduled]
    n = len(scheduled)
    trials_remaining: list = [max_trials]   # mutable counter shared by helpers

    # ABI temporaries: t0-t2 (x5-x7) and t3-t6 (x28-x31)
    _TEMPORARIES = frozenset(
        {f"x{i}" for i in (5, 6, 7, 28, 29, 30, 31)}
    )
    # Registers that must never be rename targets
    _RESERVED = frozenset({"x0", "x1", "x2", "x3", "x4"})

    # ------------------------------------------------------------------
    # Precomputed tables rebuilt once per outer iteration (O(N) each).
    #
    # live_table[pos]  – registers live at the start of position pos
    # free_table[pos]  – the prev_free state entering position pos in the
    #                    greedy-advance walk of `scheduled`.
    # ------------------------------------------------------------------
    def _build_live_table() -> list:
        t = [None] * (n + 1)
        t[n] = set()
        for pos in range(n - 1, -1, -1):
            instr = scheduled[pos]
            live = set(t[pos + 1])
            for r in instr.defs: live.discard(r)
            for r in instr.uses: live.add(r)
            t[pos] = live
        return t

    def _build_free_table() -> list:
        """Compute prev_free state for each position in O(N)."""
        ft = [False] * (n + 1)
        i = 0
        while i < n:
            if i + 1 < n and pair_score(scheduled[i], scheduled[i + 1]) > 0:
                # i pairs with i+1: i+2 starts fresh (prev was consumed)
                if i + 2 <= n: ft[i + 2] = False
                i += 2
            else:
                # i is singleton: i+1 sees prev_free=True
                if i + 1 <= n: ft[i + 1] = True
                i += 1
        return ft

    live_table: list = _build_live_table()
    free_table: list = _build_free_table()

    def rename_window(pos: int, rd: str):
        """
        Return (window_end, live_at_pos) for renaming instruction at *pos*
        whose destination is *rd*, or None if the rename is not permitted.

        window_end  : last position that must be patched (inclusive)
        live_at_pos : set of registers live at pos (excluding rd)
        """
        if rd in _RESERVED or _reg_family(rd) == "vec":
            return None
        last_use_pos = None
        next_def_pos = None
        for j in range(pos + 1, n):
            other = scheduled[j]
            if rd in other.uses:
                last_use_pos = j
            if rd in other.defs:
                next_def_pos = j
                break
        if last_use_pos is not None and (
            next_def_pos is None or last_use_pos < next_def_pos
        ):
            window_end = last_use_pos
        elif last_use_pos is None:
            window_end = pos          # dead-on-write: only patch the def line
        else:
            return None               # live past a redefinition — unsafe
        live_at = set(live_table[pos])   # O(1) lookup into precomputed table
        live_at.discard(rd)
        return window_end, live_at

    def window_conflict(new_reg: str, pos: int, window_end: int) -> bool:
        """True if new_reg appears in any instruction strictly inside the window."""
        for j in range(pos + 1, window_end + 1):
            other = scheduled[j]
            if new_reg in other.defs or new_reg in other.uses:
                return True
        return False

    def _pair_score_at(pos: int) -> float:
        """Score of the strict pair whose first slot is at even position pos."""
        if pos % 2 != 0 or pos + 1 >= n:
            return 0.0
        return pair_score(scheduled[pos], scheduled[pos + 1])

    # If the scoring function holds a mutable liveness cell (e.g. compact32),
    # capture it so try_rename can refresh it during trial scoring.
    _liveness_cell = getattr(pair_score, "_liveness_cell", None)

    def _refresh_liveness():
        """Recompute and install fresh liveness if the scorer needs it."""
        if _liveness_cell is not None:
            _liveness_cell[0] = compute_liveness(scheduled)

    def try_rename(pos: int, rd: str, new_rd: str, score_before: int):
        """
        Attempt to rename *rd* -> *new_rd* at position *pos*.
        Returns (new_score,) if it improves (rename committed in-place),
        else None (rename rolled back, scheduled unchanged).
        """
        if trials_remaining[0] <= 0:
            return None
        trials_remaining[0] -= 1
        info = rename_window(pos, rd)
        if info is None:
            return None
        window_end, live_at = info
        if new_rd in live_at or new_rd in _RESERVED:
            return None
        if _reg_family(new_rd) != _reg_family(rd):
            return None
        if window_conflict(new_reg=new_rd, pos=pos, window_end=window_end):
            return None

        # Score delta: rescan from one position before the rename window to
        # one position after it.  This is O(window_length) rather than O(N).
        # We need the "prev_free" state at the start of the scan region,
        # which requires walking from the beginning — but we cache it.
        scan_lo = max(0, pos - 1)
        scan_hi = min(n - 1, window_end + 1)

        def _local_score(seq):
            """Greedy pair count over seq[scan_lo..scan_hi].
            The prev_free state at scan_lo is read from free_table (O(1))."""
            pf = free_table[scan_lo]
            count = 0
            i = scan_lo
            while i <= scan_hi and i < len(seq):
                if i + 1 < len(seq) and pair_score(seq[i], seq[i+1]) > 0:
                    count += 1; pf = False; i += 2
                else:
                    pf = True; i += 1
            return count

        score_before_local = _local_score(scheduled)

        # Apply in-place, keeping undo info in case we need to roll back.
        undo = _apply_rename(scheduled, pos, window_end, rd, new_rd)
        _refresh_liveness()   # scorer may need updated liveness

        score_after_local = _local_score(scheduled)

        if score_after_local > score_before_local:
            # Committed.  Recompute global score as delta from previous.
            new_score = score_before + (score_after_local - score_before_local)
            return (new_score,)
        else:
            _undo_rename(scheduled, undo)
            _refresh_liveness()  # restore liveness to pre-rename state
            return None

    # -------------------------------------------------------------------------
    # Phase 1: Divergent rename — any free register that improves the score
    # -------------------------------------------------------------------------
    changed = True
    while changed:
        changed = False
        live_table = _build_live_table()   # rebuild once per pass, O(N)
        free_table = _build_free_table()
        score_before = count_pairs(scheduled, pair_score)   # O(N) once per pass
        for pos, instr in enumerate(scheduled):
            if not instr.defs:
                continue
            rd = instr.defs[0]
            info = rename_window(pos, rd)
            if info is None:
                continue
            window_end, live_at = info
            if _reg_family(rd) == "int":
                pool = _ALL_INT_REGS
            else:
                pool = _ALL_FP_REGS
            candidates = sorted(pool - live_at - _RESERVED - {rd})
            for new_rd in candidates:
                result = try_rename(pos, rd, new_rd, score_before)
                if result is not None:
                    (score_before,) = result  # committed in-place
                    live_table = _build_live_table()
                    changed = True
                    break

    # -------------------------------------------------------------------------
    # Phase 2: Convergent rename — rename toward partner's registers or temps
    # -------------------------------------------------------------------------
    changed = True
    while changed:
        changed = False
        live_table = _build_live_table()   # rebuild once per pass, O(N)
        score_before = count_pairs(scheduled, pair_score)

        for pair_start in range(0, n - 1, 2):
            a = scheduled[pair_start]
            b = scheduled[pair_start + 1]

            if pair_score(a, b) > 0:
                continue   # already a successful pair

            # Collect candidate target registers from both instructions in the
            # pair, plus the ABI temporary set — these are the "attractive"
            # values to converge toward.
            partner_regs: set = set()
            for instr in (a, b):
                partner_regs.update(instr.defs)
                partner_regs.update(instr.uses)
            partner_regs.update(_TEMPORARIES)
            partner_regs -= _RESERVED
            partner_regs.discard("x0")

            def try_convergent(pos_src: int, rd_src: str,
                                target: str, score_ref: int,
                                allow_partner_def: bool = False):
                """
                Like try_rename but optionally permits the target to be live
                only because the partner instruction defines it.
                Returns (new_score,) on success (committed in-place), else None.
                """
                if _reg_family(target) != _reg_family(rd_src):
                    return None
                if target in _RESERVED:
                    return None
                info = rename_window(pos_src, rd_src)
                if info is None:
                    return None
                window_end, live_at = info

                if target in live_at:
                    if not allow_partner_def:
                        return None
                    partner_pos = pair_start + 1 if pos_src == pair_start else pair_start
                    partner = scheduled[partner_pos]
                    if target not in partner.defs:
                        return None
                    for j in range(window_end + 1, n):
                        if target in scheduled[j].uses:
                            return None
                        if target in scheduled[j].defs:
                            break
                    for j in range(pos_src + 1, window_end + 1):
                        if j == partner_pos:
                            continue
                        if target in scheduled[j].uses or target in scheduled[j].defs:
                            return None

                if window_conflict(new_reg=target, pos=pos_src,
                                   window_end=window_end):
                    partner_pos = pair_start + 1 if pos_src == pair_start else pair_start
                    if window_end >= partner_pos:
                        real_conflict = any(
                            target in scheduled[j].defs or target in scheduled[j].uses
                            for j in range(pos_src + 1, window_end + 1)
                            if j != partner_pos
                        )
                        if real_conflict:
                            return None
                    else:
                        return None

                scan_lo_c = max(0, pos_src - 1)
                scan_hi_c = min(n - 1, window_end + 1)
                def _local_c(seq, lo=scan_lo_c, hi=scan_hi_c):
                    pf = free_table[lo]; i = lo; cnt = 0
                    while i <= hi and i < len(seq):
                        if i+1 < len(seq) and pair_score(seq[i], seq[i+1]) > 0:
                            cnt += 1; pf = False; i += 2
                        else:
                            pf = True; i += 1
                    return cnt
                sb_c = _local_c(scheduled)
                undo = _apply_rename(scheduled, pos_src, window_end, rd_src, target)
                sa_c = _local_c(scheduled)
                if sa_c > sb_c:
                    return (score_ref + sa_c - sb_c,)
                _undo_rename(scheduled, undo)
                return None

            # (a) Single rename of A toward B's registers / temps
            if a.defs:
                rd_a = a.defs[0]
                for target in sorted(partner_regs - {rd_a}):
                    result = try_convergent(pair_start, rd_a, target,
                                            score_before, allow_partner_def=True)
                    if result is not None:
                        (score_before,) = result
                        changed = True
                        break

            if changed:
                break

            # (b) Single rename of B toward A's registers / temps
            b = scheduled[pair_start + 1]
            if b.defs:
                rd_b = b.defs[0]
                for target in sorted(partner_regs - {rd_b}):
                    result = try_convergent(pair_start + 1, rd_b, target,
                                            score_before, allow_partner_def=True)
                    if result is not None:
                        (score_before,) = result
                        changed = True
                        break

            if changed:
                break

            # (c) Joint rename of both A and B (in-place with undo)
            a = scheduled[pair_start]
            b = scheduled[pair_start + 1]
            if a.defs and b.defs:
                rd_a, rd_b = a.defs[0], b.defs[0]
                info_a = rename_window(pair_start,     rd_a)
                info_b = rename_window(pair_start + 1, rd_b)
                if info_a is not None and info_b is not None:
                    _, live_a = info_a
                    _, live_b = info_b
                    free_a = sorted(
                        (_ALL_INT_REGS if _reg_family(rd_a) == "int" else _ALL_FP_REGS)
                        - live_a - _RESERVED - {rd_a}
                    )
                    free_b = sorted(
                        (_ALL_INT_REGS if _reg_family(rd_b) == "int" else _ALL_FP_REGS)
                        - live_b - _RESERVED - {rd_b}
                    )
                    targets_a = [t for t in free_a if t in partner_regs and t != rd_b]
                    targets_b = [t for t in free_b if t in partner_regs and t != rd_a]
                    # Affected pairs for this joint rename (covers both slots)
                    jlo = max(0, pair_start - 1)
                    jhi = min(n - 1, max(info_a[0], info_b[0]) + 1)
                    def _local_j(seq, lo=jlo, hi=jhi):
                        pf = free_table[lo]; i = lo; cnt = 0
                        while i <= hi and i < len(seq):
                            if i+1 < len(seq) and pair_score(seq[i], seq[i+1]) > 0:
                                cnt += 1; pf = False; i += 2
                            else:
                                pf = True; i += 1
                        return cnt
                    score_before_joint = _local_j(scheduled)
                    for ta in targets_a[:8]:
                        for tb in targets_b[:8]:
                            if ta == tb:
                                continue
                            if (window_conflict(ta, pair_start,     info_a[0]) or
                                window_conflict(tb, pair_start + 1, info_b[0])):
                                continue
                            undo_a = _apply_rename(scheduled, pair_start,
                                                   info_a[0], rd_a, ta)
                            undo_b = _apply_rename(scheduled, pair_start + 1,
                                                   info_b[0], rd_b, tb)
                            score_after_joint = _local_j(scheduled)
                            if score_after_joint > score_before_joint:
                                score_before = score_before + score_after_joint - score_before_joint
                                changed = True
                                break
                            _undo_rename(scheduled, undo_b)
                            _undo_rename(scheduled, undo_a)
                        if changed:
                            break

            if changed:
                break

    return scheduled


def _apply_rename(scheduled: list, start: int, end: int,
                  old_reg: str, new_reg: str) -> list:
    """
    In-place: rename ``old_reg`` -> ``new_reg`` in the def of
    ``scheduled[start]`` and in the uses of ``scheduled[start..end]``.
    Also patches ``instr.raw``.

    Returns an *undo list* — a list of ``(pos, old_defs, old_uses, old_raw)``
    tuples sufficient to reverse the rename exactly.  Pass it to
    ``_undo_rename`` to roll back.
    """
    undo = []
    for pos in range(start, end + 1):
        instr = scheduled[pos]
        old_defs = instr.defs
        old_uses = instr.uses
        old_raw  = instr.raw
        if pos == start:
            instr.defs = [new_reg if r == old_reg else r for r in instr.defs]
        instr.uses = [new_reg if r == old_reg else r for r in instr.uses]
        aliases_old = {old_reg}
        for abi, canon in {**_INT_ABI, **_FP_ABI}.items():
            if canon == old_reg:
                aliases_old.add(abi)
        for alias in aliases_old:
            instr.raw = re.sub(
                r'\b' + re.escape(alias) + r'\b',
                new_reg,
                instr.raw,
                flags=re.IGNORECASE,
            )
        undo.append((pos, old_defs, old_uses, old_raw))
    return undo


def _undo_rename(scheduled: list, undo: list):
    """Reverse an ``_apply_rename`` using the undo list it returned."""
    for pos, old_defs, old_uses, old_raw in undo:
        instr = scheduled[pos]
        instr.defs = old_defs
        instr.uses = old_uses
        instr.raw  = old_raw


# ---------------------------------------------------------------------------
# High-level API
# ---------------------------------------------------------------------------

class AssemblyScheduler:
    """
    Parse, analyse, and emit a reordered RV32 assembly string.

    sched = AssemblyScheduler(source_text)
    print(sched.emit(pair_score=my_fn))
    """

    def __init__(self, source: str):
        self.source = source
        self.graph = None
        self._items: list = []
        self.last_stats: "PairStats | None" = None

    def analyse(self):
        instr_index = 0
        instructions: list = []
        for line in self.source.splitlines():
            stripped = line.strip()

            is_blank_or_comment = (
                not stripped
                or stripped.startswith(("#", ";", "//"))
            )
            is_directive = stripped.startswith(".")
            is_label    = bool(re.match(r"^\w+\s*:", stripped))

            if is_blank_or_comment or is_directive:
                self._items.append(("pass", line))
                continue

            if is_label:
                # Labels are emitted as pass-through text, but they also act
                # as full scheduling barriers: no instruction may be reordered
                # from one side of a label to the other, because external code
                # may branch to the label and expect to find the original
                # instruction sequence on both sides.
                sentinel = Instruction(
                    index    = instr_index,
                    raw      = "",           # never emitted
                    mnemonic = "__label__",  # sentinel mnemonic
                )
                sentinel.is_barrier = True
                instr_index += 1
                instructions.append(sentinel)
                self._items.append(("pass", line))
                self._items.append(("instr", sentinel))
                continue

            instr = parse_line(instr_index, line)
            if instr is None:
                self._items.append(("pass", line))
            else:
                instr_index += 1
                instructions.append(instr)
                self._items.append(("instr", instr))
        self.graph = build_dep_graph(instructions)

    @property
    def liveness(self) -> dict:
        """
        Dict mapping each instruction index to a frozenset of register names
        that are read for the last time by that instruction (dead-after-use).
        Populated after analyse() is called.
        """
        if self.graph is None:
            self.analyse()
        if not hasattr(self, "_liveness"):
            self._liveness = compute_liveness(self.graph.instructions)
        return self._liveness

    def emit(self, pair_score: PairScoreFn = _compress_pair_score,
             rename: bool = True) -> str:
        """
        Schedule and emit the reordered assembly.

        Parameters
        ----------
        pair_score : callable(a, b) -> float
            Scoring function for adjacent instruction pairs.  The default
            rewards RVC-compressible instruction pairs.
        rename : bool
            If True (default), attempt destination-register renaming after
            scheduling to improve the pair score further.

        The returned string includes a trailing summary comment block.
        """
        if self.graph is None:
            self.analyse()

        scheduled = _bnb_schedule(self.graph, pair_score)

        # Strip sentinel barrier instructions (label markers) before liveness
        # analysis, renaming, and scoring — they have no register effects and
        # must not appear in the emitted output.
        real_scheduled = [i for i in scheduled if i.mnemonic != "__label__"]

        # Refresh liveness over the scheduled sequence before any scoring.
        if hasattr(pair_score, "_liveness_cell"):
            pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

        if rename:
            real_scheduled = rename_destinations(
                real_scheduled, self.graph, pair_score)
            if hasattr(pair_score, "_liveness_cell"):
                pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

        # --- Build output lines, interleaving pass-through items ---
        # Map from instruction original index -> position in `scheduled`
        # (including sentinels) so pass-through anchoring is correct.
        sched_pos = {i.index: p for p, i in enumerate(scheduled)}
        # Map from instruction original index -> position in `real_scheduled`
        # (sentinels removed) so PAIR+ annotations index correctly.
        real_pos = {i.index: p for p, i in enumerate(real_scheduled)}

        before_pos: dict = defaultdict(list)
        pending: list = []
        for kind, val in self._items:
            if kind == "pass":
                pending.append(val)
            else:
                sp = sched_pos.get(val.index)
                if sp is not None:
                    before_pos[sp].extend(pending)
                    pending.clear()

        # --- Annotate pairs, build stats, append summary ---
        total_instrs   = len(real_scheduled)
        successful     = 0
        describe_fn    = getattr(pair_score, "_describe_pair", None)

        pair_starts = []  # positions of the first instruction in each pair
        pair_rules  = {}  # position -> winning rule name

        rule_counts: dict = {}
        rule_shadow: dict = {}
        rule_missed: dict = {}

        rule_list     = getattr(pair_score, "_rule_list", None)
        liveness_snap = (pair_score._liveness_cell[0]
                         if hasattr(pair_score, "_liveness_cell") else {})

        i = 0
        while i < total_instrs:
            if i + 1 < total_instrs:
                a_s, b_s = real_scheduled[i], real_scheduled[i + 1]
                slot_scores = pair_score(a_s, b_s) > 0

                if rule_list is not None:
                    matching_rules = [
                        rname for rname, rfn in rule_list
                        if rfn(a_s, b_s, liveness_snap)
                    ]
                    if matching_rules:
                        winner = matching_rules[0]
                        if slot_scores:
                            pair_starts.append(i)
                            pair_rules[i] = winner
                            successful += 1
                            rule_counts[winner] = rule_counts.get(winner, 0) + 1
                            for rname in matching_rules[1:]:
                                rule_shadow[rname] = rule_shadow.get(rname, 0) + 1
                            i += 2
                            continue
                        else:
                            rule_missed[winner] = rule_missed.get(winner, 0) + 1
                else:
                    if slot_scores:
                        pair_starts.append(i)
                        rule = describe_fn(a_s, b_s) if describe_fn else ""
                        pair_rules[i] = rule
                        successful += 1
                        rule_counts[rule] = rule_counts.get(rule, 0) + 1
                        i += 2
                        continue
            # No pair formed at position i: singleton
            i += 1

        possible_pairs_greedy = total_instrs // 2
        rvc_eligible = sum(1 for i in real_scheduled if can_compress(i))

        paired_instrs   = successful * 2
        unpaired_instrs = total_instrs - paired_instrs
        total_words     = successful + unpaired_instrs
        estimated_bytes = total_words * 4
        baseline_bytes  = total_instrs * 4
        saving_bytes    = baseline_bytes - estimated_bytes
        saving_pct      = (saving_bytes / baseline_bytes * 100) if baseline_bytes else 0.0

        self.last_stats = PairStats(
            total_instrs     = total_instrs,
            paired_instrs    = paired_instrs,
            unpaired_instrs  = unpaired_instrs,
            possible_pairs   = possible_pairs_greedy,
            successful_pairs = successful,
            rule_counts      = rule_counts,
            rule_shadow      = rule_shadow,
            rule_missed      = rule_missed,
            rvc_eligible     = rvc_eligible,
            estimated_bytes  = estimated_bytes,
            baseline_bytes   = baseline_bytes,
            saving_bytes     = saving_bytes,
            saving_pct       = saving_pct,
        )

        # Rebuild output lines with PAIR+ annotations.
        pair_start_set = set(pair_starts)
        raw_lines: list = []
        for sp, instr in enumerate(scheduled):
            raw_lines.extend(before_pos.get(sp, []))
            if instr.mnemonic == "__label__":
                continue   # sentinel: no text emitted
            rp = real_pos.get(instr.index)
            if rp in pair_start_set:
                rule_tag = pair_rules.get(rp, "")
                tag = f"  # PAIR+ [{rule_tag}]" if rule_tag else "  # PAIR+"
                raw_lines.append(instr.raw + tag)
            else:
                raw_lines.append(instr.raw)
        raw_lines.extend(pending)
        for line in self.last_stats.summary_lines():
            raw_lines.append(line)
        return "\n".join(raw_lines)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(
        description="RV32 instruction scheduler (I,M,A,F,D,Q,C,Zicsr,Zifencei,B,V)")
    ap.add_argument("input", nargs="?", default="-")
    ap.add_argument("-v", "--verbose", action="store_true",
                    help="Dump dependency graph to stderr")
    ap.add_argument("--no-rename", dest="rename", action="store_false",
                    default=True,
                    help="Disable destination-register renaming")
    ap.add_argument("--scorer", default="rvc",
                    metavar="NAME",
                    help=f"Scoring function to use. "
                         f"Choices: {list(SCORERS)}. Default: rvc")
    ap.add_argument("--list-rules", action="store_true",
                    help="List available scorers and compact32 rules, then exit")
    args = ap.parse_args()

    if args.list_rules:
        print("Scorers (--scorer NAME):")
        for name, (_, desc) in SCORERS.items():
            marker = " [default]" if name == "rvc" else ""
            print(f"  {name:14s}  {desc}{marker}")
        print()
        print("compact32 rules (in match order):")
        for name, fn in COMPACT32_RULES:
            doc = (fn.__doc__ or "").strip().splitlines()[0]
            print(f"  {name:26s}  {doc}")
        return

    if args.scorer not in SCORERS:
        ap.error(f"Unknown scorer {args.scorer!r}. "
                 f"Available: {list(SCORERS)}")

    source = sys.stdin.read() if args.input == "-" else open(args.input).read()
    sched = AssemblyScheduler(source)
    sched.analyse()

    if args.verbose:
        liveness = sched.liveness
        for instr in sched.graph.instructions:
            succs     = sorted(sched.graph.successors[instr.index])
            dead      = sorted(liveness.get(instr.index, set()))
            compress  = can_compress(instr)
            print(f"# I{instr.index:3d}  {instr.mnemonic:18s}"
                  f"  defs={instr.defs}  uses={instr.uses}"
                  f"  last_use={dead}  rvc={compress}"
                  f"  -> {[f'I{s}' for s in succs]}", file=sys.stderr)

    factory, _ = SCORERS[args.scorer]
    pair_score = factory(sched) if getattr(factory, "needs_sched", False) \
                  else factory()

    output = sched.emit(pair_score=pair_score, rename=args.rename)
    print(output)
    if sched.last_stats is not None:
        st = sched.last_stats
        print(f"\n# --- report ---", file=sys.stderr)
        print(f"# scorer:       {args.scorer}", file=sys.stderr)
        print(f"# instructions: {st.total_instrs}", file=sys.stderr)
        print(f"# paired:       {st.paired_instrs}  ({st.successful_pairs} pairs)", file=sys.stderr)
        print(f"# unpaired:     {st.unpaired_instrs}", file=sys.stderr)
        all_rules = sorted(
            set(st.rule_counts) | set(st.rule_shadow) | set(st.rule_missed),
            key=lambda r: -st.rule_counts.get(r, 0)
        )
        if all_rules:
            print("# rule breakdown:", file=sys.stderr)
            for rule in all_rules:
                label  = rule if rule else "(unnamed)"
                won    = st.rule_counts.get(rule, 0)
                shadow = st.rule_shadow.get(rule, 0)
                missed = st.rule_missed.get(rule, 0)
                parts  = [f"{won:4d} won"]
                if shadow: parts.append(f"{shadow:3d} shadowed")
                if missed: parts.append(f"{missed:3d} missed")
                print(f"#   {label:30s} {'  '.join(parts)}", file=sys.stderr)
        if st.rvc_eligible:
            print(f"# rvc eligible: {st.rvc_eligible} instructions"
                  f"  (ceiling {st.rvc_eligible // 2} rvc pairs)", file=sys.stderr)
        print(f"# size estimate: {st.estimated_bytes} bytes"
              f"  (baseline {st.baseline_bytes},"
              f" saving {st.saving_bytes} = {st.saving_pct:.1f}%)", file=sys.stderr)


if __name__ == "__main__":
    main()
