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
    _DUAL_ARITH_MN, _REG4, _CHAIN_REG, _IMM_FORMS,
    _dual_arith_ok,
)

# ---------------------------------------------------------------------------
# Type alias
# ---------------------------------------------------------------------------

PairScoreFn = Callable[["Instruction", "Instruction"], float]

# ---------------------------------------------------------------------------
# Compressed-encoding eligibility (RVC scorer)
# ---------------------------------------------------------------------------

_CL_INT_REGS = frozenset(f"x{n}" for n in range(8, 16))
_CL_FP_REGS  = frozenset(f"f{n}" for n in range(8, 16))

_CAN_COMPRESS_MNEMONICS: frozenset = frozenset({
    "jalr", "add",
    "addi", "lui", "slli", "lw", "flw", "fld",
    "sw", "fsw", "fsd",
    "beq", "bne", "beqz", "bnez", "jal",
    "sub", "xor", "or", "and", "srai", "srli", "andi",
    "nop",
})


def can_compress(instr: "Instruction") -> bool:
    """
    Return True if *instr* is a candidate for a 16-bit RVC encoding.

    Checks mnemonic, register constraints, and immediate ranges against the
    actual RVC encoding rules.  Branch/jump offset ranges are not checked
    (the offset is a label whose value is unknown at this stage).
    """
    mn   = instr.mnemonic
    if mn not in _CAN_COMPRESS_MNEMONICS:
        return False
    defs = instr.defs
    uses = instr.uses

    if mn in ("sub", "xor", "or", "and"):
        # c.sub/c.xor/c.or/c.and: RSD form (rd==rs1), rd and rs2 both in CL.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rd in _CL_INT_REGS and rs2 in _CL_INT_REGS and rd == rs1

    if mn in ("srai", "srli", "andi"):
        # c.srai/c.srli/c.andi: RSD form (rd==rs1), rd in CL.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        if rd not in _CL_INT_REGS or rd != rs1:
            return False
        imm = instr.imm
        if mn == "andi":
            return imm is not None and -32 <= imm <= 31
        # srai/srli: shamt must be non-zero and fit in 5 bits
        return imm is not None and 1 <= imm <= 31

    if mn in ("beqz", "bnez"):
        # c.beqz/c.bnez: rs1 in CL.  Offset range not checked.
        rs1 = uses[0] if uses else None
        return rs1 in _CL_INT_REGS

    if mn in ("beq", "bne"):
        # c.beqz/c.bnez via full form: rs1 in CL, rs2 == x0.
        rs1 = uses[0] if len(uses) > 0 else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rs1 in _CL_INT_REGS and rs2 == "x0"

    if mn in ("lw", "flw", "fld"):
        # c.lw/c.flw/c.fld: base in CL, rd in CL, offset in 0..124 (mult 4).
        # c.lwsp/c.flwsp/c.fldsp: base == sp, offset in 0..252/504 (mult 4/8).
        # Memory operands are decoded into instr.mem = (offset, base_reg).
        mem  = instr.mem
        rd   = defs[0] if defs else None
        off, base = mem if mem else (None, None)
        if base == "x2":
            # lwsp/flwsp/fldsp: offset must be non-negative and aligned.
            if off is None or off < 0:
                return False
            align = 8 if mn == "fld" else 4
            limit = 504 if mn == "fld" else 252
            return off % align == 0 and off <= limit
        cl_regs = _CL_FP_REGS if mn in ("flw", "fld") else _CL_INT_REGS
        if base not in _CL_INT_REGS or rd not in cl_regs:
            return False
        # Offset: 0..124 (mult 4) for lw/flw, 0..248 (mult 8) for fld.
        if off is None or off < 0:
            return False
        align = 8 if mn == "fld" else 4
        limit = 248 if mn == "fld" else 124
        return off % align == 0 and off <= limit

    if mn in ("sw", "fsw", "fsd"):
        # c.sw/c.fsw/c.fsd: base in CL, rs2 in CL, offset in 0..124 (mult 4).
        # c.swsp/c.fswsp/c.fsdsp: base == sp, offset in 0..252/504 (mult 4/8).
        mem  = instr.mem
        off, base = mem if mem else (None, None)
        # x0 is filtered from uses; if all remaining uses equal the base,
        # the stored value was x0.
        rs2 = next((r for r in uses if r != base), "x0")
        if base == "x2":
            if off is None or off < 0:
                return False
            align = 8 if mn == "fsd" else 4
            limit = 504 if mn == "fsd" else 252
            return off % align == 0 and off <= limit
        cl_regs = _CL_FP_REGS if mn in ("fsw", "fsd") else _CL_INT_REGS
        if base not in _CL_INT_REGS or rs2 not in cl_regs:
            return False
        if off is None or off < 0:
            return False
        align = 8 if mn == "fsd" else 4
        limit = 248 if mn == "fsd" else 124
        return off % align == 0 and off <= limit

    if mn == "jalr":
        # c.jalr rs1: rd=x1, rs1 != x0, offset=0.
        # c.jr   rs1: rd=x0, rs1 != x0, offset=0.
        # Single-operand pseudo form (jalr rs / jr rs): parser puts the
        # register in defs with uses=[]; treat as compressible call/jump.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        imm = instr.imm
        if imm is not None and imm != 0:
            return False
        if rs1 is None:
            # Single-operand form: register is in defs; any non-x0 reg is ok.
            return rd is not None and rd != "x0"
        if rs1 == "x0":
            return False
        return rd in (None, "x0", "x1")

    if mn == "add":
        # c.add rd, rs2: RSD form (rd == rs1), rd != x0.
        # c.mv  rd, rs:  rs1 == x0 (filtered to single use), rd != x0.
        rd  = defs[0] if defs else None
        if rd is None or rd == "x0":
            return False
        rs1 = uses[0] if len(uses) > 0 else None
        rs2 = uses[1] if len(uses) > 1 else None
        if rs2 is None:
            # x0 was filtered — this is the c.mv form.
            return True
        # c.add: RSD form only.
        return rd == rs1

    if mn == "addi":
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        imm = instr.imm
        if rd is None:
            return False
        # c.li: addi rd, x0, imm (x0 filtered → no uses).
        if not uses:
            return rd != "x0" and imm is not None and -32 <= imm <= 31
        # c.addi16sp: addi x2, x2, imm (RSD on sp).
        if rd == "x2" and rs1 == "x2":
            return (imm is not None and imm != 0
                    and imm % 16 == 0 and -512 <= imm <= 496)
        # c.mv: addi rd, rs, 0 (GAS mv pseudo; x0 already filtered so rs != x0).
        # Assembler emits c.mv rd, rs for this form.  No register-range limit.
        if imm == 0 and rd != "x0":
            return True
        # c.addi4spn rd', x2, imm: sp-relative, rd in CL, imm positive mult of 4.
        if rs1 == "x2" and rd in _CL_INT_REGS:
            return (imm is not None and imm > 0
                    and imm % 4 == 0 and imm <= 1020)
        # c.addi rd, imm: RSD form, rd != x0/x2, imm != 0, -32..31.
        if rd == rs1 and rd not in ("x0", "x2"):
            return imm is not None and imm != 0 and -32 <= imm <= 31
        return False

    if mn == "slli":
        # c.slli rd, shamt: rd != x0, shamt in 1..31.
        rd  = defs[0] if defs else None
        imm = instr.imm
        return (rd is not None and rd != "x0"
                and imm is not None and 1 <= imm <= 31)

    if mn == "lui":
        # c.lui rd, imm: rd != x0/x2, imm != 0, imm in -32..31 (upper 20 bits).
        rd  = defs[0] if defs else None
        imm = instr.imm
        return (rd is not None and rd not in ("x0", "x2")
                and imm is not None and imm != 0 and -32 <= imm <= 31)

    if mn == "jal":
        # c.jal (RV32C, rd=x1) / c.j (rd=x0): offset range not checked.
        rd = defs[0] if defs else None
        return rd in (None, "x0", "x1")

    return False


# ---------------------------------------------------------------------------
# RVC pair scorer
# ---------------------------------------------------------------------------

def _compress_pair_score(a: "Instruction", b: "Instruction") -> float:
    """
    Returns 1.0 when both instructions are RVC-compressible, -1.0 when only
    A is (nudging the scheduler away from that choice), 0.0 otherwise.
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
# Rule signature: rule(a, b, liveness) -> bool
# liveness[i] = frozenset of registers dead after instruction i.

_CMP_MNEMONICS = frozenset({
    "slti", "sltiu", "slli", "srli", "srai",
    "andi", "ori", "xori",
    "slt", "sltu",
    "seqz", "snez", "sltz", "sgtz",
})
_BRANCH_ZERO = frozenset({"beqz", "bnez", "beq", "bne"})

# Module-level constants shared by multiple rules and by make_compact32_scorer.
_ADDR_ARITH = frozenset({"add", "addi", "sub", "sh1add", "sh2add", "sh3add"})
_MEM_OPS    = frozenset({"lw", "lh", "lb", "lhu", "lbu", "sw", "sh", "sb"})
_COMPACT32_BRANCH_MN = frozenset({
    "beq", "bne", "blt", "bge", "bltu", "bgeu",
    "beqz", "bnez",
    "jal", "jalr",
})
# ``mv rd, rs``  (GAS pseudo = ``addi rd, rs, 0``) canonicalises to ``addi``
#   with uses=[rs] and imm=0.  ``mv rd, x0`` filters x0 → uses=[], matching
#   the li-form.
# ``c.mv rd, rs`` (C extension = ``add rd, x0, rs``) canonicalises to ``add``
#   with uses=[rs] (x0 filtered).
# ``li rd, imm`` canonicalises to ``addi`` with uses=[] (x0 filtered).
_DUAL_MOVE_MN = frozenset({"add", "addi"})


def _rule_bit_branch(a: "Instruction", b: "Instruction", liveness: dict) -> bool:
    """
    Single-bit test + conditional branch (bit-branch form).

    Matches:
        andi  rd, rs, imm        (imm is a positive power of two; rd != rs)
        beqz / bnez  rd, label   (rd dead after B)

    The immediate must have exactly one bit set, so the andi isolates a single
    bit from rs.  The compact encoding represents it as a bit index rather than
    a full 12-bit immediate.  rd must differ from rs (chain form — rs preserved)
    and will be renamed to x31 by the renamer if liveness confirms it is safe.

    Canonical examples (pre-rename):
        andi  a0, s6, 4      # test bit 2; a0 → x31 after rename
        beqz  a0, .skip

        andi  a1, t1, 256    # test bit 8; a1 → x31 after rename
        bnez  a1, .found
    """
    if not a.defs:
        return False
    rd = a.defs[0]
    if a.mnemonic != "andi":
        return False
    imm = a.imm
    if imm is None or imm <= 0:
        return False
    if imm & (imm - 1):           # not a power of two
        return False
    # Chain form: rd must differ from rs1 so the source is preserved.
    if a.uses and a.uses[0] == rd:
        return False
    if b.mnemonic not in ("beqz", "bnez"):
        return False
    if rd not in b.uses:
        return False
    if rd not in liveness.get(b.index, frozenset()):
        return False
    return True


def _rule_cmp_branch_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> bool:
    """
    Compare + conditional branch where the compare result register is dead
    after the branch (chain form).

    Matches:
        <cmp-op>  rd, rs, ...    (any _CMP_MNEMONICS mnemonic; rd != rs1)
        beqz / bnez  rd, label   (rd dead after B)

    rd must differ from rs1 — this is the key distinction from cmp_branch_rsd:
    the source register is *preserved* because rd overwrites a different slot.
    The compact encoding uses x31 as an implicit chain register, so rd must be
    (or be renameable to) x31.  The renamer will rename rd → x31 if this rule
    scores the pair and liveness confirms the rename is safe.

    The liveness check — rd dead after B — serves double duty: it confirms the
    rename is safe (nothing reads rd past B) AND is required by the encoding
    (x31 is a scratch register that must not be live across the pair).

    Canonical examples (pre-rename):
        andi   a0, s6, 1     # rd=a0, rs1=s6 (rd != rs1) → rename a0 → x31
        bne    a0, zero, .L

        sltiu  a1, a0, 1     # rd=a1, rs1=a0 (rd != rs1) → rename a1 → x31
        bnez   a1, .done
    """
    if not a.defs:
        return False
    rd = a.defs[0]
    if a.mnemonic not in _CMP_MNEMONICS:
        return False
    # Chain form: rd must differ from rs1 so the source is preserved.
    # If rd == rs1 this is cmp_branch_rsd territory instead.
    if a.uses and a.uses[0] == rd:
        return False
    if b.mnemonic not in _BRANCH_ZERO:
        return False
    if rd not in b.uses:
        return False
    if rd not in liveness.get(b.index, frozenset()):
        return False
    return True


def _rule_cmp_branch_rsd(a: "Instruction", b: "Instruction",
                         liveness: dict) -> bool:
    """
    Compare in RSD form (result overwrites source) + conditional branch.

    Matches:
        <cmp-op>  rd, rd, ...    (rd == rs1 — result written back to source)
        beqz / bnez  rd, label   (rd dead after B)

    Unlike cmp_branch_chain, the result register is *not* x31 — it can be
    any general-purpose register.  The encoding trades the implicit chain
    register for an explicit rd field, but saves a register by reusing the
    source slot.  rd must be dead after B because its original value has been
    overwritten by the compare result.

    The RSD constraint (rd == rs1) must hold so the compact encoding can
    omit one register field.  Pseudo-instructions that imply rs1 == rd
    (seqz, snez, sltz, sgtz) are accepted unconditionally for their first
    operand.

    Canonical examples:
        sltiu  a0, a0, 1     # a0 = (a0 == 0); a0 overwritten, dead after branch
        bnez   a0, .done

        seqz   t1, t1        # t1 = (t1 == 0); t1 overwritten, dead after branch
        beqz   t1, .loop
    """
    if not a.defs:
        return False
    rd = a.defs[0]
    if a.mnemonic not in _CMP_MNEMONICS:
        return False
    # RSD constraint: rd must equal rs1 so the compact encoding can omit
    # one register field.  No pseudo-instruction exemptions — even seqz/snez
    # expand to distinct-register forms (sltiu rd, rs, 1) where rd != rs is
    # valid assembly, so the caller must actually write seqz rd, rd to qualify.
    if not a.uses or a.uses[0] != rd:
        return False
    if b.mnemonic not in _BRANCH_ZERO:
        return False
    if rd not in b.uses:
        return False
    if rd not in liveness.get(b.index, frozenset()):
        return False
    return True


def _rule_adjacent_load_pair(a: "Instruction", b: "Instruction",
                              liveness: dict) -> bool:
    """
    Pair of word loads from adjacent memory locations with the same base.

    Matches:
        lw  rd1, N(base)
        lw  rd2, N±4(base)
    """
    if a.mnemonic != "lw" or b.mnemonic != "lw":
        return False
    if a.mem is None or b.mem is None:
        return False
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b or abs(off_a - off_b) != 4:
        return False
    rd_a = a.defs[0] if a.defs else None
    rd_b = b.defs[0] if b.defs else None
    return rd_a is not None and rd_b is not None and rd_a != rd_b


def _rule_adjacent_store_pair(a: "Instruction", b: "Instruction",
                               liveness: dict) -> bool:
    """
    Pair of word stores to adjacent memory locations with the same base.

    Matches:
        sw  rs1, N(base)
        sw  rs2, N±4(base)
    """
    if a.mnemonic != "sw" or b.mnemonic != "sw":
        return False
    if a.mem is None or b.mem is None:
        return False
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b or abs(off_a - off_b) != 4:
        return False
    rs_a = a.uses[0] if a.uses else None
    rs_b = b.uses[0] if b.uses else None
    return rs_a is not None and rs_b is not None and rs_a != rs_b


def _rule_pre_increment(a: "Instruction", b: "Instruction",
                        liveness: dict) -> bool:
    """
    Address arithmetic followed by a memory op using that result as base (pre-increment).

    Matches:
        add / addi / sub / sh1add / sh2add / sh3add   rd, ...
        lw / sw / lh / sh / lb / sb / lhu / lbu       ..., N(rd)
    """
    if a.mnemonic not in _ADDR_ARITH or b.mnemonic not in _MEM_OPS:
        return False
    if not a.defs:
        return False
    rd = a.defs[0]
    if rd not in b.uses:
        return False
    if b.mnemonic in ("sw", "sh", "sb") and b.uses and b.uses[0] == rd:
        return False
    return True


def _rule_post_increment(a: "Instruction", b: "Instruction",
                          liveness: dict) -> bool:
    """
    Memory op followed by address arithmetic on the same base (post-increment).

    Matches:
        lw / sw / lh / sh / lb / sb / lhu / lbu       ..., N(base)
        add / addi / sub / sh1add / sh2add / sh3add   rd, base, ...
    """
    if a.mnemonic not in _MEM_OPS or b.mnemonic not in _ADDR_ARITH:
        return False
    base = a.uses[-1] if a.uses else None
    if base is None or not b.uses or b.uses[0] != base:
        return False
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

    Instruction A writes its result to t6; instruction B reads t6 as **rs1**
    (``uses[0]``); t6 must be dead after B.

    Note: the chain register must be rs1 of B (``uses[0]``) at score time.
    For commutative operations (``add``, ``and``, ``or``, …) the renamer
    normalises operand order so that the chain register is always rs1 when
    possible, so both source orderings are handled automatically.
    """
    if not (a.defs and a.defs[0] == _CHAIN_REG
            and _dual_arith_ok(a, allow_chain_reg=True)):
        return False
    if b.mnemonic not in _DUAL_ARITH_MN:
        return False
    rs1_b = b.uses[0] if b.uses else None
    if rs1_b != _CHAIN_REG:
        return False
    rd_b = b.defs[0] if b.defs else None
    if rd_b is None or rd_b not in _REG4:
        return False
    if len(b.uses) >= 2 and b.uses[1] not in _REG4:
        return False
    if b.mnemonic in _IMM_FORMS:
        imm = b.imm
        if imm is None or imm < -16 or imm > 15:
            return False
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
    """
    if not a.dual_arith_ok:
        return False
    rd = a.defs[0] if a.defs else None
    if rd is None:
        return False
    if b.mnemonic not in ("beqz", "bnez"):
        return False
    tested = b.uses[0] if b.uses else None
    return tested == rd


def _rule_addi_branch(a: "Instruction", b: "Instruction",
                      liveness: dict) -> bool:
    """
    Add-immediate (RSD form) followed by a two-register conditional branch
    on the same register.

    Matches:
        addi  rsd, rsd, imm    (RSD form; rsd in x0..x15; imm in −16..+15)
        beq / bne  rsd, rs2, label   (rsd appears as either operand)

    The compact encoding uses a single register field for the addi (RSD) and
    an implicit comparison against the second operand of the branch.  Since
    equality is commutative, rsd may appear as either rs1 or rs2 in the branch
    instruction.

    No liveness check is needed — rsd is not consumed by the branch, only read.

    Canonical examples:
        addi  a0, a0, -1
        bne   a0, a1, .loop      # rsd=a0 is rs1

        addi  a2, a2, 1
        beq   s0, a2, .done      # rsd=a2 is rs2 (commutative match)
    """
    if not a.dual_arith_ok or a.mnemonic != "addi":
        return False
    rsd = a.defs[0]
    if b.mnemonic not in ("beq", "bne"):
        return False
    # rsd must appear as either operand of the branch (commutativity).
    return rsd in b.uses


def _dual_move_ok(instr: "Instruction") -> bool:
    """Return True if *instr* is eligible as one slot of a dual_move pair.

    Recognises three canonical forms:

    * mv-form   (``addi rd, rs, 0``): GAS pseudo ``mv rd, rs`` (I-type);
      rd in x0..x15, rs in x0..x15, imm=0, exactly one use.
    * c.mv-form (``add rd, x0, rs``): C-extension ``c.mv rd, rs`` (R-type);
      rd in x0..x15, rs in x0..x15, exactly one use (x0 filtered).
    * li-form   (``addi rd, x0, imm``): ``li`` / ``c.li``; rd in x0..x15,
      no uses (x0 filtered), imm in -16..+15.
    """
    rd = instr.defs[0] if instr.defs else None
    if rd is None or rd not in _REG4:
        return False
    if instr.mnemonic == "addi" and len(instr.uses) == 1 and instr.imm == 0:
        # mv-form: addi rd, rs, 0  (GAS pseudo mv)
        return instr.uses[0] in _REG4
    if instr.mnemonic == "add" and len(instr.uses) == 1:
        # c.mv-form: add rd, x0, rs  (x0 filtered -> exactly one use)
        return instr.uses[0] in _REG4
    if instr.mnemonic == "addi" and not instr.uses:
        # li-form: addi rd, x0, imm  (x0 filtered -> no uses)
        imm = instr.imm
        return imm is not None and -16 <= imm <= 15
    return False


def _rule_dual_move(a: "Instruction", b: "Instruction",
                    liveness: dict) -> bool:
    """
    Two independent register-move or small-immediate-load instructions.

    Matches any combination of:
        mv   rd, rs          (canonical: addi rd, rs, 0 — rs in x0..x15)
        c.mv rd, rs          (canonical: add  rd, x0, rs — rs in x0..x15)
        li   rd, imm         (canonical: addi rd, x0, imm — imm in −16..+15)

    Both rd values must be distinct and in x0..x15.  Either order is valid.
    No liveness check needed — neither instruction produces a value the
    other consumes.
    """
    if not (_dual_move_ok(a) and _dual_move_ok(b)):
        return False
    return a.defs[0] != b.defs[0]


# Registry: (display_name, rule_function).  Rules are tested in order;
# the first match wins.
COMPACT32_RULES: list = [
    ("bit_branch",          _rule_bit_branch),
    ("cmp_branch_rsd",      _rule_cmp_branch_rsd),
    ("cmp_branch_chain",    _rule_cmp_branch_chain),
    ("adjacent_load_pair",  _rule_adjacent_load_pair),
    ("adjacent_store_pair", _rule_adjacent_store_pair),
    ("pre_increment",       _rule_pre_increment),
    ("post_increment",      _rule_post_increment),
    ("dual_arith",          _rule_dual_arith),
    ("dual_arith_chain",    _rule_dual_arith_chain),
    ("arith_branch",        _rule_arith_branch),
    ("addi_branch",         _rule_addi_branch),
    ("dual_move",           _rule_dual_move),
]


# ---------------------------------------------------------------------------
# Compact-32 scorer factory
# ---------------------------------------------------------------------------

def make_compact32_scorer(liveness: dict) -> "PairScoreFn":
    """
    Return a pair-scoring function for the compact-32 encoding experiment.

    The scorer holds its liveness reference in a mutable cell so that
    the streaming processor can refresh it per block after renaming.
    """
    cell: list = [liveness]

    def _a_eligible(a: "Instruction") -> "frozenset[str]":
        eligible = set()
        if a.defs and a.mnemonic in _CMP_MNEMONICS:
            rd = a.defs[0]
            rsd = a.uses and a.uses[0] == rd
            if rsd:
                # RSD form (rd == rs1): eligible for cmp_branch_rsd only.
                eligible.add("cmp_branch_rsd")
            else:
                # Non-RSD form (rd != rs1): eligible for cmp_branch_chain.
                # The renamer will rename rd → x31 if liveness permits.
                eligible.add("cmp_branch_chain")
                if (a.mnemonic == "andi" and a.imm is not None
                        and a.imm > 0 and not (a.imm & (a.imm - 1))):
                    eligible.add("bit_branch")
        if a.defs and a.defs[0] == _CHAIN_REG:
            if _dual_arith_ok(a, allow_chain_reg=True):
                eligible.add("dual_arith_chain")
        if a.mnemonic == "lw":
            eligible.add("adjacent_load_pair")
        if a.mnemonic == "sw":
            eligible.add("adjacent_store_pair")
        if a.mnemonic in _ADDR_ARITH:
            eligible.add("pre_increment")
        if a.mnemonic in _MEM_OPS:
            eligible.add("post_increment")
        if _dual_arith_ok(a):
            eligible.add("dual_arith")
            eligible.add("arith_branch")
            if a.mnemonic == "addi":
                eligible.add("addi_branch")
        if _dual_move_ok(a):
            eligible.add("dual_move")
        return frozenset(eligible)

    _elig_cache: dict = {}

    def _get_eligible(a: "Instruction") -> "frozenset[str]":
        idx = a.index
        if idx not in _elig_cache:
            _elig_cache[idx] = _a_eligible(a)
        return _elig_cache[idx]

    def _score(a: "Instruction", b: "Instruction") -> float:
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return 0.0
        elig = _get_eligible(a)
        if not elig:
            return 0.0
        for _name, rule in COMPACT32_RULES:
            if _name in elig and rule(a, b, cell[0]):
                return 1.0
        return 0.0

    def _describe(a: "Instruction", b: "Instruction") -> str:
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return ""
        elig = _get_eligible(a)
        for name, rule in COMPACT32_RULES:
            if name in elig and rule(a, b, cell[0]):
                return name
        return ""

    _score._liveness_cell = cell
    _score._elig_cache    = _elig_cache   # exposed so the renamer can invalidate
    _score._describe_pair = _describe
    _score._rule_list = COMPACT32_RULES
    return _score


# ---------------------------------------------------------------------------
# Scorer registry
# ---------------------------------------------------------------------------
#
# Maps CLI name -> (factory_fn, description_str).
# factory_fn is a zero-argument callable that returns a PairScoreFn.

SCORERS: dict = {
    "rvc": (
        lambda: _compress_pair_score,
        "Pair instructions that both have a 16-bit RVC encoding (default)",
    ),
    "compact32": (
        lambda: make_compact32_scorer({}),
        "Pair instructions that can be fused into a compact 32-bit "
        "encoding (cmp+branch, adjacent loads/stores, …)",
    ),
}
