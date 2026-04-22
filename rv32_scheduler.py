
"""
rv32_scheduler.py

RV32 instruction scheduler: reads assembly source,
reorders instructions within basic blocks to maximise pairing opportunities,
and emits the reordered assembly with PAIR+ annotations.

Unpaired instructions are annotated with per-category MISS tags describing
the rejection reasons returned by each pairing rule they qualified for:

    # MISS-A:chain[load_arith_chain:nodep,load_branch_chain:live]
    # MISS-B:jumpret[arith_jump:wrongreg]

MISS-A tags describe the instruction's failure as the first instruction of
a potential pair (partnered with the next instruction in output order);
MISS-B tags describe failure as the second instruction (partnered with the
previous).  See ``rv32_scorers.RULE_CATEGORIES`` for the category list and
``rv32_tally.py`` for aggregation.

Usage
-----
    python rv32_scheduler.py input.s
    python rv32_scheduler.py input.s --scorer compact32
    python rv32_scheduler.py input.s --no-rename -v
    python rv32_scheduler.py --list-rules
    python rv32_scheduler.py -          # read from stdin

"""
import re, io, sys, copy, argparse, os
from collections import defaultdict, Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from typing import Callable

from rv32_core import (
    Instruction, enable_wide_dual_arith, parse_line,
    _INT_ABI, _FP_ABI, _SENTINEL_MN,
    _MEM_OPS,
)
from rv32_analysis import (
    DepGraph, build_dep_graph, compute_liveness,
    _classify_labels, build_cfg_liveness, _LABEL_DEF,
)
from rv32_scorers import (
    PairScoreFn, can_compress, _compress_pair_score,
    COMPACT32_RULES, RULE_CATEGORIES, SCORERS,
    _RULE_CATEGORY, _CATEGORY_RULES,
    _a_eligible_rules, _b_eligible_rules,
    make_compact32_scorer,
)
from rv32_rename import (
    _ALL_INT_REGS, _ALL_FP_REGS, _TEMPORARIES, _RESERVED,
    _ABI_RETURN_REGS, _ABI_ARG_REGS, _ABI_CALLEE_SAVED,
    _ABI_CALL_LIVE_OUT, _ABI_RETURN_SITE_LIVE_IN,
    _reg_family, _reg_pool,
    _swap_raw, _apply_rename, _undo_rename,
    rename_destinations, count_pairs,
)
from rv32_bnb import _bnb_schedule, _bnb_schedule_window, _BNB_WINDOW

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
        )

    def summary_lines(self) -> list:
        """Return comment lines suitable for appending to assembly output.

        Output structure
        ----------------
        Two header rows use identical layout so they can be compared directly:

          # pairs:       A/N  (2A of T instructions paired)
          # rvc ceiling: C/N  (E of T instructions eligible)

        where A = successful pairs, N = possible pairs (T//2), T = total
        instructions, C = rvc_eligible//2 (max pairs if all eligible paired),
        E = rvc_eligible.  Both rows share the same /N denominator and the
        same "of T" total so the numbers are immediately comparable.

        Rule rows follow at one level of indentation, then the size estimate.
        Opcode tally tables have moved to the rv32_tally.py tool, which reads
        MISS-A:/MISS-B: annotations from the scheduler output.
        """
        # ── Header rows: pairs achieved vs rvc ceiling ───────────────────
        lbl_pairs = "pairs:"
        lbl_rvc   = "rvc ceiling:"
        hdr_w     = max(len(lbl_pairs), len(lbl_rvc))

        lines = [
            f"# {lbl_pairs.ljust(hdr_w)}  "
            f"{self.successful_pairs}/{self.possible_pairs}"
            f"  ({self.paired_instrs} of {self.total_instrs} instructions paired)",
        ]
        if self.rvc_eligible:
            ceiling = self.rvc_eligible // 2
            lines.append(
                f"# {lbl_rvc.ljust(hdr_w)}  "
                f"{ceiling}/{self.possible_pairs}"
                f"  ({self.rvc_eligible} of {self.total_instrs} instructions eligible)"
            )

        # ── Per-rule rows ────────────────────────────────────────────────
        _rule_order = {name: i for i, (name, _) in enumerate(COMPACT32_RULES)}
        all_rules = sorted(
            set(self.rule_counts) | set(self.rule_shadow) | set(self.rule_missed),
            key=lambda r: (-self.rule_counts.get(r, 0), _rule_order.get(r, 999))
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

        # ── Unpaired count and size estimate ─────────────────────────────
        if self.unpaired_instrs:
            lines.append(f"# unpaired:  {self.unpaired_instrs}")

        lines.append(
            f"# size est:  {self.estimated_bytes} bytes"
            f"  (baseline {self.baseline_bytes},"
            f" saving {self.saving_bytes} = {self.saving_pct:.1f}%)"
        )
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
        )

# ---------------------------------------------------------------------------
# Near-miss annotations for unpaired instructions
# ---------------------------------------------------------------------------

def _miss_tag(instr: "Instruction", partner: "Instruction",
              side: str, liveness: dict) -> str:
    """Build a single ``MISS-<side>`` annotation string for *instr*.

    *side* is ``"A"`` (instr is the first of the putative pair, partnered with
    the *next* instruction in output order) or ``"B"`` (instr is the second,
    partnered with the *previous*).  *partner* is the adjacent instruction on
    that side, or ``None`` if there is no partner (start/end of block).

    The annotation lists every category in which *instr* was structurally
    eligible but at least one rule rejected the pair.  Categories fully
    covered by accepted rules are omitted — they would already have produced
    a PAIR+ annotation.  Returns an empty string if *instr* has no
    near-miss categories.
    """
    if partner is None:
        return ""
    if side == "A":
        elig = _a_eligible_rules(instr)
        a, b = instr, partner
    else:
        elig = _b_eligible_rules(instr)
        a, b = partner, instr
    if not elig:
        return ""
    buckets: dict = {cat: [] for cat in RULE_CATEGORIES}
    for cat in RULE_CATEGORIES:
        for name, fn in _CATEGORY_RULES[cat]:
            if name not in elig:
                continue
            reason = fn(a, b, liveness)
            if reason is None:
                # One rule accepted — the instruction *could* pair here.
                # We still list rejections from sibling rules in the same
                # category since they are informative near-misses.
                continue
            buckets[cat].append(f"{name}:{reason}")
    parts = []
    for cat in RULE_CATEGORIES:
        if buckets[cat]:
            parts.append(f"MISS-{side}:{cat}[{','.join(buckets[cat])}]")
    return " ".join(parts)


# ---------------------------------------------------------------------------
# Chain-reorder helpers
# ---------------------------------------------------------------------------

def _order_run_by_chains(instrs: list, graph: "DepGraph",
                         pair_score: "PairScoreFn" = None) -> list:
    """
    Topologically sort *instrs* with a greedy "closest would-be partner" bias.

    Within the constraints of the dep graph, pick each next instruction so
    it sits next to the instruction most likely to be its encoding partner.
    The ranking is:

        1. A direct dep-graph predecessor of ``last_emitted`` (producer-
           consumer chain continuation).
        2. A candidate that shares a rule-category membership with
           ``last_emitted`` — ``last_emitted`` qualifies as A of some rule
           and the candidate qualifies as B of the same category, or vice
           versa.  This groups leftover instructions with their closest
           would-be partner even when no real pair is possible.
        3. Lowest original index (stable fallback).

    Parameters
    ----------
    instrs
        The instructions to reorder (a contiguous singleton run, no pairs).
    graph
        The full block dep graph — used for predecessor/successor lookups.
    pair_score
        Optional scorer whose ``_get_a_elig`` / ``_get_b_elig`` hooks are
        used for category-affinity tie-breaking.  ``None`` disables the
        affinity bias and falls back to plain chain-reorder behaviour.

    Returns
    -------
    A reordered list that respects all dep-graph edges among *instrs*.
    """
    if len(instrs) <= 1:
        return list(instrs)

    idx_set = {instr.index for instr in instrs}
    by_idx  = {instr.index: instr for instr in instrs}

    get_a_elig = getattr(pair_score, "_get_a_elig", None)
    get_b_elig = getattr(pair_score, "_get_b_elig", None)

    def _categories(elig: "frozenset[str]") -> "frozenset[str]":
        return frozenset(_RULE_CATEGORY[name] for name in elig
                         if name in _RULE_CATEGORY)

    # Compute in-degree restricted to edges within this run.
    in_deg: dict = {instr.index: 0 for instr in instrs}
    for instr in instrs:
        for succ in graph.successors[instr.index]:
            if succ in idx_set:
                in_deg[succ] += 1

    ready = [instr for instr in instrs if in_deg[instr.index] == 0]
    result: list = []
    last_emitted: "Instruction | None" = None

    while ready:
        chosen = None
        # Tier 1: dep-graph successor of last_emitted (hard chain).
        if last_emitted is not None:
            for cand in ready:
                if last_emitted.index in graph.predecessors[cand.index]:
                    chosen = cand
                    break
        # Tier 2: category affinity with last_emitted.
        if chosen is None and last_emitted is not None and get_b_elig is not None:
            last_a_cats = _categories(get_a_elig(last_emitted))
            if last_a_cats:
                for cand in ready:
                    if last_a_cats & _categories(get_b_elig(cand)):
                        chosen = cand
                        break
        # Tier 3: stable fallback.
        if chosen is None:
            chosen = ready[0]

        ready.remove(chosen)
        result.append(chosen)
        last_emitted = chosen

        for succ in graph.successors[chosen.index]:
            if succ in idx_set:
                in_deg[succ] -= 1
                if in_deg[succ] == 0:
                    ready.append(by_idx[succ])

    # Append any stragglers (shouldn't happen if graph is acyclic within run).
    remaining = [i for i in instrs if i not in result]
    result.extend(remaining)
    return result


def _chain_reorder_singletons(
    real_scheduled: list,
    pair_start_set: set,
    pair_end_set:   set,
    graph:          "DepGraph",
    pair_score:     "PairScoreFn" = None,
) -> list:
    """
    Reorder singleton runs within *real_scheduled* to maximise
    producer-consumer adjacency, without disturbing paired instructions.

    A singleton run is a maximal contiguous subsequence of instructions
    where none occupies a position in *pair_start_set* or *pair_end_set*.
    Each such run is independently reordered by ``_order_run_by_chains``.
    Paired instructions are left in their original positions.

    *pair_start_set* and *pair_end_set* are sets of **positions** (integer
    offsets into *real_scheduled*), as produced by the greedy-advance walk.

    Returns a new list (same length as *real_scheduled*).
    """
    result: list = []
    run:    list = []

    for pos, instr in enumerate(real_scheduled):
        if pos in pair_start_set or pos in pair_end_set:
            if run:
                result.extend(_order_run_by_chains(run, graph, pair_score))
                run.clear()
            result.append(instr)
        else:
            run.append(instr)
    if run:
        result.extend(_order_run_by_chains(run, graph, pair_score))
    return result



# ---------------------------------------------------------------------------
# ABI-based block boundary liveness
# ---------------------------------------------------------------------------

def _abi_liveness_for_terminal(real_scheduled: list) -> tuple:
    """
    Derive ABI-mandated liveness at a block boundary from its terminal
    instruction, without requiring a full control-flow graph.

    Returns ``(live_out, next_live_in)`` — both frozensets of canonical
    register names (xN form).

    ``live_out``
        Registers that must be treated as live at the *end* of this block,
        regardless of whether any instruction within the block reads them.
        Passed as the ``live_out`` seed to ``rename_destinations`` so the
        renamer does not clobber values that must survive past the boundary.

    ``next_live_in``
        Registers that are architecturally live at the *start* of the block
        that follows this one (the return site, or the instruction after a
        call).  Stored and forwarded as ``block_live_in`` when the next block
        is processed.

    Terminal classification
    -----------------------
    ``ret`` / ``jr ra``  (jalr x0, 0(ra) — detected structurally)
        live_out  = {x10, x11} ∪ callee-saved
        next_live_in = {}

    ``tail``
        live_out  = {x10–x17}   (all argument regs forwarded to tail callee)
        next_live_in = {}        (tail call has no local return site)

    ``call`` / ``jal rd=x1`` / ``jalr rd=x1``  (direct or indirect call)
        live_out  = _ABI_CALL_LIVE_OUT  (args + callee-saved)
        next_live_in = _ABI_RETURN_SITE_LIVE_IN  (callee-saved + ra + a0/a1)

    All other terminals (conditional branch, unconditional jump, fall-through)
        live_out  = {}  (conservative; cross-block CFG analysis handles these)
        next_live_in = {}
    """
    if not real_scheduled:
        return frozenset(), frozenset()

    last = real_scheduled[-1]
    mn   = last.mnemonic

    # ret / jr ra: function return — jalr with no link register (rd=x0),
    # base register = ra (x1).  Canonicalised from "ret" to "jalr" by
    # parse_line, so we detect it by structure rather than mnemonic.
    # Callee-saved registers (including sp) are live-out because the caller
    # expects them preserved across the call.
    if mn == "jalr" and not last.defs and "x1" in last.uses:
        return _ABI_RETURN_REGS | _ABI_CALLEE_SAVED, frozenset()

    if mn == "tail":
        return _ABI_ARG_REGS, frozenset()

    # Direct call pseudo-instruction.
    if mn == "call":
        return _ABI_CALL_LIVE_OUT, _ABI_RETURN_SITE_LIVE_IN

    # Raw jal/jalr: distinguish call (rd=x1) from jump (rd=x0/none).
    if mn in ("jal", "jalr") and "x1" in last.defs:
        return _ABI_CALL_LIVE_OUT, _ABI_RETURN_SITE_LIVE_IN

    return frozenset(), frozenset()


def _process_block(
    pass_lines:        list,
    instructions:      list,
    sentinel_texts:    dict,
    pair_score:        "PairScoreFn",
    rename:            bool,
    out,
    verbose:           bool = False,
    is_function_entry: bool = False,
    block_live_in:     frozenset = frozenset(),
    cfg_live_out:      frozenset = frozenset(),
    same_base_reorder:    bool = False,
    chain_reorder:        bool = False,
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
    is_function_entry
        True when this block begins immediately after a globally-visible label
        (a function entry point).  When set, the ABI argument registers
        ``a0–a7`` (``x10–x17``) are added to the live-in set so the renamer
        never picks them as free rename targets.
    block_live_in
        Additional registers known to be live on entry to this block from
        cross-block ABI analysis.  Merged with any function-entry live-in.
        Typically ``_ABI_RETURN_SITE_LIVE_IN`` when the preceding block ended
        with a call instruction.
    cfg_live_out
        The live-out set for this block computed by the whole-function CFG
        liveness pre-pass (``build_cfg_liveness``).  Merged with the ABI
        terminal seed so the renamer has an accurate picture of which
        registers are read by successor blocks.
    """
    # Flush leading pass-through text.
    for line in pass_lines:
        print(line, file=out)

    if not instructions:
        return PairStats.empty()

    graph = build_dep_graph(instructions, same_base_reorder=same_base_reorder)

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
        # Determine ABI-mandated live-out and live-in sets for this block
        # from the terminal instruction's calling-convention semantics.
        abi_live_out, _ = _abi_liveness_for_terminal(real_scheduled)
        # Merge with the CFG-computed live-out: cfg_live_out captures what
        # successor blocks actually read, giving a tighter picture than the
        # ABI terminal alone for blocks ending in conditional branches or
        # fall-throughs.  Union is safe: we never mark a live register dead.
        combined_live_out = abi_live_out | cfg_live_out

        abi_live_in = _ABI_ARG_REGS if is_function_entry else frozenset()
        # Merge with any cross-block live-in provided by the caller (e.g.
        # the return-site live-in from the preceding call block).
        abi_live_in = abi_live_in | block_live_in

        real_scheduled = rename_destinations(
            real_scheduled, graph, pair_score,
            live_out = combined_live_out,
            live_in  = abi_live_in,
        )
        if hasattr(pair_score, "_liveness_cell"):
            pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

    real_pos = {instr.index: p for p, instr in enumerate(real_scheduled)}

    # ── Greedy-advance walk ───────────────────────────────────────────────
    total_instrs = len(real_scheduled)
    successful   = 0

    rule_counts:  Counter = Counter()
    rule_shadow:  Counter = Counter()
    rule_missed:  Counter = Counter()

    pair_start_set: set  = set()
    pair_end_set:   set  = set()
    pair_rules:     dict = {}

    rule_list     = getattr(pair_score, "_rule_list", None)
    describe_fn   = getattr(pair_score, "_describe_pair", None)
    liveness_snap = (pair_score._liveness_cell[0]
                     if hasattr(pair_score, "_liveness_cell") else {})

    # ── Greedy-advance walk: identify primary pairs ───────────────────────
    # pair_start_set / pair_end_set hold *positions* in real_scheduled.
    i = 0
    while i < total_instrs:
        if i + 1 < total_instrs:
            a_s, b_s    = real_scheduled[i], real_scheduled[i + 1]
            slot_scores = pair_score(a_s, b_s) > 0

            if rule_list is not None:
                matching_primary = [rn for rn, rf in rule_list
                                    if rf(a_s, b_s, liveness_snap) is None]
                if matching_primary:
                    winner = matching_primary[0]
                    if slot_scores:
                        pair_start_set.add(i)
                        pair_end_set.add(i + 1)
                        pair_rules[i] = winner
                        successful += 1
                        rule_counts[winner] += 1
                        for rn in matching_primary[1:]:
                            rule_shadow[rn] += 1
                        i += 2
                        continue
                    else:
                        rule_missed[winner] += 1
            else:
                if slot_scores:
                    pair_start_set.add(i)
                    pair_end_set.add(i + 1)
                    rule = describe_fn(a_s, b_s) if describe_fn else ""
                    pair_rules[i] = rule
                    successful += 1
                    rule_counts[rule] += 1
                    i += 2
                    continue
        i += 1

    # ── Optional chain-reorder of singleton runs ─────────────────────────
    if chain_reorder:
        real_scheduled = _chain_reorder_singletons(
            real_scheduled, pair_start_set, pair_end_set, graph, pair_score)
        real_pos = {instr.index: p for p, instr in enumerate(real_scheduled)}

    # ── Annotate each unpaired instruction with MISS-A/MISS-B tags ────────
    # For each unpaired instruction, run every rule that it qualifies for
    # against its adjacent neighbour (next for A-side, previous for B-side)
    # and collect the rejection reasons per category.  Paired instructions
    # are skipped since they produce PAIR+/PAIR= annotations instead.
    tally_annots: dict = {}   # {instruction.index: "TAG1 TAG2 …"}
    for i, instr in enumerate(real_scheduled):
        if i in pair_start_set or i in pair_end_set:
            continue
        parts = []
        next_partner = real_scheduled[i + 1] if i + 1 < total_instrs else None
        prev_partner = real_scheduled[i - 1] if i > 0 else None
        a_tag = _miss_tag(instr, next_partner, "A", liveness_snap)
        b_tag = _miss_tag(instr, prev_partner, "B", liveness_snap)
        if a_tag:
            parts.append(a_tag)
        if b_tag:
            parts.append(b_tag)
        if parts:
            tally_annots[instr.index] = " ".join(parts)

    # ── Emit annotated output ─────────────────────────────────────────────
    # Walk `scheduled` (sentinels included) in order.  Sentinels are barriers
    # and cannot move, so they appear in their original relative positions.
    # For each real instruction, emit any prefix_lines (non-barrier labels
    # anchored to it) first, then the instruction text.
    for instr in scheduled:
        if instr.mnemonic == _SENTINEL_MN:
            for label_line in sentinel_texts.get(instr.index, []):
                print(label_line, file=out)
        else:
            for prefix in instr.prefix_lines:
                print(prefix, file=out)
            rp = real_pos.get(instr.index)
            if rp in pair_start_set:
                rule_tag = pair_rules.get(rp, "")
                tag = f"  # PAIR+ [{rule_tag}]" if rule_tag else "  # PAIR+"
                print(instr.raw + tag, file=out)
            elif rp in pair_end_set:
                print(instr.raw + "  # PAIR=", file=out)
            else:
                ann = tally_annots.get(instr.index, "")
                print(instr.raw + (f"  # {ann}" if ann else ""), file=out)

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
    )

# ---------------------------------------------------------------------------
# Parallel processing helpers
# ---------------------------------------------------------------------------

def _split_into_functions(source: str) -> "list[str]":
    """Split assembly source into chunks at globally-visible label boundaries.

    Returns a list of source-text chunks.  The first chunk is the preamble
    (everything before the first globally-visible label, possibly empty).
    Each subsequent chunk starts just before the inter-function gap
    (blank lines, ``.globl`` directives, comments) that precedes its entry
    label, so all associated directives travel with the function they declare.
    """
    _, globally_visible = _classify_labels(source)
    lines = source.splitlines(keepends=True)

    # First pass: find the line index of each globally-visible label definition.
    func_label_lines: list = []
    for i, line in enumerate(lines):
        m = _LABEL_DEF.match(line.strip())
        if m and m.group(1) in globally_visible:
            func_label_lines.append(i)

    if not func_label_lines:
        return [source]

    # For each function-entry label, walk backwards to capture the preamble:
    # blank lines, comments, .globl/.weak directives, .type, .p2align, etc.
    # that conventionally sit between functions.
    split_points: list = []
    for label_line in func_label_lines:
        start = label_line
        while start > 0:
            prev = lines[start - 1].strip()
            if (not prev
                    or prev.startswith("#") or prev.startswith("//")
                    or prev.startswith(";")
                    or prev.startswith(".")):
                start -= 1
            else:
                break
        split_points.append(start)

    # De-duplicate and sort (the first function's preamble walk might reach 0).
    split_points = sorted(set(split_points))
    # Don't split at 0 — that would create an empty first chunk.
    if split_points and split_points[0] == 0:
        split_points = split_points[1:]

    chunks: list = []
    prev = 0
    for sp in split_points:
        chunks.append("".join(lines[prev:sp]))
        prev = sp
    chunks.append("".join(lines[prev:]))
    return chunks


def _process_function_chunk(
    chunk: str,
    rename: bool,
    verbose: bool,
    same_base_reorder: bool,
    chain_reorder: bool,
    label_sets: tuple = None,
) -> "tuple[str, PairStats]":
    """Process a single function chunk and return (output_text, stats).

    Top-level function (not a method or closure) so it is picklable by
    ``ProcessPoolExecutor``.  Each call constructs its own scorer with
    independent mutable state.
    """
    pair_score = make_compact32_scorer({})
    sched = AssemblyScheduler(chunk)
    buf = io.StringIO()
    stats = sched.process(
        pair_score             = pair_score,
        rename                 = rename,
        out                    = buf,
        verbose                = verbose,
        same_base_reorder      = same_base_reorder,
        chain_reorder          = chain_reorder,
        _label_sets            = label_sets,
        _suppress_file_summary = True,
    )
    return buf.getvalue(), stats


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
        pair_score:         PairScoreFn = None,
        rename:             bool = True,
        out                      = None,
        verbose:            bool = False,
        same_base_reorder:      bool = False,
        chain_reorder:          bool = False,
        _label_sets:        tuple = None,
        _suppress_file_summary: bool = False,
    ) -> "PairStats":
        """
        Parse, schedule, and emit the source in a single streaming pass.

        Each basic block (sequence of instructions between barrier labels)
        is processed and written to *out* before the next block is read.
        Peak memory is O(block_size), not O(file_size).

        Unpaired instructions are annotated with per-category MISS-A/MISS-B
        tags listing the rejection reasons returned by each pairing rule
        they qualified for.  Use rv32_tally.py to aggregate these.

        Parameters
        ----------
        pair_score
            Scoring function for adjacent instruction pairs.  Defaults to
            the compact32 scorer (``make_compact32_scorer``).
        rename
            If True, attempt destination-register renaming per block.
        out
            File-like object to write to.  Defaults to ``sys.stdout``.
        verbose
            If True, dump the dependency graph for each block to stderr.

        Returns the aggregate ``PairStats`` for the whole file (also stored
        as ``self.last_stats``).
        """
        if pair_score is None:
            pair_score = make_compact32_scorer({})
        if out is None:
            out = sys.stdout

        # Classify labels for barrier/non-barrier scheduling decisions.
        if _label_sets is not None:
            branch_targets, globally_visible = _label_sets
        else:
            branch_targets, globally_visible = _classify_labels(self.source)

        # Whole-function CFG liveness pre-pass.  Computes live_out for every
        # basic block in a single O(N) parse + a few dataflow iterations, so
        # the renamer has an accurate exit-liveness seed for blocks that end in
        # conditional branches or fall-throughs — not just ret/call/tail.
        cfg_live_out_table: dict = build_cfg_liveness(
            self.source, branch_targets, globally_visible
        )

        # Streaming parse: accumulate one block at a time and hand it off.
        # A block boundary is any barrier label (branch target or globally
        # visible symbol).  Non-barrier labels are folded in as pass-through
        # text with no sentinel, so they never split a block.
        all_stats:    list = []
        func_stats:   list = []   # stats for the current function's blocks only
        current_func: str  = ""   # name of the function being accumulated
        instr_index        = 0
        pass_lines:     list = []   # inter-block pass-through (flushed before label)
        trailing_pass:  list = []   # post-instruction pass-through (carried to next block)
        instructions:   list = []   # Instruction objects for the current block
        sentinel_texts: dict = {}   # {sentinel.index: [line, ...]} — label + intra-block pass-throughs
        last_sentinel_idx: "int | None" = None   # index of most recent sentinel in this block
        # Label of the block currently being accumulated (used to look up its
        # CFG live-out from cfg_live_out_table).
        current_block_label:    str      = "__cfg_entry__"
        # True when the block currently being accumulated begins at a globally-
        # visible (function-entry) label.  Propagated to _process_block so the
        # renamer can treat a0–a7 as live-in.
        current_block_is_entry: bool     = False
        # ABI-derived live-in set for the block currently being accumulated,
        # computed from the terminal instruction of the *preceding* block.
        # Forwarded to _process_block so the renamer knows which registers
        # survive a call at the preceding block boundary.
        current_block_live_in:  frozenset = frozenset()

        def _emit_func_summary() -> None:
            """Emit a one-line per-function stats comment, then reset func_stats."""
            if func_stats and any(s.total_instrs for s in func_stats):
                fs     = PairStats.merge(func_stats)
                total  = fs.total_instrs
                rvc    = fs.rvc_eligible
                paired = fs.paired_instrs
                ratio  = paired / rvc if rvc else 0.0
                name   = current_func or "<top>"
                print(f"# {name}: {total} total, {rvc} rvc, {paired} paired,"
                      f" {ratio:.2f}x", file=out)
            func_stats.clear()

        def _flush_block():
            """Process and emit the accumulated block, then reset state."""
            nonlocal last_sentinel_idx, current_block_is_entry
            nonlocal current_block_live_in, current_block_label
            st = _process_block(
                pass_lines         = pass_lines,
                instructions       = instructions,
                sentinel_texts     = sentinel_texts,
                pair_score         = pair_score,
                rename             = rename,
                out                = out,
                verbose            = verbose,
                is_function_entry  = current_block_is_entry,
                block_live_in      = current_block_live_in,
                cfg_live_out       = cfg_live_out_table.get(current_block_label,
                                                            frozenset()),
                same_base_reorder      = same_base_reorder,
                chain_reorder          = chain_reorder,
            )
            all_stats.append(st)
            func_stats.append(st)
            pass_lines.clear()
            trailing_pass.clear()
            instructions.clear()
            sentinel_texts.clear()
            last_sentinel_idx      = None
            current_block_is_entry = False
            current_block_live_in  = frozenset()
            current_block_label    = "__cfg_entry__"

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

            When *label_name* is globally visible (a function entry point), the
            output stream is flushed after the preceding block is emitted so
            that each function's output is written promptly.  The new block is
            marked as a function entry so the renamer treats a0–a7 as live-in.

            The terminal instruction of the block being flushed is inspected to
            derive the ABI live-in set for the incoming block (e.g. after a
            ``call`` the return-site block inherits callee-saved + a0/a1).
            """
            nonlocal instr_index, last_sentinel_idx, current_func
            nonlocal current_block_is_entry, current_block_live_in, current_block_label
            is_entry = label_name in globally_visible

            # Compute next-block live-in from the terminal of the block we're
            # about to flush, before the instructions list is cleared.
            real_instrs = [i for i in instructions if i.mnemonic != _SENTINEL_MN]
            _, next_live_in = _abi_liveness_for_terminal(real_instrs)

            st = _process_block(
                pass_lines         = pass_lines,
                instructions       = instructions,
                sentinel_texts     = sentinel_texts,
                pair_score         = pair_score,
                rename             = rename,
                out                = out,
                verbose            = verbose,
                is_function_entry  = current_block_is_entry,
                block_live_in      = current_block_live_in,
                cfg_live_out       = cfg_live_out_table.get(current_block_label,
                                                            frozenset()),
                same_base_reorder      = same_base_reorder,
                chain_reorder          = chain_reorder,
            )
            all_stats.append(st)
            func_stats.append(st)
            instructions.clear()
            sentinel_texts.clear()
            last_sentinel_idx = None
            pass_lines.clear()
            pass_lines.extend(trailing_pass)
            trailing_pass.clear()

            # Emit per-function summary just before the new global symbol, then
            # start accumulating stats for the new function.
            if is_entry:
                _emit_func_summary()
                current_func = label_name
                out.flush()

            # The new block that starts here is a function entry if its opening
            # label is globally visible.  Its live-in comes from the ABI
            # analysis of the preceding block's terminal instruction.
            current_block_is_entry = is_entry
            current_block_live_in  = next_live_in
            current_block_label    = label_name

            sentinel = Instruction(index=instr_index, raw="", mnemonic=_SENTINEL_MN)
            sentinel.is_barrier = True
            sentinel_texts[instr_index] = [source_line]
            last_sentinel_idx = instr_index
            instr_index += 1
            instructions.append(sentinel)

        def _add_instruction(instr: "Instruction") -> None:
            """Add a real instruction, draining trailing_pass and pending_prefixes first."""
            nonlocal instr_index
            if trailing_pass:
                if last_sentinel_idx is not None:
                    sentinel_texts[last_sentinel_idx].extend(trailing_pass)
                else:
                    pass_lines.extend(trailing_pass)
                trailing_pass.clear()
            # Attach any buffered non-barrier label lines as prefix_lines on
            # this instruction.  They travel with it when it is scheduled and
            # are emitted immediately before it in the output.
            if pending_prefixes:
                instr.prefix_lines = list(pending_prefixes)
                pending_prefixes.clear()
            # instr.index was already set by parse_line(instr_index, ...)
            instr_index += 1
            instructions.append(instr)

        # Lines for non-barrier labels waiting to be attached to the next
        # real instruction as prefix_lines.  If no instruction follows before
        # the next block boundary they are flushed as pass-through text.
        pending_prefixes: list = []

        def _flush_pending_prefixes_as_passthrough() -> None:
            """
            If pending_prefixes are not consumed by an instruction before a
            block boundary (e.g. a label followed only by .word directives),
            emit them as pass-through text so they still appear in the output.
            """
            for pl in pending_prefixes:
                _route_pass(pl)
            pending_prefixes.clear()

        for line in self.source.splitlines():
            stripped = line.strip()
            if not stripped or stripped.startswith(("#", ";", "//")):
                _route_pass(line)
                continue

            # Check for a label definition BEFORE the dot-prefix filter.
            # Labels like `.Lbranch_xxx:` start with '.' and would otherwise
            # be swallowed as assembler directives.
            m = _LABEL_DEF.match(stripped)
            if m:
                label_name = m.group(1)
                if self._is_barrier_label(label_name,
                                          branch_targets, globally_visible):
                    # Flush any pending prefix labels as pass-through before
                    # starting the new block — they have no following instruction
                    # in this block to attach to.
                    _flush_pending_prefixes_as_passthrough()
                    _add_sentinel(label_name, line)
                else:
                    # Non-barrier label: buffer it to attach to the next
                    # instruction as a prefix line.  It must stay positionally
                    # anchored to that instruction but does not split the block.
                    pending_prefixes.append(line)
                continue

            # Skip assembler directives (lines starting with '.').
            if stripped.startswith("."):
                # A directive after pending_prefixes means no instruction
                # follows — flush prefixes as pass-through.
                if pending_prefixes:
                    _flush_pending_prefixes_as_passthrough()
                _route_pass(line)
                continue

            instr = parse_line(instr_index, line)
            if instr is None:
                if pending_prefixes:
                    _flush_pending_prefixes_as_passthrough()
                _route_pass(line)
            else:
                _add_instruction(instr)

        # Flush any non-barrier labels that appeared after the last instruction.
        _flush_pending_prefixes_as_passthrough()
        # Flush the final block.
        _flush_block()
        _emit_func_summary()   # trailing function (or only function in file)

        # Aggregate stats across all blocks.
        merged = PairStats.merge(all_stats)

        # Append the file-wide summary as assembly comments (suppressed when
        # running as a parallel worker — the caller merges stats separately).
        if not _suppress_file_summary:
            for summary_line in merged.summary_lines():
                print(summary_line, file=out)

        self.last_stats = merged
        return merged

    def emit(
        self,
        pair_score:   PairScoreFn = None,
        rename:       bool = True,
        verbose:      bool = False,
    ) -> str:
        """
        Schedule and return the reordered assembly as a single string.

        This is a convenience wrapper around ``process()`` that captures
        output in memory.  Prefer ``process(out=…)`` for large files.
        Defaults to the compact32 scorer.
        """
        if pair_score is None:
            pair_score = make_compact32_scorer({})
        buf = io.StringIO()
        self.process(pair_score=pair_score, rename=rename, out=buf, verbose=verbose)
        return buf.getvalue().rstrip("\n")

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
    ap.add_argument("--scorer", default="compact32",
                    metavar="NAME",
                    help=f"Scoring function to use. "
                         f"Choices: {list(SCORERS)}. Default: compact32")
    ap.add_argument("--list-rules", action="store_true",
                    help="List available scorers, compact32 rules, and tally rules, "
                         "then exit")
    ap.add_argument("--wide-dual-arith", action="store_true",
                    help="Relax the dual-arith register constraint from x0..x15 "
                         "to all 32 integer registers.  Quantifies the pairing "
                         "gain if the encoding were extended to 5-bit register "
                         "fields for the dual-arith rule family.")
    ap.add_argument("--chain-reorder", action="store_true",
                    help="(Experimental) After scheduling, reorder unpaired "
                         "singleton instructions within each run to maximise "
                         "producer-consumer adjacency.")
    ap.add_argument("--same-base-reorder", action="store_true",
                    help="(Experimental) Allow loads/stores to reorder past each "
                         "other when they share the same base register, the base "
                         "is not modified between them, and their address ranges "
                         "do not overlap.")
    ap.add_argument("-j", "--jobs", type=int, default=1, metavar="N",
                    help="Number of parallel worker processes.  Each function "
                         "in the input is scheduled independently; -j N spreads "
                         "them across N processes.  0 = number of CPUs.  "
                         "Default: 1 (sequential).")
    args = ap.parse_args()

    if args.wide_dual_arith:
        enable_wide_dual_arith()

    if args.list_rules:
        print("Scorers (--scorer NAME):")
        for name, (_, desc) in SCORERS.items():
            marker = " [default]" if name == "compact32" else ""
            print(f"  {name:14s}  {desc}{marker}")
        print()
        print("compact32 rules (in match order):")
        for name, fn in COMPACT32_RULES:
            doc = (fn.__doc__ or "").strip().splitlines()[0]
            cat = _RULE_CATEGORY.get(name, "-")
            print(f"  {name:26s} [{cat:7s}]  {doc}")
        print()
        print("rule categories (MISS-A:<cat>/MISS-B:<cat> annotations):")
        for cat in RULE_CATEGORIES:
            rules_in = [n for n, fn in COMPACT32_RULES
                        if _RULE_CATEGORY.get(n) == cat]
            print(f"  {cat:8s}  {', '.join(rules_in)}")
        return

    if args.scorer not in SCORERS:
        ap.error(f"Unknown scorer {args.scorer!r}. "
                 f"Available: {list(SCORERS)}")

    if args.input == "-":
        source = sys.stdin.read()
    else:
        source = open(args.input).read()

    n_jobs = args.jobs
    if n_jobs == 0:
        n_jobs = os.cpu_count() or 1

    if n_jobs > 1 and args.scorer == "compact32":
        # Parallel path: split into per-function chunks and process in
        # parallel.  Each worker gets its own scorer with independent
        # mutable state.  Label classification runs once on the whole file
        # and is shared with every worker so block boundaries are identical
        # to the sequential path.
        label_sets = _classify_labels(source)
        chunks = _split_into_functions(source)
        all_stats: list = []
        results: "list[tuple[str, PairStats]]" = [None] * len(chunks)

        # Submit largest chunks first so the pool starts on the most
        # expensive functions immediately, reducing tail latency.
        submit_order = sorted(range(len(chunks)),
                              key=lambda i: len(chunks[i]), reverse=True)

        with ProcessPoolExecutor(max_workers=n_jobs) as pool:
            future_to_idx = {}
            for idx in submit_order:
                fut = pool.submit(
                    _process_function_chunk,
                    chunks[idx],
                    rename            = args.rename,
                    verbose           = args.verbose,
                    same_base_reorder = args.same_base_reorder,
                    chain_reorder     = args.chain_reorder,
                    label_sets        = label_sets,
                )
                future_to_idx[fut] = idx
            for fut in as_completed(future_to_idx):
                idx = future_to_idx[fut]
                results[idx] = fut.result()

        for text, stats in results:
            sys.stdout.write(text)
            all_stats.append(stats)

        merged = PairStats.merge(all_stats)
        # Emit the file-wide summary that the workers suppressed.
        for summary_line in merged.summary_lines():
            print(summary_line)
    else:
        # Sequential path: single scorer, stream directly to stdout.
        factory, _ = SCORERS[args.scorer]
        pair_score = factory()

        sched = AssemblyScheduler(source)
        sched.process(
            pair_score        = pair_score,
            rename            = args.rename,
            out               = sys.stdout,
            verbose           = args.verbose,
            same_base_reorder = args.same_base_reorder,
            chain_reorder     = args.chain_reorder,
        )
        merged = sched.last_stats

    if merged is not None:
        src_label = args.input if args.input != "-" else "<stdin>"
        print(f"\n# --- report: {args.scorer}  {src_label} ---", file=sys.stderr)
        for line in merged.summary_lines():
            print(line, file=sys.stderr)

if __name__ == "__main__":
    main()
