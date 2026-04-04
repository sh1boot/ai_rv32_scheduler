#!/usr/bin/env python3
"""Annotate assembly lines with RVC compressibility, canonical form, and pair info.

Usage:
    python3 rvc_annotate.py input.s
    python3 rvc_annotate.py < input.s

Each instruction line gets a trailing comment.  Instructions that form a
matched pair are marked PAIR+ (first) and PAIR= (second); unpaired
instructions get no PAIR marker.  Either form is easy to grep for.
"""

import sys
from rv32_core import parse_line
from rv32_scorers import can_compress, make_compact32_scorer
from rv32_analysis import compute_liveness


def _canon(instr) -> str:
    """Format the canonicalised instruction as a compact string."""
    parts = [instr.mnemonic]
    operands = []
    if instr.defs:
        operands += instr.defs
    if instr.mem is not None:
        imm, base = instr.mem
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
    lines = list(lines)

    # Pass 1: parse all instructions, keyed by line index.
    line_to_instr = {}
    instr_seq = []
    for idx, line in enumerate(lines):
        instr = parse_line(idx, line)
        if instr is not None and instr.mnemonic is not None:
            line_to_instr[idx] = instr
            instr_seq.append(instr)

    # Greedy pair walk over instruction sequence.
    liveness = compute_liveness(instr_seq)
    scorer   = make_compact32_scorer(liveness)
    ordered  = sorted(line_to_instr.items())   # [(line_idx, instr), ...]
    pair_tag = {}                               # line_idx -> (rule, is_first)
    i = 0
    while i < len(ordered):
        if i + 1 < len(ordered):
            (a_idx, a), (b_idx, b) = ordered[i], ordered[i + 1]
            rule = scorer._describe_pair(a, b)
            if rule:
                pair_tag[a_idx] = (rule, True)
                pair_tag[b_idx] = (rule, False)
                i += 2
                continue
        i += 1

    # Pass 2: emit lines with annotations.
    for idx, line in enumerate(lines):
        raw   = line.rstrip("\n")
        instr = line_to_instr.get(idx)
        if instr is None:
            print(raw)
            continue
        rvc   = "[rvc]" if can_compress(instr) else "[---]"
        canon = _canon(instr)
        if idx in pair_tag:
            rule, is_first = pair_tag[idx]
            marker = "PAIR+" if is_first else "PAIR="
            print(f"{raw:<48s}  # {marker} [{rule}]  {rvc}  {canon}")
        else:
            print(f"{raw:<48s}  # {rvc}  {canon}")


def main():
    if len(sys.argv) > 1:
        with open(sys.argv[1]) as f:
            annotate(f)
    else:
        annotate(sys.stdin)


if __name__ == "__main__":
    main()
