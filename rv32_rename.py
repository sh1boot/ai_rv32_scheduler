"""
rv32_rename.py

Destination-register renaming for the RV32 scheduler.

Exports
-------
count_pairs         – greedy pair count over an instruction sequence
rename_destinations – two-phase rename pass that improves pair score
_apply_rename       – in-place rename with undo support
_undo_rename        – roll back an _apply_rename
_swap_raw           – swap two register names in an instruction's raw text

ABI register sets (also used by rv32_scheduler for liveness seeding):
  _ALL_INT_REGS, _ALL_FP_REGS, _TEMPORARIES, _RESERVED
  _ABI_RETURN_REGS, _ABI_ARG_REGS, _ABI_CALLEE_SAVED
  _ABI_CALL_LIVE_OUT, _ABI_RETURN_SITE_LIVE_IN
"""

import re
import copy

from rv32_core import (
    Instruction,
    _INT_ABI, _FP_ABI,
    _COMMUTATIVE_BINOP, _CHAIN_REG,
)
from rv32_analysis import DepGraph, compute_liveness
from rv32_scorers import PairScoreFn

# ---------------------------------------------------------------------------
# Register sets
# ---------------------------------------------------------------------------

# All integer and FP architectural registers (excluding x0 / f0 which are
# special or hardwired).
_ALL_INT_REGS = frozenset(f"x{n}" for n in range(1, 32))
_ALL_FP_REGS  = frozenset(f"f{n}" for n in range(0, 32))
# ABI temporaries: t0-t2 (x5-x7) and t3-t6 (x28-x31)
_TEMPORARIES  = frozenset(f"x{i}" for i in (5, 6, 7, 28, 29, 30, 31))
# Registers that must never be rename targets (x0, ra, sp, gp, tp)
_RESERVED     = frozenset({"x0", "x1", "x2", "x3", "x4"})

# ABI return-value registers: a0 (x10) and a1 (x11) are live-out at any ret.
_ABI_RETURN_REGS = frozenset({"x10", "x11"})
# ABI argument registers: a0–a7 (x10–x17) are live-in at every function entry.
_ABI_ARG_REGS    = frozenset(f"x{i}" for i in range(10, 18))

# Callee-saved integer registers: sp (x2), s0–s1 (x8–x9), s2–s11 (x18–x27).
# The callee is obligated to preserve these, so the caller can rely on them
# surviving any call instruction.
_ABI_CALLEE_SAVED = frozenset(
    {"x2", "x8", "x9"} | {f"x{i}" for i in range(18, 28)}
)

# Live-out at a direct or indirect call instruction (call / jal rd=x1 / jalr rd=x1):
#   - All argument registers a0–a7 (x10–x17): the caller has loaded these with
#     the arguments being passed; they must not be renamed away.
#   - All callee-saved registers: these survive the call, so any def that reaches
#     the call site and whose value is needed after return must not be renamed
#     into a caller-saved register.
_ABI_CALL_LIVE_OUT = _ABI_ARG_REGS | _ABI_CALLEE_SAVED

# Live-in at the return site (the block that immediately follows a call):
#   - Callee-saved registers (x2, x8–x9, x18–x27): restored by the callee.
#   - ra (x1): restored by the callee (though typically not read again until
#     the next ret, it is architecturally live).
#   - Return value registers a0–a1 (x10–x11): written by the callee.
#   Caller-saved temporaries (t0–t6, a2–a7) are clobbered and therefore dead.
_ABI_RETURN_SITE_LIVE_IN = _ABI_CALLEE_SAVED | frozenset({"x1", "x10", "x11"})

# ---------------------------------------------------------------------------
# Register helpers
# ---------------------------------------------------------------------------

def _reg_family(reg: str) -> str:
    """Return 'int', 'fp', or 'vec' depending on register prefix."""
    if reg.startswith("x"):
        return "int"
    if reg.startswith("f"):
        return "fp"
    return "vec"

def _reg_pool(reg: str) -> frozenset:
    """Return the full integer or FP register pool for *reg*."""
    return _ALL_INT_REGS if _reg_family(reg) == "int" else _ALL_FP_REGS

# ---------------------------------------------------------------------------
# Pair counting
# ---------------------------------------------------------------------------

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
# Low-level rename primitives
# ---------------------------------------------------------------------------

def _swap_raw(instr, r1: str, r2: str) -> None:
    """Swap two canonical register names (and their ABI aliases) in instr.raw."""
    SENT = "\x00"
    raw = instr.raw
    def _surface(canon: str) -> set:
        s = {canon}
        for abi, c in {**_INT_ABI, **_FP_ABI}.items():
            if c == canon:
                s.add(abi)
        return s
    for a in _surface(r1):
        raw = re.sub(r'\b' + re.escape(a) + r'\b', SENT, raw)
    for a in _surface(r2):
        raw = re.sub(r'\b' + re.escape(a) + r'\b', r1, raw)
    instr.raw = raw.replace(SENT, r2)


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
        # Commutative operand normalisation: for instructions where rs1/rs2 are
        # interchangeable, ensure the "key" register is always rs1 (uses[0]).
        # Preference order: chain reg (x31) > RSD form (rd == rs1) > leave alone.
        if instr.mnemonic in _COMMUTATIVE_BINOP and len(instr.uses) == 2:
            rs1, rs2 = instr.uses[0], instr.uses[1]
            rd = instr.defs[0] if instr.defs else None
            if rs2 == _CHAIN_REG and rs1 != _CHAIN_REG:
                instr.uses[0], instr.uses[1] = rs2, rs1
                _swap_raw(instr, rs1, rs2)
            elif rs2 == rd and rs1 != rd and _CHAIN_REG not in (rs1, rs2):
                instr.uses[0], instr.uses[1] = rs2, rs1
                _swap_raw(instr, rs1, rs2)
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
# Two-phase destination renaming
# ---------------------------------------------------------------------------

def rename_destinations(
    scheduled: list,
    graph: DepGraph,
    pair_score: PairScoreFn,
    max_trials: int = 5_000,
    live_out: frozenset = frozenset(),
    live_in:  frozenset = frozenset(),
) -> list:
    """
    Improve the pair score by renaming destination registers in two phases.

    *max_trials* caps the total number of rename candidates evaluated across
    both phases.  When the budget is exhausted the best schedule found so far
    is returned.  This bounds latency for large blocks where the rename search
    space is too large to explore fully.

    *live_out* is the set of registers that are architecturally live after the
    last instruction of the block (e.g. ``{x10, x11}`` at a ``ret``).  The
    renamer will not rename any def whose register is in this set if its value
    reaches the end of the block.

    *live_in* is the set of registers that are architecturally live on entry to
    the block (e.g. ``a0–a7`` at a function entry point).  These registers are
    added to the live set at position 0 so the renamer never picks them as free
    rename targets even if the block happens not to read them.

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
        # Seed the exit liveness with the ABI live-out set so the renamer
        # treats those registers as live even if not read within the block.
        t[n] = set(live_out)
        for pos in range(n - 1, -1, -1):
            instr = scheduled[pos]
            live = set(t[pos + 1])
            for r in instr.defs: live.discard(r)
            for r in instr.uses: live.add(r)
            t[pos] = live
        # Inject ABI live-in registers at position 0.  These are registers
        # whose values are provided by the caller and must not be renamed away
        # even if this block never reads them (e.g. a function that tail-calls
        # immediately without using all its arguments).
        if live_in:
            t[0] = t[0] | live_in
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
    _liveness_cell  = getattr(pair_score, "_liveness_cell", None)
    # Eligibility cache inside the scorer (keyed by instruction index).
    # Must be invalidated whenever an instruction's registers change so that
    # _a_eligible() is re-run with the current defs/uses.
    _elig_cache_ref = getattr(pair_score, "_elig_cache",    None)

    def _refresh_liveness():
        """Recompute and install fresh liveness if the scorer needs it."""
        if _liveness_cell is not None:
            _liveness_cell[0] = compute_liveness(scheduled)

    def _invalidate_elig(pos: int):
        """Drop the cached eligibility for the instruction at *pos*.
        Called after _apply_rename so the scorer recomputes eligibility from
        the instruction's current (post-rename) register state."""
        if _elig_cache_ref is not None:
            _elig_cache_ref.pop(scheduled[pos].index, None)

    def _greedy_pair_count(seq, lo: int, hi: int) -> int:
        """Greedy pair count over seq[lo..hi].
        The prev_free state at lo is read from free_table (O(1))."""
        pf = free_table[lo]
        cnt = 0
        i = lo
        while i <= hi and i < len(seq):
            if i + 1 < len(seq) and pair_score(seq[i], seq[i+1]) > 0:
                cnt += 1; pf = False; i += 2
            else:
                pf = True; i += 1
        return cnt

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

        score_before_local = _greedy_pair_count(scheduled, scan_lo, scan_hi)

        # Apply in-place, keeping undo info in case we need to roll back.
        undo = _apply_rename(scheduled, pos, window_end, rd, new_rd)
        _invalidate_elig(pos)   # defs[0] changed; drop stale eligibility
        _refresh_liveness()     # scorer may need updated liveness

        score_after_local = _greedy_pair_count(scheduled, scan_lo, scan_hi)

        if score_after_local > score_before_local:
            # Committed.  Recompute global score as delta from previous.
            new_score = score_before + (score_after_local - score_before_local)
            return (new_score,)
        else:
            _undo_rename(scheduled, undo)
            _invalidate_elig(pos)   # scoring may have re-cached the trial state
            _refresh_liveness()     # restore liveness to pre-rename state
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
            candidates = sorted(_reg_pool(rd) - live_at - _RESERVED - {rd})
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
                sb_c = _greedy_pair_count(scheduled, scan_lo_c, scan_hi_c)
                undo = _apply_rename(scheduled, pos_src, window_end, rd_src, target)
                _invalidate_elig(pos_src)   # defs[0] changed; drop stale eligibility
                sa_c = _greedy_pair_count(scheduled, scan_lo_c, scan_hi_c)
                if sa_c > sb_c:
                    return (score_ref + sa_c - sb_c,)
                _undo_rename(scheduled, undo)
                _invalidate_elig(pos_src)   # clear entry cached during the trial
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
                    free_a = sorted(_reg_pool(rd_a) - live_a - _RESERVED - {rd_a})
                    free_b = sorted(_reg_pool(rd_b) - live_b - _RESERVED - {rd_b})
                    targets_a = [t for t in free_a if t in partner_regs and t != rd_b]
                    targets_b = [t for t in free_b if t in partner_regs and t != rd_a]
                    # Affected pairs for this joint rename (covers both slots)
                    jlo = max(0, pair_start - 1)
                    jhi = min(n - 1, max(info_a[0], info_b[0]) + 1)
                    score_before_joint = _greedy_pair_count(scheduled, jlo, jhi)
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
                            _invalidate_elig(pair_start)
                            _invalidate_elig(pair_start + 1)
                            score_after_joint = _greedy_pair_count(scheduled, jlo, jhi)
                            if score_after_joint > score_before_joint:
                                score_before = score_before + score_after_joint - score_before_joint
                                changed = True
                                break
                            _undo_rename(scheduled, undo_b)
                            _undo_rename(scheduled, undo_a)
                            _invalidate_elig(pair_start)
                            _invalidate_elig(pair_start + 1)
                        if changed:
                            break

            if changed:
                break

    return scheduled
