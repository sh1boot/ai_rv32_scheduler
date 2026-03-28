"""
rv32_scorers.py

Pair-scoring functions for the RV32 instruction scheduler.

Public API
----------
PairScoreFn
    Type alias for a scorer: (Instruction, Instruction) -> float.

can_compress(instr) -> bool
    True if *instr* is a candidate for a 16-bit RVC encoding.

make_compact32_scorer(liveness) -> PairScoreFn
    Build the compact-32 experimental scorer over the given liveness map.

COMPACT32_RULES
    Ordered list of (name, rule_fn) pairs used by the compact32 scorer.
    Extend this list to add new pairing rules (see "Adding a new rule" below).

SCORERS
    Registry dict mapping CLI name -> (factory_fn, description_str).

Adding a new compact32 rule
---------------------------
1. Write ``def _rule_foo(a, b, liveness) -> bool: ...``
2. Append ``("foo", _rule_foo)`` to COMPACT32_RULES.
3. Add the A-side gate to ``_a_eligible()`` inside ``make_compact32_scorer``.
The scorer, ``--list-rules`` output, PAIR+ annotations, and stats all pick
it up automatically.
"""

from typing import Callable

from rv32_core import (
    Instruction,
    compute_liveness,
    _DUAL_ARITH_MN, _REG4, _CHAIN_REG, _dual_arith_ok,
)

# ---------------------------------------------------------------------------
# Type alias
# ---------------------------------------------------------------------------

PairScoreFn = Callable[["Instruction", "Instruction"], float]

# ---------------------------------------------------------------------------
# Compressed-encoding eligibility (RVC scorer)
# ---------------------------------------------------------------------------

# RVC integer registers: x8-x15 (s0-s1, a0-a5)
_CL_INT_REGS = frozenset(f"x{n}" for n in range(8, 16))
# RVC float registers: f8-f15
_CL_FP_REGS  = frozenset(f"f{n}" for n in range(8, 16))

# Mnemonics that have a known 16-bit C-extension encoding on RV32C.
# Derived from the RVC instruction listing (RISC-V ISA spec §12).
# Note: we use the *canonical* (expanded) mnemonic, not the c.* prefix.
_CAN_COMPRESS_MNEMONICS: frozenset = frozenset({
    # CR format
    "jalr",   # c.jr / c.jalr  (rd==x0 or rd!=x0, rs2==x0)
    "add",    # c.add / c.mv
    # CI format
    "addi",   # c.addi / c.li / c.lui / c.addi16sp / c.addi4spn / c.nop
    "lui",    # c.lui
    "slli",   # c.slli
    "lw",     # c.lwsp / c.lw
    "flw",    # c.flwsp / c.flw   (F-extension)
    "fld",    # c.fldsp / c.fld   (D-extension)
    # CSS format
    "sw",     # c.swsp / c.sw
    "fsw",    # c.fswsp / c.fsw
    "fsd",    # c.fsdsp / c.fsd
    # CL/CS format -- subset of registers only
    # (already covered by lw/sw/flw/fsw/fld/fsd above)
    # CB / CJ format
    "beq",    # c.beqz  (rs2 == x0)
    "bne",    # c.bnez  (rs2 == x0)
    "jal",    # c.jal / c.j
    # CA format (CL register subset)
    "sub",    # c.sub
    "xor",    # c.xor
    "or",     # c.or
    "and",    # c.and
    "srai",   # c.srai
    "srli",   # c.srli
    "andi",   # c.andi
    # pseudo-instructions that assemble to compressed forms
    "nop",    # c.nop
    "ret",    # c.jr ra  ->  c.ret
    "mv",     # c.mv
})


def can_compress(instr: "Instruction") -> bool:
    """
    Return True if *instr* is a candidate for a 16-bit RVC encoding.

    This is a conservative static test: it checks the mnemonic and, where
    the compressed form restricts the register set, the actual operand
    registers.  It does NOT check immediate ranges (those are only known
    after register allocation / final code-gen), so it may return True for
    instructions that ultimately won't compress due to an out-of-range
    immediate.

    Checks performed
    ----------------
    * Mnemonic must appear in the RVC instruction set.
    * For CA-format arithmetic (sub/xor/or/and/srai/srli/andi) both the
      destination and the single source must be in the CL register set
      (x8-x15).
    * For CL/CS memory ops (lw/sw/flw/fsw/fld/fsd) using the 3-register
      form, both rd/rs and the base must be in the CL register set.
    * c.beqz / c.bnez require rs2 == x0.
    * c.jr / c.jalr require rs2 == x0 (already true for jalr in the table,
      but we accept either form).
    * Loads/stores using the SP-based forms (lwsp/swsp etc.) are accepted
      for any rd/rs when the base register is sp (x2).
    """
    mn = instr.mnemonic

    if mn not in _CAN_COMPRESS_MNEMONICS:
        return False

    defs = instr.defs
    uses = instr.uses

    # CA-format: sub/xor/or/and require rd and rs2 in CL set
    if mn in ("sub", "xor", "or", "and"):
        rd  = defs[0] if defs else None
        rs2 = uses[0] if uses else None
        return rd in _CL_INT_REGS and rs2 in _CL_INT_REGS

    # CB-format shifts: srai/srli/andi -- rd (==rs1) must be in CL set
    if mn in ("srai", "srli", "andi"):
        rd = defs[0] if defs else None
        return rd in _CL_INT_REGS

    # Branches: c.beqz / c.bnez require rs2 == x0
    if mn in ("beq", "bne"):
        # uses = [rs1, rs2]; c.beqz/c.bnez encode rs1 in CL set, rs2==x0
        rs1 = uses[0] if len(uses) > 0 else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rs1 in _CL_INT_REGS and rs2 == "x0"

    # Memory ops: accept SP-relative (any rd) OR CL-register-only form
    if mn in ("lw", "flw", "fld"):
        base = uses[0] if uses else None
        rd   = defs[0] if defs else None
        if base == "x2":          # c.lwsp / c.flwsp / c.fldsp
            return True
        cl_regs = _CL_FP_REGS if mn in ("flw", "fld") else _CL_INT_REGS
        return base in _CL_INT_REGS and rd in cl_regs

    if mn in ("sw", "fsw", "fsd"):
        # uses = [rs2_data, base]
        base    = uses[1] if len(uses) > 1 else (uses[0] if uses else None)
        rs2     = uses[0] if uses else None
        if base == "x2":          # c.swsp / c.fswsp / c.fsdsp
            return True
        cl_regs = _CL_FP_REGS if mn in ("fsw", "fsd") else _CL_INT_REGS
        return base in _CL_INT_REGS and rs2 in cl_regs

    # jalr -> c.jr (rd==x0, rs2==x0) or c.jalr (rd==ra, rs2==x0)
    if mn == "jalr":
        return True   # standard jalr ra,rs1,0 and jr rs1 both compress

    # add -> c.mv (rd!=x0, rs1==x0) or c.add (rd!=x0, rs1!=x0, rs2!=x0)
    if mn == "add":
        rd  = defs[0] if defs else None
        return rd is not None and rd != "x0"

    # addi covers c.addi, c.li, c.lui-adjacent, c.addi16sp, c.addi4spn, c.nop
    # No register restriction beyond rd != x0 (c.nop is addi x0,x0,0)
    if mn == "addi":
        return True

    # slli: rd (==rs1) can be any non-zero register; shamt must be 1-31
    # (we can't check shamt here, so accept all)
    if mn == "slli":
        rd = defs[0] if defs else None
        return rd is not None and rd != "x0"

    # lui: rd must not be x0 or x2
    if mn == "lui":
        rd = defs[0] if defs else None
        return rd is not None and rd not in ("x0", "x2")

    # jal: c.jal (RV32 only, rd==ra) or c.j (rd==x0)
    if mn == "jal":
        return True

    # ret / nop / mv: always compress
    return True


# ---------------------------------------------------------------------------
# RVC pair scorer
# ---------------------------------------------------------------------------

def _compress_pair_score(a: "Instruction", b: "Instruction") -> float:
    """
    Default scoring function.

    Returns 1.0 when both *a* and *b* are candidates for RVC 16-bit
    encoding (so an optimiser can pack two compressed instructions into a
    single 32-bit word), -1.0 when only *b* is not compressible (nudging
    the scheduler to prefer a compressible candidate instead), and 0.0
    otherwise.
    """
    a_ok = can_compress(a)
    b_ok = can_compress(b)
    if a_ok and b_ok:
        return 1.0
    if a_ok and not b_ok:
        return -1.0
    return 0.0


def _rvc_describe_pair(a: "Instruction", b: "Instruction") -> str:
    return "rvc" if (can_compress(a) and can_compress(b)) else ""

_compress_pair_score._describe_pair = _rvc_describe_pair


# ---------------------------------------------------------------------------
# Compact-32 pairing rules
# ---------------------------------------------------------------------------
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
# liveness[i] is the set of registers whose *last use* is instruction i —
# i.e. registers that are dead immediately after i executes.

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
    _ADDR_ARITH = frozenset({"add", "addi", "sub", "sh1add", "sh2add", "sh3add"})
    _MEM_OPS    = frozenset({"lw", "lh", "lb", "lhu", "lbu", "sw", "sh", "sb"})

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
    _MEM_OPS    = frozenset({"lw", "lh", "lb", "lhu", "lbu", "sw", "sh", "sb"})
    _ADDR_ARITH = frozenset({"add", "addi", "sub", "sh1add", "sh2add", "sh3add"})

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
    if b.mnemonic in frozenset({"addi", "addiw", "andi"}):
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

    if b.mnemonic not in ("beqz", "bnez"):
        return False

    # B must test the same register that A produced
    tested = b.uses[0] if b.uses else None
    if tested != rd:
        return False

    return True


# Registry: (display_name, rule_function).  Rules are tested in order;
# the first match wins.
COMPACT32_RULES: list = [
    ("cmp_branch",          _rule_cmp_branch),
    ("adjacent_load_pair",  _rule_adjacent_load_pair),
    ("adjacent_store_pair", _rule_adjacent_store_pair),
    ("pre_increment",       _rule_pre_increment),
    ("post_increment",      _rule_post_increment),
    ("dual_arith",          _rule_dual_arith),
    ("dual_arith_chain",    _rule_dual_arith_chain),
    ("arith_branch",        _rule_arith_branch),
]


# ---------------------------------------------------------------------------
# Compact-32 scorer factory
# ---------------------------------------------------------------------------

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

    # Branches may only appear in the second slot of a compact32 pair.
    # Enforced here so no individual rule needs to repeat the check.
    _BRANCH_MN = frozenset({
        "beq", "bne", "blt", "bge", "bltu", "bgeu",
        "beqz", "bnez",                        # pseudo-instructions
        "jal", "jalr",                         # unconditional jumps
    })

    # Per-rule A-side guards: a cheap boolean per instruction that must be True
    # before calling the full (more expensive) rule function.  This avoids
    # executing any rule body when instruction A clearly can't satisfy it.
    _LOAD_MN    = frozenset({"lw", "lh", "lb", "lhu", "lbu"})
    _STORE_MN   = frozenset({"sw", "sh", "sb"})
    _ARITH_ADDR = frozenset({"add", "addi", "sub",
                              "sh1add", "sh2add", "sh3add"})
    _MEM_OP_MN  = _LOAD_MN | _STORE_MN

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
        if a.mnemonic in _ARITH_ADDR:
            eligible.add("pre_increment")
        if a.mnemonic in _MEM_OP_MN:
            eligible.add("post_increment")
        if a.dual_arith_ok:
            eligible.add("dual_arith")
            eligible.add("arith_branch")
        return frozenset(eligible)

    # Cache the eligible set per instruction index (computed once, reused often).
    _elig_cache: dict = {}

    def _get_eligible(a: "Instruction") -> "frozenset[str]":
        idx = a.index
        if idx not in _elig_cache:
            _elig_cache[idx] = _a_eligible(a)
        return _elig_cache[idx]

    def _score(a: "Instruction", b: "Instruction") -> float:
        if a.mnemonic in _BRANCH_MN:
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
        if a.mnemonic in _BRANCH_MN:
            return ""
        elig = _get_eligible(a)
        for name, rule in COMPACT32_RULES:
            if name in elig and rule(a, b, cell[0]):
                return name
        return ""

    # Attach metadata so emit() can update liveness and collect per-rule stats.
    _score._liveness_cell = cell
    _score._describe_pair = _describe
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
# Scorer registry
# ---------------------------------------------------------------------------
#
# Maps CLI name -> (factory_fn, description_str).
#
# factory_fn is either:
#   - a plain PairScoreFn (takes a, b) — decorated with needs_sched=False
#   - a callable (AssemblyScheduler) -> PairScoreFn — needs_sched=True
#
# The CLI detects which kind by checking for the 'needs_sched' attribute.

def _scorer_factory(needs_sched=False):
    """Decorator that marks a factory as needing the scheduler object."""
    def decorator(fn):
        fn.needs_sched = needs_sched
        return fn
    return decorator


@_scorer_factory(needs_sched=False)
def _make_rvc(sched=None):
    return _compress_pair_score


@_scorer_factory(needs_sched=True)
def _make_compact32(sched):
    return make_compact32_scorer(sched.liveness)


SCORERS: dict = {
    "rvc":       (_make_rvc,
                  "Pair instructions that both have a 16-bit RVC encoding "
                  "(default)"),
    "compact32": (_make_compact32,
                  "Pair instructions that can be fused into a compact 32-bit "
                  "encoding (cmp+branch, adjacent loads/stores, …)"),
}
