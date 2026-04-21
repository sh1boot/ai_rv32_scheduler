"""
rv32_analysis.py

Dependency-graph construction, liveness analysis, and CFG-based whole-function
liveness for the RV32 scheduler toolchain.

Exports
-------
DepGraph            – instruction dependency graph dataclass
build_dep_graph     – build a DepGraph from a list of Instructions
compute_liveness    – backward liveness pass over an instruction list
_classify_labels    – scan assembly source for branch-target and global labels
build_cfg_liveness  – two-pass CFG liveness analysis over an entire function
"""

import re
from collections import defaultdict
from dataclasses import dataclass, field

from rv32_core import Instruction, _INT_ABI, parse_line

# ---------------------------------------------------------------------------
# Dependency graph
# ---------------------------------------------------------------------------

@dataclass
class DepGraph:
    instructions: list
    successors:   dict = field(default_factory=lambda: defaultdict(set))
    predecessors: dict = field(default_factory=lambda: defaultdict(set))

    def add_edge(self, before: int, after: int):
        if before != after:
            self.successors[before].add(after)
            self.predecessors[after].add(before)

    def in_degree(self) -> dict:
        return {i.index: len(self.predecessors[i.index])
                for i in self.instructions}

def build_dep_graph(instructions: list,
                    same_base_reorder: bool = False) -> DepGraph:
    """Build a dependency graph for *instructions*.

    same_base_reorder
        When True, loads and stores that share the same base register and have
        non-overlapping address ranges are allowed to reorder past each other.
        Only applies when the base register is provably unchanged between the
        two operations (i.e. no instruction between them writes that register).
        Stores to different offsets within the same object, and loads from
        different offsets, can therefore be moved together to become pairable.

        When False (default), all memory operations are chained sequentially —
        the conservative, always-safe behaviour.
    """
    graph = DepGraph(instructions=instructions)
    last_writer: dict = {}
    last_readers: dict = defaultdict(list)
    last_csr_writer: dict = {}
    last_csr_readers: dict = defaultdict(list)
    mem_ops: list = []
    last_barrier: int = -1

    instr_by_idx: dict = {instr.index: instr for instr in instructions}

    for instr in instructions:
        idx = instr.index
        if instr.is_barrier:
            for prev in instructions:
                if prev.index < idx:
                    graph.add_edge(prev.index, idx)
            last_barrier = idx
            if instr.is_amo:
                mem_ops.append(idx)
        if instr.is_branch and not instr.is_barrier:
            for prev in instructions:
                if prev.index < idx:
                    graph.add_edge(prev.index, idx)
        if last_barrier >= 0 and last_barrier != idx:
            graph.add_edge(last_barrier, idx)
        for reg in instr.uses:
            if reg in last_writer:
                graph.add_edge(last_writer[reg], idx)
        for reg in instr.defs:
            for r in last_readers.get(reg, []):
                graph.add_edge(r, idx)
            if reg in last_writer:
                graph.add_edge(last_writer[reg], idx)
        for csr in instr.csr_uses:
            if csr in last_csr_writer:
                graph.add_edge(last_csr_writer[csr], idx)
        for csr in instr.csr_defs:
            for r in last_csr_readers.get(csr, []):
                graph.add_edge(r, idx)
            if csr in last_csr_writer:
                graph.add_edge(last_csr_writer[csr], idx)
        if (instr.is_load or instr.is_store) and not instr.is_amo:
            if same_base_reorder:
                # Check every previous mem op individually.  We can't rely on
                # chain transitivity once we start dropping edges, so each pair
                # must be tested directly.
                for prev_idx in mem_ops:
                    prev = instr_by_idx[prev_idx]
                    if not _mem_independent(prev, instr, last_writer):
                        graph.add_edge(prev_idx, idx)
            else:
                # Conservative: chain to the immediately preceding mem op only
                # (transitivity through the chain preserves full ordering).
                if mem_ops:
                    graph.add_edge(mem_ops[-1], idx)
            mem_ops.append(idx)
        for reg in instr.defs:
            last_writer[reg] = idx
            last_readers[reg] = []
        for reg in instr.uses:
            last_readers[reg].append(idx)
        for csr in instr.csr_defs:
            last_csr_writer[csr] = idx
            last_csr_readers[csr] = []
        for csr in instr.csr_uses:
            last_csr_readers[csr].append(idx)

    return graph


def _mem_independent(a: "Instruction", b: "Instruction",
                     last_writer: dict) -> bool:
    """Return True if memory operations *a* and *b* are provably independent.

    Independence requires:
      1. Both have a parsed memory operand (offset, base).
      2. They use the same base register.
      3. The base register has not been written between *a* and *b*
         (last_writer[base] < a.index, or base not written at all).
      4. Their byte ranges do not overlap, given their respective access widths.

    If any condition cannot be verified the function returns False (conservative).
    """
    from rv32_core import _MEM_WIDTH
    if a.mem is None or b.mem is None:
        return False
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b:
        return False
    # Base must not have been written between a and b.
    writer_idx = last_writer.get(base_a, -1)
    if writer_idx > a.index:   # written after a, before (or at) b
        return False
    # Both access widths must be known.
    w_a = _MEM_WIDTH.get(a.mnemonic)
    w_b = _MEM_WIDTH.get(b.mnemonic)
    if w_a is None or w_b is None:
        return False
    # Non-overlap: [off_a, off_a+w_a) and [off_b, off_b+w_b) must not intersect.
    if off_a + w_a <= off_b or off_b + w_b <= off_a:
        return True
    return False

# ---------------------------------------------------------------------------
# Liveness analysis
# ---------------------------------------------------------------------------

def compute_liveness(instructions: list) -> dict:
    """
    Backward pass over *instructions*; returns
    { instr_index: frozenset[register] } where each frozenset is the set of
    registers whose last use is at that instruction.
    """
    live_out: dict = {}
    last_use: dict = {}
    for instr in reversed(instructions):
        idx = instr.index
        killed: set = set()
        for reg in instr.defs:
            live_out[reg] = False
        for reg in instr.uses:
            if reg == "x0":
                continue
            if not live_out.get(reg, False):
                killed.add(reg)
            live_out[reg] = True
        last_use[idx] = frozenset(killed)
    return last_use

# ---------------------------------------------------------------------------
# Input-format detection and label classification
# ---------------------------------------------------------------------------

# Label definition: optional leading dot, word chars, colon.
_LABEL_DEF = re.compile(r"^\s*(\.?\w+)\s*:")
# Branches and jumps whose last operand is a label target.
# The optional ``c\.`` prefix covers compressed-instruction disassembly
# (``c.beqz``, ``c.bnez``, ``c.j``, ``c.jal``, ``c.jalr``, ``c.jr``).
_BRANCH_LIKE = re.compile(
    r"^\s+(?:c\.)?"
    r"(?:beq|bne|blt|bge|bltu|bgeu|beqz|bnez|blez|bgez|bltz|bgtz"
    r"|jal|jalr|j|jr|call|tail)\s",
)
# ELF visibility directives.
_VISIBILITY_DIRS = re.compile(
    r"^\s+\.(?:globl|global|weak|protected|hidden|internal)\s+(\S+)",
)

def _classify_labels(source: str) -> tuple:
    """
    Single-pass pre-scan of plain assembly source.

    Returns ``(branch_targets, globally_visible)`` — two frozensets of label
    name strings that must be treated as scheduling barriers.

    **branch_targets**: every label that appears as the operand of a branch or
    jump instruction (``beq``, ``bne``, ``j``, ``jal``, etc.).  These mark
    basic-block entry points: no instruction may be reordered past them.
    This explicitly *includes* compiler-generated ``.L``-prefixed labels such
    as ``.LBB0_1``, ``.Lloop``, ``.Ltmp3`` — they are the targets of
    intra-function branches (loop back-edges, if/else arms, switch cases) and
    are therefore genuine basic-block boundaries.

    **globally_visible**: labels declared with ``.globl``, ``.weak``, etc.
    These are function entry points reachable from outside the translation
    unit and are also scheduling barriers.

    Labels that are *not* barriers are those referenced only in assembler
    directive expressions — e.g. ``.Lfunc_end*`` in ``.size`` expressions and
    ``.Lpcrel_hi*`` in ``%pcrel_lo()`` relocation operands.  These never
    appear as branch operands so they are naturally excluded by this scan.

    Note: ``auipc``/``addi %pcrel_lo`` pairs are already protected by the
    RAW dependency on the register ``auipc`` writes, so ``.Lpcrel_hi*``
    labels need not be barriers even if they did appear here.
    """
    branch_targets:   set = set()
    globally_visible: set = set()
    for line in source.splitlines():
        m = _VISIBILITY_DIRS.match(line)
        if m:
            globally_visible.add(m.group(1).split("@")[0])
            continue
        if _BRANCH_LIKE.match(line):
            code = line.split("#")[0].split(";")[0].strip()
            tgt  = code.split()[-1].rstrip(",")
            if (tgt
                    and not tgt.lstrip("-").isdigit()
                    and not tgt.startswith("%")
                    and "(" not in tgt
                    and tgt not in _INT_ABI
                    and not re.match(r"^[xf]\d+$", tgt)):
                branch_targets.add(tgt)
    return frozenset(branch_targets), frozenset(globally_visible)


# ---------------------------------------------------------------------------
# CFG construction and whole-function liveness analysis
# ---------------------------------------------------------------------------

# Unconditional jumps — their only successor is the branch target.
_UNCOND_JUMPS = frozenset({"j", "jal", "jalr", "jr"})
# Conditional branches — successors are the branch target AND the fall-through.
_COND_BRANCHES = frozenset({
    "beq", "bne", "blt", "bge", "bltu", "bgeu",
    "beqz", "bnez", "blez", "bgez", "bltz", "bgtz",
})

def build_cfg_liveness(
    source:          str,
    branch_targets:  frozenset,
    globally_visible: frozenset,
) -> "dict[str, frozenset]":
    """
    Two-pass analysis of *source* that returns a mapping
    ``{block_label: live_out_frozenset}`` for every basic block.

    The live-out set of a block is the union of the live-in sets of all its
    successors, propagated to a fixpoint.  Seeded from ABI calling-convention
    rules at function boundaries and call/ret instructions.

    The result is consumed by ``AssemblyScheduler.process()`` to provide
    accurate ``live_out`` seeds to ``rename_destinations``, replacing the
    conservative empty-set assumption for blocks that end in conditional
    branches or fall-throughs.

    Block identity
    --------------
    Each block is keyed by its opening barrier label (a string).  The
    implicit entry block before the first barrier label in the file uses the
    synthetic key ``_CFG_ENTRY``.

    Successor rules
    ---------------
    ``ret`` / ``tail``           → no successors (function exit)
    ``call`` / ``jal rd=x1``     → [next_label]  (return site; callee opaque)
    ``jalr rd=x1``               → [next_label]  (indirect call; same)
    ``j target`` / ``jal x0``    → [target]       (unconditional jump)
    ``jalr x0`` / ``jr``         → []             (indirect jump; unknown)
    conditional branch           → [target, next_label]  (both edges)
    implicit fall-through        → [next_label]

    ABI seeds
    ---------
    ``ret``  blocks: live_out ⊇ {a0, a1}
    ``tail`` blocks: live_out ⊇ {a0–a7}
    ``call`` blocks: live_out ⊇ args ∪ callee-saved  (caller must have loaded args)
    function-entry blocks: live_in ⊇ {a0–a7}  (applied to live_out via backward pass)

    Complexity
    ----------
    O(B × I) where B = number of blocks and I = iterations to fixpoint
    (typically 2–5 for natural loops).  Each block's use/def sets are
    computed once from ``parse_line`` during the first pass.
    """
    _CFG_ENTRY = "__cfg_entry__"

    # ── Pass 1: parse blocks, collect use/def, record terminal instructions ──

    # block_order  : list of label strings in source order
    # block_use    : {label: set of registers read before written in block}
    # block_def    : {label: set of registers written in block}
    # block_term   : {label: Instruction | None} — last real instruction
    # block_next   : {label: str | None} — label of the immediately following block

    block_order: list = []
    block_use:   dict = {}
    block_def:   dict = {}
    block_term:  dict = {}
    block_next:  dict = {}     # populated in a second loop once order is known

    cur_label    = _CFG_ENTRY
    cur_use:  set = set()
    cur_def:  set = set()
    cur_term      = None

    def _is_barrier(name: str) -> bool:
        return name in branch_targets or name in globally_visible

    def _commit_block(label: str) -> None:
        block_order.append(label)
        block_use[label]  = frozenset(cur_use)
        block_def[label]  = frozenset(cur_def)
        block_term[label] = cur_term

    # Start with the implicit entry block.
    block_order.clear()

    for line in source.splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith(("#", ";", "//")):
            continue

        # Check for a label definition *before* the dot-prefix filter so that
        # compiler-generated labels like ``.Lelse:`` are not discarded as
        # assembler directives.
        m = _LABEL_DEF.match(stripped)
        if m:
            name = m.group(1)
            if _is_barrier(name):
                _commit_block(cur_label)
                cur_label = name
                cur_use   = set()
                cur_def   = set()
                cur_term  = None
            continue

        # Skip assembler directives (lines starting with '.') and blank/comment.
        if stripped.startswith("."):
            continue

        instr = parse_line(0, line)
        if instr is None:
            continue

        # Update use/def for liveness: a register is in use[B] if it is read
        # before being written within B; it is in def[B] if written anywhere.
        for reg in instr.uses:
            if reg != "x0" and reg not in cur_def:
                cur_use.add(reg)
        for reg in instr.defs:
            cur_def.add(reg)

        cur_term = instr

    # Commit the last block.
    _commit_block(cur_label)

    # Populate block_next: each block's immediate textual successor.
    for i, lbl in enumerate(block_order):
        block_next[lbl] = block_order[i + 1] if i + 1 < len(block_order) else None

    # ── Build successor lists from terminal instructions ──────────────────

    def _successors(label: str) -> list:
        """Return the list of successor block labels for *label*."""
        term = block_term[label]
        nxt  = block_next[label]   # textual fall-through (may be None)

        if term is None:
            # Empty block — falls through.
            return [nxt] if nxt else []

        mn = term.mnemonic

        # Function exits: no successors within this translation unit.
        # "ret" is canonicalised to "jalr" by parse_line; handled below
        # by the jalr-no-defs branch.
        if mn == "tail":
            return []

        # Calls: return site is the fall-through block.
        if mn == "call":
            return [nxt] if nxt else []
        if mn in ("jal", "jalr") and "x1" in term.defs:
            return [nxt] if nxt else []

        # Unconditional jumps: sole successor is the explicit target.
        if mn == "j":
            tgt = term.operands[0] if term.operands else None
            return [tgt] if tgt and tgt in block_use else []
        if mn == "jal" and not term.defs:
            # jal x0, target — pure jump
            tgt = term.operands[-1] if term.operands else None
            return [tgt] if tgt and tgt in block_use else []
        if mn in ("jalr", "jr") and not term.defs:
            # Indirect jump to unknown target.
            return []

        # Conditional branches: target + fall-through.
        if mn in _COND_BRANCHES:
            tgt = term.operands[-1] if term.operands else None
            succs = []
            if tgt and tgt in block_use:
                succs.append(tgt)
            if nxt:
                succs.append(nxt)
            return succs

        # Default: fall-through.
        return [nxt] if nxt else []

    succs: dict = {lbl: _successors(lbl) for lbl in block_order}

    # ── ABI seeds for live_out ─────────────────────────────────────────────
    # These come from _abi_liveness_for_terminal semantics, re-derived here
    # from the terminal mnemonic directly to avoid importing rv32_scheduler.

    # Callee-saved: sp (x2), s0-s1 (x8-x9), s2-s11 (x18-x27).
    _callee_saved = frozenset(
        {"x2", "x8", "x9"} | {f"x{i}" for i in range(18, 28)}
    )
    _arg_regs     = frozenset(f"x{i}" for i in range(10, 18))
    _ret_regs     = frozenset({"x10", "x11"})
    _call_live_out = _arg_regs | _callee_saved

    def _abi_seed(label: str) -> frozenset:
        term = block_term[label]
        if term is None:
            return frozenset()
        mn = term.mnemonic
        # ret / jr ra: jalr with no link (rd=x0), base = ra (x1).
        # Canonicalised from "ret" to "jalr" by parse_line.
        # Callee-saved regs (incl. sp) are live because the caller
        # expects them preserved.
        if mn == "jalr" and not term.defs and "x1" in term.uses:
            return _ret_regs | _callee_saved
        if mn == "tail":
            return _arg_regs
        if mn in ("call",) or (mn in ("jal", "jalr") and "x1" in term.defs):
            return _call_live_out
        return frozenset()

    # ── Iterative backward dataflow to fixpoint ───────────────────────────
    #
    # live_out[B] = abi_seed[B]  ∪  ∪{ live_in[S] for S in succs[B] }
    # live_in[B]  = use[B]       ∪  (live_out[B] − def[B])
    #
    # Iterate in reverse source order (approximate reverse-post-order)
    # until no live_out set changes.

    live_out: dict = {lbl: _abi_seed(lbl) for lbl in block_order}

    MAX_ITER = 32   # far more than enough for any realistic CFG
    for _ in range(MAX_ITER):
        changed = False
        for lbl in reversed(block_order):
            # Compute new live_out as ABI seed ∪ live_in of each successor.
            new_lo = _abi_seed(lbl)
            for s in succs[lbl]:
                if s in live_out:
                    # live_in[s] = use[s] ∪ (live_out[s] − def[s])
                    s_live_in = block_use[s] | (live_out[s] - block_def[s])
                    new_lo = new_lo | s_live_in
            if new_lo != live_out[lbl]:
                live_out[lbl] = new_lo
                changed = True
        if not changed:
            break

    return live_out
