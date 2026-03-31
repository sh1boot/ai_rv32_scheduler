#!/usr/bin/env python3
"""Annotate assembly lines with RVC compressibility and canonical form.

Usage:
    python3 rvc_annotate.py input.s
    python3 rvc_annotate.py < input.s
"""

import sys
from rv32_core import parse_line
from rv32_scorers import can_compress


def _canon(instr) -> str:
    """Format the canonicalised instruction as a compact string."""
    parts = [instr.mnemonic]
    operands = []
    if instr.defs:
        operands += instr.defs
    if instr.mem is not None:
        imm, base = instr.mem
        # For stores the value register is in uses but not the base.
        for r in instr.uses:
            if r != base:
                operands.append(r)
        operands.append(f"{imm}({base})")
    else:
        operands += instr.uses
        if instr.imm is not None:
            operands.append(str(instr.imm))
    if operands:
        parts.append(", ".join(operands))
    return " ".join(parts)


def annotate(lines):
    for idx, line in enumerate(lines):
        instr = parse_line(idx, line)
        raw = line.rstrip("\n")
        if instr is None or instr.mnemonic is None:
            print(raw)
            continue
        tag = "[rvc]" if can_compress(instr) else "[---]"
        canon = _canon(instr)
        # Pad the source line to a consistent column before the comment.
        print(f"{raw:<48s}  # {tag}  {canon}")


def main():
    if len(sys.argv) > 1:
        with open(sys.argv[1]) as f:
            annotate(f)
    else:
        annotate(sys.stdin)


if __name__ == "__main__":
    main()
