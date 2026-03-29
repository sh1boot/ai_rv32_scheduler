
"""
rv32_scheduler.py

RV32 instruction scheduler: reads assembly source (or objdump -d output),
reorders instructions within basic blocks to maximise pairing opportunities,
and emits the reordered assembly with PAIR+ annotations.

Usage
-----
    python rv32_scheduler.py input.s
    python rv32_scheduler.py input.s --scorer compact32
    python rv32_scheduler.py input.s --scorer compact32 --opcode-tally
    python rv32_scheduler.py input.s --no-rename -v
    python rv32_scheduler.py --list-rules
    python rv32_scheduler.py -          # read from stdin

Also accepts objdump -d output directly:
    objdump -d binary | python rv32_scheduler.py -
"""
import re, io, sys, copy, argparse
from collections import defaultdict, Counter
from dataclasses import dataclass, field
from typing import Callable

from rv32_core import (
    Instruction, DepGraph, parse_line, build_dep_graph, compute_liveness,
    _INT_ABI, _FP_ABI, _SENTINEL_MN, _LABEL_DEF,
    _is_objdump, _objdump_line, _classify_labels, _classify_labels_objdump,
)
from rv32_scorers import (
    PairScoreFn, can_compress, _compress_pair_score, COMPACT32_RULES, SCORERS,
)


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
        In practice this means the slot was a failed pair (neither instruction
        satisfied any rule as the winning instruction in that slot), yet this
        rule still saw a match — indicating the scheduler placed a matching
        pair into an already-lost slot.  A high missed count suggests the
        scheduler couldn't align this rule's matches to winnable slots, often
        due to dependency constraints.

    rvc_eligible : int
        Instructions in the final scheduled sequence satisfying can_compress().
        Reference ceiling: floor(rvc_eligible / 2) is the maximum achievable
        RVC pairs if every eligible instruction could be matched with another.

    singleton_tally : {(label_a, label_b): int}
        For every position i where instruction i ended up as a singleton and
        i+1 exists, record (label(i), label(i+1)).  This is exactly the (a, b)
        pair the scorer tested and rejected.  Sorted by count descending, this
        reveals which opcode combinations are most often adjacent but unpairable
        — the highest-count entries are the best candidates for new pairing rules.

        Labels are the instruction mnemonic, except that loads and stores with
        sp (x2) as their base register use the qualified form ``mnemonic(sp)``
        (e.g. ``lw(sp)``, ``sw(sp)``).  Stack-relative accesses are subject to
        different pairing constraints than heap/data accesses and benefit from
        being counted separately.

        Note: the last instruction in the sequence (no successor) contributes
        a (label, "") entry — i.e. it is counted as a singleton with an empty
        partner label, since there is no adjacent instruction to compare against.

    unpaired_opcode_tally : {label: int}
        Flat count of instructions that ended up unpaired, keyed by the same
        qualified label used in singleton_tally (``lw(sp)`` etc. for
        stack-relative accesses, plain mnemonic otherwise).  Useful for "which
        opcodes most often miss pairing" without worrying about the partner.

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
    singleton_tally:        dict   # {(mn_a, mn_b): count} — unpaired adjacent pairs
    unpaired_opcode_tally:  dict   # {mnemonic: count} — flat singleton opcode counts

    @classmethod
    def empty(cls) -> "PairStats":
        """Return a zero PairStats for a block with no instructions."""
        return cls(
            total_instrs=0, paired_instrs=0, unpaired_instrs=0,
            possible_pairs=0, successful_pairs=0,
            rule_counts={}, rule_shadow={}, rule_missed={},
            rvc_eligible=0,
            estimated_bytes=0, baseline_bytes=0,
            saving_bytes=0, saving_pct=0.0,
            singleton_tally={}, unpaired_opcode_tally={},
        )

    def summary_lines(self, opcode_tally: bool = False) -> list:
        """Return comment lines suitable for appending to assembly output.

        opcode_tally: when True, append the singleton opcode-pair tally and
            the flat unpaired-opcode tally sections.  Omitted by default to
            keep normal output concise.
        """
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
        if opcode_tally:
            lines.extend(self._opcode_tally_lines())
        return lines

    # Maximum rows shown in each tally section.  Keeps output readable even
    # for large files with many distinct mnemonic combinations.
    _TALLY_LIMIT = 20

    def _opcode_tally_lines(self) -> list:
        """Format the singleton opcode-pair tally and flat unpaired-opcode tally."""
        lines = []

        # --- paired opcode-pair tally ---
        if self.singleton_tally:
            lines.append(f"# unpaired opcode pairs (top {self._TALLY_LIMIT}):")
            ranked = sorted(self.singleton_tally.items(), key=lambda kv: -kv[1])
            for (mn_a, mn_b), cnt in ranked[:self._TALLY_LIMIT]:
                b_label = mn_b if mn_b else "(end)"
                lines.append(f"#   {cnt:5d}  {mn_a} | {b_label}")

        # --- flat unpaired opcode tally ---
        if self.unpaired_opcode_tally:
            lines.append(f"# unpaired opcodes (top {self._TALLY_LIMIT}):")
            ranked = sorted(self.unpaired_opcode_tally.items(), key=lambda kv: -kv[1])
            for mn, cnt in ranked[:self._TALLY_LIMIT]:
                lines.append(f"#   {cnt:5d}  {mn}")

        return lines


    @classmethod
    def merge(cls, stats: "list[PairStats]") -> "PairStats":
        """
        Combine a sequence of per-block PairStats into a single aggregate.

        All integer counters are summed.  Dict counters (rule_counts etc.)
        are merged by summing values for each key.  saving_pct is
        recomputed from the merged byte totals rather than averaged, so it
        reflects the true overall saving.  possible_pairs is summed from
        per-block values (each block contributes floor(block_size/2)).
        """
        def _merge_dicts(attr):
            c: Counter = Counter()
            for s in stats:
                c.update(getattr(s, attr))
            return dict(c)

        total_instrs     = sum(s.total_instrs     for s in stats)
        paired_instrs    = sum(s.paired_instrs     for s in stats)
        unpaired_instrs  = sum(s.unpaired_instrs   for s in stats)
        possible_pairs   = sum(s.possible_pairs    for s in stats)
        successful_pairs = sum(s.successful_pairs  for s in stats)
        rvc_eligible     = sum(s.rvc_eligible      for s in stats)
        estimated_bytes  = sum(s.estimated_bytes   for s in stats)
        baseline_bytes   = sum(s.baseline_bytes    for s in stats)
        saving_bytes     = sum(s.saving_bytes      for s in stats)
        saving_pct       = ((saving_bytes / baseline_bytes * 100)
                            if baseline_bytes else 0.0)

        return cls(
            total_instrs     = total_instrs,
            paired_instrs    = paired_instrs,
            unpaired_instrs  = unpaired_instrs,
            possible_pairs   = possible_pairs,
            successful_pairs = successful_pairs,
            rule_counts      = _merge_dicts("rule_counts"),
            rule_shadow      = _merge_dicts("rule_shadow"),
            rule_missed      = _merge_dicts("rule_missed"),
            rvc_eligible     = rvc_eligible,
            estimated_bytes  = estimated_bytes,
            baseline_bytes   = baseline_bytes,
            saving_bytes     = saving_bytes,
            saving_pct       = saving_pct,
            singleton_tally        = _merge_dicts("singleton_tally"),
            unpaired_opcode_tally  = _merge_dicts("unpaired_opcode_tally"),
        )


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
# ABI temporaries: t0-t2 (x5-x7) and t3-t6 (x28-x31)
_TEMPORARIES  = frozenset(f"x{i}" for i in (5, 6, 7, 28, 29, 30, 31))
# Registers that must never be rename targets (x0, ra, sp, gp, tp)
_RESERVED     = frozenset({"x0", "x1", "x2", "x3", "x4"})


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
         be renamed to, try that rename.  This covers the sign-extend idiom:

             slli  t0, a0, 24       # intermediate dead, dest could be t1
             srai  t1, t0, 24       # t1 is the final value
           → rename slli dest to t1:
             slli  t1, a0, 24  # PAIR+
             srai  t1, t1, 24

      b) **Temporary convergence**: if both instructions in the pair write
         dead destinations, try renaming both into the ABI temporary set
         (``t0``–``t2`` = x5–x7, ``t3``–``t6`` = x28–x31) so downstream
         scoring functions that reward temporaries can fire.

    A register is *renameable* at position P when:
      - It is not architecturally reserved (x0, ra, sp, gp, tp).
      - It is not a vector register.
      - Its defined value is dead: either no later instruction in the block
        reads it before the next write, or it is only read by instructions
        that are within the rename window (the span from the def to its last
        consumer).

    Safety invariant: no rename is ever applied unless ``count_pairs``
    strictly increases, so correctness is preserved by construction.

    Returns the (possibly modified) scheduled list.
    """
    scheduled = [copy.copy(i) for i in scheduled]
    n = len(scheduled)
    trials_remaining: list = [max_trials]   # mutable counter shared by helpers

    # ------------------------------------------------------------------
    # Precomputed tables rebuilt once per outer iteration (O(N) each).
    #
    # live_table[pos]  – registers live at the start of position pos
    # free_table[pos]  – the prev_free state entering position pos in the
    #                    greedy-advance walk of `scheduled`.
    #                    free_table[0] = False (no predecessor).
    #                    free_table[i] = True  when position i-1 was a singleton.
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
# Tally helpers (module-level so they can be used by the streaming processor)
# ---------------------------------------------------------------------------

def _tally_label(instr: "Instruction") -> str:
    """
    Return the tally key for *instr*.

    Loads and stores with sp (x2) as their base register use the qualified
    form ``mnemonic(sp)`` (e.g. ``lw(sp)``, ``sw(sp)``).  Stack-relative
    accesses are subject to different pairing constraints from heap/data
    accesses and benefit from being counted separately.  All other
    instructions return their plain mnemonic.
    """
    if instr.mem is not None and instr.mem[1] == "x2":
        return f"{instr.mnemonic}(sp)"
    return instr.mnemonic


# ---------------------------------------------------------------------------
# Label classification pre-pass
# ---------------------------------------------------------------------------

# Branches and jumps whose last operand is a label target.
_BRANCH_LIKE = re.compile(
    r"^\s+(?:beq|bne|blt|bge|bltu|bgeu|beqz|bnez|blez|bgez|bltz|bgtz"
    r"|jal|jalr|j|jr|call|tail)\s",
)
# ELF visibility directives that make a symbol externally reachable.
_VISIBILITY_DIRS = re.compile(
    r"^\s+\.(?:globl|global|weak|protected|hidden|internal)\s+(\S+)",
)
# Label definition: optional leading dot, word chars, colon.
_LABEL_DEF = re.compile(r"^\s*(\.?\w+)\s*:")


def _classify_labels(source: str) -> tuple:
    """
    Single-pass scan of *source* (raw text, no Instruction objects created).

    Returns ``(branch_targets, globally_visible)`` — two frozensets of label
    name strings.

    branch_targets
        Names that appear as the final non-comment token of a branch or jump
        instruction.  Any label in this set is a genuine control-flow target
        and must be treated as a scheduling barrier.

    globally_visible
        Names declared by an ELF visibility directive (.globl, .global, .weak,
        .protected, .hidden, .internal).  These are callable from outside the
        translation unit and must also be treated as barriers, even if no
        branch within *this* file targets them.

    All other labels (e.g. ``.Lfunc_end*`` size markers, ``.Lpcrel_hi*``
    relocation anchors) are pass-through text only — they carry no scheduling
    constraint because no instruction can ever transfer control to them.

    Note: ``.Lpcrel_hi*`` labels sit between ``auipc`` and the ``addi`` that
    consumes ``%pcrel_lo()``.  Reordering those two would corrupt the
    relocation, but the pair is already protected by a RAW dependency: ``auipc``
    writes ``rd``, and the ``addi`` reads that same register as ``rs1``.  The
    dependency graph enforces their ordering without the label needing to be a
    barrier.
    """
    branch_targets: set = set()
    globally_visible: set = set()

    for line in source.splitlines():
        # Visibility directives
        m = _VISIBILITY_DIRS.match(line)
        if m:
            globally_visible.add(m.group(1).split("@")[0])  # strip @plt etc.
            continue

        # Branch / jump targets — last token before any comment.
        # Reject tokens that are: plain integers, relocation expressions
        # (%pcrel_hi etc.), register-indirect forms (offset(reg)), or bare
        # register names.  What remains must be a label name.
        if _BRANCH_LIKE.match(line):
            code = line.split("#")[0].split(";")[0].strip()
            tgt = code.split()[-1].rstrip(",")
            if (tgt
                    and not tgt.lstrip("-").isdigit()
                    and not tgt.startswith("%")
                    and "(" not in tgt
                    and tgt not in _INT_ABI
                    and not re.match(r"^[xf]\d+$", tgt)):
                branch_targets.add(tgt)

    return frozenset(branch_targets), frozenset(globally_visible)


# ---------------------------------------------------------------------------
# objdump disassembly input support
# ---------------------------------------------------------------------------

# objdump instruction line: hex-address colon, one or more hex words, then mnemonic
_OBJDUMP_INSTR = re.compile(
    r"^([0-9a-f]+):\s+"        # address:
    r"(?:[0-9a-f]{2,8}\s+)+"   # one or more hex encoding words
    r"(\S.*)$"                  # mnemonic and operands (captured)
)
# objdump label line: hex-address <name>:
_OBJDUMP_LABEL = re.compile(r"^([0-9a-f]+)\s+<([^>]+)>:\s*$")
# objdump data line: address + multiple hex words + optional ASCII (no mnemonic starting with a letter)
_OBJDUMP_DATA  = re.compile(r"^[0-9a-f]+:\s+(?:[0-9a-f]{8}\s+){2,}")
# Trailing  <name>  or  <name+0xOFFSET>  annotation on branch operands.
_ANGLE_ANNOT   = re.compile(r"\s+<[^>]+>")


def _is_objdump(source: str) -> bool:
    """
    Return True when *source* looks like ``objdump -d`` output.

    Detection heuristic: the first non-blank, non-comment line contains
    ``file format`` (the standard objdump file-format header), or the
    second non-blank line is ``Disassembly of section``.
    """
    for line in source.splitlines():
        s = line.strip()
        if not s:
            continue
        if "file format" in s or s.startswith("Disassembly of section"):
            return True
        # First substantive line that looks like code, not a header → not objdump
        return False
    return False


def _objdump_line(line: str) -> tuple:
    """
    Classify and normalise one line of objdump output.

    Returns ``(kind, text)`` where kind is one of:
      ``'label'``   — label definition; text is the bare label name (e.g. ``_start``)
      ``'instr'``   — instruction; text is the canonical assembly line ready
                      for ``parse_line``, with address/encoding stripped and
                      ``<name>`` branch annotations removed
      ``'pass'``    — pass-through; text is the original line unchanged

    Angle-bracket annotations on operands (``80000034 <bss_done>``) are
    stripped, leaving the bare hex address (``80000034``).  This is the
    address the branch will actually jump to, and it is what ``parse_line``
    would see as a label reference in plain assembly.  The dependency graph
    does not need the symbolic name — it only needs to know the instruction
    is a branch.
    """
    stripped = line.rstrip()

    # Blank line
    if not stripped.strip():
        return ('pass', line)

    # Label: "80000000 <_start>:"
    m = _OBJDUMP_LABEL.match(stripped)
    if m:
        name = m.group(2)
        # objdump uses "name+0xoffset" for labels inside functions — these
        # are not real label definitions, just display hints.  Drop them.
        if "+" in name or " " in name:
            return ('pass', line)
        return ('label', name)

    # Data rows: multiple hex words with no mnemonic letter
    if _OBJDUMP_DATA.match(stripped):
        return ('pass', line)

    # Instruction line
    m = _OBJDUMP_INSTR.match(stripped)
    if m:
        rest = m.group(2)   # "mv\ts0,a0" or "bgeu\tt0,t1,80000034 <bss_done>"
        # Strip inline comments that objdump adds after  #
        rest = rest.split(" # ")[0].split("\t# ")[0]
        # Remove <name> and <name+offset> annotations from operands
        rest = _ANGLE_ANNOT.sub("", rest)
        # Normalise multiple spaces/tabs between mnemonic and operands to a
        # single tab so parse_line sees a familiar format
        parts = rest.split(None, 1)
        if not parts:
            return ('pass', line)
        canonical = "\t" + parts[0]
        if len(parts) > 1:
            canonical += "\t" + parts[1]
        return ('instr', canonical)

    # Ellipsis padding, section headers, file-format line, etc.
    return ('pass', line)


def _classify_labels_objdump(source: str) -> tuple:
    """
    Like ``_classify_labels`` but for objdump disassembly format.

    In objdump output there are no ``.globl`` directives, so
    ``globally_visible`` is derived from function-entry labels: a label is
    a function entry if it appears as ``ADDR <name>:`` at a line by itself
    (not as ``ADDR <name+offset>:`` which is an intra-function hint label).

    ``branch_targets`` is derived from the ``<name>`` annotations that
    objdump attaches to branch/jump target addresses.  Every name that
    appears inside angle brackets on a branch line is a barrier.
    """
    branch_targets:   set = set()
    globally_visible: set = set()

    for line in source.splitlines():
        # Function-entry label → globally visible (treated as barrier)
        m = _OBJDUMP_LABEL.match(line.rstrip())
        if m:
            name = m.group(2)
            if "+" not in name and " " not in name:
                globally_visible.add(name)
            continue

        # Branch targets: extract <name> annotations from branch/jump lines
        if _BRANCH_LIKE.match(line):
            for annot in re.findall(r"<([^>+]+)(?:\+[^>]*)?>", line):
                branch_targets.add(annot)

    return frozenset(branch_targets), frozenset(globally_visible)


def _process_block(
    pass_lines:     list,
    instructions:   list,
    sentinel_texts: dict,
    pair_score:     "PairScoreFn",
    rename:         bool,
    out,
    verbose:        bool = False,
) -> "PairStats":
    """
    Schedule, annotate, and emit one basic block, then return its PairStats.

    Parameters
    ----------
    pass_lines
        Lines of pass-through text (directives, blank lines, comments) that
        appeared before the first instruction of this block.  Flushed to
        *out* before any instruction output.
    instructions
        Instruction objects for this block, including ``__label__`` sentinels.
    sentinel_texts
        Maps each sentinel's original instruction index to a list of source
        lines that begin with the label line itself, followed by any intra-block
        directives/comments between the label and the first real instruction.
        Used to re-emit label lines at the correct position after scheduling
        (sentinels are barriers so they never move, but their text must appear
        in the output).
    pair_score, rename, out, verbose
        As for ``AssemblyScheduler.process()``.
    """
    # Flush leading pass-through text.
    for line in pass_lines:
        print(line, file=out)

    if not instructions:
        return PairStats.empty()

    graph = build_dep_graph(instructions)

    if verbose:
        lv = compute_liveness([i for i in instructions if i.mnemonic != _SENTINEL_MN])
        for instr in graph.instructions:
            if instr.mnemonic == _SENTINEL_MN:
                continue
            succs    = sorted(graph.successors[instr.index])
            dead     = sorted(lv.get(instr.index, set()))
            compress = can_compress(instr)
            print(f"# I{instr.index:3d}  {instr.mnemonic:18s}"
                  f"  defs={instr.defs}  uses={instr.uses}"
                  f"  last_use={dead}  rvc={compress}"
                  f"  -> {[f'I{s}' for s in succs]}", file=sys.stderr)

    scheduled      = _bnb_schedule(graph, pair_score)
    real_scheduled = [i for i in scheduled if i.mnemonic != _SENTINEL_MN]

    if hasattr(pair_score, "_liveness_cell"):
        pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

    if rename:
        real_scheduled = rename_destinations(real_scheduled, graph, pair_score)
        if hasattr(pair_score, "_liveness_cell"):
            pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

    real_pos = {instr.index: p for p, instr in enumerate(real_scheduled)}

    # ── Greedy-advance walk ───────────────────────────────────────────────
    total_instrs = len(real_scheduled)
    successful   = 0

    rule_counts:           Counter = Counter()
    rule_shadow:           Counter = Counter()
    rule_missed:           Counter = Counter()
    singleton_tally:       Counter = Counter()
    unpaired_opcode_tally: Counter = Counter()

    pair_start_set: set  = set()
    pair_rules:     dict = {}

    rule_list     = getattr(pair_score, "_rule_list", None)
    describe_fn   = getattr(pair_score, "_describe_pair", None)
    liveness_snap = (pair_score._liveness_cell[0]
                     if hasattr(pair_score, "_liveness_cell") else {})

    i = 0
    while i < total_instrs:
        if i + 1 < total_instrs:
            a_s, b_s    = real_scheduled[i], real_scheduled[i + 1]
            slot_scores = pair_score(a_s, b_s) > 0

            if rule_list is not None:
                matching_rules = [rn for rn, rf in rule_list
                                  if rf(a_s, b_s, liveness_snap)]
                if matching_rules:
                    winner = matching_rules[0]
                    if slot_scores:
                        pair_start_set.add(i)
                        pair_rules[i] = winner
                        successful += 1
                        rule_counts[winner] += 1
                        for rn in matching_rules[1:]:
                            rule_shadow[rn] += 1
                        i += 2
                        continue
                    else:
                        rule_missed[winner] += 1
            else:
                if slot_scores:
                    pair_start_set.add(i)
                    rule = describe_fn(a_s, b_s) if describe_fn else ""
                    pair_rules[i] = rule
                    successful += 1
                    rule_counts[rule] += 1
                    i += 2
                    continue

        mn_a = _tally_label(real_scheduled[i])
        mn_b = _tally_label(real_scheduled[i + 1]) if i + 1 < total_instrs else ""
        key  = (mn_a, mn_b)
        singleton_tally[key]        += 1
        unpaired_opcode_tally[mn_a] += 1
        i += 1

    # ── Emit annotated output ─────────────────────────────────────────────
    # Walk `scheduled` (sentinels included) in order.  Sentinels are barriers
    # and cannot move, so they appear in their original relative positions.
    # For each sentinel we emit its label line; for each real instruction we
    # emit the instruction text with PAIR+ annotation if applicable.
    for instr in scheduled:
        if instr.mnemonic == _SENTINEL_MN:
            for label_line in sentinel_texts.get(instr.index, []):
                print(label_line, file=out)
        else:
            rp = real_pos.get(instr.index)
            if rp in pair_start_set:
                rule_tag = pair_rules.get(rp, "")
                tag = f"  # PAIR+ [{rule_tag}]" if rule_tag else "  # PAIR+"
                print(instr.raw + tag, file=out)
            else:
                print(instr.raw, file=out)

    # ── Build and return PairStats ────────────────────────────────────────
    rvc_eligible    = sum(1 for instr in real_scheduled if can_compress(instr))
    paired_instrs   = successful * 2
    unpaired_instrs = total_instrs - paired_instrs
    total_words     = successful + unpaired_instrs
    estimated_bytes = total_words * 4
    baseline_bytes  = total_instrs * 4
    saving_bytes    = baseline_bytes - estimated_bytes
    saving_pct      = (saving_bytes / baseline_bytes * 100) if baseline_bytes else 0.0

    return PairStats(
        total_instrs     = total_instrs,
        paired_instrs    = paired_instrs,
        unpaired_instrs  = unpaired_instrs,
        possible_pairs   = total_instrs // 2,
        successful_pairs = successful,
        rule_counts      = rule_counts,
        rule_shadow      = rule_shadow,
        rule_missed      = rule_missed,
        rvc_eligible     = rvc_eligible,
        estimated_bytes  = estimated_bytes,
        baseline_bytes   = baseline_bytes,
        saving_bytes     = saving_bytes,
        saving_pct       = saving_pct,
        singleton_tally        = singleton_tally,
        unpaired_opcode_tally  = unpaired_opcode_tally,
    )


# ---------------------------------------------------------------------------
# High-level API
# ---------------------------------------------------------------------------

class AssemblyScheduler:
    """
    Streaming RV32 instruction scheduler.

    Processes one basic block at a time, writing output as each block
    completes.  Peak memory is proportional to the largest single block
    (typically ~16 instructions within a BnB window), not the whole file.

    Basic usage (writes directly to a file / stdout)::

        sched = AssemblyScheduler(source_text)
        sched.process(pair_score=my_fn, out=sys.stdout)
        st = sched.last_stats   # aggregate PairStats for the whole file

    Legacy string-returning usage (loads entire output into RAM — avoid for
    very large files)::

        output = sched.emit(pair_score=my_fn)
        print(output)
    """

    def __init__(self, source: str):
        self.source = source
        self.last_stats: "PairStats | None" = None

    # ------------------------------------------------------------------
    # Label classification
    # ------------------------------------------------------------------

    @staticmethod
    def _is_barrier_label(name: str,
                          branch_targets:   frozenset,
                          globally_visible: frozenset) -> bool:
        """
        Return True when *name* must be treated as a scheduling barrier.

        A label is a barrier when:
          - It is a branch or jump target (any instruction can transfer
            control to it, so nothing may be reordered past it), OR
          - It is externally visible (declared .globl / .weak / etc.) — it
            may be called from outside this translation unit.

        Labels that are referenced only in assembler directives (e.g.
        ``.Lfunc_end*`` in ``.size`` expressions, ``.Lpcrel_hi*`` in
        ``%pcrel_lo()`` relocation operands) are NOT barriers: no
        instruction can branch to them, so the scheduler is free to move
        instructions across them.  Their text is still emitted as-is.

        Note: ``.Lpcrel_hi*`` labels appear between an ``auipc`` and the
        ``addi`` that consumes ``%pcrel_lo()``.  Reordering those two would
        corrupt the relocation, but the pair is already protected by a RAW
        dependency on the register ``auipc`` writes — so the label does not
        need to be a barrier itself.
        """
        return name in branch_targets or name in globally_visible

    # ------------------------------------------------------------------
    # Streaming processor
    # ------------------------------------------------------------------

    def process(
        self,
        pair_score:   PairScoreFn = _compress_pair_score,
        rename:       bool = True,
        opcode_tally: bool = False,
        out          = None,
        verbose:      bool = False,
    ) -> "PairStats":
        """
        Parse, schedule, and emit the source in a single streaming pass.

        Each basic block (sequence of instructions between barrier labels)
        is processed and written to *out* before the next block is read.
        Peak memory is O(block_size), not O(file_size).

        Parameters
        ----------
        pair_score
            Scoring function for adjacent instruction pairs.
        rename
            If True, attempt destination-register renaming per block.
        opcode_tally
            If True, append the unpaired-opcode tally to the final summary.
        out
            File-like object to write to.  Defaults to ``sys.stdout``.
        verbose
            If True, dump the dependency graph for each block to stderr.

        Returns the aggregate ``PairStats`` for the whole file (also stored
        as ``self.last_stats``).
        """
        if out is None:
            out = sys.stdout

        # Detect input format and select the appropriate label classifier.
        objdump = _is_objdump(self.source)
        if objdump:
            branch_targets, globally_visible = _classify_labels_objdump(self.source)
        else:
            branch_targets, globally_visible = _classify_labels(self.source)

        # Streaming parse: accumulate one block at a time and hand it off.
        # A block boundary is any barrier label (branch target or globally
        # visible symbol).  Non-barrier labels are folded in as pass-through
        # text with no sentinel, so they never split a block.
        all_stats: list = []
        instr_index    = 0
        pass_lines:     list = []   # inter-block pass-through (flushed before label)
        trailing_pass:  list = []   # post-instruction pass-through (carried to next block)
        instructions:   list = []   # Instruction objects for the current block
        sentinel_texts: dict = {}   # {sentinel.index: [line, ...]} — label + intra-block pass-throughs
        last_sentinel_idx: "int | None" = None   # index of most recent sentinel in this block

        def _flush_block():
            """Process and emit the accumulated block, then reset state."""
            nonlocal last_sentinel_idx
            st = _process_block(
                pass_lines     = pass_lines,
                instructions   = instructions,
                sentinel_texts = sentinel_texts,
                pair_score     = pair_score,
                rename         = rename,
                out            = out,
                verbose        = verbose,
            )
            all_stats.append(st)
            pass_lines.clear()
            trailing_pass.clear()
            instructions.clear()
            sentinel_texts.clear()
            last_sentinel_idx = None

        def _route_pass(line: str) -> None:
            """
            Place a pass-through line in the correct bucket.

            Lines that arrive before any real instruction in the current block
            are attached to the most recent sentinel (so they print after the
            label line, not before it).  Lines that arrive after at least one
            real instruction have been seen go to trailing_pass (they are
            inter-block gap, carried forward as the next block's preamble).
            Lines before any sentinel go to pass_lines (file preamble).
            """
            has_real = any(i.mnemonic != _SENTINEL_MN for i in instructions)
            if not has_real and last_sentinel_idx is not None:
                sentinel_texts[last_sentinel_idx].append(line)
            elif has_real:
                trailing_pass.append(line)
            else:
                pass_lines.append(line)

        def _add_sentinel(label_name: str, source_line: str) -> None:
            """
            Flush the current block, then start a new block with a barrier
            sentinel for *label_name*.  *source_line* is the original source
            text of the label definition, preserved for output.
            """
            nonlocal instr_index, last_sentinel_idx
            # Flush: inter-block trailing_pass becomes next block's preamble.
            st = _process_block(
                pass_lines     = pass_lines,
                instructions   = instructions,
                sentinel_texts = sentinel_texts,
                pair_score     = pair_score,
                rename         = rename,
                out            = out,
                verbose        = verbose,
            )
            all_stats.append(st)
            instructions.clear()
            sentinel_texts.clear()
            last_sentinel_idx = None
            pass_lines.clear()
            pass_lines.extend(trailing_pass)
            trailing_pass.clear()

            sentinel = Instruction(index=instr_index, raw="", mnemonic=_SENTINEL_MN)
            sentinel.is_barrier = True
            sentinel_texts[instr_index] = [source_line]
            last_sentinel_idx = instr_index
            instr_index += 1
            instructions.append(sentinel)

        def _add_instruction(instr: "Instruction") -> None:
            """Add a real instruction, draining trailing_pass first."""
            nonlocal instr_index
            if trailing_pass:
                if last_sentinel_idx is not None:
                    sentinel_texts[last_sentinel_idx].extend(trailing_pass)
                else:
                    pass_lines.extend(trailing_pass)
                trailing_pass.clear()
            # instr.index was already set by parse_line(instr_index, ...)
            instr_index += 1
            instructions.append(instr)



        for line in self.source.splitlines():
            if objdump:
                kind, text = _objdump_line(line)
                if kind == 'pass':
                    _route_pass(line)
                    continue
                elif kind == 'label':
                    label_name = text
                    if self._is_barrier_label(label_name,
                                              branch_targets, globally_visible):
                        _add_sentinel(label_name, line)
                    else:
                        _route_pass(line)
                    continue
                else:  # kind == 'instr'
                    instr = parse_line(instr_index, text)
                    if instr is None:
                        _route_pass(line)
                    else:
                        instr.raw = line   # preserve original objdump line
                        _add_instruction(instr)
                    continue

            # Plain assembly path.
            stripped = line.strip()
            if (not stripped
                    or stripped.startswith(("#", ";", "//"))
                    or stripped.startswith(".")):
                _route_pass(line)
                continue

            m = _LABEL_DEF.match(stripped)
            if m:
                label_name = m.group(1)
                if self._is_barrier_label(label_name,
                                          branch_targets, globally_visible):
                    _add_sentinel(label_name, line)
                else:
                    _route_pass(line)
                continue

            instr = parse_line(instr_index, line)
            if instr is None:
                _route_pass(line)
            else:
                _add_instruction(instr)

        # Flush the final block.
        _flush_block()

        # Aggregate stats across all blocks.
        merged = PairStats.merge(all_stats)

        # Append the file-wide summary as assembly comments.
        for summary_line in merged.summary_lines(opcode_tally=opcode_tally):
            print(summary_line, file=out)

        self.last_stats = merged
        return merged

    def emit(
        self,
        pair_score:   PairScoreFn = _compress_pair_score,
        rename:       bool = True,
        opcode_tally: bool = False,
        verbose:      bool = False,
    ) -> str:
        """
        Schedule and return the reordered assembly as a single string.

        This is a convenience wrapper around ``process()`` that captures
        output in memory.  Prefer ``process(out=…)`` for large files.
        """
        buf = io.StringIO()
        self.process(pair_score=pair_score, rename=rename,
                     opcode_tally=opcode_tally, out=buf, verbose=verbose)
        return buf.getvalue().rstrip("\n")



# ---------------------------------------------------------------------------
# Compact-32 pairing scorer
# ---------------------------------------------------------------------------
#
# Models a hypothetical 32-bit encoding that fuses two instructions into one
# word when they share enough information to be encoded compactly together.
#
# Architecture
# ------------
# A "pairing rule" is a plain function with the signature:
#
#     rule(a, b, liveness) -> bool
#
# where:
#   a, b      -- the two Instruction objects (a at the even slot, b at odd)
#   liveness  -- dict[instr_index -> frozenset[str]] from compute_liveness,
#                used to test whether a value is dead after its last use
#
# Rules are collected in COMPACT32_RULES, a list of (name, rule_fn) pairs.
# The scorer fires the first matching rule and returns 1.0; if no rule
# matches it returns 0.0 (or -1.0 when the RVC fallback applies).
#
# Adding a new rule
# -----------------
# 1. Write a function  def _rule_<name>(a, b, liveness): -> bool
# 2. Append it to COMPACT32_RULES below with a short descriptive name.
# That's it.  The scorer, the CLI --list-rules output, and the PAIR+
# annotation comment all pick it up automatically.
#
# Liveness note
# -------------
# liveness[i] is the set of registers whose *last use* is instruction i —
# i.e. registers that are dead immediately after i executes.  A register r
# is "dead after a" when r in liveness[a.index].  This is used to verify
# that an intermediate result (e.g. the comparison flag written to t6) is
# not needed by any instruction other than b.

_CMP_MNEMONICS = frozenset({
    "slti", "sltiu", "slli", "srli", "srai",
    "andi", "ori", "xori",
    "slt", "sltu",
    "seqz", "snez", "sltz", "sgtz",
})
_BRANCH_ZERO = frozenset({"beqz", "bnez", "beq", "bne"})

def _rule_cmp_branch(a: "Instruction", b: "Instruction", liveness: dict) -> bool:
    """
    Compare-with-immediate + conditional branch on x31 (t6).

    Matches:
        slti / sltiu / seqz / snez  x31, rs, imm
        beqz / bnez                 x31, label      (x31 dead after)
    """
    if not a.defs or a.defs[0] != "x31":
        return False
    if a.mnemonic not in _CMP_MNEMONICS:
        return False
    if b.mnemonic not in _BRANCH_ZERO:
        return False
    if "x31" not in b.uses:
        return False
    if "x31" not in liveness.get(b.index, frozenset()):
        return False
    return True


def _rule_adjacent_load_pair(a: "Instruction", b: "Instruction",
                              liveness: dict) -> bool:
    """
    Pair of word loads from adjacent memory locations with the same base.

    Matches:
        lw  rd1, N(base)
        lw  rd2, N+4(base)     (or N-4)

    A compact encoding can represent both loads with one base register, one
    starting offset, and two destination registers.  The two data registers
    must be different; the base register may be the same for both (and
    usually is).

    Offset adjacency is detected from the raw operand text when the offset
    is a plain integer literal.  Symbol-relative offsets (e.g. %lo(sym)(gp))
    are not matched.
    """
    if a.mnemonic != "lw" or b.mnemonic != "lw":
        return False

    if a.mem is None or b.mem is None:
        return False

    off_a, base_a = a.mem
    off_b, base_b = b.mem

    if base_a != base_b:
        return False
    if abs(off_a - off_b) != 4:
        return False

    # Destination registers must be distinct
    rd_a = a.defs[0] if a.defs else None
    rd_b = b.defs[0] if b.defs else None
    if rd_a is None or rd_b is None or rd_a == rd_b:
        return False

    return True


def _rule_adjacent_store_pair(a: "Instruction", b: "Instruction",
                               liveness: dict) -> bool:
    """
    Pair of word stores to adjacent memory locations with the same base.

    Matches:
        sw  rs1, N(base)
        sw  rs2, N+4(base)     (or N-4)

    Symmetric to _rule_adjacent_load_pair.  The two source data registers
    must be different.
    """
    if a.mnemonic != "sw" or b.mnemonic != "sw":
        return False

    if a.mem is None or b.mem is None:
        return False

    off_a, base_a = a.mem
    off_b, base_b = b.mem

    if base_a != base_b:
        return False
    if abs(off_a - off_b) != 4:
        return False

    # Source data registers (first operand for sw) must be distinct
    rs_a = a.uses[0] if a.uses else None
    rs_b = b.uses[0] if b.uses else None
    if rs_a is None or rs_b is None or rs_a == rs_b:
        return False

    return True


def _rule_pre_increment(a: "Instruction", b: "Instruction",
                        liveness: dict) -> bool:
    """
    Address arithmetic followed by a memory op using that result as base (pre-increment).

    Matches:
        add / addi / sub / sh1add / sh2add / sh3add   rd, ...
        lw / sw / lh / sh / lb / sb / lhu / lbu       ..., N(rd)

    The arithmetic result register must be the base register of the memory
    operation.  For stores, the data register must differ from rd.
    """
    if a.mnemonic not in _ADDR_ARITH or b.mnemonic not in _MEM_OPS:
        return False
    if not a.defs:
        return False
    rd = a.defs[0]
    if rd not in b.uses:
        return False
    # For stores: data reg != rd (would be unrepresentable in a compact encoding)
    if b.mnemonic in ("sw", "sh", "sb"):
        if b.uses and b.uses[0] == rd:
            return False
    return True


def _rule_post_increment(a: "Instruction", b: "Instruction",
                          liveness: dict) -> bool:
    """
    Memory op followed by address arithmetic on the same base (post-increment).

    Matches:
        lw / sw / lh / sh / lb / sb / lhu / lbu       ..., N(base)
        add / addi / sub / sh1add / sh2add / sh3add   rd, base, ...

    The arithmetic's first source must be the memory op's base register.
    For loads, the arithmetic destination must not alias the load destination.
    """
    if a.mnemonic not in _MEM_OPS or b.mnemonic not in _ADDR_ARITH:
        return False
    base = a.uses[-1] if a.uses else None
    if base is None:
        return False
    if not b.uses or b.uses[0] != base:
        return False
    # For loads: arithmetic result must not alias the load destination
    if a.mnemonic in ("lw", "lh", "lb", "lhu", "lbu"):
        load_rd  = a.defs[0] if a.defs else None
        arith_rd = b.defs[0] if b.defs else None
        if load_rd is not None and load_rd == arith_rd:
            return False
    return True


# ---------------------------------------------------------------------------
# Dual-arithmetic rules
# ---------------------------------------------------------------------------
#
# Both rules model a 32-bit encoding that packs two arithmetic operations
# into one word.  The encoding budget is tight, so each instruction must
# satisfy three constraints simultaneously:
#
#   1. MNEMONIC — must be one of the permitted arithmetic operations:
#        addi addiw andi add addw sub subw and bic or xor
#      (addi4spn is treated as addi with sp as rs1 and a scaled immediate;
#       bic is accepted as a synonym for andn from the Zbb extension)
#
#   2. RSD (register-source-destination) — the first source register and
#      the destination register must be the SAME register, encoded once.
#      For immediate-form ops (addi, andi, …): rd == rs1.
#      For register-form ops (add, sub, and, or, xor, bic/andn):  rd == rs1.
#      addi4spn is exempt: its implicit rs1 is sp (x2) and rd may differ.
#
#   3. REGISTER RANGE — all register operands (rd/rs1 and any rs2) must be
#      in x0..x15, encodable in 4 bits.
#
#   4. IMMEDIATE WIDTH — for immediate-form ops, the immediate must fit in
#      5 signed bits (−16..+15).  For addi4spn specifically the immediate
#      is a byte offset that is a non-zero multiple of 4; the 5-bit unsigned
#      field encodes imm>>2, so the byte offset must be in 4..124 (step 4).
#      Register-form ops (add, sub, and, or, xor, bic) have no immediate.
#
# The two variants differ only in how the pair is linked:
#
#   dual_arith        — the two instructions are independent; their only
#                       relationship is that both satisfy constraints 1-4.
#
#   dual_arith_chain  — instruction A's destination is t6 (x31), and
#                       instruction B's first source (rs1) is also t6.
#                       t6 must be dead after B (its value does not escape
#                       the pair).  This models a fused "compute-then-use"
#                       where the intermediate value in t6 is implicit in
#                       the encoding and costs no register file allocation.
#                       Note: t6 (x31) is outside x0..x15, so the normal
#                       register-range constraint is deliberately relaxed
#                       for the linked register only.

# Mnemonics accepted by both dual-arith rules.
_DUAL_ARITH_MN = frozenset({
    "addi", "addiw", "andi",           # immediate arithmetic
    "add",  "addw",                     # register addition
    "sub",  "subw",                     # register subtraction
    "and",  "bic",  "andn",             # bitwise AND / AND-NOT (bic == andn)
    "or",   "xor",                      # bitwise OR / XOR
})

# Registers encodable in 4 bits: x0..x15
_REG4 = frozenset(f"x{n}" for n in range(16))

# t6 is the implicit chain register for dual_arith_chain
_CHAIN_REG = "x31"

# Mnemonics for the immediate-form dual-arith instructions that carry a
# 5-bit signed immediate (−16..+15).
_IMM_FORMS = frozenset({"addi", "addiw", "andi"})

# Address-arithmetic mnemonics used by pre_increment / post_increment rules.
_ADDR_ARITH = frozenset({"add", "addi", "sub", "sh1add", "sh2add", "sh3add"})

# Memory-operation mnemonics (integer loads and stores, no vector/FP).
_MEM_OPS = frozenset({"lw", "lh", "lb", "lhu", "lbu", "sw", "sh", "sb"})

# Branches and jumps that may only appear in the B (second) slot of a compact32
# pair — they cannot be the A instruction because nothing useful can follow them.
_COMPACT32_BRANCH_MN = frozenset({
    "beq", "bne", "blt", "bge", "bltu", "bgeu",
    "beqz", "bnez",
    "jal", "jalr",
})



def _dual_arith_ok(instr: "Instruction", allow_chain_reg: bool = False) -> bool:
    """
    Return True if *instr* satisfies all constraints for the dual-arith
    encoding:
      - Mnemonic is in _DUAL_ARITH_MN
      - RSD: rd == rs1  (or addi4spn special case)
      - All register operands in x0..x15  (relaxed for the chain register
        when allow_chain_reg is True)
      - Immediate fits in 5 signed bits if applicable

    allow_chain_reg=True relaxes the register-range check for rd/rs1 when
    the register is _CHAIN_REG (x31=t6).  Used for the A instruction in
    dual_arith_chain (whose destination is t6).
    """
    mn = instr.mnemonic

    if mn not in _DUAL_ARITH_MN:
        return False

    rd  = instr.defs[0] if instr.defs else None
    rs1 = instr.uses[0] if instr.uses else None

    if rd is None or rs1 is None:
        return False

    # ── addi4spn special case ──────────────────────────────────────────────
    # addi rd, sp, imm where imm is a non-zero multiple of 4, 4..124.
    # The 5-bit unsigned field encodes imm >> 2 (values 1..31).
    # rs1 is sp (x2) — rs1 != rd is allowed for this form only.
    if mn == "addi" and rs1 == "x2" and rd != "x2":
        reg_ok = (rd in _REG4) or (allow_chain_reg and rd == _CHAIN_REG)
        if not reg_ok:
            return False
        imm = instr.imm
        if imm is None:
            return False
        # Must be a positive multiple of 4 in 4..124
        if imm <= 0 or imm % 4 != 0 or imm > 124:
            return False
        return True

    # ── Standard RSD constraint: rd == rs1 ────────────────────────────────
    if rd != rs1:
        return False

    # ── Register range ────────────────────────────────────────────────────
    rsd = rd   # rd == rs1
    rsd_ok = (rsd in _REG4) or (allow_chain_reg and rsd == _CHAIN_REG)
    if not rsd_ok:
        return False

    # rs2 (second source for register-form ops) must always be in x0..x15
    if len(instr.uses) >= 2:
        rs2 = instr.uses[1]
        if rs2 not in _REG4:
            return False

    # ── Immediate range: 5 signed bits → −16..+15 ─────────────────────────
    if mn in _IMM_FORMS:
        imm = instr.imm
        if imm is None:
            return False
        if imm < -16 or imm > 15:
            return False

    return True


def _rule_dual_arith(a: "Instruction", b: "Instruction",
                     liveness: dict) -> bool:
    """
    Two independent arithmetic operations, each satisfying the dual-arith
    encoding constraints (RSD form, registers in x0..x15, 5-bit immediate).
    """
    return a.dual_arith_ok and b.dual_arith_ok


def _rule_dual_arith_chain(a: "Instruction", b: "Instruction",
                            liveness: dict) -> bool:
    """
    Two arithmetic operations linked through t6 (x31) as an implicit
    intermediate register.

    Instruction A writes its result to t6 (x31).
    Instruction B reads t6 as its first source (rs1).
    t6 must be dead after B — its value does not escape the pair.

    This models a fused "compute-then-use" sequence where the intermediate
    value in t6 is implicit in the compact encoding and costs no register
    file bits:

        addi  x31, a0, 5     # A: t6 = a0 + 5
        and   a1,  x31, a2   # B: a1 = t6 & a2;  t6 dead after

    Constraints on A:
      - Mnemonic in _DUAL_ARITH_MN
      - RSD: rd == rs1  (so A computes  t6 = t6 op imm/rs2)
      - rd == t6 (x31)  — the chain register
      - rs1 (== rd) == t6 is outside x0..x15 but is explicitly allowed
      - rs2 (if present) must be in x0..x15

    Constraints on B:
      - Mnemonic in _DUAL_ARITH_MN
      - RSD: rd == rs1 == t6  i.e. first source is t6
      - rd (the output of B) must be in x0..x15
      - rs2 (if present) must be in x0..x15
      - 5-bit immediate constraint applies as normal
      - t6 must be dead after B  (liveness check)
    """
    # ── Instruction A: must write t6 as its RSD register ──────────────────
    if not a.dual_arith_chain_ok:
        return False

    # ── Instruction B: must read t6 as rs1 ────────────────────────────────
    if b.mnemonic not in _DUAL_ARITH_MN:
        return False
    rs1_b = b.uses[0] if b.uses else None
    if rs1_b != _CHAIN_REG:
        return False

    # B's destination (rd) must be in x0..x15 (the result must be addressable)
    rd_b = b.defs[0] if b.defs else None
    if rd_b is None or rd_b not in _REG4:
        return False

    # B's rs2 (if present) must be in x0..x15
    if len(b.uses) >= 2 and b.uses[1] not in _REG4:
        return False

    # B's immediate must fit in 5 signed bits
    if b.mnemonic in _IMM_FORMS:
        imm = b.imm
        if imm is None or imm < -16 or imm > 15:
            return False

    # ── t6 must be dead after B ────────────────────────────────────────────
    if _CHAIN_REG not in liveness.get(b.index, frozenset()):
        return False

    return True


def _rule_arith_branch(a: "Instruction", b: "Instruction",
                       liveness: dict) -> bool:
    """
    Arithmetic operation (dual-arith subset) followed by a conditional
    branch on whether the result is zero.

    Matches:
        <dual-arith op>  rd, rd, rs2/imm   (RSD form, rd in x0..x15)
        beqz / bnez      rd, label          (same rd)

    The arithmetic instruction must satisfy all dual-arith encoding
    constraints: mnemonic in _DUAL_ARITH_MN, RSD form (rd == rs1),
    all register operands in x0..x15, and 5-bit signed immediate for
    immediate forms.

    The branch tests whether rd is zero; rd must be the same register as
    the arithmetic destination.  Unlike cmp_branch, rd is explicitly
    encoded in the compact word (it appears in both instructions), so
    there is no liveness requirement — rd may be read after the branch.

    Canonical examples:
        addi  x8, x8, -1      # decrement loop counter
        bnez  x8, .loop       # branch while counter != 0

        and   x10, x10, x11   # mask result
        beqz  x10, .done      # branch if masked value is zero
    """
    if not a.dual_arith_ok:
        return False

    rd = a.defs[0] if a.defs else None
    if rd is None:
        return False

    # B must be a zero-test branch
    if b.mnemonic not in ("beqz", "bnez"):
        return False

    # B must test the same register that A produced
    # beqz/bnez are pseudo-instructions; after parsing, b.uses[0] is the
    # tested register (they expand to beq/bne rs,x0,label).
    tested = b.uses[0] if b.uses else None
    if tested != rd:
        return False

    return True


_DUAL_MOVE_MN = frozenset({"mv", "li"})


def _dual_move_ok(instr: "Instruction") -> bool:
    """Return True if *instr* is eligible as one slot of a dual_move pair."""
    if instr.mnemonic not in _DUAL_MOVE_MN:
        return False
    rd = instr.defs[0] if instr.defs else None
    if rd is None or rd not in _REG4:
        return False
    if instr.mnemonic == "mv":
        rs = instr.uses[0] if instr.uses else None
        if rs is None or rs not in _REG4:
            return False
    else:  # li
        imm = instr.imm
        if imm is None or imm < -16 or imm > 15:
            return False
    return True


def _rule_dual_move(a: "Instruction", b: "Instruction",
                    liveness: dict) -> bool:
    """
    Two independent register-move or small-immediate-load instructions.

    Matches any combination of:
        mv   rd, rs          (copy register, rs in x0..x15)
        li   rd, imm         (load 5-bit signed immediate, −16..+15)

    Constraints:
      - A and B must each be mv or li.
      - Both destination registers must be in x0..x15 (4-bit field).
      - For mv: the source register must be in x0..x15.
      - For li: the immediate must be a plain integer literal fitting in
        5 signed bits (−16..+15).  Symbol-relative values are rejected.
      - The two destination registers must be distinct; encoding two writes
        to the same register in one compact word serves no purpose.
      - Either order is valid — (mv, li), (li, mv), (mv, mv), (li, li).
        The BnB scheduler will try both orderings, so a single symmetric
        predicate covers all four cases.

    No liveness check is required because neither instruction produces an
    intermediate value that the other consumes; both destinations are
    independently written.

    Canonical examples:
        mv   a0, a1          # a0 = a1
        li   a2, 7           # a2 = 7

        li   x8, -1          # x8 = -1
        li   x9, 0           # x9 = 0

        mv   x10, x11        # copy pair
        mv   x12, x13
    """
    if not (_dual_move_ok(a) and _dual_move_ok(b)):
        return False
    # Distinct destinations — encoding two writes to the same register
    # in a single compact word is pointless and likely unrepresentable.
    return a.defs[0] != b.defs[0]


# Registry: (display_name, rule_function)
# Rules are tested in order; the first match wins.
COMPACT32_RULES: list = [
    ("cmp_branch",          _rule_cmp_branch),
    ("adjacent_load_pair",  _rule_adjacent_load_pair),
    ("adjacent_store_pair", _rule_adjacent_store_pair),
    ("pre_increment",       _rule_pre_increment),
    ("post_increment",      _rule_post_increment),
    ("dual_arith",          _rule_dual_arith),
    ("dual_arith_chain",    _rule_dual_arith_chain),
    ("arith_branch",        _rule_arith_branch),
    ("dual_move",           _rule_dual_move),
]


def make_compact32_scorer(liveness: dict) -> "PairScoreFn":
    """
    Return a pair-scoring function for the compact-32 encoding experiment.

    The returned function:
      - Returns 1.0 if any rule in COMPACT32_RULES matches the pair.
      - Returns 0.0 otherwise.

    *liveness* is the dict returned by compute_liveness(), needed by rules
    that test whether an intermediate register is dead after the pair.

    The scorer holds its liveness reference in a mutable cell so that
    ``AssemblyScheduler.emit()`` can refresh it after register renaming
    (renaming changes which registers are dead at each instruction, so the
    liveness map must be recomputed over the renamed sequence before the
    final pair-count and annotation pass).

    Usage::

        sched = AssemblyScheduler(src)
        sched.analyse()
        scorer = make_compact32_scorer(sched.liveness)
        output = sched.emit(pair_score=scorer)
    """
    # Mutable cell: [current_liveness_dict].  emit() may write a fresh dict
    # into cell[0] after renaming; the closure always reads cell[0].
    cell: list = [liveness]

    # Per-rule A-side guards: a cheap boolean per instruction that must be True
    # before calling the full (more expensive) rule function.  This avoids
    # executing any rule body when instruction A clearly can't satisfy it.
    # Uses module-level constants: _COMPACT32_BRANCH_MN, _ADDR_ARITH, _MEM_OPS,
    # _DUAL_MOVE_MN.
    def _a_eligible(a: "Instruction") -> "frozenset[str]":
        """Return the set of rule names for which instruction A could match."""
        eligible = set()
        if a.defs and a.defs[0] == "x31":
            eligible.add("cmp_branch")
            if a.dual_arith_chain_ok:
                eligible.add("dual_arith_chain")
        if a.mnemonic == "lw":
            eligible.add("adjacent_load_pair")
        if a.mnemonic == "sw":
            eligible.add("adjacent_store_pair")
        if a.mnemonic in _ADDR_ARITH:
            eligible.add("pre_increment")
        if a.mnemonic in _MEM_OPS:
            eligible.add("post_increment")
        if a.dual_arith_ok:
            eligible.add("dual_arith")
            eligible.add("arith_branch")
        if a.mnemonic in _DUAL_MOVE_MN:
            eligible.add("dual_move")
        return frozenset(eligible)

    # Pre-build the eligible set for each instruction once, then cache it.
    # (The cache is a simple dict keyed by instruction index.)
    _elig_cache: dict = {}

    def _get_eligible(a: "Instruction") -> "frozenset[str]":
        idx = a.index
        if idx not in _elig_cache:
            _elig_cache[idx] = _a_eligible(a)
        return _elig_cache[idx]

    def _score(a: "Instruction", b: "Instruction") -> float:
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return 0.0   # branches only allowed in the second slot
        elig = _get_eligible(a)
        if not elig:
            return 0.0
        for _name, rule in COMPACT32_RULES:
            if _name in elig and rule(a, b, cell[0]):
                return 1.0
        return 0.0

    def _describe(a: "Instruction", b: "Instruction") -> str:
        """Return the name of the first matching rule, or empty string."""
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return ""
        elig = _get_eligible(a)
        for name, rule in COMPACT32_RULES:
            if name in elig and rule(a, b, cell[0]):
                return name
        return ""

    # Attach the cell so emit() can update it without rebuilding the scorer.
    _score._liveness_cell = cell
    # Attach the describe hook so emit() can collect per-rule counts.
    _score._describe_pair = _describe
    # Attach the rule list so emit() can compute per-rule candidate counts.
    _score._rule_list = COMPACT32_RULES
    return _score


def _describe_pair(a: "Instruction", b: "Instruction",
                   liveness: dict) -> str:
    """Return the name of the first matching compact32 rule, or ''."""
    for name, rule in COMPACT32_RULES:
        if rule(a, b, liveness):
            return name
    return ""


# ---------------------------------------------------------------------------
# Scorer registry — maps CLI name -> (factory_fn, description)
# ---------------------------------------------------------------------------
#
# factory_fn is a zero-argument callable that returns a PairScoreFn.
# To add a new scorer: add an entry here and it appears automatically in
# --list-rules output and --scorer choices.

SCORERS: dict = {
    "rvc": (
        lambda: _compress_pair_score,
        "Pair instructions that both have a 16-bit RVC encoding (default)",
    ),
    "compact32": (
        # Liveness starts empty; _process_block refreshes the cell before
        # any scoring occurs, so the initial value never matters.
        lambda: make_compact32_scorer({}),
        "Pair instructions that can be fused into a compact 32-bit "
        "encoding (cmp+branch, adjacent loads/stores, …)",
    ),
}

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
    ap.add_argument("--opcode-tally", action="store_true",
                    help="Append a ranked tally of unpaired opcode combinations "
                         "to the output and stderr report. Use this to identify "
                         "the best candidates for new pairing rules.")
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

    if args.input == "-":
        source = sys.stdin.read()
    else:
        source = open(args.input).read()

    sched = AssemblyScheduler(source)

    factory, _ = SCORERS[args.scorer]
    pair_score = factory()

    # Stream output directly to stdout; summary printed at end of process().
    sched.process(
        pair_score   = pair_score,
        rename       = args.rename,
        opcode_tally = args.opcode_tally,
        out          = sys.stdout,
        verbose      = args.verbose,
    )

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
        if args.opcode_tally:
            for line in st._opcode_tally_lines():
                print(line, file=sys.stderr)


if __name__ == "__main__":
    main()
