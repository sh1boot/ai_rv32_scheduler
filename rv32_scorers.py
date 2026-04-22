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
    Each rule_fn has signature ``(a, b, liveness) -> str | None``:
        None  - pair matches the rule (success)
        str   - short reason token describing why the pair is rejected
    Extend this list to add new pairing rules (see "Adding a new rule" below).

RULE_CATEGORIES
    Ordered list of ``(category, a_member_fn, b_member_fn, [rule_names])``
    tuples.  Categories group rules that share a common structural pattern
    (chain / rsd / lspair / addrmem / dual / jumpret) so the scheduler can
    report category-level near-miss reasons for unpaired instructions.

SCORERS
    Registry dict mapping CLI name -> (factory_fn, description_str).

Adding a new compact32 rule
---------------------------
1. Write ``def _rule_foo(a, b, liveness) -> str | None: ...``
   Return None when the pair matches; return a short reason token when it
   does not.  Reason tokens are free-form but should reuse the existing
   vocabulary (noopcode, notrsd, notchain, nodep, live, bigimm, wrongreg,
   basediff, stride, samedest, partner, etc.) where possible.
2. Append ``("foo", _rule_foo)`` to COMPACT32_RULES and add an entry to
   ``_RULE_CATEGORY`` mapping the rule name to an existing category (or add
   a new category to RULE_CATEGORIES).
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
        # c.mv  rd, rs:  rs1 == x0, rd != x0.
        rd  = defs[0] if defs else None
        if rd is None or rd == "x0":
            return False
        rs1 = uses[0] if len(uses) > 0 else None
        rs2 = uses[1] if len(uses) > 1 else None
        if rs1 == "x0":
            return True
        # c.add: RSD form only.
        return rd == rs1

    if mn == "addi":
        rd  = defs[0] if defs else None
        rs1 = uses[0] if uses else None
        imm = instr.imm
        if rd is None:
            return False
        # c.li: addi rd, x0, imm.
        if rs1 == "x0":
            return rd != "x0" and imm is not None and -32 <= imm <= 31
        # c.addi16sp: addi x2, x2, imm (RSD on sp).
        if rd == "x2" and rs1 == "x2":
            return (imm is not None and imm != 0
                    and imm % 16 == 0 and -512 <= imm <= 496)
        # c.mv: addi rd, rs, 0 (GAS mv pseudo).
        # Assembler emits c.mv rd, rs for this form.  No register-range limit.
        if imm == 0 and rd != "x0" and rs1 != "x0":
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

_BRANCH_ZERO = frozenset({"beqz", "bnez", "beq", "bne"})
_BRANCH_CMP  = frozenset({"beq", "bne", "blt", "bge", "bltu", "bgeu", "beqz", "bnez"})

# beq and bne are symmetric: ``beq rs1, rs2, lbl`` == ``beq rs2, rs1, lbl``.
_COMMUTATIVE_BRANCH = frozenset({"beq", "bne"})

_ARITH_MEM_MN = frozenset({"add", "sub", "and", "or", "addi"})

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

def _is_arith_mem_a(instr: "Instruction") -> bool:
    mn = instr.mnemonic
    if mn not in _ARITH_MEM_MN:
        return False
    rd = instr.defs[0] if instr.defs else None
    if rd is None or rd not in _DUAL_ARITH_REG:
        return False
    if not instr.uses or instr.uses[0] != rd:
        return False
    if mn == "addi":
        imm = instr.imm
        return imm is not None and -64 <= imm <= 63
    rs2 = instr.uses[1] if len(instr.uses) > 1 else None
    return rs2 is not None and rs2 in _DUAL_ARITH_REG

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
                         liveness: dict) -> "str | None":
    """
    Single-bit mask in RSD form + conditional branch.

    Matches:
        andi  rd, rd, imm        (imm a positive power of two; rd == rs1)
        beqz / bnez  rd, label   (rd dead after B)

    rd is overwritten with the isolated bit and then consumed by the branch.
    """
    if not a.defs:
        return "nodef"
    if a.mnemonic != "andi":
        return "noopcode"
    rd = a.defs[0]
    if not _is_pow2_imm(a.imm):
        return "notmask"
    if not a.uses or a.uses[0] != rd:
        return "notrsd"
    if b.mnemonic not in ("beqz", "bnez"):
        return "notbranch"
    if rd not in b.uses:
        return "nodep"
    if rd not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_bit_branch_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> "str | None":
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
        return "nodef"
    rd = a.defs[0]
    if a.mnemonic == "andi":
        if not _is_pow2_imm(a.imm):
            return "notmask"
    elif a.mnemonic not in ("slli", "srli", "srai"):
        return "noopcode"
    if a.uses and a.uses[0] == rd:
        return "notchain"
    if b.mnemonic not in ("beqz", "bnez"):
        return "notbranch"
    if rd not in b.uses:
        return "nodep"
    if rd not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_cmp_branch_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> "str | None":
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
        return "nodef"
    rd = a.defs[0]

    # Path 1: _is_cmp + beqz/bnez (chain form: rd != rs1)
    if a.is_cmp:
        if a.uses and a.uses[0] == rd:
            return "notchain"
        if b.mnemonic not in _BRANCH_ZERO:
            return "notbranch"
        if rd not in b.uses:
            return "nodep"
        if rd not in liveness.get(b.index, frozenset()):
            return "live"
        return None

    # Path 2: _is_li + any comparison branch (rd used as comparison operand)
    if a.is_li():
        if b.mnemonic not in _BRANCH_CMP:
            return "notbranch"
        if rd not in b.uses:
            return "nodep"
        if rd not in liveness.get(b.index, frozenset()):
            return "live"
        return None

    return "noopcode"


def _rule_cmp_branch_rsd(a: "Instruction", b: "Instruction",
                         liveness: dict) -> "str | None":
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
        return "nodef"
    rd = a.defs[0]
    if not a.is_cmp:
        return "noopcode"
    # RSD constraint: rd must equal rs1 so the compact encoding can omit
    # one register field.  No pseudo-instruction exemptions — even seqz/snez
    # expand to distinct-register forms (sltiu rd, rs, 1) where rd != rs is
    # valid assembly, so the caller must actually write seqz rd, rd to qualify.
    if not a.uses or a.uses[0] != rd:
        return "notrsd"
    if b.mnemonic not in _BRANCH_ZERO:
        return "notbranch"
    if rd not in b.uses:
        return "nodep"
    if rd not in liveness.get(b.index, frozenset()):
        return "live"
    return None


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
    width = mem.mem_width
    imm = arith.imm
    return width != 0 and imm is not None and abs(imm) % width == 0


def _rule_adjacent_load_pair(a: "Instruction", b: "Instruction",
                              liveness: dict) -> "str | None":
    """
    Pair of same-width loads from adjacent memory locations with the same base.
    Address difference must equal the access width.  Both destinations distinct.

    Matches:
        <load>  rd1, N(base)
        <load>  rd2, N±<width>(base)   rd1 != rd2, same mnemonic
    """
    if not a.is_sized_load:
        return "notload"
    if a.mnemonic != b.mnemonic:
        return "notload" if not b.is_sized_load else "mnmismatch"
    if a.mem is None or b.mem is None:
        return "nomem"
    width = a.mem_width
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b:
        return "basediff"
    if abs(off_a - off_b) != width:
        return "stride"
    rd_a = a.defs[0] if a.defs else None
    rd_b = b.defs[0] if b.defs else None
    if rd_a is None or rd_b is None:
        return "nodef"
    if rd_a == rd_b:
        return "samedest"
    return None


def _rule_adjacent_store_pair(a: "Instruction", b: "Instruction",
                               liveness: dict) -> "str | None":
    """
    Pair of same-width stores to adjacent memory locations with the same base.
    Address difference must equal the access width.

    Matches:
        <store>  rs1, N(base)
        <store>  rs2, N±<width>(base)   same mnemonic
    """
    if not a.is_sized_store:
        return "notstore"
    if a.mnemonic != b.mnemonic:
        return "notstore" if not b.is_sized_store else "mnmismatch"
    if a.mem is None or b.mem is None:
        return "nomem"
    width = a.mem_width
    off_a, base_a = a.mem
    off_b, base_b = b.mem
    if base_a != base_b:
        return "basediff"
    if abs(off_a - off_b) != width:
        return "stride"
    rs_a = a.uses[0] if a.uses else None
    rs_b = b.uses[0] if b.uses else None
    if rs_a is None or rs_b is None:
        return "nosrc"
    return None


def _rule_addr_chain(a: "Instruction", b: "Instruction",
                     liveness: dict) -> "str | None":
    """
    Address computation followed by a load/store using the result as base,
    where the computed address is dead after the memory op (chain form).

    A slot: _is_addr_compute  (add/addi/addw/addiw/sub/subw/sh[1-3]add[.uw])
    B slot: _is_mem_op        (any load or store)

    rd_a must be dead after B — it carries only the computed address.
    """
    if not a.is_addr_compute:
        return "noopcode"
    if not b.is_mem_op:
        return "notmem"
    if not a.defs:
        return "nodef"
    rd_a = a.defs[0]
    if b.mem is None:
        return "nomem"
    if b.mem[1] != rd_a:
        return "nodep"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_pre_increment(a: "Instruction", b: "Instruction",
                        liveness: dict) -> "str | None":
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
    if not a.is_addr_update:
        return "noopcode"
    if not b.is_mem_op:
        return "notmem"
    if not a.defs:
        return "nodef"
    rd = a.defs[0]
    if rd not in b.uses:
        return "nodep"
    if b.is_sized_store and b.uses and b.uses[0] == rd:
        return "storesrc"
    if not _addr_stride_ok(a, b):
        return "stride"
    return None


def _rule_post_increment(a: "Instruction", b: "Instruction",
                          liveness: dict) -> "str | None":
    """
    Memory op followed by an address update on the same base
    (access-then-stride).

    A slot: _is_mem_op        (any load or store)
    B slot: _is_addr_update   (add/addi/sub/sh[1-3]add — scalar only)

    _addr_stride_ok constrains the immediate when B is addi/addiw.
    For loads, the load destination must differ from B's destination.
    """
    if not a.is_mem_op:
        return "notmem"
    if not b.is_addr_update:
        return "noopcode"
    base = a.uses[-1] if a.uses else None
    if base is None:
        return "nobase"
    if not b.uses or b.uses[0] != base:
        return "nodep"
    if a.is_sized_load:
        load_rd  = a.defs[0] if a.defs else None
        arith_rd = b.defs[0] if b.defs else None
        if load_rd is not None and load_rd == arith_rd:
            return "samedest"
    if not _addr_stride_ok(b, a):
        return "stride"
    return None


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
def _rule_load_mem_chain(a: "Instruction", b: "Instruction",
                         liveness: dict) -> "str | None":
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
    if not a.is_load_producer:
        return "noopcode"
    rd_a = a.defs[0]
    if not b.is_mem_op:
        return "notmem"
    if b.mem is None:
        return "nomem"
    off_b, base_b = b.mem
    if base_b != rd_a:
        return "nodep"
    width_b = b.mem_width
    if width_b == 0 or off_b is None:
        return "nomem"
    if off_b < 0 or off_b % width_b != 0 or off_b // width_b > 3:
        return "stride"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_load_jalr_chain(a: "Instruction", b: "Instruction",
                          liveness: dict) -> "str | None":
    """
    Load of a function pointer followed by an indirect jump/call through it.

    A slot: lw or ld
    B slot: jalr (the parser canonicalises ``jr`` to ``jalr``) whose base
            register equals A's destination.

    A's destination must be dead after B.  Matches vtable / function-pointer
    call idioms.
    """
    if not a.is_load_producer:
        return "noopcode"
    rd_a = a.defs[0]
    if b.mnemonic != "jalr":
        return "notjump"
    if not b.uses or b.uses[0] != rd_a:
        return "nodep"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    return None


_LOAD_BRANCH_MN = frozenset({"beqz", "bnez", "beq", "bne"})


def _rule_load_branch_chain(a: "Instruction", b: "Instruction",
                            liveness: dict) -> "str | None":
    """
    Load followed by a conditional branch on the loaded value.

    A slot: lw or ld
    B slot: beqz or bnez whose tested register equals A's destination.

    A's destination must be dead after B.  Matches null-check / flag-load
    idioms (load a value, branch if zero/non-zero).
    """
    if not a.is_load_producer:
        return "noopcode"
    rd_a = a.defs[0]
    if b.mnemonic not in _LOAD_BRANCH_MN:
        return "notbranch"
    if not b.uses:
        return "nodep"
    if b.uses[0] != rd_a and not (
            (b.mnemonic in _COMMUTATIVE_BINOP or b.mnemonic in _COMMUTATIVE_BRANCH)
            and rd_a in b.uses):
        return "nodep"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_load_arith_chain(a: "Instruction", b: "Instruction",
                           liveness: dict) -> "str | None":
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
    if not a.is_load_producer:
        return "noopcode"
    rd_a = a.defs[0]
    if rd_a not in _DUAL_ARITH_REG:
        return "wrongreg"
    if b.mnemonic not in _DUAL_ARITH_MN:
        return "noopcode"
    if not b.uses:
        return "nodep"
    if b.uses[0] != rd_a and not (
            b.mnemonic in _COMMUTATIVE_BINOP and rd_a in b.uses):
        return "nodep"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    rd_b = b.defs[0] if b.defs else None
    if rd_b is None:
        return "nodef"
    if rd_b not in _DUAL_ARITH_REG:
        return "wrongreg"
    if any(u != "x0" and u not in _DUAL_ARITH_REG for u in b.uses):
        return "wrongreg"
    if not _dual_arith_immediate_ok(b):
        return "bigimm"
    return None


def _rule_dual_arith(a: "Instruction", b: "Instruction",
                     liveness: dict) -> "str | None":
    """
    Two independent arithmetic operations, each satisfying the dual-arith
    encoding constraints (RSD form, registers in x0..x15, 5-bit immediate).
    """
    if not a.dual_arith_ok:
        return "noopcode"
    if not b.dual_arith_ok:
        return "partner"
    return None


def _mem_small_offset_ok(instr: "Instruction") -> bool:
    """
    True if *instr* is a load or store with an aligned offset in
    0 .. 3 × access_width (i.e., a 2-bit scaled field).
    """
    if not instr.is_mem_op:
        return False
    mem = instr.mem
    if mem is None:
        return False
    off, _base = mem
    if off is None or off < 0:
        return False
    width = instr.mem_width
    return width != 0 and off % width == 0 and off <= 3 * width


def _rule_arith_mem(a: "Instruction", b: "Instruction",
                    liveness: dict) -> "str | None":
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
    if not _is_arith_mem_a(a):
        mn = a.mnemonic
        if mn not in _ARITH_MEM_MN:
            return "noopcode"
        rd = a.defs[0] if a.defs else None
        if rd is None or rd not in _DUAL_ARITH_REG:
            return "wrongreg"
        if not a.uses or a.uses[0] != rd:
            return "notrsd"
        if mn == "addi":
            return "bigimm"
        return "wrongreg"
    if not b.is_mem_op:
        return "notmem"
    if not _mem_small_offset_ok(b):
        return "stride"
    return None


def _rule_dual_arith_chain(a: "Instruction", b: "Instruction",
                            liveness: dict) -> "str | None":
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
    if not a.defs:
        return "nodef"
    if not _chain_arith_a(a):
        if a.mnemonic not in _DUAL_ARITH_MN:
            return "noopcode"
        if a.defs[0] not in _DUAL_ARITH_REG:
            return "wrongreg"
        if any(u != "x0" and u not in _DUAL_ARITH_REG for u in a.uses):
            return "wrongreg"
        return "bigimm"
    if not _chain_arith_b(b):
        if b.mnemonic not in _DUAL_ARITH_MN:
            return "noopcode"
        if b.defs and b.defs[0] not in _DUAL_ARITH_REG:
            return "wrongreg"
        return "bigimm"
    rd_a = a.defs[0]
    if not b.uses:
        return "nodep"
    if b.uses[0] != rd_a and not (
            b.mnemonic in _COMMUTATIVE_BINOP and rd_a in b.uses):
        return "nodep"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_arith_jump(a: "Instruction", b: "Instruction",
                     liveness: dict) -> "str | None":
    """
    Arithmetic operation (dual-arith subset) followed by a small
    unconditional branch (j, jr, jalr with zero offset, ret).

    Matches:
        <dual-arith op>  rd, rd, rs2/imm   (RSD form, rd in x0..x15)
        j / jr / jalr 0(rs) / ret
    """
    if not a.dual_arith_ok:
        if a.mnemonic not in _DUAL_ARITH_MN:
            return "noopcode"
        if a.defs and a.defs[0] not in _DUAL_ARITH_REG:
            return "wrongreg"
        return "bigimm"
    if not b.is_small_jump:
        return "notjump"
    return None


def _rule_mv_load_jump(a: "Instruction", b: "Instruction",
                       liveness: dict) -> "str | None":
    """
    Move or small-offset load followed by a small unconditional branch.

    A slot: ``mv rd, rs`` or load with offset in 0..3×width
    B slot: j / jr / jalr 0(rs) / ret  (shared with arith_jump)
    """
    if a.is_mv or a.is_li():
        return None if b.is_small_jump else "notjump"
    if a.is_sized_load:
        if a.mem is None:
            return "nomem"
        off, _base = a.mem
        width = a.mem_width
        if off is None or off < 0 or width == 0 or off % width != 0 or off > 3 * width:
            return "stride"
        return None if b.is_small_jump else "notjump"
    return "noopcode"


def _rule_arith_branch(a: "Instruction", b: "Instruction",
                       liveness: dict) -> "str | None":
    """
    Arithmetic operation (dual-arith subset) followed by a conditional
    branch on whether the result is zero.  In this instance rsd is
    re-used, but not discarded after the branch.

    Matches:
        <dual-arith op>  rd, rd, rs2/imm   (RSD form, rd in x0..x15)
        beqz / bnez      rd, label          (same rd)
    """
    if not a.dual_arith_ok:
        if a.mnemonic not in _DUAL_ARITH_MN:
            return "noopcode"
        if a.defs and a.defs[0] not in _DUAL_ARITH_REG:
            return "wrongreg"
        return "bigimm"
    rd = a.defs[0] if a.defs else None
    if rd is None:
        return "nodef"
    if b.mnemonic not in ("beqz", "bnez"):
        return "notbranch"
    tested = b.uses[0] if b.uses else None
    if tested != rd:
        return "nodep"
    return None


def _rule_addi_branch(a: "Instruction", b: "Instruction",
                      liveness: dict) -> "str | None":
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
    if a.mnemonic != "addi":
        return "noopcode"
    if not a.dual_arith_ok:
        if a.defs and a.defs[0] not in _DUAL_ARITH_REG:
            return "wrongreg"
        return "bigimm"
    rsd = a.defs[0] if a.defs else None
    if b.mnemonic not in ("beq", "bne"):
        return "notbranch"
    if rsd not in b.uses:
        return "nodep"
    return None


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
                      liveness: dict) -> "str | None":
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
    if not a.defs:
        return "nodef"
    if not b.defs:
        return "nodef"
    if a.defs[0] == b.defs[0]:
        return "samedest"
    # Move/li pairs.
    if a.is_mv:
        if b.is_mv or b.is_li():
            return None
        return "partner"
    if a.is_li():
        if b.is_li():
            return None
        return "partner"
    # Table-driven same-input pairs.
    partners = _OP_PAIR_TABLE.get(a.mnemonic)
    if partners is None:
        return "noopcode"
    if b.mnemonic not in partners:
        return "partner"
    if not a.real_uses:
        return "nodep"
    if a.uses != b.uses:
        return "samesrc"
    return None


# Chain form: A's result is consumed by B, then dead.
# Each entry maps A's mnemonic to the set of valid B mnemonics.
_OP_PAIR_CHAIN_TABLE: dict = {
    "slli": frozenset({"srli", "srai", "add", "sub", "or"}),
}


def _rule_op_pair_chain(a: "Instruction", b: "Instruction",
                        liveness: dict) -> "str | None":
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
    if partners is None:
        return "noopcode"
    if b.mnemonic not in partners:
        return "partner"
    if not a.defs:
        return "nodef"
    rd_a = a.defs[0]
    if rd_a not in b.uses:
        return "nodep"
    if rd_a not in liveness.get(b.index, frozenset()):
        return "live"
    return None


def _rule_li_branch_chain(a: "Instruction", b: "Instruction",
                          liveness: dict) -> "str | None":
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
    if a.mnemonic != "addi":
        return "noopcode"
    if a.real_uses or not a.defs:
        return "notli"
    imm = a.imm
    if imm is None or imm < -512 or imm > 511:
        return "bigimm"
    rd = a.defs[0]
    if b.mnemonic not in _BRANCH_CMP:
        return "notbranch"
    if rd not in b.uses:
        return "nodep"
    if rd not in liveness.get(b.index, frozenset()):
        return "live"
    return None


# Ordered list of primary pairing rules.  Each entry is (name, rule_fn).
# rule_fn(a, b, liveness) returns None on a successful match and a short
# reason token (str) when the pair is rejected.  First match wins when
# multiple rules accept the same pair.
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
    ("arith_mem",           _rule_arith_mem),
    ("arith_jump",          _rule_arith_jump),
    ("mv_load_jump",        _rule_mv_load_jump),
    ("arith_branch",        _rule_arith_branch),
    ("addi_branch",         _rule_addi_branch),
    ("li_branch_chain",     _rule_li_branch_chain),
]

_COMPACT32_RULE_BY_NAME: dict = {name: fn for name, fn in COMPACT32_RULES}


# ---------------------------------------------------------------------------
# Rule categories
# ---------------------------------------------------------------------------
# Each rule belongs to a structural category.  Categories let the scheduler
# report per-group near-miss statistics for unpaired instructions: when an
# instruction is structurally eligible as the A or B slot of a category but
# fails to pair, the output is annotated with the category plus the set of
# rejection reasons returned by the category's member rules.
#
#   chain    — A produces rd, B consumes rd, and rd is dead after B.
#   rsd      — A is in RSD form (rs1 == rd) and B reads rd (may stay live).
#   lspair   — Adjacent same-width memory accesses on the same base.
#   addrmem  — Address update and memory op on the same base (either order).
#   dual     — Two independent operations packed into one word.
#   jumpret  — A small op immediately preceding an unconditional jump/return.
_RULE_CATEGORY: dict = {
    # chain: producer -> consumer, result dies at the consumer
    "bit_branch_chain":    "chain",
    "cmp_branch_chain":    "chain",
    "addr_chain":          "chain",
    "load_mem_chain":      "chain",
    "load_jalr_chain":     "chain",
    "load_branch_chain":   "chain",
    "load_arith_chain":    "chain",
    "op_pair_chain":       "chain",
    "dual_arith_chain":    "chain",
    "li_branch_chain":     "chain",
    # rsd: A writes back into its own source, B reads it
    "bit_branch_rsd":      "rsd",
    "cmp_branch_rsd":      "rsd",
    "arith_branch":        "rsd",
    "addi_branch":         "rsd",
    # lspair: adjacent memory accesses of matching width on the same base
    "adjacent_load_pair":  "lspair",
    "adjacent_store_pair": "lspair",
    # addrmem: address arithmetic fused with a neighbouring memory op
    "pre_increment":       "addrmem",
    "post_increment":      "addrmem",
    # dual: two independent operations (no producer -> consumer edge)
    "dual_arith":          "dual",
    "op_pair":             "dual",
    "arith_mem":           "dual",
    # jumpret: small op immediately before an unconditional jump/return
    "arith_jump":          "jumpret",
    "mv_load_jump":        "jumpret",
}

# Stable display order — the scheduler emits MISS-A/MISS-B annotations in
# this order so diffs between runs are easy to compare.
RULE_CATEGORIES: list = ["chain", "rsd", "lspair", "addrmem", "dual", "jumpret"]

_CATEGORY_RULES: dict = {cat: [] for cat in RULE_CATEGORIES}
for _rule_name, _rule_fn in COMPACT32_RULES:
    _cat = _RULE_CATEGORY.get(_rule_name)
    if _cat is not None:
        _CATEGORY_RULES[_cat].append((_rule_name, _rule_fn))


# ---------------------------------------------------------------------------
# Per-rule structural eligibility predicates
# ---------------------------------------------------------------------------
# A-side and B-side structural filters — they identify whether a single
# instruction *could* occupy the named slot of the named rule, ignoring the
# partner.  The rule itself is still the authority on acceptance; these
# predicates exist so the scheduler can (a) skip rules that cannot possibly
# match and (b) decide whether an unpaired instruction "qualified" for a
# category for near-miss reporting.

_OP_PAIR_B_MN: frozenset = frozenset(
    mn for partners in _OP_PAIR_TABLE.values() for mn in partners)
_OP_PAIR_CHAIN_B_MN: frozenset = frozenset(
    mn for partners in _OP_PAIR_CHAIN_TABLE.values() for mn in partners)


def _a_eligible_rules(a: "Instruction") -> "frozenset[str]":
    """
    Set of rule names for which *a* is structurally eligible as the A (first)
    slot.  An empty set means no pairing rule will accept *a* as A.
    """
    elig = set()
    if a.defs and a.is_cmp:
        rd = a.defs[0]
        if a.uses and a.uses[0] == rd:
            elig.add("cmp_branch_rsd")
        else:
            elig.add("cmp_branch_chain")
    if a.defs and a.is_li():
        elig.add("cmp_branch_chain")
    if (a.mnemonic == "addi" and not a.real_uses and a.defs
            and a.imm is not None and -512 <= a.imm <= 511):
        elig.add("li_branch_chain")
    if a.defs and a.mnemonic == "andi" and _is_pow2_imm(a.imm):
        rd = a.defs[0]
        if a.uses and a.uses[0] == rd:
            elig.add("bit_branch_rsd")
        else:
            elig.add("bit_branch_chain")
    if a.defs and a.mnemonic in ("slli", "srli", "srai"):
        if not (a.uses and a.uses[0] == a.defs[0]):  # non-RSD only
            elig.add("bit_branch_chain")
    if a.is_sized_load:
        elig.add("adjacent_load_pair")
    if a.is_sized_store:
        elig.add("adjacent_store_pair")
    if a.is_addr_compute:
        elig.add("addr_chain")
    if a.is_addr_update:
        elig.add("pre_increment")
    if a.is_mem_op:
        elig.add("post_increment")
    if a.is_load_producer:
        elig.add("load_mem_chain")
        elig.add("load_jalr_chain")
        elig.add("load_branch_chain")
        elig.add("load_arith_chain")
    if a.mnemonic in _OP_PAIR_TABLE or a.is_mv or a.is_li():
        elig.add("op_pair")
    if a.mnemonic in _OP_PAIR_CHAIN_TABLE:
        elig.add("op_pair_chain")
    if a.is_mv or (a.is_sized_load and _mem_small_offset_ok(a)):
        elig.add("mv_load_jump")
    if _chain_arith_a(a):
        elig.add("dual_arith_chain")
    if _is_arith_mem_a(a):
        elig.add("arith_mem")
    if _dual_arith_ok(a):
        elig.add("dual_arith")
        elig.add("arith_jump")
        elig.add("arith_branch")
        if a.mnemonic == "addi":
            elig.add("addi_branch")
    return frozenset(elig)


def _b_eligible_rules(b: "Instruction") -> "frozenset[str]":
    """
    Set of rule names for which *b* is structurally eligible as the B (second)
    slot.  Symmetric counterpart of ``_a_eligible_rules``.
    """
    elig = set()
    mn = b.mnemonic
    if mn in ("beqz", "bnez"):
        elig.add("bit_branch_rsd")
        elig.add("bit_branch_chain")
        elig.add("cmp_branch_rsd")
        elig.add("cmp_branch_chain")
        elig.add("arith_branch")
    if mn in _BRANCH_CMP:
        elig.add("cmp_branch_chain")
        elig.add("li_branch_chain")
    if mn in _LOAD_BRANCH_MN:
        elig.add("load_branch_chain")
    if mn in ("beq", "bne"):
        elig.add("addi_branch")
    if b.is_sized_load:
        elig.add("adjacent_load_pair")
    if b.is_sized_store:
        elig.add("adjacent_store_pair")
    if b.is_mem_op:
        elig.add("addr_chain")
        elig.add("pre_increment")
        elig.add("load_mem_chain")
        elig.add("arith_mem")
    if b.is_addr_update:
        elig.add("post_increment")
    if mn == "jalr":
        elig.add("load_jalr_chain")
    if b.is_small_jump:
        elig.add("arith_jump")
        elig.add("mv_load_jump")
    if mn in _DUAL_ARITH_MN:
        elig.add("load_arith_chain")
    if _dual_arith_ok(b):
        elig.add("dual_arith")
    if _chain_arith_b(b):
        elig.add("dual_arith_chain")
    if mn in _OP_PAIR_B_MN or b.is_mv or b.is_li():
        elig.add("op_pair")
    if mn in _OP_PAIR_CHAIN_B_MN:
        elig.add("op_pair_chain")
    return frozenset(elig)




# ---------------------------------------------------------------------------
# Compact-32 scorer factory
# ---------------------------------------------------------------------------

def make_compact32_scorer(liveness: dict) -> "PairScoreFn":
    """
    Return a pair-scoring function for the compact-32 encoding experiment.

    The scorer holds its liveness reference in a mutable cell so that
    the streaming processor can refresh it per block after renaming.

    Each rule in ``COMPACT32_RULES`` returns ``None`` on a successful match
    and a short reason token (``str``) on rejection.  The scorer returns
    ``1.0`` for the first rule that accepts the pair and ``0.0`` otherwise.
    """
    cell: list = [liveness]
    rules = list(COMPACT32_RULES)

    _a_cache: dict = {}
    _b_cache: dict = {}

    def _get_a_elig(a: "Instruction") -> "frozenset[str]":
        idx = a.index
        cached = _a_cache.get(idx)
        if cached is None:
            cached = _a_eligible_rules(a)
            _a_cache[idx] = cached
        return cached

    def _get_b_elig(b: "Instruction") -> "frozenset[str]":
        idx = b.index
        cached = _b_cache.get(idx)
        if cached is None:
            cached = _b_eligible_rules(b)
            _b_cache[idx] = cached
        return cached

    def _score(a: "Instruction", b: "Instruction") -> float:
        """Score for BnB scheduling — 1.0 on a successful rule match."""
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return 0.0
        elig = _get_a_elig(a)
        if not elig:
            return 0.0
        live = cell[0]
        for name, rule in rules:
            if name in elig and rule(a, b, live) is None:
                return 1.0
        return 0.0

    def _describe(a: "Instruction", b: "Instruction") -> str:
        if a.mnemonic in _COMPACT32_BRANCH_MN:
            return ""
        elig = _get_a_elig(a)
        live = cell[0]
        for name, rule in rules:
            if name in elig and rule(a, b, live) is None:
                return name
        return ""

    def _invalidate(idx: int) -> None:
        """Drop cached eligibility for *idx* on both sides."""
        _a_cache.pop(idx, None)
        _b_cache.pop(idx, None)

    _score._liveness_cell = cell
    _score._elig_cache    = _a_cache        # legacy name, renamer uses .pop()
    _score._b_elig_cache  = _b_cache
    _score._invalidate    = _invalidate
    _score._get_a_elig    = _get_a_elig
    _score._get_b_elig    = _get_b_elig
    _score._describe_pair = _describe
    _score._rule_list     = rules
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
