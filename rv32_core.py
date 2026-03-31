"""
rv32_core.py

Shared foundations for the RV32 scheduler toolchain:
  - Register name tables and normalisation
  - ISA opcode tables (I, M, A, F, D, Q, C, Zicsr, Zifencei, Zba/Zbb/Zbc/Zbs, V)
  - Instruction dataclass and line parser (parse_line)
  - Dual-arith eligibility helpers

Dependency graph, liveness, and CFG analysis live in rv32_analysis.py.
This module has no dependency on any other rv32_* module.
"""

import re
from collections import defaultdict
from dataclasses import dataclass, field

# ---------------------------------------------------------------------------
# Register name tables
# ---------------------------------------------------------------------------

_INT_ABI: dict = {
    "zero": "x0", "ra": "x1", "sp": "x2", "gp": "x3", "tp": "x4",
    "t0": "x5", "t1": "x6", "t2": "x7",
    "s0": "x8", "fp": "x8", "s1": "x9",
    "a0": "x10", "a1": "x11", "a2": "x12", "a3": "x13",
    "a4": "x14", "a5": "x15", "a6": "x16", "a7": "x17",
    "s2": "x18", "s3": "x19", "s4": "x20", "s5": "x21",
    "s6": "x22", "s7": "x23", "s8": "x24", "s9": "x25",
    "s10": "x26", "s11": "x27",
    "t3": "x28", "t4": "x29", "t5": "x30", "t6": "x31",
}

_FP_ABI: dict = {
    "ft0": "f0",  "ft1": "f1",  "ft2": "f2",  "ft3": "f3",
    "ft4": "f4",  "ft5": "f5",  "ft6": "f6",  "ft7": "f7",
    "fs0": "f8",  "fs1": "f9",
    "fa0": "f10", "fa1": "f11",
    "fa2": "f12", "fa3": "f13", "fa4": "f14", "fa5": "f15",
    "fa6": "f16", "fa7": "f17",
    "fs2": "f18", "fs3": "f19", "fs4": "f20", "fs5": "f21",
    "fs6": "f22", "fs7": "f23", "fs8": "f24", "fs9": "f25",
    "fs10": "f26", "fs11": "f27",
    "ft8": "f28", "ft9": "f29", "ft10": "f30", "ft11": "f31",
}

def _normalise_reg(name: str) -> str:
    s = name.lower().strip().rstrip(",").rstrip(")").strip()
    if s in _INT_ABI:
        return _INT_ABI[s]
    if s in _FP_ABI:
        return _FP_ABI[s]
    return s

def _is_reg_token(tok: str) -> bool:
    t = tok.lower().strip().rstrip(",")
    if t in _INT_ABI or t in _FP_ABI:
        return True
    return bool(re.match(r"^[xfv]\d{1,2}$", t))

# ---------------------------------------------------------------------------
# ISA opcode tables
# ---------------------------------------------------------------------------
# mnemonic -> (def_slot, (use_slot, ...))

_I = {
    "add":   ("rd", ("rs1","rs2")), "sub":   ("rd", ("rs1","rs2")),
    "sll":   ("rd", ("rs1","rs2")), "slt":   ("rd", ("rs1","rs2")),
    "sltu":  ("rd", ("rs1","rs2")), "xor":   ("rd", ("rs1","rs2")),
    "srl":   ("rd", ("rs1","rs2")), "sra":   ("rd", ("rs1","rs2")),
    "or":    ("rd", ("rs1","rs2")), "and":   ("rd", ("rs1","rs2")),
    "addi":  ("rd", ("rs1",)),      "slti":  ("rd", ("rs1",)),
    "sltiu": ("rd", ("rs1",)),      "xori":  ("rd", ("rs1",)),
    "ori":   ("rd", ("rs1",)),      "andi":  ("rd", ("rs1",)),
    "slli":  ("rd", ("rs1",)),      "srli":  ("rd", ("rs1",)),
    "srai":  ("rd", ("rs1",)),
    "lui":   ("rd", ()),            "auipc": ("rd", ()),
    "jal":   ("rd", ()),            "jalr":  ("rd", ("mem_base",)),
    "beq":   (None, ("rs1","rs2")), "bne":   (None, ("rs1","rs2")),
    "blt":   (None, ("rs1","rs2")), "bge":   (None, ("rs1","rs2")),
    "bltu":  (None, ("rs1","rs2")), "bgeu":  (None, ("rs1","rs2")),
    "lb":    ("rd",  ("mem_base",)), "lh":   ("rd",  ("mem_base",)),
    "lw":    ("rd",  ("mem_base",)), "lbu":  ("rd",  ("mem_base",)),
    "lhu":   ("rd",  ("mem_base",)),
    "sb":    (None, ("rs1","mem_base")),
    "sh":    (None, ("rs1","mem_base")),
    "sw":    (None, ("rs1","mem_base")),
    # ── Pseudo-instructions ──────────────────────────────────────────────
    "beqz":  (None, ("rs1",)),      "bnez":  (None, ("rs1",)),
    "blez":  (None, ("rs1",)),      "bgez":  (None, ("rs1",)),
    "bltz":  (None, ("rs1",)),      "bgtz":  (None, ("rs1",)),
    "mv":    ("rd",  ("rs1",)),     "not":   ("rd",  ("rs1",)),
    "neg":   ("rd",  ("rs1",)),     "negw":  ("rd",  ("rs1",)),
    "seqz":  ("rd",  ("rs1",)),     "snez":  ("rd",  ("rs1",)),
    "sltz":  ("rd",  ("rs1",)),     "sgtz":  ("rd",  ("rs1",)),
    "sext.w":("rd",  ("rs1",)),     "zext.b":("rd",  ("rs1",)),
    "nop":   (None,  ()),           "ret":   (None,  ("rs1",)),
    "li":    ("rd",  ()),           "la":    ("rd",  ()),
    "j":     (None,  ()),           "jr":    (None,  ("rs1",)),
    "call":  ("rd",  ()),           "tail":  (None,  ()),
    # ── Explicit C-extension expansions ──────────────────────────────────
    # Each entry declares the exact operand structure of the canonical
    # expansion so the RSD fixup in parse_line never applies.
    #
    #   c.mv  rd, rs   = add  rd, x0, rs   (R-type copy; distinct from GAS mv)
    #   c.li  rd, imm  = addi rd, x0, imm  (imm load — same pattern as li)
    #   c.nop          = addi x0, x0, 0    (no operands)
    #   c.lui rd, imm  = lui  rd, imm      (same pattern as lui)
    #   c.j   target   = jal  x0, target   (unconditional jump — same as j)
    #   c.jal target   = jal  x1, target   (call; x1 written)
    #   c.jr  rs       = jalr x0, 0(rs)    (indirect jump — same as jr)
    #   c.jalr rs      = jalr x1, 0(rs)    (indirect call; x1 written)
    #   c.beqz rs, lbl = beq  rs, x0, lbl  (same pattern as beqz)
    #   c.bnez rs, lbl = bne  rs, x0, lbl  (same pattern as bnez)
    #   c.lw  rd,N(rs) = lw   rd, N(rs)    (same as lw)
    #   c.lwsp rd,N    = lw   rd, N(sp)    (same as lw — sp is base)
    #   c.sw  rs,N(b)  = sw   rs, N(b)     (same as sw)
    #   c.swsp rs,N    = sw   rs, N(sp)    (same as sw — sp is base)
    #   c.ebreak       = ebreak            (no operands)
    "c.mv":    ("rd",  ("rs1",)),
    "c.li":    ("rd",  ()),
    "c.nop":   (None,  ()),
    "c.lui":   ("rd",  ()),
    "c.j":     (None,  ()),
    "c.jal":   (None,  ()),       # jal x1, target — label operand, rd=x1 implicit
    "c.jr":    (None,  ("rs1",)),
    "c.jalr":  (None,  ("rs1",)), # jalr x1, 0(rs) — rs1 operand, rd=x1 implicit
    "c.beqz":  (None,  ("rs1",)),
    "c.bnez":  (None,  ("rs1",)),
    "c.lw":    ("rd",  ("mem_base",)),
    "c.lwsp":  ("rd",  ("mem_base",)),
    "c.sw":    (None,  ("rs1", "mem_base")),
    "c.swsp":  (None,  ("rs1", "mem_base")),
    "c.ebreak":(None,  ()),
}

_M = {
    "mul":    ("rd", ("rs1","rs2")), "mulh":   ("rd", ("rs1","rs2")),
    "mulhsu": ("rd", ("rs1","rs2")), "mulhu":  ("rd", ("rs1","rs2")),
    "div":    ("rd", ("rs1","rs2")), "divu":   ("rd", ("rs1","rs2")),
    "rem":    ("rd", ("rs1","rs2")), "remu":   ("rd", ("rs1","rs2")),
}

_A = {
    "lr.w":      ("rd", ("rs1",)),
    "sc.w":      ("rd", ("rs1","rs2")),
    "amoswap.w": ("rd", ("rs1","rs2")), "amoadd.w":  ("rd", ("rs1","rs2")),
    "amoand.w":  ("rd", ("rs1","rs2")), "amoor.w":   ("rd", ("rs1","rs2")),
    "amoxor.w":  ("rd", ("rs1","rs2")), "amomax.w":  ("rd", ("rs1","rs2")),
    "amomin.w":  ("rd", ("rs1","rs2")), "amomaxu.w": ("rd", ("rs1","rs2")),
    "amominu.w": ("rd", ("rs1","rs2")),
}

_F = {
    "flw":      ("fd",  ("mem_base",)), "fsw":      (None, ("fs1","mem_base")),
    "fadd.s":   ("fd",  ("fs1","fs2")), "fsub.s":   ("fd",  ("fs1","fs2")),
    "fmul.s":   ("fd",  ("fs1","fs2")), "fdiv.s":   ("fd",  ("fs1","fs2")),
    "fsqrt.s":  ("fd",  ("fs1",)),      "fmin.s":   ("fd",  ("fs1","fs2")),
    "fmax.s":   ("fd",  ("fs1","fs2")),
    "fmadd.s":  ("fd",  ("fs1","fs2","fs3")),
    "fmsub.s":  ("fd",  ("fs1","fs2","fs3")),
    "fnmsub.s": ("fd",  ("fs1","fs2","fs3")),
    "fnmadd.s": ("fd",  ("fs1","fs2","fs3")),
    "fsgnj.s":  ("fd",  ("fs1","fs2")), "fsgnjn.s": ("fd",  ("fs1","fs2")),
    "fsgnjx.s": ("fd",  ("fs1","fs2")),
    "fcvt.w.s":  ("rd", ("fs1",)),      "fcvt.wu.s": ("rd", ("fs1",)),
    "fcvt.s.w":  ("fd", ("rs1",)),      "fcvt.s.wu": ("fd", ("rs1",)),
    "fmv.x.w":  ("rd",  ("fs1",)),      "fmv.w.x":  ("fd",  ("rs1",)),
    "feq.s":    ("rd",  ("fs1","fs2")), "flt.s":    ("rd",  ("fs1","fs2")),
    "fle.s":    ("rd",  ("fs1","fs2")), "fclass.s": ("rd",  ("fs1",)),
}

_D = {
    "fld":       ("fd",  ("mem_base",)), "fsd":       (None,  ("fs1","mem_base")),
    "fadd.d":    ("fd",  ("fs1","fs2")), "fsub.d":    ("fd",  ("fs1","fs2")),
    "fmul.d":    ("fd",  ("fs1","fs2")), "fdiv.d":    ("fd",  ("fs1","fs2")),
    "fsqrt.d":   ("fd",  ("fs1",)),      "fmin.d":    ("fd",  ("fs1","fs2")),
    "fmax.d":    ("fd",  ("fs1","fs2")),
    "fmadd.d":   ("fd",  ("fs1","fs2","fs3")),
    "fmsub.d":   ("fd",  ("fs1","fs2","fs3")),
    "fnmsub.d":  ("fd",  ("fs1","fs2","fs3")),
    "fnmadd.d":  ("fd",  ("fs1","fs2","fs3")),
    "fsgnj.d":   ("fd",  ("fs1","fs2")), "fsgnjn.d":  ("fd",  ("fs1","fs2")),
    "fsgnjx.d":  ("fd",  ("fs1","fs2")),
    "fcvt.s.d":  ("fd",  ("fs1",)),      "fcvt.d.s":  ("fd",  ("fs1",)),
    "fcvt.w.d":  ("rd",  ("fs1",)),      "fcvt.wu.d": ("rd",  ("fs1",)),
    "fcvt.d.w":  ("fd",  ("rs1",)),      "fcvt.d.wu": ("fd",  ("rs1",)),
    "fmv.x.d":   ("rd",  ("fs1",)),      "fmv.d.x":   ("fd",  ("rs1",)),
    "feq.d":     ("rd",  ("fs1","fs2")), "flt.d":     ("rd",  ("fs1","fs2")),
    "fle.d":     ("rd",  ("fs1","fs2")), "fclass.d":  ("rd",  ("fs1",)),
}

_Q = {
    "flq":       ("fd",  ("mem_base",)), "fsq":       (None,  ("fs1","mem_base")),
    "fadd.q":    ("fd",  ("fs1","fs2")), "fsub.q":    ("fd",  ("fs1","fs2")),
    "fmul.q":    ("fd",  ("fs1","fs2")), "fdiv.q":    ("fd",  ("fs1","fs2")),
    "fsqrt.q":   ("fd",  ("fs1",)),      "fmin.q":    ("fd",  ("fs1","fs2")),
    "fmax.q":    ("fd",  ("fs1","fs2")),
    "fmadd.q":   ("fd",  ("fs1","fs2","fs3")),
    "fmsub.q":   ("fd",  ("fs1","fs2","fs3")),
    "fnmsub.q":  ("fd",  ("fs1","fs2","fs3")),
    "fnmadd.q":  ("fd",  ("fs1","fs2","fs3")),
    "fsgnj.q":   ("fd",  ("fs1","fs2")), "fsgnjn.q":  ("fd",  ("fs1","fs2")),
    "fsgnjx.q":  ("fd",  ("fs1","fs2")),
    "fcvt.s.q":  ("fd",  ("fs1",)),      "fcvt.q.s":  ("fd",  ("fs1",)),
    "fcvt.d.q":  ("fd",  ("fs1",)),      "fcvt.q.d":  ("fd",  ("fs1",)),
    "fcvt.w.q":  ("rd",  ("fs1",)),      "fcvt.wu.q": ("rd",  ("fs1",)),
    "fcvt.q.w":  ("fd",  ("rs1",)),      "fcvt.q.wu": ("fd",  ("rs1",)),
    "feq.q":     ("rd",  ("fs1","fs2")), "flt.q":     ("rd",  ("fs1","fs2")),
    "fle.q":     ("rd",  ("fs1","fs2")), "fclass.q":  ("rd",  ("fs1",)),
}

_ZICSR = {
    "csrrw":  ("rd", ("rs1","csr")), "csrrs":  ("rd", ("rs1","csr")),
    "csrrc":  ("rd", ("rs1","csr")),
    "csrrwi": ("rd", ("csr",)),      "csrrsi": ("rd", ("csr",)),
    "csrrci": ("rd", ("csr",)),
}
CSR_WRITERS = frozenset(_ZICSR)

_B = {
    "sh1add": ("rd", ("rs1","rs2")), "sh2add": ("rd", ("rs1","rs2")),
    "sh3add": ("rd", ("rs1","rs2")),
    "andn":   ("rd", ("rs1","rs2")), "orn":    ("rd", ("rs1","rs2")),
    "xnor":   ("rd", ("rs1","rs2")),
    "clz":    ("rd", ("rs1",)),      "ctz":    ("rd", ("rs1",)),
    "cpop":   ("rd", ("rs1",)),
    "max":    ("rd", ("rs1","rs2")), "maxu":   ("rd", ("rs1","rs2")),
    "min":    ("rd", ("rs1","rs2")), "minu":   ("rd", ("rs1","rs2")),
    "sext.b": ("rd", ("rs1",)),      "sext.h": ("rd", ("rs1",)),
    "zext.h": ("rd", ("rs1",)),
    "rol":    ("rd", ("rs1","rs2")), "ror":    ("rd", ("rs1","rs2")),
    "rori":   ("rd", ("rs1",)),
    "orc.b":  ("rd", ("rs1",)),      "rev8":   ("rd", ("rs1",)),
    "clmul":  ("rd", ("rs1","rs2")), "clmulh": ("rd", ("rs1","rs2")),
    "clmulr": ("rd", ("rs1","rs2")),
    "bclr":   ("rd", ("rs1","rs2")), "bclri":  ("rd", ("rs1",)),
    "bext":   ("rd", ("rs1","rs2")), "bexti":  ("rd", ("rs1",)),
    "binv":   ("rd", ("rs1","rs2")), "binvi":  ("rd", ("rs1",)),
    "bset":   ("rd", ("rs1","rs2")), "bseti":  ("rd", ("rs1",)),
    "bic":    ("rd", ("rs1","rs2")),
}

_V = {
    "vadd.vv": ("vd",("vs1","vs2")),  "vadd.vx": ("vd",("vs1","rs1")),
    "vadd.vi": ("vd",("vs1",)),
    "vsub.vv": ("vd",("vs1","vs2")),  "vsub.vx": ("vd",("vs1","rs1")),
    "vrsub.vx":("vd",("vs1","rs1")),  "vrsub.vi":("vd",("vs1",)),
    "vmul.vv": ("vd",("vs1","vs2")),  "vmul.vx": ("vd",("vs1","rs1")),
    "vmulh.vv":("vd",("vs1","vs2")),  "vmulh.vx":("vd",("vs1","rs1")),
    "vdiv.vv": ("vd",("vs1","vs2")),  "vdiv.vx": ("vd",("vs1","rs1")),
    "vrem.vv": ("vd",("vs1","vs2")),  "vrem.vx": ("vd",("vs1","rs1")),
    "vand.vv": ("vd",("vs1","vs2")),  "vand.vx": ("vd",("vs1","rs1")),
    "vand.vi": ("vd",("vs1",)),
    "vor.vv":  ("vd",("vs1","vs2")),  "vor.vx":  ("vd",("vs1","rs1")),
    "vor.vi":  ("vd",("vs1",)),
    "vxor.vv": ("vd",("vs1","vs2")),  "vxor.vx": ("vd",("vs1","rs1")),
    "vxor.vi": ("vd",("vs1",)),
    "vsll.vv": ("vd",("vs1","vs2")),  "vsll.vx": ("vd",("vs1","rs1")),
    "vsll.vi": ("vd",("vs1",)),
    "vsrl.vv": ("vd",("vs1","vs2")),  "vsrl.vx": ("vd",("vs1","rs1")),
    "vsrl.vi": ("vd",("vs1",)),
    "vsra.vv": ("vd",("vs1","vs2")),  "vsra.vx": ("vd",("vs1","rs1")),
    "vsra.vi": ("vd",("vs1",)),
    "vfadd.vv":("vd",("vs1","vs2")),  "vfadd.vf":("vd",("vs1","fs1")),
    "vfsub.vv":("vd",("vs1","vs2")),  "vfsub.vf":("vd",("vs1","fs1")),
    "vfmul.vv":("vd",("vs1","vs2")),  "vfmul.vf":("vd",("vs1","fs1")),
    "vfdiv.vv":("vd",("vs1","vs2")),  "vfdiv.vf":("vd",("vs1","fs1")),
    "vfsqrt.v":("vd",("vs1",)),
    "vfmadd.vv":("vd",("vs1","vs2")), "vfmadd.vf":("vd",("vs1","fs1")),
    "vfmsub.vv":("vd",("vs1","vs2")), "vfmsub.vf":("vd",("vs1","fs1")),
    "vfnmadd.vv":("vd",("vs1","vs2")),"vfnmadd.vf":("vd",("vs1","fs1")),
    "vfnmsub.vv":("vd",("vs1","vs2")),"vfnmsub.vf":("vd",("vs1","fs1")),
    "vle8.v":  ("vd",("rs1",)),       "vle16.v": ("vd",("rs1",)),
    "vle32.v": ("vd",("rs1",)),       "vle64.v": ("vd",("rs1",)),
    "vse8.v":  (None,("vs1","rs1")),  "vse16.v": (None,("vs1","rs1")),
    "vse32.v": (None,("vs1","rs1")),  "vse64.v": (None,("vs1","rs1")),
    "vmv.v.v": ("vd",("vs1",)),       "vmv.v.x": ("vd",("rs1",)),
    "vmv.v.i": ("vd",()),             "vmv.x.s": ("rd",("vs1",)),
    "vmv.s.x": ("vd",("rs1",)),
    "vsetvli": ("rd",("rs1",)),       "vsetivli":("rd",()),
    "vsetvl":  ("rd",("rs1","rs2")),
    "vredsum.vs":("vd",("vs1","vs2")),"vredmax.vs":("vd",("vs1","vs2")),
    "vredmin.vs":("vd",("vs1","vs2")),"vredand.vs":("vd",("vs1","vs2")),
    "vredor.vs": ("vd",("vs1","vs2")),"vredxor.vs":("vd",("vs1","vs2")),
    "vfredsum.vs":("vd",("vs1","vs2")),"vfredmax.vs":("vd",("vs1","vs2")),
    "vfredmin.vs":("vd",("vs1","vs2")),
    "vmand.mm":("vd",("vs1","vs2")),  "vmor.mm": ("vd",("vs1","vs2")),
    "vmxor.mm":("vd",("vs1","vs2")),  "vmnand.mm":("vd",("vs1","vs2")),
    "vmnor.mm":("vd",("vs1","vs2")),  "vmxnor.mm":("vd",("vs1","vs2")),
    "vmnot.m": ("vd",("vs1",)),
    "vslideup.vx":   ("vd",("vs1","rs1")), "vslideup.vi":   ("vd",("vs1",)),
    "vslidedown.vx": ("vd",("vs1","rs1")), "vslidedown.vi": ("vd",("vs1",)),
    "vslide1up.vx":  ("vd",("vs1","rs1")), "vslide1down.vx":("vd",("vs1","rs1")),
    "vmseq.vv":("vd",("vs1","vs2")),  "vmseq.vx":("vd",("vs1","rs1")),
    "vmseq.vi":("vd",("vs1",)),       "vmsne.vv":("vd",("vs1","vs2")),
    "vmsne.vx":("vd",("vs1","rs1")),  "vmsne.vi":("vd",("vs1",)),
    "vmsltu.vv":("vd",("vs1","vs2")), "vmsltu.vx":("vd",("vs1","rs1")),
    "vmslt.vv":("vd",("vs1","vs2")),  "vmslt.vx":("vd",("vs1","rs1")),
    "vmsleu.vv":("vd",("vs1","vs2")), "vmsleu.vx":("vd",("vs1","rs1")),
    "vmsle.vv":("vd",("vs1","vs2")),  "vmsle.vx":("vd",("vs1","rs1")),
    "vmsgtu.vx":("vd",("vs1","rs1")), "vmsgt.vx":("vd",("vs1","rs1")),
    "vfcvt.xu.f.v":("vd",("vs1",)),  "vfcvt.x.f.v":("vd",("vs1",)),
    "vfcvt.f.xu.v":("vd",("vs1",)),  "vfcvt.f.x.v":("vd",("vs1",)),
}

ALL_TABLES: dict = {**_I, **_M, **_A, **_F, **_D, **_Q, **_ZICSR, **_B, **_V}

BARRIERS = frozenset({
    "fence", "fence.i", "ecall", "ebreak",
    "vsetvli", "vsetivli", "vsetvl",
})
_BRANCH_MNEMONICS = frozenset({
    "beq", "bne", "blt", "bge", "bltu", "bgeu",
    "beqz", "bnez", "blez", "bgez", "bltz", "bgtz",
    "jal", "jalr", "j", "jr",
})
_AMO_PREFIXES = ("lr.", "sc.", "amo")
_LOADS  = frozenset({"lb","lh","lw","lbu","lhu","flw","fld","flq"} |
                    {k for k in _V if k.startswith("vle")})
_STORES = frozenset({"sb","sh","sw","fsw","fsd","fsq"} |
                    {k for k in _V if k.startswith("vse")})
_AMO_SUFFIX_RE = re.compile(r"\.(aq|rl|aqrl)$")

# Regex for a plain integer immediate: optional minus, then decimal or 0x hex.
_IMM_RE = re.compile(r"-?(?:0x[0-9a-fA-F]+|\d+)$")
# Regex for a memory operand in offset(base) form.
_MEM_RE = re.compile(r"\s*(-?\d+)\s*\(([^)]+)\)")

# C-extension compressed instructions.
#
# Two categories are handled differently:
#
# 1. TRUE RSD ALIASES — instructions where the compressed two-operand form
#    means rd is also rs1 (e.g. c.add a0, a1 = add a0, a0, a1).  These stay
#    in _C_ALIASES; the parser's RSD fixup inserts the implicit rs1=rd operand
#    and then substitutes the canonical mnemonic.
#
# 2. EXPLICIT EXPANSIONS — instructions whose canonical expansion has a
#    different operand structure (e.g. c.mv rd, rs = add rd, x0, rs, NOT
#    add rd, rd, rs).  These have their own ALL_TABLES entries that declare
#    the exact operand pattern, and _C_CANON maps them to their canonical
#    mnemonic.  The RSD fixup never applies because _C_ALIASES doesn't
#    contain them.
_C_ALIASES: dict = {
    # True RSD accumulate ops — rd is also rs1 in the compressed encoding.
    "c.add":  "add",   "c.addi": "addi",
    "c.and":  "and",   "c.andi": "andi",
    "c.or":   "or",    "c.sub":  "sub",
    "c.slli": "slli",  "c.srai": "srai",  "c.srli": "srli",
    "c.xor":  "xor",
    # sp-relative forms that the RSD fixup harmlessly skips (0 or 1 operand
    # forms that don't match the 2-op + RSD-pattern condition).
    "c.addi16sp": "addi",
    "c.addi4spn": "addi",
}

# Canonical mnemonic for c. instructions with explicit ALL_TABLES entries.
# Applied after operand decoding to normalise the mnemonic field.
_C_CANON: dict = {
    "c.mv":    "add",   "c.li":    "addi",  "c.nop":   "addi",
    "c.lui":   "lui",   "c.j":     "jal",   "c.jal":   "jal",
    "c.jr":    "jalr",  "c.jalr":  "jalr",
    "c.beqz":  "beqz",  "c.bnez":  "bnez",
    "c.lw":    "lw",    "c.lwsp":  "lw",
    "c.sw":    "sw",    "c.swsp":  "sw",
    "c.ebreak":"ebreak",
}

# ---------------------------------------------------------------------------
# Instruction dataclass
# ---------------------------------------------------------------------------

# Mnemonic used for synthetic label-barrier instructions inserted by the
# streaming parser.  These are never emitted; they exist only to force the
# dependency graph to draw full barriers at label boundaries.
_SENTINEL_MN = "__label__"

@dataclass
class Instruction:
    index:    int
    raw:      str
    mnemonic: str
    operands:  list = field(default_factory=list)
    defs:      list = field(default_factory=list)
    uses:      list = field(default_factory=list)
    csr_defs:  list = field(default_factory=list)
    csr_uses:  list = field(default_factory=list)
    is_load:    bool = False
    is_store:   bool = False
    is_amo:     bool = False
    is_barrier: bool = False
    is_branch:  bool = False
    imm:        object = None  # int immediate if present, else None
    mem:        object = None  # (offset:int, base:str) for load/store, else None
    dual_arith_ok:       bool = False
    dual_arith_chain_ok: bool = False
    # Source lines (label definitions) that must be emitted immediately before
    # this instruction wherever it is scheduled.  Used for non-barrier labels
    # such as .Lpcrel_hi* that must stay anchored to the instruction they
    # precede but do not constrain scheduling across them.
    prefix_lines: list = field(default_factory=list)

    def __repr__(self):
        return f"I{self.index}:{self.mnemonic}"

# ---------------------------------------------------------------------------
# Operand decoder
# ---------------------------------------------------------------------------

def _mem_base(operand: str):
    m = re.match(r"[^(]*\(([^)]+)\)", operand)
    return _normalise_reg(m.group(1)) if m else None

def _strip_vec_mask(operand: str):
    s = operand.strip().rstrip(",")
    return "v0" if s in ("v0.t", "v0") else None

def _decode_operands(mnemonic, pat_def, pat_uses, ops):
    defs, uses, csr_defs, csr_uses = [], [], [], []

    mask_reg = None
    if ops and _strip_vec_mask(ops[-1]) is not None:
        mask_reg = _strip_vec_mask(ops[-1])
        ops = ops[:-1]

    it = iter(ops)
    def nxt():
        try: return next(it)
        except StopIteration: return None

    if pat_def is not None:
        tok = nxt()
        if tok is None:
            return defs, uses, csr_defs, csr_uses
        reg = _normalise_reg(tok)
        if pat_def in ("rd","fd","vd") and reg != "x0":
            defs.append(reg)

    for slot in pat_uses:
        tok = nxt()
        if tok is None:
            break
        if slot == "mem_base":
            base = _mem_base(tok)
            if base: uses.append(base)
        elif slot == "csr":
            csr_id = f"csr:{tok.lower()}"
            csr_uses.append(csr_id)
            if mnemonic in CSR_WRITERS:
                csr_defs.append(csr_id)
        elif slot in ("rs1","rs2","fs1","fs2","fs3","vs1","vs2","vs3"):
            uses.append(_normalise_reg(tok))

    if mask_reg:
        uses.append(mask_reg)
    uses = [r for r in uses if r != "x0"]
    return defs, uses, csr_defs, csr_uses

# ---------------------------------------------------------------------------
# Line parser
# ---------------------------------------------------------------------------

def parse_line(index: int, line: str):
    stripped = line.strip()
    if (not stripped
            or stripped.startswith(("#",";","//"))
            or stripped.startswith(".")
            or re.match(r"^\w+\s*:", stripped)):
        return None

    code = re.split(r"[#;]", stripped)[0].strip()
    if not code:
        return None

    tokens = code.split()
    raw_mn = tokens[0].lower()

    is_c_insn = raw_mn in _C_ALIASES
    mnemonic  = _C_ALIASES.get(raw_mn, raw_mn)
    mnemonic  = _AMO_SUFFIX_RE.sub("", mnemonic)

    ops = [p.strip() for p in " ".join(tokens[1:]).split(",") if p.strip()]

    if is_c_insn and len(ops) == 2 and mnemonic in ALL_TABLES:
        pat_def, pat_uses = ALL_TABLES[mnemonic]
        if (pat_def in ("rd","fd")
                and pat_uses and pat_uses[0] in ("rs1","fs1")):
            ops = [ops[0], ops[0]] + ops[1:]

    instr = Instruction(index=index, raw=line, mnemonic=mnemonic, operands=ops)
    instr.is_load    = mnemonic in _LOADS
    instr.is_store   = mnemonic in _STORES
    instr.is_amo     = any(mnemonic.startswith(p) for p in _AMO_PREFIXES)
    instr.is_barrier = mnemonic in BARRIERS or instr.is_amo
    instr.is_branch  = mnemonic in _BRANCH_MNEMONICS

    if mnemonic not in ALL_TABLES:
        instr.is_barrier = True
        instr.uses = [_normalise_reg(t.rstrip(",")) for t in tokens[1:]
                      if _is_reg_token(t)]
        return instr

    # Normalise single-operand jalr: ``jalr offset(rs)`` is assembler shorthand
    # for ``jalr ra, offset(rs)`` (rd = ra = x1 implied by the ABI call
    # convention).  Both GAS and objdump emit this form when rd == rs1 == ra
    # with an arbitrary offset; other disassemblers (and no-alias dumps) emit
    # the full three-token form ``jalr ra, offset(rs)``.  Canonicalise here so
    # _decode_operands always sees (rd, mem_operand) and correctly records
    # defs=[x1] uses=[base_reg].
    if mnemonic == "jalr" and len(ops) == 1 and _MEM_RE.match(ops[0]):
        ops = ["ra"] + ops   # prepend implicit rd = ra (x1)

    pat_def, pat_uses = ALL_TABLES[mnemonic]
    defs, uses, csr_defs, csr_uses = _decode_operands(mnemonic, pat_def, pat_uses, ops)
    instr.defs, instr.uses = defs, uses
    instr.csr_defs, instr.csr_uses = csr_defs, csr_uses

    # ── Mnemonic canonicalisation ────────────────────────────────────────────
    #
    # Goal: every pair of assembly files that represent the *same* binary must
    # produce identical Instruction objects regardless of whether the assembler
    # emitted alias/pseudo mnemonics or their canonical base-ISA equivalents.
    # Two common sources of divergence are:
    #
    #   1. Compressed (c.) aliases — objdump --no-aliases writes the full form;
    #      normal objdump writes c.mv, c.li, c.j, c.jr, c.beqz, …
    #   2. GAS pseudo-instructions — assemblers may emit ``li``, ``mv``, ``j``,
    #      ``ret``, ``beqz``, ``bnez``, ``bltz``, ``bgez`` etc.  No-alias
    #      disassemblers expand these to their real encodings: ``addi rd,x0,imm``,
    #      ``add rd,x0,rs``, ``jal x0,label``, ``jalr x0,0(ra)``, ``bne rs,zero``, …
    #
    # The normalisation steps below collapse every alias to the same canonical
    # form that the c. expansion already produces, so both styles end up with
    # identical mnemonic, defs, uses, is_branch, is_barrier, can_compress, and
    # dual_arith_ok values.

    # Step 1 — c. aliases (explicit C-extension mnemonics with their own
    # ALL_TABLES entries).  Operands were already decoded correctly above using
    # those entries; now replace the mnemonic so downstream checks see the
    # canonical base-ISA name.
    if mnemonic in _C_CANON:
        mnemonic       = _C_CANON[mnemonic]
        instr.mnemonic = mnemonic
        instr.is_load   = mnemonic in _LOADS
        instr.is_store  = mnemonic in _STORES
        instr.is_branch = mnemonic in _BRANCH_MNEMONICS

    # Step 2 — GAS pseudo-instructions that are strict aliases for a base-ISA
    # instruction.  Operands were decoded correctly from the pseudo's ALL_TABLES
    # entry; we only need to rename the mnemonic.
    #
    #   mv  rd, rs  == addi rd, rs, 0      (GAS/spec; c.mv separately → add)
    #   li  rd, imm == addi rd, x0, imm    (c.li already canonicalises to addi)
    #   j   label   == jal  x0, label      (c.j  already canonicalises to jal)
    #
    # This ensures ``mv a0,a1`` (aliases) and ``addi a0,a1,0`` (no-aliases)
    # produce mnemonic='addi' with identical uses, imm, dual_arith_ok, and
    # dual_move_ok.  Likewise ``li a0,1`` / ``c.li a0,1`` / ``addi a0,zero,1``
    # all produce mnemonic='addi'.
    #
    # Also covers the negation pseudos:
    #   neg  rd, rs == sub  rd, x0, rs   (uses=[rs]; NOT RSD — rd≠rs1=x0)
    #   negw rd, rs == subw rd, x0, rs
    #   not  rd, rs == xori rd, rs, -1   (uses=[rs]; rd may equal rs)
    #
    # Canonicalising these ensures consistent mnemonic, can_compress, and
    # _CMP_MNEMONICS membership regardless of which disassembler style is used.
    #
    # Note: ``mv rd, rs`` is the GAS / RISC-V spec pseudo for ``addi rd, rs, 0``
    # (I-type).  It is NOT ``add rd, x0, rs`` (R-type); that is the expansion of
    # the C-extension ``c.mv rd, rs``, which is handled separately via _C_CANON.
    # Canonicalising ``mv`` to ``addi`` (not ``add``) ensures that an aliased
    # disassembler printing ``mv a0, a1`` and a no-alias disassembler printing
    # ``addi a0, a1, 0`` both produce the same mnemonic, uses, and imm.
    _PSEUDO_CANON = {"mv": "addi", "li": "addi", "j": "jal", "jr": "jalr",
                     "neg": "sub", "not": "xori"}
    if mnemonic in _PSEUDO_CANON:
        mnemonic       = _PSEUDO_CANON[mnemonic]
        instr.mnemonic = mnemonic
        instr.is_branch = mnemonic in _BRANCH_MNEMONICS
    # For ``not``: fix up imm=-1 so _dual_arith_ok and imm-range checks see it.
    if mnemonic == "xori" and instr.imm is None and raw_mn == "not":
        instr.imm = -1
    # For ``mv``: fix up imm=0 so dual_arith_ok, _dual_move_ok, and imm-range
    # checks all see it — identical to what addi rd, rs, 0 produces explicitly.
    if mnemonic == "addi" and instr.imm is None and raw_mn == "mv":
        instr.imm = 0

    # Step 3 — ``ret`` canonicalises to ``jalr`` (= jalr x0, 0(ra)).
    #
    # ``ret`` is a GAS pseudo for ``jalr x0, 0(ra)``.  Its c. equivalent is
    # ``c.jr ra`` which already canonicalises to jalr (is_branch=True, not
    # is_barrier).  ``ret`` must match: it is *not* a scheduling barrier within
    # a basic block — the block ends because it's a branch, not because it's a
    # call boundary.  (``call`` and ``tail`` remain barriers because they cross
    # call boundaries.)
    #
    # We also fix up uses=[x1] (ra) to match c.jr ra's decoded uses.
    if mnemonic == "ret":
        instr.mnemonic  = "jalr"
        instr.is_branch = True
        instr.uses      = ["x1"]   # ra — the base register of jalr x0, 0(ra)
        mnemonic        = "jalr"

    # Step 4 — ``bne/beq/blt/bge rs, zero, label`` → pseudo branch forms.
    #
    # No-alias disassemblers emit ``bne rs, zero, lbl`` where assemblers write
    # ``bnez rs, lbl``.  Canonicalise to the pseudo form so both produce the
    # same mnemonic, and so can_compress (which checks for beqz/bnez-style
    # single-source forms) sees the right mnemonic.
    #
    #   bne  rs, zero  → bnez     bge  zero, rs  → blez
    #   beq  rs, zero  → beqz     bge  rs, zero  → bgez  (always-true, rare)
    #   blt  rs, zero  → bltz     blt  zero, rs  → bgtz
    _ZERO_BRANCH: dict = {
        # (mnemonic, which operand is zero): pseudo
        ("bne",  1): "bnez",   # bne rs, zero → bnez rs
        ("bne",  0): "bnez",   # bne zero, rs → bnez rs  (commuted; bne is symmetric)
        ("beq",  1): "beqz",   # beq rs, zero → beqz rs
        ("beq",  0): "beqz",   # beq zero, rs → beqz rs  (commuted; beq is symmetric)
        ("blt",  1): "bltz",   # blt rs, zero → bltz rs
        ("bge",  1): "bgez",   # bge rs, zero → bgez rs
        ("blt",  0): "bgtz",   # blt zero, rs → bgtz rs  (rs > 0)
        ("bge",  0): "blez",   # bge zero, rs → blez rs  (rs ≤ 0)
    }
    if mnemonic in ("bne", "beq", "blt", "bge") and len(instr.uses) >= 1:
        # uses has already had x0 filtered out by _decode_operands, so we need
        # to inspect the raw ops to determine which position was zero.
        # ops[0] and ops[1] are the two source registers; ops[2] is the label.
        if len(ops) >= 3:
            r0 = _normalise_reg(ops[0])
            r1 = _normalise_reg(ops[1])
            zero_pos = None
            if r1 == "x0":
                zero_pos = 1
            elif r0 == "x0":
                zero_pos = 0
            if zero_pos is not None:
                key = (mnemonic, zero_pos)
                if key in _ZERO_BRANCH:
                    mnemonic        = _ZERO_BRANCH[key]
                    instr.mnemonic  = mnemonic
                    # uses: keep only the non-zero source
                    instr.uses      = [r1 if zero_pos == 0 else r0]
                    instr.is_branch = True   # already True, but be explicit

    # Step 5 — ``seqz rd, rs`` / ``snez rd, rs`` pseudo forms.
    #
    # No-alias disassemblers emit the real encodings:
    #   seqz rd, rs  ==  sltiu rd, rs, 1
    #   snez rd, rs  ==  sltu  rd, x0, rs
    # Canonicalise both directions so the mnemonic is always seqz/snez,
    # ensuring they are recognised by _CMP_MNEMONICS rules.
    # sltiu rd, rs, 1  →  seqz rd, rs
    # instr.imm is not yet populated at this point (imm scan runs below), so
    # read the immediate directly from the raw ops list.
    if mnemonic == "sltiu" and len(ops) >= 3 and ops[2].strip() == "1":
        instr.mnemonic = "seqz"
        mnemonic       = "seqz"

    # sltu rd, zero, rs  →  snez rd, rs  (3-operand form with explicit x0/zero)
    if (mnemonic == "sltu" and instr.defs
            and len(ops) >= 3 and _normalise_reg(ops[1]) == "x0"):
        instr.mnemonic = "snez"
        mnemonic       = "snez"

    # Step 6 — ``zext.b rd, rs  ==  andi rd, rs, 0xff``
    #
    # Downstream analysis (dual-arith eligibility, cmp rules, can_compress)
    # keys on the canonical mnemonic; raw source line preserved in instr.raw.
    if mnemonic == "zext.b":
        instr.mnemonic = "andi"
        instr.imm      = 0xff
        mnemonic       = "andi"

    # ── Barrier flags ────────────────────────────────────────────────────────
    # ``call`` and ``tail`` cross call boundaries → full barrier.
    # ``ret`` has already been canonicalised to ``jalr`` above (is_branch=True).
    if mnemonic in ("call", "tail"):
        instr.is_barrier = True

    # Cache immediate and memory operand at parse time.
    # Skip the imm scan if a normalisation step already set instr.imm.
    if instr.imm is None:
        _code = re.split(r"[#;]", instr.raw)[0].strip()
        _parts = _code.split(None, 1)
        if len(_parts) >= 2:
            _ops = [o.strip() for o in _parts[1].split(",")]
            _last = _ops[-1].strip()
            if _IMM_RE.fullmatch(_last):
                try:
                    instr.imm = int(_last, 0)
                except ValueError:
                    pass
    else:
        _code = re.split(r"[#;]", instr.raw)[0].strip()
        _parts = _code.split(None, 1)
    if (instr.is_load or instr.is_store) and len(_parts) >= 2:
        _ops2 = [o.strip() for o in _parts[1].split(",")]
        _m = _MEM_RE.match(_ops2[-1])
        if _m:
            instr.mem = (int(_m.group(1)), _normalise_reg(_m.group(2).strip()))

    # Pre-compute dual-arith eligibility flags.
    instr.dual_arith_ok       = _dual_arith_ok(instr)
    instr.dual_arith_chain_ok = (
        _dual_arith_ok(instr, allow_chain_reg=True)
        and bool(instr.defs) and instr.defs[0] == "x31"
    )
    return instr

# ---------------------------------------------------------------------------
# Dual-arith eligibility helpers (cached onto Instruction at parse time)
# ---------------------------------------------------------------------------

_DUAL_ARITH_MN = frozenset({
    "addi", "addiw", "andi",
    "add",  "addw",
    "sub",  "subw",
    "and",  "bic",  "andn",
    "or",   "xor",
})
# R-type instructions whose rs1/rs2 can be swapped without changing the result.
_COMMUTATIVE_BINOP = frozenset({
    "add",  "addw",
    "and",  "or",   "xor",
    "mul",  "mulh", "mulhu",
    "min",  "minu", "max",  "maxu",
    "xnor",
})
_REG4      = frozenset(f"x{n}" for n in range(16))
_CHAIN_REG = "x31"
_IMM_FORMS = frozenset({"addi", "addiw", "andi"})

def _dual_arith_ok(instr: "Instruction", allow_chain_reg: bool = False) -> bool:
    mn  = instr.mnemonic
    if mn not in _DUAL_ARITH_MN:
        return False
    rd  = instr.defs[0] if instr.defs else None
    rs1 = instr.uses[0] if instr.uses else None
    if rd is None or rs1 is None:
        return False
    if mn == "addi" and rs1 == "x2" and rd != "x2":
        reg_ok = (rd in _REG4) or (allow_chain_reg and rd == _CHAIN_REG)
        if not reg_ok:
            return False
        imm = instr.imm
        if imm is None or imm <= 0 or imm % 4 != 0 or imm > 124:
            return False
        return True
    if rd != rs1:
        return False
    rsd_ok = (rd in _REG4) or (allow_chain_reg and rd == _CHAIN_REG)
    if not rsd_ok:
        return False
    if len(instr.uses) >= 2 and instr.uses[1] not in _REG4:
        return False
    if mn in _IMM_FORMS:
        imm = instr.imm
        if imm is None or imm < -16 or imm > 15:
            return False
    return True

