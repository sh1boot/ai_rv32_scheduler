"""
rv32_objdump.py

Converts ``objdump -d`` disassembly output into plain RV32 assembly source
that the rv32_scheduler parser can process directly.

The converter performs a two-pass scan:

  Pass 1 – collect all addresses defined (function/label headers) and all
            addresses *referenced* by instructions (branch targets, auipc
            PC-relative targets mentioned in the ``# ADDR <sym>`` comment,
            jalr targets, etc.).  Addresses that are referenced but have no
            corresponding function/label header need a synthetic label.

  Pass 2 – emit clean assembly, inserting labels at the right addresses
            and replacing hex address literals in branch/jump operands with
            label names.

Label naming convention
-----------------------
Generated label names encode both the hex address and the *kind* of the
first reference that created them.  All synthetic labels use the ``.L``
prefix, following the GNU assembler convention for local/compiler-generated
labels.  ``_classify_labels`` in ``rv32_core`` explicitly excludes ``.L``
labels from the barrier set, so only named function-entry labels (which
receive ``.globl`` directives) act as scheduling barriers.

  ``.Lbranch_XXXXXXXX``  – address is the target of a branch or jump
                           instruction (beq, bne, …, j, jal, jalr, …).
                           NOT a scheduler barrier — the dependency graph
                           already enforces branch-last ordering via the
                           ``is_branch`` flag.

  ``.Lpcrel_XXXXXXXX``   – address appears only in a ``# ADDR <sym>``
                           side-channel comment on an auipc instruction
                           (PC-relative data/symbol reference).
                           Informational only; no scheduling effect.

  ``.Lref_XXXXXXXX``     – address appears in a ``# ADDR <sym>`` comment
                           on any other instruction.  Informational only.

Named labels from objdump function/local headers (``ADDR <name>:``) are
preserved verbatim when the name is a plain identifier (no ``+`` offset).
Offset entries (``ADDR <name+0xN>:``) are treated as unnamed and get a
synthetic label only if they are referenced.

Usage
-----
As a standalone converter::

    python3 rv32_objdump.py input.objdump > output.s
    python3 rv32_objdump.py -           # read stdin, write stdout
    python3 rv32_objdump.py input.objdump -o output.s

As a library::

    from rv32_objdump import convert
    plain_asm: str = convert(objdump_text)

Then feed *plain_asm* to ``rv32_scheduler.AssemblyScheduler``.
"""

from __future__ import annotations

import re
import sys
import argparse
from typing import Optional

# ---------------------------------------------------------------------------
# Regex patterns for objdump lines
# ---------------------------------------------------------------------------

# Function / local label header:  "ADDR <name>:"
# Group 1 = hex address (no leading 0x), group 2 = label text inside < >.
_RE_LABEL_HDR = re.compile(r"^([0-9a-f]+)\s+<([^>]+)>:\s*$", re.IGNORECASE)

# Instruction line:
#   "ADDR:  HEXBYTES  mnemonic  operands"
# Group 1 = hex address, group 2 = hex encoding bytes (no spaces),
# group 3 = everything after the hex encoding (mnemonic + operands + comment).
_RE_INSTR = re.compile(
    r"^([0-9a-f]+):\s+"          # address
    r"((?:[0-9a-f]{2,8}\s+)+)"   # hex-byte groups (captured)
    r"(\S.*)$",                   # mnemonic + operands (+ optional comment)
    re.IGNORECASE,
)

# Pure data line (two or more 4-byte words, no mnemonic column):
#   "ADDR:  WORD  WORD  ..."
_RE_DATA = re.compile(
    r"^[0-9a-f]+:\s+(?:[0-9a-f]{8}\s+){2,}\s*$",
    re.IGNORECASE,
)

# "..." filler lines that objdump emits for zero-filled regions.
_RE_FILL = re.compile(r"^\s+\.\.\.\s*$")

# Trailing ``# ADDR <sym>`` or ``\t# ADDR <sym>`` annotation on an instruction.
# We capture the numeric address (group 1) and the symbolic name (group 2).
_RE_HASH_ANNOT = re.compile(
    r"[\t ]+#\s+([0-9a-f]+)\s+<([^>]*)>",
    re.IGNORECASE,
)

# Inline ``<name>`` or ``<name+offset>`` annotation that objdump appends to
# branch/jump target operands: "80000034 <bss_done>".
# We want to strip these from the operand field.
_RE_ANGLE_ANNOT = re.compile(r"\s+<[^>]+>")

# Branch and jump mnemonics whose *last* operand is a target address.
# Includes both canonical forms (as objdump emits by default) and the
# explicit c. compressed forms (emitted when --explicit-compressed is active).
_BRANCH_MN = frozenset({
    "beq", "bne", "blt", "bge", "bltu", "bgeu",
    "beqz", "bnez", "blez", "bgez", "bltz", "bgtz",
    "jal", "j", "c.j", "c.jal",
    "c.beqz", "c.bnez",
    # jalr is listed separately because its address operand may be an
    # offset(reg) form; we handle it by looking at the hash comment.
})

# Mnemonics that use PC-relative addressing (auipc family).
_AUIPC_MN = frozenset({"auipc"})


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _is_hex_addr(tok: str) -> bool:
    """Return True if *tok* looks like a bare hex address (no 0x prefix)."""
    t = tok.strip().rstrip(",")
    return bool(re.match(r"^[0-9a-f]{4,8}$", t, re.IGNORECASE))


def _plain_name(label_text: str) -> Optional[str]:
    """
    Return the bare label name from an objdump ``<text>`` field, or None if
    it is an offset reference (``name+0xN``) or contains spaces.

    Plain names are re-used verbatim in the output.  Offset references are
    treated as anonymous; they receive a synthetic ``_branch_``/``_ref_``
    label if they are actually referenced.
    """
    if "+" in label_text or " " in label_text:
        return None
    # Replace characters that are illegal in GNU assembler label names.
    safe = re.sub(r"[^A-Za-z0-9_.$]", "_", label_text)
    return safe if safe else None


def _is_16bit_encoding(hex_field: str) -> bool:
    """Return True when the hex encoding field represents a 16-bit instruction.

    objdump emits exactly 4 hex digits (plus trailing whitespace) for
    compressed (RVC) instructions and 8 digits for standard 32-bit ones.
    """
    return len(hex_field.strip()) == 4


def _decode_c_mnemonic(word: int) -> Optional[str]:
    """
    Decode a 16-bit RVC instruction word and return its canonical ``c.``
    mnemonic, or ``None`` if the encoding is unrecognised or reserved.

    The quadrant (bits [1:0]) and funct3 (bits [15:13]) fields determine the
    instruction class; secondary fields are used where needed to distinguish
    within a class (e.g. ``c.mv`` vs ``c.add``, ``c.jr`` vs ``c.jalr``).

    Reference: RISC-V Compressed ISA, Volume I, Chapter 16.
    """
    quad   = word & 0x3          # bits [1:0]
    funct3 = (word >> 13) & 0x7  # bits [15:13]

    # ── Quadrant 0 ────────────────────────────────────────────────────────
    if quad == 0:
        if funct3 == 0b000:
            return "c.addi4spn" if (word >> 5) & 0xFF else None  # 0 = illegal
        if funct3 == 0b001: return "c.fld"
        if funct3 == 0b010: return "c.lw"
        if funct3 == 0b011: return "c.flw"
        if funct3 == 0b101: return "c.fsd"
        if funct3 == 0b110: return "c.sw"
        if funct3 == 0b111: return "c.fsw"
        return None

    # ── Quadrant 1 ────────────────────────────────────────────────────────
    if quad == 1:
        if funct3 == 0b000:
            rd = (word >> 7) & 0x1F
            return "c.nop" if rd == 0 else "c.addi"
        if funct3 == 0b001: return "c.jal"
        if funct3 == 0b010: return "c.li"
        if funct3 == 0b011:
            rd = (word >> 7) & 0x1F
            return "c.addi16sp" if rd == 2 else "c.lui"
        if funct3 == 0b100:
            funct2 = (word >> 10) & 0x3
            if funct2 == 0b00: return "c.srli"
            if funct2 == 0b01: return "c.srai"
            if funct2 == 0b10: return "c.andi"
            if funct2 == 0b11:
                funct_hi = (word >> 12) & 0x1
                funct2b  = (word >> 5)  & 0x3
                if funct_hi == 0:
                    if funct2b == 0b00: return "c.sub"
                    if funct2b == 0b01: return "c.xor"
                    if funct2b == 0b10: return "c.or"
                    if funct2b == 0b11: return "c.and"
                else:
                    if funct2b == 0b00: return "c.subw"
                    if funct2b == 0b01: return "c.addw"
                return None
        if funct3 == 0b101: return "c.j"
        if funct3 == 0b110: return "c.beqz"
        if funct3 == 0b111: return "c.bnez"
        return None

    # ── Quadrant 2 ────────────────────────────────────────────────────────
    if quad == 2:
        if funct3 == 0b000: return "c.slli"
        if funct3 == 0b001: return "c.fldsp"
        if funct3 == 0b010: return "c.lwsp"
        if funct3 == 0b011: return "c.flwsp"
        if funct3 == 0b100:
            funct_bit = (word >> 12) & 0x1
            rs2       = (word >> 2)  & 0x1F
            rd        = (word >> 7)  & 0x1F
            if funct_bit == 0:
                return "c.mv" if rs2 != 0 else ("c.jr" if rd != 0 else None)
            else:
                if rs2 == 0:
                    return "c.ebreak" if rd == 0 else "c.jalr"
                return "c.add"
        if funct3 == 0b101: return "c.fsdsp"
        if funct3 == 0b110: return "c.swsp"
        if funct3 == 0b111: return "c.fswsp"
        return None

    return None  # quad == 3: not a compressed instruction


def _label_for(addr: int, kind: str) -> str:
    """
    Return the synthetic label name for *addr* of the given *kind*.

    All synthetic labels use the ``.L`` prefix so that ``_classify_labels``
    treats them as local compiler-generated temporaries and does NOT make
    them scheduling barriers.  Only explicitly ``.globl``-declared labels
    (the named function-entry headers) become barriers.

    - ``.Lbranch_XXXXXXXX`` — intra-function branch / jump target
    - ``.Lpcrel_XXXXXXXX``  — auipc PC-relative target (informational only)
    - ``.Lref_XXXXXXXX``    — other hash-comment address (informational only)
    """
    return f".L{kind}_{addr:08x}"


# ---------------------------------------------------------------------------
# Pass 1: scan and classify all addresses
# ---------------------------------------------------------------------------

def _pass1(lines: list[str]) -> tuple[
    dict[int, str],   # addr_to_defined_name: addr -> label name (or synthetic placeholder)
    dict[int, str],   # addr_to_ref_kind:     addr -> 'branch' | 'pcrel' | 'ref'
    set[int],         # branch_target_addrs
]:
    """
    Scan all lines and return:

    addr_to_defined_name
        Maps every address that has an explicit objdump label header to the
        label name we will emit.  Anonymous offset headers (``name+0xN``)
        map to a placeholder that will be filled in from addr_to_ref_kind
        if the address is referenced.

    addr_to_ref_kind
        For every address that is *referenced* (but may or may not be
        *defined* by a header), the kind of the first reference seen.
        Priority: 'branch' > 'pcrel' > 'ref'.

    branch_target_addrs
        The subset of referenced addresses that are branch/jump targets.
        The caller uses this to decide which labels need ``.globl``-style
        visibility in the output (for the scheduler's barrier logic).
    """
    addr_to_defined_name: dict[int, str] = {}
    addr_to_ref_kind: dict[int, str] = {}
    branch_target_addrs: set[int] = set()

    def _note_ref(addr: int, kind: str) -> None:
        # Priority: branch beats pcrel beats ref.
        existing = addr_to_ref_kind.get(addr)
        if existing is None:
            addr_to_ref_kind[addr] = kind
        elif existing == "ref" and kind in ("pcrel", "branch"):
            addr_to_ref_kind[addr] = kind
        elif existing == "pcrel" and kind == "branch":
            addr_to_ref_kind[addr] = kind
        if kind == "branch":
            branch_target_addrs.add(addr)

    for line in lines:
        stripped = line.rstrip()

        # Label header.
        m = _RE_LABEL_HDR.match(stripped)
        if m:
            addr = int(m.group(1), 16)
            name = _plain_name(m.group(2))
            if name is not None:
                addr_to_defined_name[addr] = name
            # Offset headers (name=None) are registered with a placeholder;
            # the real label will be synthesised if the address is referenced.
            else:
                # Register the address as "defined but unnamed" so we know it
                # exists in the disassembly (don't insert a label unless referenced).
                addr_to_defined_name.setdefault(addr, None)  # type: ignore[arg-type]
            continue

        # Instruction line.
        m = _RE_INSTR.match(stripped)
        if not m:
            continue

        rest = m.group(3)   # mnemonic + operands (group 2 is now the hex bytes)

        # Separate the hash annotation from the instruction text.
        hash_m = _RE_HASH_ANNOT.search(rest)
        hash_addr: Optional[int] = None
        hash_name: Optional[str] = None
        if hash_m:
            hash_addr = int(hash_m.group(1), 16)
            hash_name = hash_m.group(2)

        # Strip the hash annotation to get the clean instruction text.
        instr_text = rest
        if hash_m:
            instr_text = rest[: hash_m.start()]
        instr_text = instr_text.rstrip()

        # Get mnemonic.
        parts = instr_text.split(None, 1)
        if not parts:
            continue
        mn = parts[0].lower()
        operands_raw = parts[1] if len(parts) > 1 else ""

        # Branch / jump: last operand is the target address.
        if mn in _BRANCH_MN:
            # Strip any <name> annotation from the operands field.
            ops_clean = _RE_ANGLE_ANNOT.sub("", operands_raw).strip()
            # The target is the last comma-separated token.
            last_tok = ops_clean.split(",")[-1].strip()
            if _is_hex_addr(last_tok):
                _note_ref(int(last_tok, 16), "branch")
            elif hash_addr is not None:
                # Fallback: use the hash-comment address.
                _note_ref(hash_addr, "branch")

        elif mn in _AUIPC_MN:
            # auipc: the hash comment holds the resolved PC-relative address.
            if hash_addr is not None:
                _note_ref(hash_addr, "pcrel")

        else:
            # All other instructions with a hash comment address.
            if hash_addr is not None:
                _note_ref(hash_addr, "ref")

    return addr_to_defined_name, addr_to_ref_kind, branch_target_addrs


# ---------------------------------------------------------------------------
# Build the combined address → label-name map
# ---------------------------------------------------------------------------

def _build_label_map(
    addr_to_defined_name: dict[int, str],
    addr_to_ref_kind: dict[int, str],
) -> dict[int, str]:
    """
    Merge defined and referenced addresses into a single addr → label_name
    map.  Rules:

    - If the address has a *plain* defined name, use it.
    - If the address has only an *anonymous* defined name (offset header) but
      is also referenced, synthesise a label using the reference kind.
    - If the address is *only* referenced (not defined by any header), and the
      reference kind is 'branch' or 'pcrel', synthesise a label.
    - 'ref'-only addresses (hash comments on non-auipc instructions pointing
      outside the disassembled region) are NOT given labels — they don't need
      to be in the assembly text at all since the instruction's immediate
      already encodes the correct value.
    """
    label_map: dict[int, str] = {}

    all_addrs = set(addr_to_defined_name) | set(addr_to_ref_kind)
    for addr in sorted(all_addrs):
        defined_name = addr_to_defined_name.get(addr)  # str or None or missing
        ref_kind = addr_to_ref_kind.get(addr)

        if isinstance(defined_name, str) and defined_name:
            # Named header — always emit.
            label_map[addr] = defined_name
        elif ref_kind in ("branch", "pcrel"):
            # Referenced but unnamed (or offset-only header).
            label_map[addr] = _label_for(addr, ref_kind)
        # else: 'ref'-only with no header, or anonymous header with no
        #       interesting reference → skip.

    return label_map


# ---------------------------------------------------------------------------
# Pass 2: emit clean assembly
# ---------------------------------------------------------------------------

def _pass2(
    lines: list[str],
    label_map: dict[int, str],
    branch_target_addrs: set[int],
    keep_comments: bool,
    explicit_compressed: bool = False,
) -> list[str]:
    """
    Walk the objdump lines and produce clean assembly lines.

    For each instruction address, emit any pending label lines first, then
    the cleaned instruction.  Labels that are branch targets get a preceding
    blank line for readability.
    """
    output: list[str] = []

    # Track which labels we have already emitted so we don't duplicate them
    # when the same address has both a header line and a reference.
    emitted_labels: set[int] = set()

    # Addresses we need to emit in order; we will emit them just before the
    # instruction at that address.  We pre-sort all addresses in label_map.
    label_addrs_sorted = sorted(label_map)
    pending_idx = 0  # index into label_addrs_sorted

    def _flush_pending_labels_up_to(instr_addr: int) -> None:
        """Emit any labels whose address <= instr_addr that haven't been emitted."""
        nonlocal pending_idx
        while pending_idx < len(label_addrs_sorted):
            la = label_addrs_sorted[pending_idx]
            if la > instr_addr:
                break
            if la not in emitted_labels:
                name = label_map[la]
                if la in branch_target_addrs and output and output[-1] != "":
                    output.append("")
                output.append(f"{name}:")
                emitted_labels.add(la)
            pending_idx += 1

    # Track the current function/section context for comments.
    current_section: Optional[str] = None
    in_text_section = False

    for line in lines:
        stripped = line.rstrip()

        # ── File header / section headers ─────────────────────────────────
        if not stripped:
            # Preserve blank lines between functions.
            output.append("")
            continue

        if "file format" in stripped:
            if keep_comments:
                output.append(f"# {stripped}")
            continue

        if stripped.startswith("Disassembly of section"):
            section = stripped.split()[-1].rstrip(":")
            current_section = section
            in_text_section = section in (".text", ".init", ".fini")
            if keep_comments:
                output.append("")
                output.append(f"# {stripped}")
            continue

        # ── Fill / ellipsis lines ──────────────────────────────────────────
        if _RE_FILL.match(stripped):
            if keep_comments:
                output.append(f"\t# ... (zero-filled gap)")
            continue

        # ── Data lines ────────────────────────────────────────────────────
        if _RE_DATA.match(stripped):
            if keep_comments:
                output.append(f"\t# data: {stripped}")
            continue

        # ── Label header ──────────────────────────────────────────────────
        m = _RE_LABEL_HDR.match(stripped)
        if m:
            addr = int(m.group(1), 16)
            label_text = m.group(2)
            name = _plain_name(label_text)

            # Flush any synthetic labels that fall before this address.
            _flush_pending_labels_up_to(addr - 1)

            if addr in label_map and addr not in emitted_labels:
                used_name = label_map[addr]  # may differ from `name` if synthesised
                if addr in branch_target_addrs and output and output[-1] != "":
                    output.append("")
                # Emit .globl for non-local named labels so the scheduler
                # treats them as entry-point barriers.  Local labels
                # (starting with .L) are compiler-generated temporaries
                # and do not need to be globally visible.
                if name is not None and not used_name.startswith(".L"):
                    output.append(f"\t.globl {used_name}")
                output.append(f"{used_name}:")
                emitted_labels.add(addr)
            continue

        # ── Instruction line ───────────────────────────────────────────────
        m = _RE_INSTR.match(stripped)
        if not m:
            # Unrecognised line — pass through as a comment.
            if keep_comments and stripped:
                output.append(f"# {stripped}")
            continue

        instr_addr = int(m.group(1), 16)
        hex_field  = m.group(2)   # hex encoding bytes (with trailing whitespace)
        rest       = m.group(3)   # mnemonic + operands + optional hash comment

        # Separate the hash annotation.
        hash_m = _RE_HASH_ANNOT.search(rest)
        hash_comment = ""
        if hash_m:
            if keep_comments:
                hash_addr_val = int(hash_m.group(1), 16)
                hash_sym = hash_m.group(2)
                # Replace hex address in hash comment with label name if known.
                if hash_addr_val in label_map:
                    hash_comment = f"\t# {label_map[hash_addr_val]}"
                else:
                    hash_comment = f"\t# {hash_sym}" if hash_sym else ""
            rest = rest[: hash_m.start()].rstrip()

        # Strip inline <name> angle annotations from operands.
        rest = _RE_ANGLE_ANNOT.sub("", rest).rstrip()

        # Split mnemonic / operands.
        parts = rest.split(None, 1)
        if not parts:
            continue
        mn = parts[0]
        operands_raw = parts[1].strip() if len(parts) > 1 else ""

        # If --explicit-compressed is active and this is a 16-bit instruction,
        # replace the canonical mnemonic with the exact c. form decoded from
        # the instruction word bits.
        if explicit_compressed and _is_16bit_encoding(hex_field):
            word = int(hex_field.strip(), 16)
            c_mn = _decode_c_mnemonic(word)
            if c_mn is not None:
                mn = c_mn

        # Replace bare hex address tokens in branch/jump operands with labels.
        mn_lower = mn.lower()
        if mn_lower in _BRANCH_MN and operands_raw:
            ops = operands_raw.split(",")
            last = ops[-1].strip()
            if _is_hex_addr(last):
                target_addr = int(last, 16)
                if target_addr in label_map:
                    ops[-1] = " " + label_map[target_addr]
                    operands_raw = ",".join(ops)

        # Emit any pending labels whose address falls at or before this instruction.
        _flush_pending_labels_up_to(instr_addr)

        # Build the clean assembly line.
        if operands_raw:
            asm_line = f"\t{mn}\t{operands_raw}{hash_comment}"
        else:
            asm_line = f"\t{mn}{hash_comment}"

        output.append(asm_line)

    # Flush any remaining labels (e.g. at end of file, after last instruction).
    if pending_idx < len(label_addrs_sorted):
        for la in label_addrs_sorted[pending_idx:]:
            if la not in emitted_labels:
                name = label_map[la]
                if la in branch_target_addrs and output and output[-1] != "":
                    output.append("")
                output.append(f"{name}:")

    return output


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

def convert(
    source: str,
    *,
    keep_comments: bool = True,
    explicit_compressed: bool = False,
) -> str:
    """
    Convert *source* (an ``objdump -d`` disassembly string) to plain
    RV32 assembly suitable for ``rv32_scheduler.AssemblyScheduler``.

    Parameters
    ----------
    source
        The full text of an ``objdump -d`` dump, or any contiguous slice of
        it beginning at a function header or instruction line.
    keep_comments
        If True (default), preserve informational ``# ...`` comments in the
        output (section headers, hash-comment addresses resolved to label
        names, data / fill markers).  Set to False for a minimal output with
        no comments.
    explicit_compressed
        If True, 16-bit (RVC) instructions are emitted with their exact
        ``c.`` mnemonic (e.g. ``c.mv``, ``c.addi``, ``c.swsp``) rather than
        the canonical form that objdump normally uses.

    Returns
    -------
    str
        The converted assembly text, ready to be written to a ``.s`` file or
        passed directly to the scheduler.
    """
    lines = source.splitlines()

    addr_to_defined_name, addr_to_ref_kind, branch_target_addrs = _pass1(lines)
    label_map = _build_label_map(addr_to_defined_name, addr_to_ref_kind)
    output_lines = _pass2(lines, label_map, branch_target_addrs,
                          keep_comments, explicit_compressed)

    # Strip leading/trailing blank lines, add a trailing newline.
    while output_lines and output_lines[0] == "":
        output_lines.pop(0)
    while output_lines and output_lines[-1] == "":
        output_lines.pop()
    return "\n".join(output_lines) + "\n"


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def _build_arg_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="rv32_objdump",
        description=(
            "Convert objdump -d disassembly to plain RV32 assembly.\n\n"
            "Branch-target addresses become _branch_XXXXXXXX labels.\n"
            "PC-relative (auipc) target addresses become _pcrel_XXXXXXXX labels.\n"
            "Named function headers are preserved verbatim with .globl directives.\n"
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    p.add_argument(
        "input",
        nargs="?",
        default="-",
        metavar="FILE",
        help="objdump -d output file (default: stdin)",
    )
    p.add_argument(
        "-o", "--output",
        default="-",
        metavar="FILE",
        help="output assembly file (default: stdout)",
    )
    p.add_argument(
        "--no-comments",
        action="store_true",
        help="omit informational comments from the output",
    )
    p.add_argument(
        "--explicit-compressed",
        action="store_true",
        help="emit c. mnemonics (c.mv, c.addi, c.swsp, …) for 16-bit RVC "
             "instructions instead of the canonical form objdump uses",
    )
    p.add_argument(
        "--list-labels",
        action="store_true",
        help="instead of converting, print a table of address→label mappings",
    )
    return p


def main(argv: list[str] | None = None) -> int:
    args = _build_arg_parser().parse_args(argv)

    # Read input.
    if args.input == "-":
        source = sys.stdin.read()
    else:
        try:
            with open(args.input, encoding="utf-8", errors="replace") as fh:
                source = fh.read()
        except OSError as exc:
            print(f"rv32_objdump: error reading '{args.input}': {exc}", file=sys.stderr)
            return 1

    if args.list_labels:
        lines = source.splitlines()
        defined, ref_kind, branch_addrs = _pass1(lines)
        label_map = _build_label_map(defined, ref_kind)
        print(f"{'Address':>12}  {'Kind':<8}  Label")
        print("-" * 50)
        for addr in sorted(label_map):
            has_named_hdr = isinstance(defined.get(addr), str) and defined.get(addr)
            kind = "defined" if has_named_hdr else ref_kind.get(addr, "defined")
            bt = " [branch target]" if addr in branch_addrs else ""
            print(f"  0x{addr:08x}  {kind:<8}  {label_map[addr]}{bt}")
        return 0

    result = convert(source, keep_comments=not args.no_comments,
                    explicit_compressed=args.explicit_compressed)

    # Write output.
    if args.output == "-":
        sys.stdout.write(result)
    else:
        try:
            with open(args.output, "w", encoding="utf-8") as fh:
                fh.write(result)
        except OSError as exc:
            print(f"rv32_objdump: error writing '{args.output}': {exc}", file=sys.stderr)
            return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
