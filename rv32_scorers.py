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

import sys
from typing import Callable

from rv32_core import (
    Instruction,
    _DUAL_ARITH_MN, _DUAL_ARITH_REG, _IMM_FORMS, _COMMUTATIVE_BINOP,
    _dual_arith_immediate_ok, _dual_arith_ok, _chain_arith_a, _chain_arith_b,
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

# Target profile: RV64GC + Zcb (RVA23 baseline).  In RV64 the c.jal, c.flw,
# c.fsw, c.flwsp, c.fswsp slots are repurposed for c.addiw/c.ld/c.sd/
# c.ldsp/c.sdsp respectively, and shifts use a 6-bit shamt.
_CAN_COMPRESS_MNEMONICS: frozenset = frozenset({
    # Base RVC (RV32/RV64 shared)
    "jalr", "add",
    "addi", "lui", "slli", "lw", "fld",
    "sw", "fsd",
    "beq", "bne", "beqz", "bnez", "jal",
    "sub", "xor", "or", "and", "srai", "srli", "andi",
    "nop", "ebreak",
    # RV64C extras
    "ld", "sd", "addiw", "addw", "subw",
    # Zcb (compressed code-size extension)
    "lbu", "lhu", "lh", "sb", "sh",
    "sext.b", "sext.h", "sext.w", "zext.h", "zext.w",
    "mul", "xori",
})


def can_compress(instr: "Instruction") -> bool:
    """
    Return True if *instr* is a candidate for a 16-bit RVC encoding.

    Target profile is RV64GC + Zcb.  Checks mnemonic, register constraints,
    and immediate ranges against the actual RVC encoding rules.  Branch/jump
    offset ranges are not checked (the offset is a label whose value is
    unknown at this stage).
    """
    mn   = instr.mnemonic
    if mn not in _CAN_COMPRESS_MNEMONICS:
        return False
    defs = instr.defs
    uses = instr.uses

    # c.nop / c.ebreak: zero-operand encodings, always compressible.
    if mn in ("nop", "ebreak"):
        return True

    if mn in ("sub", "xor", "or", "and"):
        # c.sub/c.xor/c.or/c.and: RSD form (rd==rs1), rd and rs2 both in CL.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rd in _CL_INT_REGS and rs2 in _CL_INT_REGS and rd == rs1

    if mn in ("addw", "subw"):
        # c.addw/c.subw (RV64C): RSD form, rd and rs2 both in CL.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rd in _CL_INT_REGS and rs2 in _CL_INT_REGS and rd == rs1

    if mn == "mul":
        # c.mul (Zcb): RSD form, rd and rs2 both in CL.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rd in _CL_INT_REGS and rs2 in _CL_INT_REGS and rd == rs1

    if mn in ("sext.b", "sext.h", "sext.w", "zext.h", "zext.w"):
        # c.sext.b/c.sext.h/c.zext.h/c.zext.w/c.sext.w (Zcb, c.sext.w is RV64).
        # Single-operand form: rd in CL, rd == rs1.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        return rd in _CL_INT_REGS and rd == rs1

    if mn in ("srai", "srli", "andi"):
        # c.srai/c.srli/c.andi: RSD form (rd==rs1), rd in CL.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        if rd not in _CL_INT_REGS or rd != rs1:
            return False
        imm = instr.imm
        if mn == "andi":
            # c.andi: imm in -32..31, OR c.zext.b (Zcb) which is
            # andi rd, rd, 0xff.  The parser canonicalises `zext.b` to
            # `andi rd, rs, 0xff`, so detect that alias here.
            if imm is None:
                return False
            return (-32 <= imm <= 31) or imm == 0xff
        # srai/srli: shamt must be non-zero, RV64 uses 6-bit shamt (1..63).
        return imm is not None and 1 <= imm <= 63

    if mn == "xori":
        # c.not (Zcb): xori rd, rd, -1 with rd in CL.  The parser canonicalises
        # the `not` pseudo to this form.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        return rd in _CL_INT_REGS and rd == rs1 and instr.imm == -1

    if mn in ("beqz", "bnez"):
        # c.beqz/c.bnez: rs1 in CL.  Offset range not checked.
        rs1 = uses[0] if uses else None
        return rs1 in _CL_INT_REGS

    if mn in ("beq", "bne"):
        # c.beqz/c.bnez via full form: rs1 in CL, rs2 == x0.
        rs1 = uses[0] if len(uses) > 0 else None
        rs2 = uses[1] if len(uses) > 1 else None
        return rs1 in _CL_INT_REGS and rs2 == "x0"

    if mn in ("lw", "ld", "fld"):
        # c.lw/c.ld/c.fld: base in CL, rd in CL, offset aligned.
        # c.lwsp/c.ldsp/c.fldsp: base == sp, offset non-negative and aligned.
        # c.ldsp/c.lwsp also require rd != x0.
        mem  = instr.mem
        rd   = defs[0] if defs else None
        off, base = mem if mem else (None, None)
        align = 8 if mn in ("ld", "fld") else 4
        if base == "x2":
            if off is None or off < 0 or rd in (None, "x0"):
                return False
            # c.lwsp: 0..252, c.ldsp/c.fldsp: 0..504.
            limit = 252 if mn == "lw" else 504
            return off % align == 0 and off <= limit
        cl_regs = _CL_FP_REGS if mn == "fld" else _CL_INT_REGS
        if base not in _CL_INT_REGS or rd not in cl_regs:
            return False
        if off is None or off < 0:
            return False
        # c.lw: 0..124, c.ld/c.fld: 0..248.
        limit = 124 if mn == "lw" else 248
        return off % align == 0 and off <= limit

    if mn in ("sw", "sd", "fsd"):
        # c.sw/c.sd/c.fsd: base in CL, rs2 in CL, offset aligned.
        # c.swsp/c.sdsp/c.fsdsp: base == sp, offset non-negative and aligned.
        # Note: c.sdsp/c.swsp accept any rs2 including x0.
        mem  = instr.mem
        off, base = mem if mem else (None, None)
        # x0 is filtered from uses; if all remaining uses equal the base,
        # the stored value was x0.
        rs2 = next((r for r in uses if r != base), "x0")
        align = 8 if mn in ("sd", "fsd") else 4
        if base == "x2":
            if off is None or off < 0:
                return False
            limit = 252 if mn == "sw" else 504
            return off % align == 0 and off <= limit
        cl_regs = _CL_FP_REGS if mn == "fsd" else _CL_INT_REGS
        if base not in _CL_INT_REGS or rs2 not in cl_regs:
            return False
        if off is None or off < 0:
            return False
        limit = 124 if mn == "sw" else 248
        return off % align == 0 and off <= limit

    if mn in ("lbu", "lhu", "lh"):
        # c.lbu (Zcb): rd in CL, base in CL, offset 0..3.
        # c.lhu/c.lh (Zcb): rd in CL, base in CL, offset in {0, 2}.
        mem  = instr.mem
        rd   = defs[0] if defs else None
        off, base = mem if mem else (None, None)
        if base not in _CL_INT_REGS or rd not in _CL_INT_REGS:
            return False
        if off is None or off < 0:
            return False
        if mn == "lbu":
            return off <= 3
        return off in (0, 2)

    if mn in ("sb", "sh"):
        # c.sb (Zcb): rs2 in CL, base in CL, offset 0..3.
        # c.sh (Zcb): rs2 in CL, base in CL, offset in {0, 2}.
        mem  = instr.mem
        off, base = mem if mem else (None, None)
        rs2 = next((r for r in uses if r != base), None)
        if base not in _CL_INT_REGS or rs2 not in _CL_INT_REGS:
            return False
        if off is None or off < 0:
            return False
        if mn == "sb":
            return off <= 3
        return off in (0, 2)

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

    if mn == "addiw":
        # c.addiw (RV64C): RSD form, rd != x0, imm in -32..31.  Unlike c.addi,
        # imm=0 is a valid (albeit redundant sign-extend) encoding.
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        imm = instr.imm
        if rd is None or rd == "x0" or rd != rs1:
            return False
        return imm is not None and -32 <= imm <= 31

    if mn == "slli":
        # c.slli rd, shamt: RSD form (rd==rs1), rd != x0, shamt in 1..63 (RV64).
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        imm = instr.imm
        return (rd is not None and rd != "x0" and rd == rs1
                and imm is not None and 1 <= imm <= 63)

    if mn == "lui":
        # c.lui rd, imm: rd != x0/x2, imm != 0, imm in -32..31 (upper 20 bits).
        rd  = defs[0] if defs else None
        imm = instr.imm
        return (rd is not None and rd not in ("x0", "x2")
                and imm is not None and imm != 0 and -32 <= imm <= 31)

    if mn == "jal":
        # RV64C: c.j (rd=x0); the c.jal (rd=x1) slot is taken by c.addiw.
        # Offset range not checked.
        rd = defs[0] if defs else None
        return rd in (None, "x0")

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
    "slti", "sltiu",
    "slt", "sltu",
    "seqz", "snez", "sltz", "sgtz",
})
_BRANCH_ZERO = frozenset({"beqz", "bnez", "beq", "bne"})
_BRANCH_CMP  = frozenset({"beq", "bne", "blt", "bge", "bltu", "bgeu", "beqz", "bnez"})

# beq and bne are symmetric: ``beq rs1, rs2, lbl`` == ``beq rs2, rs1, lbl``.
_COMMUTATIVE_BRANCH = frozenset({"beq", "bne"})


def _is_chained(rd: str, b: "Instruction", liveness: dict) -> bool:
    """True if *b* consumes *rd* and *rd* is dead after *b*.

    Handles commutative instructions: for R-type ops in ``_COMMUTATIVE_BINOP``
    and for ``beq``/``bne``, *rd* may appear as either operand.  For all
    other instructions *rd* must be ``b.uses[0]`` (rs1).
    """
    if not b.uses:
        return False
    if b.uses[0] == rd:
        pass  # matched as rs1
    elif (b.mnemonic in _COMMUTATIVE_BINOP or b.mnemonic in _COMMUTATIVE_BRANCH):
        if rd not in b.uses:
            return False
    else:
        return False
    return rd in liveness.get(b.index, frozenset())

# Module-level constants shared by multiple rules and by make_compact32_scorer.
#
# Two distinct arithmetic mnemonic sets are used for memory-related rules:
#
#   _ADDR_UPDATE_MN — scalar address updates for pre/post-increment pairs.
#     Simple add/sub/shift-add; no 64-bit word or .uw variants.
#
#   _ADDR_COMPUTE_MN — address computations for addr_chain pairs.
#     Wider: also includes addw/addiw/subw and sh[1-3]add.uw.
#
_ADDR_UPDATE_MN = frozenset({"add", "addi", "sub", "sh1add", "sh2add", "sh3add"})
_ADDR_COMPUTE_MN = frozenset({
    "add",  "addi",  "addw",  "addiw",
    "sub",  "subw",
    "add.uw", "slli.uw",
    "sh1add", "sh1add.uw",
    "sh2add", "sh2add.uw",
    "sh3add", "sh3add.uw",
})
# Arithmetic mnemonics that carry an immediate operand (potential stride).
_IMM_ARITH  = frozenset({"addi", "addiw"})
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


def _is_pow2_imm(imm) -> bool:
    return imm is not None and imm > 0 and not (imm & (imm - 1))


def _rule_bit_branch_rsd(a: "Instruction", b: "Instruction",
                         liveness: dict) -> bool:
    """
    Single-bit mask in RSD form + conditional branch.

    Matches:
        andi  rd, rd, imm        (imm a positive power of two; rd == rs1)
        beqz / bnez  rd, label   (rd dead after B)

    rd is overwritten with the isolated bit and then consumed by the branch.
    """
    if not a.defs or a.mnemonic != "andi":
        return False
    rd = a.defs[0]
    if not _is_pow2_imm(a.imm):
        return False
    if not a.uses or a.uses[0] != rd:   # must be RSD form
        return False
    if b.mnemonic not in ("beqz", "bnez"):
        return False
    if rd not in b.uses:
        return False
    return rd in liveness.get(b.index, frozenset())


def _rule_bit_branch_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> bool:
    """
    Single-bit test into a fresh register + conditional branch (chain form).

    Matches either:
        andi   rd, rs, imm       (imm a positive power of two; rd != rs)
        beqz / bnez  rd, label   (rd dead after B)

    or:
        slli / srli / srai  rd, rs, N   (rd != rs)
        beqz / bnez  rd, label          (rd dead after B)

    rd is dead after B — it carries only the isolated or shifted bit to
    the branch and is then discarded.  The source register rs is preserved.
    """
    if not a.defs:
        return False
    rd = a.defs[0]
    if a.uses and a.uses[0] == rd:      # RSD form → not chain
        return False
    if a.mnemonic == "andi":
        if not _is_pow2_imm(a.imm):
            return False
    elif a.mnemonic not in ("slli", "srli", "srai"):
        return False
    if b.mnemonic not in ("beqz", "bnez"):
        return False
    if rd not in b.uses:
        return False
    return rd in liveness.get(b.index, frozenset())


def _rule_cmp_branch_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> bool:
    """
    Compare + conditional branch where the compare result register is dead
    after the branch (chain form).

    Matches:
        <cmp-op>  rd, rs, ...    (any _CMP_MNEMONICS mnemonic; rd != rs1)
        beqz / bnez  rd, label   (rd dead after B)

    rd must differ from rs1 — the source register is preserved because rd
    occupies a distinct slot.  rd must be dead after B: it carries the
    comparison result only as far as the branch, then is discarded.

    Also matches the load-immediate + comparison-branch pattern:

        li     rd, imm           # addi rd, x0, imm — rd is a fresh constant
        blt / bge / bltu / bgeu / beq / bne  rs, rd, label   (rd dead after B)

    This is equivalent to  sltiu t, rs, imm; bnez t, label  (or similar) with
    t being any dead register.  rd must be dead after B.

    Canonical examples:
        andi   a0, s6, 1     # rd=a0, rs1=s6; a0 dead after branch
        bne    a0, zero, .L

        sltiu  a1, a0, 1     # rd=a1, rs1=a0; a1 dead after branch
        bnez   a1, .done

        li     a5, 5         # addi a5, x0, 5
        bltu   a3, a5, .L    # a5 dead after branch
    """
    if not a.defs:
        return False
    rd = a.defs[0]

    # Path 1: _is_cmp + beqz/bnez/beq/bne (chain form: rd != rs1)
    if _is_cmp(a):
        # Chain form: rd must differ from rs1 so the source is preserved.
        # If rd == rs1 this is cmp_branch_rsd territory instead.
        if a.uses and a.uses[0] == rd:
            return False
        if b.mnemonic not in _BRANCH_ZERO:
            return False
        if rd not in b.uses:
            return False
        return rd in liveness.get(b.index, frozenset())

    # Path 2: _is_li + any comparison branch (rd used as comparison operand)
    if _is_li(a):  # TODO: look at available range here
        if b.mnemonic not in _BRANCH_CMP:
            return False
        if rd not in b.uses:
            return False
        return rd in liveness.get(b.index, frozenset())

    return False


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
    if not _is_cmp(a):
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


# Map each load/store mnemonic to the number of bytes it accesses.
# RV32I/RV64I integer, and F/D extension float widths included so the
# adjacent-pair rules generalise cleanly to future ISA variants.
_MEM_WIDTH: dict = {
    # RV32I / RV64I integer loads and stores
    "lb":  1, "lbu": 1, "sb":  1,
    "lh":  2, "lhu": 2, "sh":  2,
    "lw":  4, "lwu": 4, "sw":  4,
    "ld":  8,            "sd":  8,
    # F extension (single-precision float)
    "flw": 4, "fsw": 4,
    # D extension (double-precision float)
    "fld": 8, "fsd": 8,
}
_LOAD_MN  = frozenset(mn for mn in _MEM_WIDTH
                       if mn.startswith(("l", "f")) and not mn.startswith("fs"))
_STORE_MN = frozenset(mn for mn in _MEM_WIDTH
                       if mn.startswith(("s", "fs")))
_MEM_OPS  = frozenset(_MEM_WIDTH)    # all load/store mnemonics


# ---------------------------------------------------------------------------
# Named instruction compatibility predicates
# ---------------------------------------------------------------------------
# These are the canonical per-instruction gate functions referenced by the
# pairing rules.  Each rule names the predicates it applies, making the
# opcode-set and structural constraints explicit at the call site.
#
# Existing predicates defined in rv32_core.py:
#   _dual_arith_ok(instr)  — RSD form, x0..x15 regs, bounded immediate
#
# Predicates defined here (compact32-rule specific):

def _is_load(instr: "Instruction") -> bool:
    """True if *instr* is any load (byte/half/word/double, integer or float)."""
    return instr.mnemonic in _LOAD_MN

def _is_store(instr: "Instruction") -> bool:
    """True if *instr* is any store (byte/half/word/double, integer or float)."""
    return instr.mnemonic in _STORE_MN

def _is_mem_op(instr: "Instruction") -> bool:
    """True if *instr* is any load or store."""
    return instr.mnemonic in _MEM_OPS

def _is_addr_update(instr: "Instruction") -> bool:
    """True if *instr* is a scalar address-update op (pre/post-increment slot).

    Covers: add, addi, sub, sh1add, sh2add, sh3add.
    Excludes 64-bit word variants (addw, addiw, subw) and .uw shift-adds —
    those are only valid in the addr_chain slot (_is_addr_compute).
    """
    return instr.mnemonic in _ADDR_UPDATE_MN

def _is_addr_compute(instr: "Instruction") -> bool:
    """True if *instr* is an address-computation op (addr_chain slot).

    Wider than _is_addr_update: also includes addw, addiw, subw, and the
    sh[1-3]add.uw variants.
    """
    return instr.mnemonic in _ADDR_COMPUTE_MN

def _addr_stride_ok(arith: "Instruction", mem: "Instruction") -> bool:
    """True if *arith*'s immediate stride is aligned to *mem*'s access width.

    Only constrains immediate-form arithmetic (addi / addiw).  For
    register-based arithmetic (add, sub, sh1add …) there is no immediate
    to check, so the function always returns True.

    When an immediate is present it must be non-zero and a multiple of the
    memory access width (e.g. ±4, ±8, ±12 for lw; ±2, ±4 for lh; ±1 for lb).
    """
    if arith.mnemonic not in _IMM_ARITH:
        return True
    width = _MEM_WIDTH.get(mem.mnemonic, 0)
    imm = arith.imm
    return width != 0 and imm is not None and abs(imm) % width == 0

def _is_cmp(instr: "Instruction") -> bool:
    """True if *instr* is a true comparison op (produces a boolean integer result).

    Covers: slti, sltiu, slt, sltu, seqz, snez, sltz, sgtz.
    Does NOT include shifts or bit-masks — see _rule_bit_branch_* for those.
    """
    return instr.mnemonic in _CMP_MNEMONICS

def _is_mv(instr: "Instruction") -> bool:
    """True if *instr* is a register-to-register move.

    Covers two canonical forms:
    * ``addi rd, rs, 0`` — GAS pseudo ``mv rd, rs`` (I-type)
    * ``add  rd, x0, rs`` — C-extension ``c.mv rd, rs`` (R-type; x0 filtered
      away leaves exactly one use)
    """
    if instr.mnemonic == "addi" and len(instr.uses) == 1 and instr.imm == 0:
        return True
    if instr.mnemonic == "add" and len(instr.uses) == 1:
        return True
    return False


def _is_li(instr: "Instruction", values = range(-16, 16)) -> bool:
    """True if *instr* is a load-immediate within the compact encoding range.

    The GAS pseudo ``li rd, imm`` canonicalises to ``addi rd, x0, imm`` with
    x0 filtered from uses[], so this form has mnemonic="addi" and uses=[].
    Immediate is restricted to −16..+15 to fit the compact encoding field.
    """
    return (instr.mnemonic == "addi" and not instr.uses
            and instr.imm is not None and instr.imm in values)


def _rule_adjacent_load_pair(a: "Instruction", b: "Instruction",
                              liveness: dict) -> bool:
    """
    Pair of same-width loads from adjacent memory locations with the same base.
    Address difference must equal the access width.  Both destinations distinct.

    Matches:
        <load>  rd1, N(base)
        <load>  rd2, N±<width>(base)   rd1 != rd2, same mnemonic
    """
    if not _is_load(a) or a.mnemonic != b.mnemonic:
        return False
    width = _MEM_WIDTH.get(a.mnemonic)
    if a.mem is None or b.mem is None:
        return False
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b or abs(off_a - off_b) != width:
        return False
    rd_a = a.defs[0] if a.defs else None
    rd_b = b.defs[0] if b.defs else None
    return rd_a is not None and rd_b is not None and rd_a != rd_b


def _rule_adjacent_store_pair(a: "Instruction", b: "Instruction",
                               liveness: dict) -> bool:
    """
    Pair of same-width stores to adjacent memory locations with the same base.
    Address difference must equal the access width.

    Matches:
        <store>  rs1, N(base)
        <store>  rs2, N±<width>(base)   same mnemonic
    """
    if not _is_store(a) or a.mnemonic != b.mnemonic:
        return False
    width = _MEM_WIDTH.get(a.mnemonic)
    if a.mem is None or b.mem is None:
        return False
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b or abs(off_a - off_b) != width:
        return False
    rs_a = a.uses[0] if a.uses else None
    rs_b = b.uses[0] if b.uses else None
    return rs_a is not None and rs_b is not None


def _rule_addr_chain(a: "Instruction", b: "Instruction",
                     liveness: dict) -> bool:
    """
    Address computation followed by a load/store using the result as base,
    where the computed address is dead after the memory op (chain form).

    A slot: _is_addr_compute  (add/addi/addw/addiw/sub/subw/sh[1-3]add[.uw])
    B slot: _is_mem_op        (any load or store)

    rd_a must be dead after B — it carries only the computed address.
    """
    if not _is_addr_compute(a) or not _is_mem_op(b):
        return False
    if not a.defs:
        return False
    rd_a = a.defs[0]
    if b.mem is None or b.mem[1] != rd_a:
        return False
    return rd_a in liveness.get(b.index, frozenset())


def _rule_pre_increment(a: "Instruction", b: "Instruction",
                        liveness: dict) -> bool:
    """
    Address update followed by a memory op using that result as base
    (pre-increment / stride-then-access).

    A slot: _is_addr_update   (add/addi/sub/sh[1-3]add — scalar only)
    B slot: _is_mem_op        (any load or store)

    _addr_stride_ok constrains the immediate when A is addi/addiw: the
    stride must be a non-zero multiple of B's access width.  Register-based
    arithmetic (add, sub, sh1add …) has no immediate to constrain.

    The stored-value register of a store must not be rd (it would be
    overwritten by A before the store executes).
    """
    if not _is_addr_update(a) or not _is_mem_op(b):
        return False
    if not a.defs:
        return False
    rd = a.defs[0]
    if rd not in b.uses:
        return False
    if _is_store(b) and b.uses and b.uses[0] == rd:
        return False
    return _addr_stride_ok(a, b)


def _rule_post_increment(a: "Instruction", b: "Instruction",
                          liveness: dict) -> bool:
    """
    Memory op followed by an address update on the same base
    (access-then-stride).

    A slot: _is_mem_op        (any load or store)
    B slot: _is_addr_update   (add/addi/sub/sh[1-3]add — scalar only)

    _addr_stride_ok constrains the immediate when B is addi/addiw.
    For loads, the load destination must differ from B's destination.
    """
    if not _is_mem_op(a) or not _is_addr_update(b):
        return False
    base = a.uses[-1] if a.uses else None
    if base is None or not b.uses or b.uses[0] != base:
        return False
    if _is_load(a):
        load_rd  = a.defs[0] if a.defs else None
        arith_rd = b.defs[0] if b.defs else None
        if load_rd is not None and load_rd == arith_rd:
            return False
    return _addr_stride_ok(b, a)


# ---------------------------------------------------------------------------
# Load-producer chain rules
# ---------------------------------------------------------------------------
# Three rules that share an A slot: a word or doubleword load whose result
# is consumed by B and then dead.  They differ in what B may be:
#
#   load_mem_chain    B is a load/store indexed by the loaded pointer, with a
#                     small scaled offset (0..3 × access width).
#   load_jalr_chain   B is an indirect jump/call through the loaded pointer.
#   load_arith_chain  B is an arithmetic op reading the loaded value as rs1,
#                     with the same encoding constraints as dual_arith_chain.
#
# Shared A predicate: _is_load_producer.
_LOAD_PRODUCER_MN = frozenset({"lw", "ld"})


def _is_load_producer(instr: "Instruction") -> bool:
    """True if *instr* is a word/doubleword load that can seed a chain."""
    return instr.mnemonic in _LOAD_PRODUCER_MN and bool(instr.defs)


def _rule_load_mem_chain(a: "Instruction", b: "Instruction",
                         liveness: dict) -> bool:
    """
    Load of a value followed by an indexed load/store that uses the loaded
    value as its base, with a small scaled offset.

    A slot: lw or ld
    B slot: any load/store whose base register equals A's destination and
            whose offset is a non-negative multiple of its access width with
            the scaled index in {0, 1, 2, 3}.

    A's destination must be dead after B — it carries only the chained
    pointer.  Matches the pointer-deref idiom (load pointer, deref field).
    """
    if not _is_load_producer(a):
        return False
    rd_a = a.defs[0]
    if not _is_mem_op(b) or b.mem is None:
        return False
    off_b, base_b = b.mem
    if base_b != rd_a:
        return False
    width_b = _MEM_WIDTH.get(b.mnemonic, 0)
    if width_b == 0 or off_b is None:
        return False
    if off_b < 0 or off_b % width_b != 0 or off_b // width_b > 3:
        return False
    return rd_a in liveness.get(b.index, frozenset())


def _rule_load_jalr_chain(a: "Instruction", b: "Instruction",
                          liveness: dict) -> bool:
    """
    Load of a function pointer followed by an indirect jump/call through it.

    A slot: lw or ld
    B slot: jalr (the parser canonicalises ``jr`` to ``jalr``) whose base
            register equals A's destination.

    A's destination must be dead after B.  Matches vtable / function-pointer
    call idioms.
    """
    if not _is_load_producer(a):
        return False
    rd_a = a.defs[0]
    if b.mnemonic != "jalr":
        return False
    if not b.uses or b.uses[0] != rd_a:
        return False
    return rd_a in liveness.get(b.index, frozenset())


_LOAD_BRANCH_MN = frozenset({"beqz", "bnez", "beq", "bne"})


def _rule_load_branch_chain(a: "Instruction", b: "Instruction",
                            liveness: dict) -> bool:
    """
    Load followed by a conditional branch on the loaded value.

    A slot: lw or ld
    B slot: beqz or bnez whose tested register equals A's destination.

    A's destination must be dead after B.  Matches null-check / flag-load
    idioms (load a value, branch if zero/non-zero).
    """
    if not _is_load_producer(a):
        return False
    rd_a = a.defs[0]
    if b.mnemonic not in _LOAD_BRANCH_MN:
        return False
    return _is_chained(rd_a, b, liveness)


def _rule_load_arith_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> bool:
    """
    Load followed by arithmetic that uses the loaded value, with the
    same encoding constraints as dual_arith_chain's B slot.

    A slot: lw or ld; A's destination must lie in x0..x15 so the chain
            intermediate fits the compact register field.
    B slot: dual-arith op using rd_a (as either operand for commutative
            ops), rd_b in x0..x15, all register uses in x0..x15, and
            immediate in range (−16..15 for addi/andi/etc., 1..31 for
            slli/srli).

    A's destination must be dead after B — it carries only the chained value.
    """
    if not _is_load_producer(a):
        return False
    rd_a = a.defs[0]
    if rd_a not in _DUAL_ARITH_REG:
        return False
    if b.mnemonic not in _DUAL_ARITH_MN:
        return False
    if not _is_chained(rd_a, b, liveness):
        return False
    rd_b = b.defs[0] if b.defs else None
    if rd_b is None or rd_b not in _DUAL_ARITH_REG:
        return False
    if any(u not in _DUAL_ARITH_REG for u in b.uses):
        return False
    if not _dual_arith_immediate_ok(b):
        return False
    return True


def _rule_dual_arith(a: "Instruction", b: "Instruction",
                     liveness: dict) -> bool:
    """
    Two independent arithmetic operations, each satisfying the dual-arith
    encoding constraints (RSD form, registers in x0..x15, 5-bit immediate).
    """
    return a.dual_arith_ok and b.dual_arith_ok


# Arithmetic group for arith_mem: addi (6-bit imm), add, sub, and, or;
# all in RSD form (rs1 == rd) with all registers in x0..x15.
_ARITH_MEM_MN = frozenset({"add", "sub", "and", "or", "addi"})

def _is_arith_mem_a(instr: "Instruction") -> bool:
    """
    True if *instr* qualifies as the A slot of an arith_mem pair.

    Constraints:
    - mnemonic in {addi, add, sub, and, or}
    - RSD form: rs1 == rd
    - all registers (rd, rs1, rs2) in x0..x15
    - addi: immediate in -64..63
    """
    mn = instr.mnemonic
    if mn not in _ARITH_MEM_MN:
        return False
    rd = instr.defs[0] if instr.defs else None
    if rd is None or rd not in _DUAL_ARITH_REG:
        return False
    if not instr.uses or instr.uses[0] != rd:   # rsd constraint
        return False
    if mn == "addi":
        imm = instr.imm
        return imm is not None and -64 <= imm <= 63
    else:
        # add, sub, and, or: rs2 must also be in x0..x15
        rs2 = instr.uses[1] if len(instr.uses) > 1 else None
        return rs2 is not None and rs2 in _DUAL_ARITH_REG


def _mem_small_offset_ok(instr: "Instruction") -> bool:
    """
    True if *instr* is a load or store with an aligned offset in
    0 .. 3 × access_width (i.e., a 2-bit scaled field).
    """
    if instr.mnemonic not in _MEM_OPS:
        return False
    mem = instr.mem
    if mem is None:
        return False
    off, _base = mem
    if off is None or off < 0:
        return False
    width = _MEM_WIDTH.get(instr.mnemonic, 0)
    return width != 0 and off % width == 0 and off <= 3 * width


def _rule_arith_mem(a: "Instruction", b: "Instruction",
                    liveness: dict) -> bool:
    """
    Arithmetic (RSD form, x0..x15 regs) followed by a load or store with a
    small aligned offset (0 .. 3 × access width).

    A slot: addi rsd, rsd, imm  (imm in -64..63)
         or add / sub / and / or  rsd, rsd, rs2
         all registers in x0..x15.

    B slot: any load or store whose offset is a non-negative multiple of its
        access width and fits in a 2-bit scaled field (0, 1×w, 2×w, 3×w).

    No producer-consumer relationship between A and B is required — the
    pairing is structural, encoding two independent operations together.
    The dep graph still prevents scheduling A before B when a true dependency
    exists.
    """
    return _is_arith_mem_a(a) and _mem_small_offset_ok(b)


def _rule_dual_arith_chain(a: "Instruction", b: "Instruction",
                            liveness: dict) -> bool:
    """
    Two arithmetic operations where A's result is consumed by B as its first
    source, then discarded (dead after B).

    Matches:
        <dual-arith op>  rd_a, rs1_a, rs2_a
        <dual-arith op>  rd_b, rd_a, rs2_b   (B uses A's result; rd_a dead after B)

    rd_a must be dead after B — it is the intermediate, used only to pass
    A's result to B.

    For commutative B ops (add, and, or, xor) rd_a may appear as either
    rs1 or rs2.
    """
    rd_a = a.defs[0] if a.defs else None
    return _chain_arith_a(a) and _chain_arith_b(b) and _is_chained(rd_a, b, liveness)


def _is_small_jump(b: "Instruction") -> bool:
    """True if *b* is an unconditional branch with a small or zero immediate.

    ``j`` targets a local label whose offset fits in the instruction word;
    ``jalr``/``jr`` with zero offset is a pure register-indirect transfer.
    Both are safe to pair because the immediate is small and not subject to
    linker relocation.

    ``jal`` (call) carries a potentially large, linker-modifiable function
    address.  ``jalr`` with a non-zero offset typically holds a relocation
    addend from ``auipc``; both are rejected.

    Accepts:
      - ``j label``   (canonicalised to ``jal`` with defs=[] — x0 link reg)
      - ``jr rs``     (canonicalised to ``jalr`` with zero/absent offset)
      - ``jalr rd, 0(rs)``  (zero offset — indirect call/jump)
      - ``ret``       (canonicalised to ``jalr`` with zero offset)

    Rejects:
      - ``jal func``  (defs=[x1] — large/relocatable immediate)
      - ``jalr rd, off(rs)``  with off ≠ 0 (relocatable addend)
    """
    if b.mnemonic == "jal":
        return not b.defs  # j → defs=[], jal func → defs=[x1]
    if b.mnemonic == "jalr":
        return b.imm is None or b.imm == 0
    return False


def _rule_arith_jump(a: "Instruction", b: "Instruction",
                     liveness: dict) -> bool:
    """
    Arithmetic operation (dual-arith subset) followed by a small
    unconditional branch (j, jr, jalr with zero offset, ret).

    Matches:
        <dual-arith op>  rd, rd, rs2/imm   (RSD form, rd in x0..x15)
        j / jr / jalr 0(rs) / ret
    """
    return a.dual_arith_ok and _is_small_jump(b)


def _rule_mv_load_jump(a: "Instruction", b: "Instruction",
                       liveness: dict) -> bool:
    """
    Move or small-offset load followed by a small unconditional branch.

    A slot: ``mv rd, rs`` or load with offset in 0..3×width
    B slot: j / jr / jalr 0(rs) / ret  (shared with arith_jump)
    """
    if _is_mv(a) or _is_li(a):
        return _is_small_jump(b)
    if _is_load(a) and a.mem is not None:
        off, _base = a.mem
        if off is not None and off >= 0:
            width = _MEM_WIDTH.get(a.mnemonic, 0)
            if width != 0 and off % width == 0 and off <= 3 * width:
                return _is_small_jump(b)
    return False


def _rule_arith_branch(a: "Instruction", b: "Instruction",
                       liveness: dict) -> bool:
    """
    Arithmetic operation (dual-arith subset) followed by a conditional
    branch on whether the result is zero.  In this instance rsd is
    re-used, but not discarded after the branch.

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
    rsd = a.defs[0] if a.defs else None
    if b.mnemonic not in ("beq", "bne"):
        return False
    # rsd must appear as either operand of the branch (commutativity).
    return rsd in b.uses


# Pairs of mnemonics that consume the same two source registers but produce
# two distinct results, making them natural candidates for dual-issue.
# Each entry maps a mnemonic to the set of valid partners.
_OP_PAIR_TABLE: dict = {
    "add":    frozenset({"sub"}),
    "sub":    frozenset({"add"}),
    "div":    frozenset({"rem"}),
    "rem":    frozenset({"div"}),
    "divu":   frozenset({"remu"}),
    "remu":   frozenset({"divu"}),
    "mul":    frozenset({"mulh", "mulhu", "mulhsu"}),
    "mulh":   frozenset({"mul"}),
    "mulhu":  frozenset({"mul"}),
    "mulhsu": frozenset({"mul"}),
    "min":    frozenset({"max"}),
    "max":    frozenset({"min"}),
    "minu":   frozenset({"maxu"}),
    "maxu":   frozenset({"minu"}),
    "and":    frozenset({"andn"}),
    "andn":   frozenset({"and"}),
    # mv (addi rd, rs, 0) and li (addi rd, x0, imm) both canonicalise to addi,
    # but those cases are handled by the _is_mv/_is_li early return above and
    # never reach the table.  addi is intentionally absent here so that general
    # arithmetic addi instructions (non-zero imm, non-x0 source) do not
    # spuriously match after register renaming makes two addis share a source.
}


def _rule_op_pair(a: "Instruction", b: "Instruction",
                      liveness: dict) -> bool:
    """
    Two instructions that together take two inputs and produce two independent
    results (dual-result form).

    For arithmetic pairs (add/sub, div/rem, mul/mulh, min/max, and/andn …)
    both instructions consume the *same* rs1, rs2 and write to distinct
    destinations.

    For move pairs (mv+mv, mv+li, li+li) each instruction independently
    routes one input to one output; the pair as a whole takes two inputs
    and gives two results.  Same-source constraint does not apply here.

    Valid pairs and their relationship:
        add / sub       — sum and difference of the same operands
        div / rem       — quotient and remainder (signed)
        divu / remu     — quotient and remainder (unsigned)
        mul / mulh      — low and high word of signed×signed product
        mul / mulhu     — low and high word of unsigned×unsigned product
        mul / mulhsu    — low and high word of signed×unsigned product
        min / max       — minimum and maximum (signed)
        minu / maxu     — minimum and maximum (unsigned)
        and / andn      — AND and AND-NOT of the same operands
        mv / mv         — two independent register copies (any sources)
        mv / li         - one register copy, one constant load
        li / li         — two independent small constant loads
    """
    if not a.defs or not b.defs or a.defs[0] == b.defs[0]:
        return False
    # Move/li pairs: each instruction is an independent one-input→one-output
    # data path; no shared-source requirement.  Only same-kind pairs allowed:
    # mv+mv (each routes a different register) or li+li (each loads a constant).
    # li+mv is intentionally excluded to concede the case where a source
    # register is copied and then replaced with a constant, and
    # reordering can achieve any complementary case of li+mv.
    if _is_mv(a):
        return _is_mv(b) or _is_li(b)
    if _is_li(a):
        return _is_li(b)
    # Table-driven same-input pairs.
    partners = _OP_PAIR_TABLE.get(a.mnemonic)
    if partners is None or b.mnemonic not in partners:
        return False
    return bool(a.uses) and a.uses == b.uses


# Chain form: A's result is consumed by B, then dead.
# Each entry maps A's mnemonic to the set of valid B mnemonics.
_OP_PAIR_CHAIN_TABLE: dict = {
    "slli": frozenset({"srli", "srai", "add", "sub", "or"}),
}


def _rule_op_pair_chain(a: "Instruction", b: "Instruction",
                        liveness: dict) -> bool:
    """
    Chain form of op_pair: A computes a value into rd_a, B consumes rd_a
    as one of its source registers, and rd_a is dead after B.

    A slot: first mnemonic of the explicit pair
    B slot: second mnemonic of the explicit pair

    Current pairs:
        slli / srli   — shift left then shift right (bit-field extraction)
        slli / srai   — shift left then arithmetic shift right (sign-extend)
        slli / add    — shift left then add (scaled index)
        slli / sub    — shift left then subtract (scaled index)
        slli / or     — shift left then OR (bit-field insertion)
    """
    partners = _OP_PAIR_CHAIN_TABLE.get(a.mnemonic)
    if partners is None or b.mnemonic not in partners:
        return False
    if not a.defs:
        return False
    rd_a = a.defs[0]
    if rd_a not in b.uses:
        return False
    return rd_a in liveness.get(b.index, frozenset())


def _rule_li_branch_chain(a: "Instruction", b: "Instruction",
                          liveness: dict) -> bool:
    """
    Load-immediate followed by a conditional branch using the loaded value,
    effectively synthesising ``bXX rs1, imm, label``.

    A slot: ``li rd, imm`` with imm in −512..511 (10-bit signed)
    B slot: any conditional branch (beq/bne/blt/bge/bltu/bgeu/beqz/bnez)
            that uses rd as one of its operands.

    rd must be dead after B — it carries only the comparison constant.
    The immediate range is wider than the compact-encoding ``_is_li``
    (−16..15) because the fused branch-with-immediate encoding has room
    for a 10-bit signed operand.
    """
    if a.mnemonic != "addi" or a.uses or not a.defs:
        return False
    imm = a.imm
    if imm is None or imm < -512 or imm > 511:
        return False
    rd = a.defs[0]
    if b.mnemonic not in _BRANCH_CMP:
        return False
    if rd not in b.uses:
        return False
    return rd in liveness.get(b.index, frozenset())


# the first match wins.
COMPACT32_RULES: list = [
    ("bit_branch_rsd",      _rule_bit_branch_rsd),
    ("bit_branch_chain",    _rule_bit_branch_chain),
    ("cmp_branch_rsd",      _rule_cmp_branch_rsd),
    ("cmp_branch_chain",    _rule_cmp_branch_chain),
    ("adjacent_load_pair",  _rule_adjacent_load_pair),
    ("adjacent_store_pair", _rule_adjacent_store_pair),
    ("addr_chain",          _rule_addr_chain),
    ("pre_increment",       _rule_pre_increment),
    ("post_increment",      _rule_post_increment),
    ("load_mem_chain",      _rule_load_mem_chain),
    ("load_jalr_chain",     _rule_load_jalr_chain),
    ("load_branch_chain",   _rule_load_branch_chain),
    ("load_arith_chain",    _rule_load_arith_chain),
    ("op_pair",             _rule_op_pair),
    ("op_pair_chain",       _rule_op_pair_chain),
    ("dual_arith",          _rule_dual_arith),
    ("dual_arith_chain",    _rule_dual_arith_chain),
    ("arith_jump",          _rule_arith_jump),
    ("mv_load_jump",        _rule_mv_load_jump),
    ("arith_branch",        _rule_arith_branch),
    ("addi_branch",         _rule_addi_branch),
    ("li_branch_chain",     _rule_li_branch_chain),
]

def _is_return_instr(instr: "Instruction") -> bool:
    """True if *instr* is a return: ``ret`` or ``jalr`` using ra (x1) as base."""
    if instr.mnemonic == "ret":
        return True
    if instr.mnemonic == "jalr":
        if instr.mem is not None and instr.mem[1] == "x1":
            return True
        if "x1" in instr.uses and (not instr.defs or instr.defs[0] == "x0"):
            return True
    return False


def _rule_chain(a: "Instruction", b: "Instruction",
                liveness: dict) -> bool:
    """
    Generic chain: A defines a register that B consumes and is dead after B.

    Matches any producer-consumer adjacent pair where A's result register is
    used by B and not live after B.  Catches patterns not covered by the more
    specific primary chain rules (addr_chain, op_pair_chain, …).
    """
    if not a.defs:
        return False
    rd = a.defs[0]
    if rd == "x0":
        return False
    if rd not in b.uses:
        return False
    return rd in liveness.get(b.index, frozenset())


def _rule_rsd_live(a: "Instruction", b: "Instruction",
                   liveness: dict) -> bool:
    """
    RSD-form update feeding B where A's result stays live after B.

    A is in RSD form (rs1 == rd): it updates a register in-place.  B reads
    that register, but the value is still needed afterwards (not dead).
    Contrasts with the chain rules where the value is dead after B.
    """
    if not a.defs or not a.uses:
        return False
    rd = a.defs[0]
    if rd == "x0":
        return False
    if a.uses[0] != rd:          # rsd constraint: rs1 == rd
        return False
    if rd not in b.uses:
        return False
    return rd not in liveness.get(b.index, frozenset())  # NOT dead after B


def _rule_arith_return(a: "Instruction", b: "Instruction",
                       liveness: dict) -> bool:
    """
    Any arithmetic before a function return (ret or jalr-as-return).

    Catches the common pattern of computing a return value immediately before
    returning.  A may be any instruction that defines a register and is not
    itself a branch, memory access, or return.
    """
    if not _is_return_instr(b):
        return False
    if not a.defs:
        return False
    if a.mnemonic in _COMPACT32_BRANCH_MN or _is_mem_op(a):
        return False
    if a.mnemonic in ("nop", "ret", "tail", "call", "ecall", "ebreak",
                      "fence", "fence.i"):
        return False
    return True


# ---------------------------------------------------------------------------
# Per-side eligibility predicates for tally rules
# ---------------------------------------------------------------------------
# Each function tests whether a single instruction is structurally eligible
# to occupy the A slot (first/producer) or B slot (second/consumer) of the
# corresponding tally rule.  These are used to annotate unpaired instructions
# in the scheduler output; the downstream rv32_tally.py tool reads these
# annotations to compute statistics without re-running the scheduler.
#
# Liveness-dependent rules (chain, rsd_live) use loose structural criteria
# that do not require knowledge of the adjacent instruction.

def _chain_a_eligible(instr: "Instruction") -> bool:
    """A-eligible for 'chain': defines a non-x0 register (potential producer)."""
    return bool(instr.defs) and instr.defs[0] != "x0"


def _chain_b_eligible(instr: "Instruction") -> bool:
    """B-eligible for 'chain': has at least one use (potential consumer)."""
    return bool(instr.uses)


def _rsd_live_a_eligible(instr: "Instruction") -> bool:
    """A-eligible for 'rsd_live': RSD form (rs1 == rd), rd != x0."""
    if not instr.defs or not instr.uses:
        return False
    rd = instr.defs[0]
    return rd != "x0" and instr.uses[0] == rd


def _rsd_live_b_eligible(instr: "Instruction") -> bool:
    """B-eligible for 'rsd_live': has at least one use (potential consumer)."""
    return bool(instr.uses)


def _arith_return_a_eligible(instr: "Instruction") -> bool:
    """A-eligible for 'arith_return': defines a register, not branch/mem/return/nop."""
    if not instr.defs:
        return False
    if instr.mnemonic in _COMPACT32_BRANCH_MN or _is_mem_op(instr):
        return False
    if instr.mnemonic in ("nop", "ret", "tail", "call", "ecall", "ebreak",
                          "fence", "fence.i"):
        return False
    return True


# ---------------------------------------------------------------------------
# Tally rules
# ---------------------------------------------------------------------------
# Candidate pairing rules used for statistics gathering only.  They are never
# activated during scheduling; instead, unpaired instructions in the scheduler
# output are annotated with TALLY:name:A / TALLY:name:B tags indicating which
# rules each instruction is eligible for on each side.
#
# Each entry is (name, pair_fn, a_eligible_fn, b_eligible_fn).
#   name           : short identifier, used in annotations and --list-rules
#   pair_fn        : full rule predicate (a, b, liveness) -> bool
#   a_eligible_fn  : per-instruction A-side structural check (instr) -> bool
#   b_eligible_fn  : per-instruction B-side structural check (instr) -> bool
TALLY_RULES: list = [
    ("arith_mem",    _rule_arith_mem,    _is_arith_mem_a,          _mem_small_offset_ok),
    ("chain",        _rule_chain,        _chain_a_eligible,        _chain_b_eligible),
    ("rsd_live",     _rule_rsd_live,     _rsd_live_a_eligible,     _rsd_live_b_eligible),
    ("arith_return", _rule_arith_return, _arith_return_a_eligible, _is_return_instr),
]


# ---------------------------------------------------------------------------
# Compact-32 scorer factory
# ---------------------------------------------------------------------------

def make_compact32_scorer(liveness: dict,
                          tally_rules: "list[str]" = []) -> "PairScoreFn":
    """
    Return a pair-scoring function for the compact-32 encoding experiment.

    The scorer holds its liveness reference in a mutable cell so that
    the streaming processor can refresh it per block after renaming.

    tally_rules
        Ordered list of tally rule names to activate (see TALLY_RULES).
        Each name corresponds to a rule that is tried only after all primary
        rules have failed.  Order matches --tally= list order.
    """
    cell: list = [liveness]

    _tally_by_name = {name: fn for name, fn, _a, _b in TALLY_RULES}
    active_tally: list = [
        (name, _tally_by_name[name])
        for name in tally_rules
        if name in _tally_by_name
    ]

    rules = list(COMPACT32_RULES)

    def _a_eligible(a: "Instruction") -> "frozenset[str]":
        eligible = set()
        if a.defs and _is_cmp(a):
            rd = a.defs[0]
            if a.uses and a.uses[0] == rd:
                eligible.add("cmp_branch_rsd")
            else:
                eligible.add("cmp_branch_chain")
        if a.defs and _is_li(a):
            eligible.add("cmp_branch_chain")
        if (a.mnemonic == "addi" and not a.uses and a.defs
                and a.imm is not None and -512 <= a.imm <= 511):
            eligible.add("li_branch_chain")
        if a.defs and a.mnemonic == "andi" and _is_pow2_imm(a.imm):
            rd = a.defs[0]
            if a.uses and a.uses[0] == rd:
                eligible.add("bit_branch_rsd")
            else:
                eligible.add("bit_branch_chain")
        if a.defs and a.mnemonic in ("slli", "srli", "srai"):
            if not (a.uses and a.uses[0] == a.defs[0]):  # non-RSD only
                eligible.add("bit_branch_chain")
        if _is_load(a):
            eligible.add("adjacent_load_pair")
        if _is_store(a):
            eligible.add("adjacent_store_pair")
        if _is_addr_compute(a):
            eligible.add("addr_chain")
        if _is_addr_update(a):
            eligible.add("pre_increment")
        if _is_mem_op(a):
            eligible.add("post_increment")
        if a.mnemonic in _LOAD_PRODUCER_MN:
            eligible.add("load_mem_chain")
            eligible.add("load_jalr_chain")
            eligible.add("load_branch_chain")
            eligible.add("load_arith_chain")
        if a.mnemonic in _OP_PAIR_TABLE or _is_mv(a) or _is_li(a):
            eligible.add("op_pair")
        if a.mnemonic in _OP_PAIR_CHAIN_TABLE:
            eligible.add("op_pair_chain")
        if _is_mv(a) or (_is_load(a) and _mem_small_offset_ok(a)):
            eligible.add("mv_load_jump")
        if _chain_arith_a(a):
            eligible.add("dual_arith_chain")
        if _dual_arith_ok(a):
            eligible.add("dual_arith")
            eligible.add("arith_jump")
            eligible.add("arith_branch")
            if a.mnemonic == "addi":
                eligible.add("addi_branch")
        return frozenset(eligible)

    _elig_cache: dict = {}

    def _get_eligible(a: "Instruction") -> "frozenset[str]":
        idx = a.index
        if idx not in _elig_cache:
            _elig_cache[idx] = _a_eligible(a)
        return _elig_cache[idx]

    def _score(a: "Instruction", b: "Instruction") -> float:
        """Score for BnB scheduling — primary rules only, no tally rules."""
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return 0.0
        elig = _get_eligible(a)
        if not elig:
            return 0.0
        for _name, rule in rules:
            if _name in elig and rule(a, b, cell[0]):
                return 1.0
        return 0.0

    def _describe(a: "Instruction", b: "Instruction") -> str:
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return ""
        elig = _get_eligible(a)
        for name, rule in rules:
            if name in elig and rule(a, b, cell[0]):
                return name
        return ""

    _score._liveness_cell   = cell
    _score._elig_cache      = _elig_cache   # exposed so the renamer can invalidate
    _score._describe_pair   = _describe
    _score._rule_list       = rules          # primary only (wide-aware)
    _score._tally_rule_list = active_tally
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
