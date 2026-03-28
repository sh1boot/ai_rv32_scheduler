"""
rv32_scheduler.py

Reads RV32 assembly, builds a dependency graph respecting:
  - RAW / WAW / WAR register hazards (integer AND floating-point registers)
  - Memory ordering (loads/stores preserve relative order)
  - Atomic ordering (AMO instructions are treated as memory barriers)
  - CSR hazards (reads/writes to the same CSR are ordered)
  - Vector register hazards (v0-v31)

Supported extensions
--------------------
  I   Base integer
  M   Multiply / divide
  A   Atomics
  F   Single-precision floating-point
  D   Double-precision floating-point
  Q   Quad-precision floating-point
  C   Compressed instructions  (16-bit; decoded to canonical names)
  Zicsr   CSR access instructions
  Zifencei  fence.i
  Zba / Zbb / Zbc / Zbs  Bit-manipulation (B-extension subsets)
  V   Vector (RVV 1.0)

The scheduler exposes a hook -- pair_score(instr_a, instr_b) -> float --
that an external optimiser can override to bias instruction placement.

Usage
-----
    python rv32_scheduler.py input.s            # print reordered assembly
    python rv32_scheduler.py input.s -v         # also dump dep-graph to stderr
    python rv32_scheduler.py -                  # read from stdin

Python API
----------
    from rv32_scheduler import AssemblyScheduler, Instruction

    def my_score(a: Instruction, b: Instruction) -> float:
        if a.mnemonic == "fmul.s" and b.mnemonic == "fadd.s":
            return 5.0
        return 0.0

    sched = AssemblyScheduler(open("loop.s").read())
    print(sched.emit(pair_score=my_score))
"""

import re
import sys
import argparse
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Optional, Callable

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
    # These are assembler aliases for base instructions.  They are decoded
    # here so that the dependency analyser sees their actual register usage
    # rather than treating them as barriers.
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
    "li":    ("rd",  ()),           # lui+addi or addi — dest only, imm is immediate
    "la":    ("rd",  ()),           # auipc+addi — dest only
    "j":     (None,  ()),           # jal x0, label
    "jr":    (None,  ("rs1",)),     # jalr x0, rs, 0
    "call":  ("rd",  ()),           # auipc+jalr — writes ra (x1); treated conservatively
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
# c.add rd, rs2  =>  add rd, rd, rs2
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

    # Branches and jumps must be scheduled after all instructions that
    # precede them in the original basic block.  They are NOT full barriers:
    # they don't prevent reordering among instructions that follow them
    # (there normally aren't any in a basic block).
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

    # call/tail are multi-instruction pseudo-ops (auipc + jalr) that may
    # clobber any caller-saved register and cross arbitrary call boundaries.
    # ret is jalr x0, ra, 0 — ends a function, nothing meaningful after it.
    # Treat all three as barriers so nothing reorders past them.
    if mnemonic in ("call", "tail", "ret"):
        instr.is_barrier = True

    # ── Cache immediate and memory operand ───────────────────────────────
    # Populate once at parse time so scorer rules don't have to re-parse
    # raw strings (which involves regex) on every pair_score() call.
    _IMM_RE  = re.compile(r"-?(?:0x[0-9a-fA-F]+|\d+)$")
    _MEM_RE  = re.compile(r"\s*(-?\d+)\s*\(([^)]+)\)")
    # Immediate: last comma-separated token, if it's a plain integer literal
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
    # Memory operand: offset(base) form, present on loads and stores
    if (instr.is_load or instr.is_store) and len(_parts) >= 2:
        _ops2 = [o.strip() for o in _parts[1].split(",")]
        # memory operand is the last operand for loads, second for stores
        _mem_op = _ops2[-1]
        _m = _MEM_RE.match(_mem_op)
        if _m:
            instr.mem = (int(_m.group(1)), _normalise_reg(_m.group(2).strip()))

    # Pre-computation of dual-arith eligibility is deferred to
    # _finalize_instruction() which is called right after this return.
    # We can't call _dual_arith_ok here because it is defined later in the
    # file, but Python resolves names at call time so calling via
    # _finalize_instruction works fine.
    _finalize_instruction(instr)
    return instr


def _finalize_instruction(instr: "Instruction") -> None:
    """Populate fields that depend on functions defined after parse_line."""
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
            # the original sequence.  This prevents the scheduler from moving
            # the branch earlier and skipping instructions that belong in the
            # same basic block.  Unlike a full barrier, we do NOT set
            # last_barrier, so instructions after the branch (if any) are not
            # forced to follow it.
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
    registers that are "last-used" by that instruction -- i.e. registers that
    are read by the instruction and are not read again before being
    overwritten (or before the end of the block).

    A register is considered dead-after-use at instruction I when:
      - I reads the register, AND
      - No later instruction (in original order) reads it before the next
        write to that register (or end-of-block).

    The returned dict has the shape:
        { instr_index: frozenset of register names }

    Only tracks integer (x*) and floating-point (f*) architectural registers.
    x0 is never reported as a last-use because it cannot hold a meaningful
    value.

    Example
    -------
        liveness = compute_liveness(graph.instructions)
        for instr in scheduled:
            dead = liveness[instr.index]
            if dead:
                print(f"  ; kills: {', '.join(sorted(dead))}")
    """
    # live_out[reg] = True  means the register is still needed by some
    # later instruction.  We walk backward and clear it when we see a write.
    live_out: dict = {}          # reg -> bool (currently live)
    last_use: dict = {}          # instr_index -> set[reg]

    for instr in reversed(instructions):
        idx = instr.index
        killed: set = set()

        # Registers *defined* by this instruction become dead before this
        # point (unless they're also used here, which can happen for e.g.
        # c.add rd,rs2 where rd==rs1).
        for reg in instr.defs:
            live_out[reg] = False   # killed by this write

        # Registers *used* by this instruction: if not already live from a
        # later instruction, this is the last use.
        for reg in instr.uses:
            if reg == "x0":
                continue
            if not live_out.get(reg, False):
                killed.add(reg)
            live_out[reg] = True    # mark as live going upward

        last_use[idx] = frozenset(killed)

    return last_use


# ---------------------------------------------------------------------------
# Compressed-encoding eligibility
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
# Default pair-score: prefer pairs where both instructions can be compressed
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
# Pair scoring helpers
# ---------------------------------------------------------------------------

PairScoreFn = Callable[["Instruction", "Instruction"], float]


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

    singleton_tally : {(mnemonic_a, mnemonic_b): int}
        For every position i where instruction i ended up as a singleton and
        i+1 exists, record (i.mnemonic, (i+1).mnemonic).  This is exactly
        the (a, b) pair the scorer tested and rejected.  Sorted by count
        descending, this reveals which opcode combinations are most often
        adjacent but unpairable — the highest-count entries are the best
        candidates for new pairing rules.

        Note: the last instruction in the sequence (no successor) contributes
        a (mnemonic, "") entry — i.e. it is counted as a singleton with an
        empty partner mnemonic, since there is no adjacent instruction to
        compare against.

    unpaired_opcode_tally : {mnemonic: int}
        Flat count of instructions that ended up unpaired, keyed by mnemonic.
        Useful for "which opcodes most often miss pairing" without worrying
        about the pairing partner.

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
    import copy

    scheduled = [copy.copy(i) for i in scheduled]
    n = len(scheduled)
    trials_remaining: list = [max_trials]   # mutable counter shared by helpers

    # ABI temporaries: t0-t2 (x5-x7) and t3-t6 (x28-x31)
    _TEMPORARIES = frozenset(
        {f"x{i}" for i in (5, 6, 7, 28, 29, 30, 31)}
    )
    # Registers that must never be rename targets
    _RESERVED = frozenset({"x0", "x1", "x2", "x3", "x4"})

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
# High-level API
# ---------------------------------------------------------------------------

class AssemblyScheduler:
    """
    Parse, analyse, and emit a reordered RV32 assembly string.

    sched = AssemblyScheduler(source_text)
    print(sched.emit(pair_score=my_fn))
    """

    def __init__(self, source: str):
        self.source = source
        self.graph = None
        self._items: list = []
        self.last_stats: "PairStats | None" = None

    def analyse(self):
        instr_index = 0
        instructions: list = []
        for line in self.source.splitlines():
            stripped = line.strip()

            is_blank_or_comment = (
                not stripped
                or stripped.startswith(("#", ";", "//"))
            )
            is_directive = stripped.startswith(".")
            is_label    = bool(re.match(r"^\w+\s*:", stripped))

            if is_blank_or_comment or is_directive:
                self._items.append(("pass", line))
                continue

            if is_label:
                # Labels are emitted as pass-through text, but they also act
                # as full scheduling barriers: no instruction may be reordered
                # from one side of a label to the other, because external code
                # may branch to the label and expect to find the original
                # instruction sequence on both sides.
                #
                # We achieve this by inserting a synthetic zero-cost barrier
                # instruction into the instruction list.  The barrier carries
                # no register effects and is never emitted; it exists solely
                # to force the dependency graph to draw edges from every
                # predecessor to it and from it to every successor.
                sentinel = Instruction(
                    index    = instr_index,
                    raw      = "",           # never emitted
                    mnemonic = "__label__",  # sentinel mnemonic
                )
                sentinel.is_barrier = True
                instr_index += 1
                instructions.append(sentinel)
                # The label text goes into _items as a pass-through tied to
                # the sentinel, so it is re-emitted immediately before the
                # first instruction that follows the label.
                self._items.append(("pass", line))
                # Associate the sentinel with the label position so the
                # emitter can reconstruct the correct interleaving.
                self._items.append(("instr", sentinel))
                continue

            instr = parse_line(instr_index, line)
            if instr is None:
                self._items.append(("pass", line))
            else:
                instr_index += 1
                instructions.append(instr)
                self._items.append(("instr", instr))
        self.graph = build_dep_graph(instructions)

    @property
    def liveness(self) -> dict:
        """
        Dict mapping each instruction index to a frozenset of register names
        that are read for the last time by that instruction (dead-after-use).
        Populated after analyse() is called.
        """
        if self.graph is None:
            self.analyse()
        if not hasattr(self, "_liveness"):
            self._liveness = compute_liveness(self.graph.instructions)
        return self._liveness

    def emit(self, pair_score: PairScoreFn = _compress_pair_score,
             rename: bool = True,
             opcode_tally: bool = False) -> str:
        """
        Schedule and emit the reordered assembly.

        Parameters
        ----------
        pair_score : callable(a, b) -> float
            Scoring function for adjacent instruction pairs.  The default
            rewards RVC-compressible instruction pairs.
        rename : bool
            If True (default), attempt destination-register renaming after
            scheduling to improve the pair score further.

        The returned string includes a trailing comment line of the form:
            # pairs: K/N  (K successful strict pairs out of N/2 possible)
        """
        if self.graph is None:
            self.analyse()

        scheduled = _bnb_schedule(self.graph, pair_score)

        # Strip sentinel barrier instructions (label markers) before liveness
        # analysis, renaming, and scoring — they have no register effects and
        # must not appear in the emitted output.
        real_scheduled = [i for i in scheduled if i.mnemonic != "__label__"]

        # Refresh liveness over the scheduled sequence before any scoring.
        if hasattr(pair_score, "_liveness_cell"):
            pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

        if rename:
            real_scheduled = rename_destinations(
                real_scheduled, self.graph, pair_score)
            if hasattr(pair_score, "_liveness_cell"):
                pair_score._liveness_cell[0] = compute_liveness(real_scheduled)

        # --- Build output lines, interleaving pass-through items ---
        # Map from instruction original index -> position in `scheduled`
        # (including sentinels) so pass-through anchoring is correct.
        sched_pos = {i.index: p for p, i in enumerate(scheduled)}
        # Map from instruction original index -> position in `real_scheduled`
        # (sentinels removed) so PAIR+ annotations index correctly.
        real_pos = {i.index: p for p, i in enumerate(real_scheduled)}

        before_pos: dict = defaultdict(list)
        pending: list = []
        for kind, val in self._items:
            if kind == "pass":
                pending.append(val)
            else:
                sp = sched_pos.get(val.index)
                if sp is not None:
                    before_pos[sp].extend(pending)
                    pending.clear()

        # --- Annotate pairs, build stats, append summary ---
        # All pairing logic operates on real_scheduled (no sentinels).
        total_instrs   = len(real_scheduled)
        possible_pairs = total_instrs // 2
        successful     = 0
        rule_counts: dict = {}
        describe_fn = getattr(pair_score, "_describe_pair", None)

        # Greedy-advance walk: the pairing model that drives both the
        # PAIR+ annotations and all statistics.
        #
        # Walk the scheduled sequence left-to-right.  At each position i:
        #   - If pair_score(i, i+1) > 0: form a pair, advance i by 2.
        #   - Otherwise: emit i as a singleton, advance i by 1.
        #
        # A singleton never prevents the following instruction from pairing.
        # Rule classification follows first-match priority:
        #   rule_counts [winner] += 1  — pair formed and winner rule fired
        #   rule_shadow [rule]   += 1  — rule also matched but lost to winner
        #   rule_missed [winner] += 1  — winner rule matched but pair_score=0

        pair_starts = []  # positions of the first instruction in each pair
        pair_rules  = {}  # position -> winning rule name

        rule_counts: dict = {}
        rule_shadow: dict = {}
        rule_missed: dict = {}
        singleton_tally:       dict = {}   # {(mn_a, mn_b): count}
        unpaired_opcode_tally: dict = {}   # {mnemonic: count}

        rule_list    = getattr(pair_score, "_rule_list", None)
        liveness_snap = (pair_score._liveness_cell[0]
                         if hasattr(pair_score, "_liveness_cell") else {})

        i = 0
        while i < total_instrs:
            if i + 1 < total_instrs:
                a_s, b_s = real_scheduled[i], real_scheduled[i + 1]
                slot_scores = pair_score(a_s, b_s) > 0

                if rule_list is not None:
                    matching_rules = [
                        rname for rname, rfn in rule_list
                        if rfn(a_s, b_s, liveness_snap)
                    ]
                    if matching_rules:
                        winner = matching_rules[0]
                        if slot_scores:
                            pair_starts.append(i)
                            pair_rules[i] = winner
                            successful += 1
                            rule_counts[winner] = rule_counts.get(winner, 0) + 1
                            for rname in matching_rules[1:]:
                                rule_shadow[rname] = rule_shadow.get(rname, 0) + 1
                            i += 2
                            continue
                        else:
                            rule_missed[winner] = rule_missed.get(winner, 0) + 1
                else:
                    if slot_scores:
                        pair_starts.append(i)
                        rule = describe_fn(a_s, b_s) if describe_fn else ""
                        pair_rules[i] = rule
                        successful += 1
                        rule_counts[rule] = rule_counts.get(rule, 0) + 1
                        i += 2
                        continue

            # No pair formed at position i: singleton.
            # Record the (a, b) opcode combination that failed to pair, using
            # the same adjacent instruction the scorer examined.  When i is the
            # last instruction, record ("", "") as the partner mnemonic.
            mn_a = real_scheduled[i].mnemonic
            mn_b = real_scheduled[i + 1].mnemonic if i + 1 < total_instrs else ""
            key = (mn_a, mn_b)
            singleton_tally[key]       = singleton_tally.get(key, 0) + 1
            unpaired_opcode_tally[mn_a] = unpaired_opcode_tally.get(mn_a, 0) + 1
            i += 1

        # possible_pairs: maximum achievable under greedy-advance model.
        possible_pairs_greedy = total_instrs // 2

        # RVC eligibility (over real instructions only, no sentinels).
        rvc_eligible = sum(1 for i in real_scheduled if can_compress(i))

        # Size estimate.
        paired_instrs   = successful * 2
        unpaired_instrs = total_instrs - paired_instrs
        total_words     = successful + unpaired_instrs
        estimated_bytes = total_words * 4
        baseline_bytes  = total_instrs * 4
        saving_bytes    = baseline_bytes - estimated_bytes
        saving_pct      = (saving_bytes / baseline_bytes * 100) if baseline_bytes else 0.0

        self.last_stats = PairStats(
            total_instrs     = total_instrs,
            paired_instrs    = paired_instrs,
            unpaired_instrs  = unpaired_instrs,
            possible_pairs   = possible_pairs_greedy,
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

        # Rebuild output lines with PAIR+ annotations.
        # real_pos maps original index -> position in real_scheduled (no sentinels).
        pair_start_set = set(pair_starts)
        # Build a lookup: real_scheduled position -> instr, for annotation
        # pair_starts indices are into real_scheduled.
        # The output must interleave pass-throughs anchored by `scheduled`
        # (including sentinels) but emit real instruction text from real_scheduled.
        # We walk `scheduled` in order; for each instruction we look up its
        # position in real_scheduled (if it's a real instruction) to check
        # whether it starts a pair.
        raw_lines: list = []
        for sp, instr in enumerate(scheduled):
            raw_lines.extend(before_pos.get(sp, []))
            if instr.mnemonic == "__label__":
                continue   # sentinel: no text emitted
            rp = real_pos.get(instr.index)
            if rp in pair_start_set:
                rule_tag = pair_rules.get(rp, "")
                tag = f"  # PAIR+ [{rule_tag}]" if rule_tag else "  # PAIR+"
                raw_lines.append(instr.raw + tag)
            else:
                raw_lines.append(instr.raw)
        raw_lines.extend(pending)
        for line in self.last_stats.summary_lines(opcode_tally=opcode_tally):
            raw_lines.append(line)
        return "\n".join(raw_lines)



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


def _parse_immediate(instr: "Instruction") -> "int | None":
    """Return the cached immediate parsed at parse_line time, or None."""
    return instr.imm


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
        imm = _parse_immediate(instr)
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
    imm_forms = frozenset({"addi", "addiw", "andi"})
    if mn in imm_forms:
        imm = _parse_immediate(instr)
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
    if b.mnemonic in frozenset({"addi", "addiw", "andi"}):
        imm = _parse_immediate(b)
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
    _DUAL_MOVE_MN = frozenset({"mv", "li"})

    def _ok(instr: "Instruction") -> bool:
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

    if not (_ok(a) and _ok(b)):
        return False

    # Distinct destinations — encoding two writes to the same register
    # in a single compact word is pointless and likely unrepresentable.
    rd_a = a.defs[0]
    rd_b = b.defs[0]
    if rd_a == rd_b:
        return False

    return True


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

    # Branches (instructions that transfer control) may only appear in the
    # second slot of a compact32 pair.  Enforced here so no individual rule
    # needs to repeat the check.
    _BRANCH_MN = frozenset({
        "beq", "bne", "blt", "bge", "bltu", "bgeu",
        "beqz", "bnez",                        # pseudo-instructions
        "jal", "jalr",                         # unconditional jumps
    })

    # Per-rule A-side guards: a cheap boolean per instruction that must be True
    # before calling the full (more expensive) rule function.  This avoids
    # executing any rule body when instruction A clearly can't satisfy it.
    _LOAD_MN  = frozenset({"lw", "lh", "lb", "lhu", "lbu"})
    _STORE_MN = frozenset({"sw", "sh", "sb"})
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
        if a.mnemonic in ("mv", "li"):
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
# Scorer registry — maps CLI name -> factory or direct function
# ---------------------------------------------------------------------------
#
# Each entry is (name, description, factory_or_fn) where factory_or_fn is
# either a plain PairScoreFn (takes a, b) or a callable that takes a
# post-analysis AssemblyScheduler and returns a PairScoreFn.  The CLI
# detects which kind it is by checking for the 'needs_sched' attribute.

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

    source = sys.stdin.read() if args.input == "-" else open(args.input).read()
    sched = AssemblyScheduler(source)
    sched.analyse()

    if args.verbose:
        liveness = sched.liveness
        for instr in sched.graph.instructions:
            succs     = sorted(sched.graph.successors[instr.index])
            dead      = sorted(liveness.get(instr.index, set()))
            compress  = can_compress(instr)
            print(f"# I{instr.index:3d}  {instr.mnemonic:18s}"
                  f"  defs={instr.defs}  uses={instr.uses}"
                  f"  last_use={dead}  rvc={compress}"
                  f"  -> {[f'I{s}' for s in succs]}", file=sys.stderr)

    factory, _ = SCORERS[args.scorer]
    pair_score = factory(sched) if getattr(factory, "needs_sched", False)                  else factory()

    output = sched.emit(pair_score=pair_score, rename=args.rename,
                        opcode_tally=args.opcode_tally)
    print(output)
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
