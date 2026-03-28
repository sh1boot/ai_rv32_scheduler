"""
rv32_core.py

Shared foundations for the RV32 scheduler toolchain:
  - Register name tables and normalisation
  - ISA opcode tables (I, M, A, F, D, Q, C, Zicsr, Zifencei, Zba/Zbb/Zbc/Zbs, V)
  - Instruction dataclass
  - Line parser (parse_line)
  - Dependency graph (build_dep_graph)
  - Liveness analysis (compute_liveness)

This module has no dependency on rv32_scorers or rv32_scheduler and may be
imported on its own.
"""

import re
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Optional

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
#
# Slot keys: rd/fd/vd  rs1/rs2  fs1/fs2/fs3  vs1/vs2/vs3
#            mem_base  csr  (imm/label slots are consumed but not tracked)

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
    "jal":   ("rd", ()),            "jalr":  ("rd", ("rs1",)),
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
    "beqz":  (None, ("rs1",)),      # beq  rs, x0, label
    "bnez":  (None, ("rs1",)),      # bne  rs, x0, label
    "blez":  (None, ("rs1",)),      # bge  x0, rs, label
    "bgez":  (None, ("rs1",)),      # bge  rs, x0, label
    "bltz":  (None, ("rs1",)),      # blt  rs, x0, label
    "bgtz":  (None, ("rs1",)),      # blt  x0, rs, label
    "mv":    ("rd",  ("rs1",)),     # addi rd, rs, 0
    "not":   ("rd",  ("rs1",)),     # xori rd, rs, -1
    "neg":   ("rd",  ("rs1",)),     # sub  rd, x0, rs
    "negw":  ("rd",  ("rs1",)),     # subw rd, x0, rs
    "seqz":  ("rd",  ("rs1",)),     # sltiu rd, rs, 1
    "snez":  ("rd",  ("rs1",)),     # sltu  rd, x0, rs
    "sltz":  ("rd",  ("rs1",)),     # slt   rd, rs, x0
    "sgtz":  ("rd",  ("rs1",)),     # slt   rd, x0, rs
    "sext.w":("rd",  ("rs1",)),     # addiw rd, rs, 0
    "zext.b":("rd",  ("rs1",)),     # andi  rd, rs, 255
    "nop":   (None,  ()),           # addi  x0, x0, 0
    "ret":   (None,  ("rs1",)),     # jalr  x0, x1, 0  (uses ra)
    "li":    ("rd",  ()),           # lui+addi or addi — dest only
    "la":    ("rd",  ()),           # auipc+addi — dest only
    "j":     (None,  ()),           # jal x0, label
    "jr":    (None,  ("rs1",)),     # jalr x0, rs, 0
    "call":  ("rd",  ()),           # auipc+jalr — writes ra (x1)
    "tail":  (None,  ()),           # auipc+jalr x0 — no dest
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
_AMO_PREFIXES = ("lr.", "sc.", "amo")
_LOADS  = frozenset({"lb","lh","lw","lbu","lhu","flw","fld","flq"} |
                    {k for k in _V if k.startswith("vle")})
_STORES = frozenset({"sb","sh","sw","fsw","fsd","fsq"} |
                    {k for k in _V if k.startswith("vse")})
_AMO_SUFFIX_RE = re.compile(r"\.(aq|rl|aqrl)$")

# C-extension: 2-operand compressed form where rd is also implicit rs1.
_C_ALIASES: dict = {
    "c.add":"add",    "c.addi":"addi",  "c.addi16sp":"addi",
    "c.addi4spn":"addi", "c.and":"and", "c.andi":"andi",
    "c.beqz":"beq",   "c.bnez":"bne",  "c.ebreak":"ebreak",
    "c.j":"jal",      "c.jal":"jal",   "c.jalr":"jalr",   "c.jr":"jalr",
    "c.li":"addi",    "c.lui":"lui",   "c.lw":"lw",       "c.lwsp":"lw",
    "c.mv":"add",     "c.nop":"addi",  "c.or":"or",
    "c.slli":"slli",  "c.srai":"srai", "c.srli":"srli",
    "c.sub":"sub",    "c.sw":"sw",     "c.swsp":"sw",      "c.xor":"xor",
}


# ---------------------------------------------------------------------------
# Instruction dataclass
# ---------------------------------------------------------------------------

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
    is_branch:  bool = False   # conditional/unconditional branch or jump
    # Cached decoded values — populated by parse_line, used by scorer rules
    # to avoid re-parsing raw strings on every scorer call.
    imm:        object = None  # int immediate if present, else None
    mem:        object = None  # (offset:int, base:str) for load/store, else None
    dual_arith_ok:       bool = False  # satisfies _dual_arith_ok() constraints
    dual_arith_chain_ok: bool = False  # satisfies _dual_arith_ok(allow_chain_reg=True) and defs x31

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

    # C-extension implicit rs1=rd expansion for 2-operand compressed forms
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

    _BRANCH_MNEMONICS = frozenset({
        "beq", "bne", "blt", "bge", "bltu", "bgeu",
        "beqz", "bnez", "blez", "bgez", "bltz", "bgtz",
        "jal", "jalr", "j", "jr",
    })
    instr.is_branch = mnemonic in _BRANCH_MNEMONICS

    if mnemonic not in ALL_TABLES:
        instr.is_barrier = True
        instr.uses = [_normalise_reg(t.rstrip(",")) for t in tokens[1:]
                      if _is_reg_token(t)]
        return instr

    pat_def, pat_uses = ALL_TABLES[mnemonic]
    defs, uses, csr_defs, csr_uses = _decode_operands(mnemonic, pat_def, pat_uses, ops)
    instr.defs, instr.uses = defs, uses
    instr.csr_defs, instr.csr_uses = csr_defs, csr_uses

    # call/tail/ret are multi-instruction pseudo-ops that cross call boundaries
    # or end functions — treat as full barriers.
    if mnemonic in ("call", "tail", "ret"):
        instr.is_barrier = True

    # Cache immediate and memory operand at parse time so scorer rules don't
    # re-parse raw strings on every pair_score() call.
    _IMM_RE  = re.compile(r"-?(?:0x[0-9a-fA-F]+|\d+)$")
    _MEM_RE  = re.compile(r"\s*(-?\d+)\s*\(([^)]+)\)")
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
    if (instr.is_load or instr.is_store) and len(_parts) >= 2:
        _ops2 = [o.strip() for o in _parts[1].split(",")]
        _mem_op = _ops2[-1]
        _m = _MEM_RE.match(_mem_op)
        if _m:
            instr.mem = (int(_m.group(1)), _normalise_reg(_m.group(2).strip()))

    _finalize_instruction(instr)
    return instr


# ---------------------------------------------------------------------------
# Dual-arith eligibility
# ---------------------------------------------------------------------------
#
# These constants and the helper are defined here (rather than in
# rv32_scorers) because they are cached onto Instruction at parse time via
# _finalize_instruction.  Keeping them in core avoids any import cycle and
# lets rv32_core stand alone.
#
# The dual-arith encoding packs two arithmetic ops into one 32-bit word.
# Constraints (see rv32_scorers for the full rule descriptions):
#   1. Mnemonic in _DUAL_ARITH_MN
#   2. RSD form: rd == rs1 (or addi4spn special case)
#   3. All register operands in x0..x15 (4-bit field)
#   4. Immediate in −16..+15 (5-bit signed) for immediate forms
#      Exception: addi rd, sp, imm with imm a non-zero multiple of 4, 4..124

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
    the register is _CHAIN_REG (x31/t6).  Used for the A instruction in
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
    # rs1 is sp (x2); rd may differ from rs1 for this form only.
    if mn == "addi" and rs1 == "x2" and rd != "x2":
        reg_ok = (rd in _REG4) or (allow_chain_reg and rd == _CHAIN_REG)
        if not reg_ok:
            return False
        imm = instr.imm
        if imm is None:
            return False
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
    if mn in ("addi", "addiw", "andi"):
        imm = instr.imm
        if imm is None:
            return False
        if imm < -16 or imm > 15:
            return False

    return True


def _finalize_instruction(instr: "Instruction") -> None:
    """Cache dual-arith eligibility flags onto *instr* at parse time."""
    instr.dual_arith_ok       = _dual_arith_ok(instr)
    instr.dual_arith_chain_ok = (
        _dual_arith_ok(instr, allow_chain_reg=True)
        and bool(instr.defs) and instr.defs[0] == "x31"
    )


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


def build_dep_graph(instructions: list) -> DepGraph:
    graph = DepGraph(instructions=instructions)
    last_writer: dict = {}
    last_readers: dict = defaultdict(list)
    last_csr_writer: dict = {}
    last_csr_readers: dict = defaultdict(list)
    mem_ops: list = []
    last_barrier: int = -1

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
            # Branch must come after every instruction that precedes it in
            # the original sequence.  Unlike a full barrier, does NOT set
            # last_barrier, so instructions after the branch (if any) are
            # not forced to follow it.
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


# ---------------------------------------------------------------------------
# Liveness analysis
# ---------------------------------------------------------------------------

def compute_liveness(instructions: list) -> dict:
    """
    Perform a single backward pass over *instructions* (in original program
    order) and return a dict mapping each instruction index to the set of
    registers that are "last-used" by that instruction — i.e. registers that
    are read by the instruction and are not read again before being
    overwritten (or before the end of the block).

    Returns { instr_index: frozenset of register names }.
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
