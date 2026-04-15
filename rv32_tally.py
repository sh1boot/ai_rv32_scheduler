"""
rv32_tally.py

Post-processing analysis tool for rv32_scheduler.py output.

Reads annotated assembly from one or more files (or stdin), parses the
PAIR+, PAIR=, TALLY-A:, TALLY-B:, and CLASS: annotations written by
rv32_scheduler.py, and produces cross-tab tables and counts.

Annotation format (written by rv32_scheduler.py)
-------------------------------------------------
    instr  # PAIR+ [rule_name]   — primary pair, A-side (first instruction)
    instr  # PAIR=               — primary pair, B-side (second instruction)
    instr  # TALLY-A:r1,r2 TALLY-B:r3 CLASS:cls1,cls2
        TALLY-A:rules  — comma-separated list of tally rules this instruction
                         is eligible for as A-side (first of pair)
        TALLY-B:rules  — comma-separated list of tally rules this instruction
                         is eligible for as B-side (second of pair)
        CLASS:classes  — comma-separated list of instruction classes
                         (arith, mem, control, big, rvc)

Usage
-----
    python rv32_tally.py scheduled.s
    python rv32_tally.py scheduled.s --rule chain
    python rv32_tally.py scheduled.s --rule chain --cols control
    python rv32_tally.py scheduled.s --pairs               # show A/B adjacent pairs
    python rv32_tally.py - < scheduled.s                   # read from stdin

"""
import re, sys, argparse, shutil
from collections import Counter

from rv32_core import parse_line

# ---------------------------------------------------------------------------
# Annotation parsing
# ---------------------------------------------------------------------------

# Grabs the mnemonic (first token of the instruction field, before registers).
# Assembly lines are expected in the form:
#   <optional_whitespace><mnemonic><rest>  # <annotations>
_INSTR_RE    = re.compile(r'^\s+(\S+)')
_PAIR_A_RE   = re.compile(r'#\s*PAIR\+\s*(?:\[([^\]]*)\])?')
_PAIR_B_RE   = re.compile(r'#\s*PAIR=')
_TALLY_A_RE  = re.compile(r'TALLY-A:([\w,]+)')
_TALLY_B_RE  = re.compile(r'TALLY-B:([\w,]+)')
_CLASS_RE    = re.compile(r'CLASS:([\w,]+)')


class AnnotatedInstr:
    """Parsed record for one instruction line."""
    __slots__ = ("mnemonic", "is_pair_a", "pair_rule", "is_pair_b",
                 "tally_a", "tally_b", "classes", "parsed")

    def __init__(self):
        self.mnemonic: str       = ""
        self.is_pair_a: bool     = False
        self.pair_rule: str      = ""
        self.is_pair_b: bool     = False
        self.tally_a:  set       = set()   # rule names where eligible as A-side
        self.tally_b:  set       = set()   # rule names where eligible as B-side
        self.classes:  frozenset = frozenset()
        # Full Instruction record (defs/uses/is_load/etc.) for dependency
        # analysis when reordering around skipped neighbours.  None if
        # parse_line could not decode the instruction.
        self.parsed:   object    = None


def parse_annotated_stream(lines):
    """
    Yield AnnotatedInstr objects for every instruction line in *lines*.

    Lines that are not instruction lines (labels, directives, blank lines,
    pure comment lines) are silently skipped.
    """
    for line in lines:
        # Only process lines that start with whitespace (indented instructions).
        m = _INSTR_RE.match(line)
        if m is None:
            continue
        mnemonic = m.group(1)
        # Skip pure-comment pseudo-instructions and directives.
        if mnemonic.startswith("#") or mnemonic.startswith("."):
            continue

        ai = AnnotatedInstr()
        ai.mnemonic = mnemonic
        # parse_line strips comments itself and returns None for non-instruction
        # lines.  We feed the original line so it sees the same operand text
        # that the scheduler did.
        try:
            ai.parsed = parse_line(0, line)
        except Exception:
            ai.parsed = None

        # Extract comment portion (everything after the first '#' not inside
        # the instruction operands).
        comment_idx = line.find("#")
        comment = line[comment_idx:] if comment_idx >= 0 else ""

        # PAIR+ annotation
        m_pa = _PAIR_A_RE.search(comment)
        if m_pa:
            ai.is_pair_a = True
            ai.pair_rule = (m_pa.group(1) or "").strip()

        # PAIR= annotation
        if _PAIR_B_RE.search(comment):
            ai.is_pair_b = True

        # TALLY-A / TALLY-B annotations (comma-separated rule lists)
        m_ta = _TALLY_A_RE.search(comment)
        if m_ta:
            ai.tally_a = set(m_ta.group(1).split(","))
        m_tb = _TALLY_B_RE.search(comment)
        if m_tb:
            ai.tally_b = set(m_tb.group(1).split(","))

        # CLASS annotation
        m_cls = _CLASS_RE.search(comment)
        if m_cls:
            ai.classes = frozenset(m_cls.group(1).split(","))

        yield ai


# ---------------------------------------------------------------------------
# Tally helpers
# ---------------------------------------------------------------------------

_TALLY_ARITH_MN: frozenset = frozenset({
    "add",  "addw",  "sub",  "subw",  "neg",  "negw",
    "addi", "addiw",
    "and",  "or",  "xor",  "not",
    "andi", "ori", "xori",
    "sll",  "sllw", "srl",  "srlw", "sra",  "sraw",
    "slli", "slliw","srli", "srliw","srai", "sraiw",
    "slt",  "sltu", "slti", "sltiu",
    "seqz", "snez", "sltz", "sgtz",
    "mul",  "mulh", "mulhu","mulhsu","mulw",
    "div",  "divu", "rem",  "remu",
    "divw", "divuw","remw", "remuw",
    "mv", "li",
    "bic",  "andn", "xnor",
    "sh1add","sh2add","sh3add",
    "add.uw", "slli.uw",
    "min",  "minu", "max",  "maxu",
    "clz",  "ctz",  "cpop", "rev8",
    "clzw", "ctzw", "cpopw",
    "sext.b","sext.h","zext.h",
    "bset", "bclr", "binv", "bext",
    "bseti","bclri","binvi","bexti",
    "ror",  "rol",  "rori", "orc.b",
    "rorw", "rolw", "roriw",
    # Zicond
    "czero.eqz", "czero.nez",
})

_TALLY_CONTROL_MN: frozenset = frozenset({
    "beq",  "bne",  "blt",  "bge",  "bltu", "bgeu",
    "beqz", "bnez", "blez", "bgez", "bltz", "bgtz",
    "j",    "jal",  "jalr", "jr",
    "ret",  "call", "tail",
    "ecall","ebreak","nop",
    "fence","fence.i","sfence.vma",
    "mret", "sret", "uret",
    "c.beqz","c.bnez","c.j","c.jal","c.jalr","c.jr",
})

_TALLY_MEM_MN: frozenset = frozenset({
    "lb",  "lbu", "lh",  "lhu", "lw",  "lwu", "ld",
    "flw", "fld",
    "sb",  "sh",  "sw",  "sd",
    "fsw", "fsd",
})

# lui and auipc are the canonical "big-immediate" mnemonics: they always carry
# a 20-bit upper immediate.  Other instructions may also be tagged CLASS:big
# (when their immediate exceeds the compact 5-bit threshold), but those are
# identified by their CLASS annotation rather than by mnemonic alone.
_TALLY_BIG_MN: frozenset = frozenset({"lui", "auipc"})

# "rvc" has no mnemonic-only membership: an instruction is RVC-compressible
# only when register and immediate constraints line up.  The scheduler emits
# CLASS:rvc per-instance; filters on "rvc" rely on that annotation via the
# classes-set intersection in _instr_excluded / _matches_filter.
_TALLY_GROUP: dict = {
    "arith":   _TALLY_ARITH_MN,
    "mem":     _TALLY_MEM_MN,
    "control": _TALLY_CONTROL_MN,
    "big":     _TALLY_BIG_MN,
    "rvc":     frozenset(),
}


def _mn_in_group(mn: str, group_tok: str) -> bool:
    """True if *mn* belongs to the class named *group_tok*."""
    if group_tok in _TALLY_GROUP:
        return mn in _TALLY_GROUP[group_tok]
    return mn == group_tok


def _matches_filter(mn: str, filter_toks: "frozenset[str]") -> bool:
    """True if *mn* matches any token in *filter_toks* (class name or mnemonic)."""
    if not filter_toks:
        return True
    return any(_mn_in_group(mn, tok) for tok in filter_toks)


def _can_commute(x, y) -> bool:
    """True if instructions *x* and *y* can be swapped without changing
    program semantics — i.e. there is no register, memory, CSR, or barrier
    dependency between them.

    Conservative: if either instruction is missing parsed metadata (e.g.
    parse_line returned None for an unknown mnemonic) the answer is False.
    Memory ops are conservative too — any pairing that involves a store on
    either side is treated as conflicting, since the tally tool has no
    alias analysis.
    """
    if x is None or y is None:
        return False
    if getattr(x, "is_barrier", False) or getattr(y, "is_barrier", False):
        return False
    x_load  = getattr(x, "is_load",  False)
    x_store = getattr(x, "is_store", False)
    y_load  = getattr(y, "is_load",  False)
    y_store = getattr(y, "is_store", False)
    x_mem   = x_load or x_store
    y_mem   = y_load or y_store
    if (x_store and y_mem) or (y_store and x_mem):
        return False
    x_cdef = set(getattr(x, "csr_defs", []) or ())
    y_cdef = set(getattr(y, "csr_defs", []) or ())
    x_cuse = set(getattr(x, "csr_uses", []) or ())
    y_cuse = set(getattr(y, "csr_uses", []) or ())
    if (x_cdef & y_cuse) or (y_cdef & x_cuse) or (x_cdef & y_cdef):
        return False
    x_def = set(getattr(x, "defs", []) or ())
    y_def = set(getattr(y, "defs", []) or ())
    x_use = set(getattr(x, "uses", []) or ())
    y_use = set(getattr(y, "uses", []) or ())
    if (x_def & y_use) or (y_def & x_use) or (x_def & y_def):
        return False
    return True


def _instr_excluded(ai: "AnnotatedInstr", exclude: "frozenset[str]") -> bool:
    """True if *ai* should be excluded based on *exclude* tokens.

    Checks both mnemonic-based group membership (handles lui/auipc etc.) and
    the CLASS: annotation on the instruction (handles big-immediate instructions
    of other mnemonics such as ``addi`` with an out-of-range immediate).
    """
    if not exclude:
        return False
    if any(_mn_in_group(ai.mnemonic, tok) for tok in exclude):
        return True
    # CLASS annotation check: covers e.g. addi with big immediate
    return bool(ai.classes & exclude)


# ---------------------------------------------------------------------------
# Cross-tab table renderer
# ---------------------------------------------------------------------------

def _opcode_tally_lines(
    singleton_tally: dict,
    opcode_tally: dict,
    header: str = "opcode pair table (rows=A-side, cols=B-side, +total):",
    grid_rows: int = 20,
    grid_cols: int = 20,
    exclude: "frozenset[str]" = frozenset({"lui", "auipc"}),
    col_include: "frozenset[str]" = frozenset(),
    sort_col_by: str = "",
) -> list:
    """Format a cross-tab grid and return it as a list of comment strings.

    singleton_tally : {(mn_a, mn_b): count}
    opcode_tally    : {mn_a: count}          (row totals)
    exclude         : class/mnemonic tokens to hide from rows AND columns
    col_include     : if non-empty, restrict columns to these class/mnemonic tokens
    sort_col_by     : if non-empty, rank columns by their count in this row's
                      mnemonic instead of by overall column total
    """
    def _excluded(mn: str) -> bool:
        return any(_mn_in_group(mn, tok) for tok in exclude)

    def _include_col(mn: str) -> bool:
        if not col_include:
            return True
        return _matches_filter(mn, col_include)

    def _row_group(mn: str) -> int:
        for i, g in enumerate(("arith", "mem", "control")):
            if mn in _TALLY_GROUP[g]:
                return i
        return 3

    _GROUP_LABELS = ("arith", "mem", "control", "other")

    all_mn       = set(opcode_tally)
    actual_total = sum(opcode_tally.values())
    visible_mn   = [mn for mn in all_mn if not _excluded(mn)]
    visible_mn.sort(key=lambda mn: (_row_group(mn), -opcode_tally.get(mn, 0)))
    row_ops      = visible_mn[:grid_rows]

    tbl = dict(singleton_tally)

    all_col_mn     = {b for (_, b) in singleton_tally
                      if b and not _excluded(b) and _include_col(b)}
    col_totals_all = {b: sum(tbl.get((a, b), 0) for a in visible_mn)
                      for b in all_col_mn}
    if sort_col_by:
        # Rank columns by how often the chosen A-row pairs with each B,
        # falling back to overall column total to break ties / handle zeros.
        col_sort_key = lambda kv: (-tbl.get((sort_col_by, kv[0]), 0), -kv[1])
    else:
        col_sort_key = lambda kv: -kv[1]
    col_ops    = [mn for mn, _ in
                  sorted(col_totals_all.items(), key=col_sort_key)[:grid_cols]]
    col_totals = {b: col_totals_all[b] for b in col_ops}
    grand_total = sum(opcode_tally.get(mn, 0) for mn in visible_mn)
    hidden      = actual_total - grand_total

    if not row_ops and not col_ops:
        return []

    # -- Per-row "top next": most frequent B-side opcode for each row ------
    # Considers ALL B-side opcodes (not just displayed columns).
    row_top_next: dict = {}   # mn_a -> (mn_b, count)
    for mn_a in row_ops:
        best_mn, best_cnt = "", 0
        for (a, b), cnt in tbl.items():
            if a == mn_a and b and cnt > best_cnt:
                best_mn, best_cnt = b, cnt
        if best_cnt:
            row_top_next[mn_a] = (best_mn, best_cnt)

    # -- Per-column "top prev": most frequent A-side opcode for each col ---
    # Considers ALL A-side opcodes (not just displayed rows).
    col_top_prev: dict = {}   # mn_b -> (mn_a, count)
    for mn_b in col_ops:
        best_mn, best_cnt = "", 0
        for (a, b), cnt in tbl.items():
            if b == mn_b and a and cnt > best_cnt:
                best_mn, best_cnt = a, cnt
        if best_cnt:
            col_top_prev[mn_b] = (best_mn, best_cnt)

    col_w   = max((len(mn) for mn in col_ops), default=4)
    row_w   = max((len(mn) for mn in row_ops), default=4)
    total_w = max(5, max((len(str(opcode_tally.get(mn, 0))) for mn in row_ops), default=1))
    total_w = max(total_w, len(str(actual_total)))

    # Width for the two "top next" suffix columns.
    top_mn_w = max((len(mn) for mn, _ in row_top_next.values()), default=4)
    top_mn_w = max(top_mn_w, len("next"))
    top_ct_w = max((len(str(ct)) for _, ct in row_top_next.values()), default=1)
    top_ct_w = max(top_ct_w, 1)

    def _suffix(mn_a: str) -> str:
        if mn_a in row_top_next:
            tmn, tct = row_top_next[mn_a]
            return f"  {tmn:>{top_mn_w}} {tct:>{top_ct_w}d}"
        return ""

    lines = [f"# {header}"]
    if hidden:
        lines.append(f"#   ({hidden} of {actual_total} hidden)")
    if col_include:
        lines.append(f"#   (columns restricted to: {', '.join(sorted(col_include))})")
    hdr_line = (f"# {'':>{row_w}}  {'total':>{total_w}}"
                + ("  " + "  ".join(f"{mn:>{col_w}}" for mn in col_ops)
                   if col_ops else "")
                + f"  {'next':>{top_mn_w}}")
    lines.append(hdr_line)

    tot_row = f"# {'':>{row_w}}  {actual_total:>{total_w}d}"
    if col_ops:
        tot_row += "  " + "  ".join(
            f"{col_totals[b]:>{col_w}d}" if col_totals[b] else " " * col_w
            for b in col_ops)
    lines.append(tot_row)

    current_group = -1
    for mn_a in row_ops:
        g = _row_group(mn_a)
        if g != current_group:
            current_group = g
            lines.append(f"# {'--- ' + _GROUP_LABELS[g] + ' ---':>{row_w + total_w + 3}}")
        row = f"# {mn_a:<{row_w}}  {opcode_tally.get(mn_a, 0):>{total_w}d}"
        if col_ops:
            cells = [f"{tbl.get((mn_a, b), 0):>{col_w}d}"
                     if tbl.get((mn_a, b), 0) else " " * col_w
                     for b in col_ops]
            row += "  " + "  ".join(cells)
        row += _suffix(mn_a)
        lines.append(row)

    # -- Bottom summary rows: top prev opcode and count per column ---------
    if col_ops:
        prev_mn_row = f"# {'prev':<{row_w}}  {'':>{total_w}}"
        prev_ct_row = f"# {'':>{row_w}}  {'':>{total_w}}"
        prev_mn_row += "  " + "  ".join(
            f"{col_top_prev[b][0]:>{col_w}}" if b in col_top_prev
            else " " * col_w
            for b in col_ops)
        prev_ct_row += "  " + "  ".join(
            f"{col_top_prev[b][1]:>{col_w}d}" if b in col_top_prev
            else " " * col_w
            for b in col_ops)
        lines.append(prev_mn_row)
        lines.append(prev_ct_row)

    return lines


# ---------------------------------------------------------------------------
# Main analysis logic
# ---------------------------------------------------------------------------

def analyse(instrs: "list[AnnotatedInstr]",
            rule: str = "",
            cols: "frozenset[str]" = frozenset(),
            exclude: "frozenset[str]" = frozenset({"big"}),
            pairs_mode: bool = False,
            grid_rows: int = 20,
            grid_cols: int = 20,
            sort_col_by: str = "") -> list:
    """
    Produce tally output lines for *instrs*.

    rule
        If non-empty, filter to instructions annotated with TALLY:<rule>:A/B.
        Empty = show unpaired opcode distribution regardless of tally tags.
    cols
        Restrict B-side columns to these class/mnemonic tokens.
    exclude
        Hide these class/mnemonic tokens from both rows and columns.
    pairs_mode
        When True, only count (A, B) pairs where A immediately precedes B in
        the unpaired sequence and A has TALLY:rule:A and B has TALLY:rule:B.
        When False (default), show A-side counts only (the row totals reflect
        how often each opcode appears as A-side eligible for the rule).
    """
    lines = []

    # ── Single-instruction counts ─────────────────────────────────────────
    # Count each unpaired instruction that matches the requested rule filter.
    # singleton_tally : {(mn_a, mn_b): count} where mn_b is the NEXT unpaired
    #                   instruction's mnemonic (or "" if none follows).
    # opcode_tally    : {mn_a: count}

    singleton_tally: Counter = Counter()
    opcode_tally:    Counter = Counter()

    # Walk the instruction list.  Excluded and already-paired instructions
    # do not break the (prev → cand) chain on their own — the scheduler is
    # free to reorder around them provided no register/memory/CSR/barrier
    # dependency forbids the move.  We accumulate them in *skipped* and
    # only count (prev, cand) when every skipped neighbour can commute
    # with cand (so cand can be lifted up to prev).
    prev:    "AnnotatedInstr | None" = None
    skipped: list                     = []

    for ai in instrs:
        if ai.is_pair_a or ai.is_pair_b or _instr_excluded(ai, exclude):
            if prev is not None:
                skipped.append(ai)
            continue

        a_ok = (not rule) or (rule in ai.tally_a)
        b_ok = (not rule) or (rule in ai.tally_b)

        if prev is not None:
            prev_a_ok = (not rule) or (rule in prev.tally_a)
            cur_b_ok  = b_ok
            # In pairs mode B must be rule-eligible; in default mode B is
            # any non-excluded/non-paired instruction.
            count_pair = prev_a_ok and (cur_b_ok if pairs_mode else True)
            if count_pair and all(_can_commute(s.parsed, ai.parsed)
                                  for s in skipped):
                singleton_tally[(prev.mnemonic, ai.mnemonic)] += 1
                if pairs_mode:
                    opcode_tally[prev.mnemonic] += 1

        if a_ok and not pairs_mode:
            opcode_tally[ai.mnemonic] += 1

        prev = ai
        skipped = []

    if not opcode_tally and not singleton_tally:
        mode_desc = "pairs" if pairs_mode else "A-side"
        rule_desc = f" for rule '{rule}'" if rule else ""
        lines.append(f"# (no unpaired {mode_desc} found{rule_desc})")
        return lines

    mode_str  = "pairs (A-side then B-side)" if pairs_mode else "A-side eligible"
    rule_str  = f" [{rule}]" if rule else ""
    hdr = (f"tally{rule_str} {mode_str}"
           f" (rows=A-side, cols=next-unpaired, +total):")
    lines.extend(_opcode_tally_lines(
        singleton_tally, opcode_tally,
        header=hdr,
        grid_rows=grid_rows, grid_cols=grid_cols,
        exclude=exclude, col_include=cols,
        sort_col_by=sort_col_by,
    ))
    return lines


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(
        description="Analyse TALLY:/CLASS: annotations from rv32_scheduler.py output.")
    ap.add_argument("input", nargs="*", default=["-"],
                    help="Annotated assembly files to read (default: stdin).")
    ap.add_argument("--rule", default="", metavar="RULE",
                    help="Restrict analysis to instructions annotated with "
                         "TALLY:<RULE>:A or TALLY:<RULE>:B.  Empty = all unpaired.")
    ap.add_argument("--cols", default="", metavar="CATEGORIES",
                    help="Restrict B-side columns to these class/mnemonic tokens. "
                         "Group tokens: arith, mem, control, big.  "
                         "Or bare mnemonics.  Comma-separated.  "
                         "Empty (default) = all columns.")
    ap.add_argument("--exclude", default="big", metavar="CATEGORIES",
                    help="Hide these class/mnemonic tokens from rows and columns. "
                         "Same tokens as --cols.  'big' excludes lui, auipc, and "
                         "any instruction annotated CLASS:big (large immediate).  "
                         "Default: 'big'.")
    ap.add_argument("--sort-by", default="", metavar="MNEMONIC",
                    help="Sort columns by their count in row MNEMONIC instead "
                         "of by overall column total.  Empty (default) = sort "
                         "by total.")
    ap.add_argument("--pairs", action="store_true",
                    help="Count adjacent (A-eligible, B-eligible) pairs rather "
                         "than individual A-side instructions.")
    ap.add_argument("--grid-rows", type=int, default=20, metavar="N",
                    help="Number of row opcodes shown (default: 20).")
    _default_grid_cols = max(5, (shutil.get_terminal_size(fallback=(120, 24)).columns
                                 - 20) // 10)
    ap.add_argument("--grid-cols", type=int, default=_default_grid_cols, metavar="N",
                    help=f"Number of column opcodes shown "
                         f"(default: {_default_grid_cols}, derived from terminal width).")
    args = ap.parse_args()

    col_include = frozenset(t.strip() for t in args.cols.split(",") if t.strip())
    exclude     = frozenset(t.strip() for t in args.exclude.split(",") if t.strip())

    # Read all input files.
    all_lines: list = []
    for fname in args.input:
        if fname == "-":
            all_lines.extend(sys.stdin.readlines())
        else:
            with open(fname) as f:
                all_lines.extend(f.readlines())

    instrs = list(parse_annotated_stream(all_lines))

    output = analyse(
        instrs,
        rule        = args.rule,
        cols        = col_include,
        exclude     = exclude,
        pairs_mode  = args.pairs,
        grid_rows   = args.grid_rows,
        grid_cols   = args.grid_cols,
        sort_col_by = args.sort_by,
    )
    for line in output:
        print(line)


if __name__ == "__main__":
    main()
