"""
rv32_tally.py

Post-processing analysis tool for rv32_scheduler.py output.

Reads annotated assembly from one or more files (or stdin), parses the
PAIR+, PAIR=, MISS-A, and MISS-B annotations written by rv32_scheduler.py,
and produces aggregate statistics on near-misses in the pairing logic.

Annotation format (written by rv32_scheduler.py)
-------------------------------------------------
    instr  # PAIR+ [rule_name]    primary pair, first instruction
    instr  # PAIR=                primary pair, second instruction
    instr  # MISS-A:<cat>[<rule>:<reason>, ...] MISS-B:<cat>[<rule>:<reason>, ...]

Each ``MISS-<side>`` tag names a rule category the instruction was
structurally eligible for on that side and lists the per-rule rejection
reasons.  A single instruction can have multiple categories per side and
separate A-side and B-side entries.

Usage
-----
    python rv32_tally.py scheduled.s
    python rv32_tally.py scheduled.s --category chain
    python rv32_tally.py scheduled.s --pairs
    python rv32_tally.py - < scheduled.s

"""
import re, sys, argparse, shutil
from collections import Counter, defaultdict

from rv32_core import parse_line


# ---------------------------------------------------------------------------
# Annotation parsing
# ---------------------------------------------------------------------------

_INSTR_RE    = re.compile(r'^\s+(\S+)')
_PAIR_A_RE   = re.compile(r'#\s*PAIR\+\s*(?:\[([^\]]*)\])?')
_PAIR_B_RE   = re.compile(r'#\s*PAIR=')
# Match MISS-A or MISS-B, capturing the category name and the bracketed body.
_MISS_RE     = re.compile(r'MISS-([AB]):(\w+)\[([^\]]*)\]')


class AnnotatedInstr:
    """Parsed record for one instruction line."""
    __slots__ = ("mnemonic", "is_pair_a", "pair_rule", "is_pair_b",
                 "miss_a", "miss_b", "parsed")

    def __init__(self):
        self.mnemonic:  str       = ""
        self.is_pair_a: bool      = False
        self.pair_rule: str       = ""
        self.is_pair_b: bool      = False
        # miss_a / miss_b: {category: [(rule_name, reason), ...]}
        self.miss_a:    dict      = {}
        self.miss_b:    dict      = {}
        self.parsed:    object    = None


def _parse_miss_body(body: str) -> list:
    """Parse ``rule1:reason1,rule2:reason2`` into ``[(rule, reason), ...]``."""
    entries = []
    for item in body.split(","):
        item = item.strip()
        if not item:
            continue
        rule, _, reason = item.partition(":")
        entries.append((rule, reason))
    return entries


def parse_annotated_stream(lines):
    """Yield AnnotatedInstr objects for every instruction line in *lines*."""
    for line in lines:
        m = _INSTR_RE.match(line)
        if m is None:
            continue
        mnemonic = m.group(1)
        if mnemonic.startswith("#") or mnemonic.startswith("."):
            continue

        ai = AnnotatedInstr()
        ai.mnemonic = mnemonic
        try:
            ai.parsed = parse_line(0, line)
        except Exception:
            ai.parsed = None

        comment_idx = line.find("#")
        comment = line[comment_idx:] if comment_idx >= 0 else ""

        m_pa = _PAIR_A_RE.search(comment)
        if m_pa:
            ai.is_pair_a = True
            ai.pair_rule = (m_pa.group(1) or "").strip()

        if _PAIR_B_RE.search(comment):
            ai.is_pair_b = True

        for side, cat, body in _MISS_RE.findall(comment):
            target = ai.miss_a if side == "A" else ai.miss_b
            target.setdefault(cat, []).extend(_parse_miss_body(body))

        yield ai


# ---------------------------------------------------------------------------
# Aggregation
# ---------------------------------------------------------------------------

class TallyReport:
    """Aggregated counts over a sequence of AnnotatedInstr objects."""

    def __init__(self):
        self.total_instrs:       int     = 0
        self.paired_instrs:      int     = 0
        self.pairs_by_rule:      Counter = Counter()
        # cat_reason[side]  : {(cat, reason): count}
        # cat_rule_reason   : {(side, cat, rule, reason): count}
        # cat_instances[side]: {cat: count}           (instrs that qualified)
        self.cat_reason:         dict    = {"A": Counter(), "B": Counter()}
        self.cat_rule_reason:    Counter = Counter()
        self.cat_instances:      dict    = {"A": Counter(), "B": Counter()}
        # Opcode cross-tab of adjacent unpaired instructions.
        self.unpaired_opcodes:   Counter = Counter()
        self.unpaired_adjacent:  Counter = Counter()   # {(mn_a, mn_b): count}

    def accumulate(self, instrs: "list[AnnotatedInstr]") -> None:
        self.total_instrs += len(instrs)
        prev_unpaired: "AnnotatedInstr | None" = None
        for ai in instrs:
            if ai.is_pair_a:
                self.paired_instrs += 1
                if ai.pair_rule:
                    self.pairs_by_rule[ai.pair_rule] += 1
                prev_unpaired = None
                continue
            if ai.is_pair_b:
                self.paired_instrs += 1
                prev_unpaired = None
                continue

            # Unpaired instruction.
            self.unpaired_opcodes[ai.mnemonic] += 1
            if prev_unpaired is not None:
                self.unpaired_adjacent[(prev_unpaired.mnemonic, ai.mnemonic)] += 1

            for side, bucket in (("A", ai.miss_a), ("B", ai.miss_b)):
                for cat, entries in bucket.items():
                    self.cat_instances[side][cat] += 1
                    for rule, reason in entries:
                        self.cat_reason[side][(cat, reason)] += 1
                        self.cat_rule_reason[(side, cat, rule, reason)] += 1

            prev_unpaired = ai


# ---------------------------------------------------------------------------
# Reporting
# ---------------------------------------------------------------------------

def _headline_lines(r: TallyReport) -> list:
    lines = ["# ── Pair summary ──"]
    lines.append(f"#   total instructions : {r.total_instrs}")
    lines.append(f"#   paired instructions: {r.paired_instrs}")
    lines.append(f"#   unpaired           : {r.total_instrs - r.paired_instrs}")
    if r.pairs_by_rule:
        lines.append("#   pairs by rule:")
        for rule, cnt in r.pairs_by_rule.most_common():
            lines.append(f"#     {rule:26s} {cnt:>8d}")
    return lines


def _category_reason_lines(r: TallyReport, side: str,
                           category: str = "") -> list:
    """Render a (category, reason) -> count table for one side."""
    label = "A-side (next partner)" if side == "A" else "B-side (prev partner)"
    bucket = r.cat_reason[side]
    if category:
        bucket = Counter({k: v for k, v in bucket.items() if k[0] == category})
    if not bucket:
        return [f"# ── {label} near-miss reasons "
                f"{'[' + category + ']' if category else ''}──",
                f"#   (no entries)"]
    # Group by category, sort reasons by count.
    by_cat: dict = defaultdict(list)
    for (cat, reason), cnt in bucket.items():
        by_cat[cat].append((reason, cnt))
    for cat in by_cat:
        by_cat[cat].sort(key=lambda p: (-p[1], p[0]))

    lines = [f"# ── {label} near-miss reasons "
             f"{'[' + category + ']' if category else ''}──"]
    for cat in sorted(by_cat, key=lambda c: -sum(n for _, n in by_cat[c])):
        total = sum(n for _, n in by_cat[cat])
        instances = r.cat_instances[side].get(cat, 0)
        lines.append(f"#   {cat:9s}  qualified={instances:<6d}  reasons={total}")
        for reason, cnt in by_cat[cat]:
            lines.append(f"#     {reason:16s} {cnt:>8d}")
    return lines


def _rule_breakdown_lines(r: TallyReport, category: str,
                          top: int = 10) -> list:
    """Render (rule, reason) pairs within a single category, both sides."""
    lines = [f"# ── Rule-level breakdown [{category}] ──"]
    for side in ("A", "B"):
        keys = [(s, c, rule, reason) for (s, c, rule, reason) in r.cat_rule_reason
                if s == side and c == category]
        if not keys:
            continue
        rows = [(rule, reason, r.cat_rule_reason[(side, category, rule, reason)])
                for (_, _, rule, reason) in keys]
        rows.sort(key=lambda r: (-r[2], r[0], r[1]))
        lines.append(f"#   {side}-side:")
        for rule, reason, cnt in rows[:top]:
            lines.append(f"#     {rule:22s} {reason:14s} {cnt:>8d}")
        if len(rows) > top:
            lines.append(f"#     (+{len(rows) - top} more)")
    return lines


def _opcode_tally_lines(r: TallyReport, grid_rows: int = 15,
                        grid_cols: int = 12) -> list:
    """Cross-tab of unpaired-instruction mnemonics (rows=A, cols=next B)."""
    if not r.unpaired_opcodes:
        return ["# ── Unpaired opcode cross-tab ──",
                "#   (no unpaired instructions)"]

    row_ops = [mn for mn, _ in r.unpaired_opcodes.most_common(grid_rows)]
    col_totals: Counter = Counter()
    for (_, mn_b), cnt in r.unpaired_adjacent.items():
        col_totals[mn_b] += cnt
    col_ops = [mn for mn, _ in col_totals.most_common(grid_cols)]

    col_w = max((len(mn) for mn in col_ops), default=4)
    row_w = max((len(mn) for mn in row_ops), default=4)
    total_w = max(5, max((len(str(r.unpaired_opcodes[mn])) for mn in row_ops),
                         default=1))

    lines = ["# ── Unpaired opcode cross-tab (rows=A, cols=next unpaired B) ──"]
    hdr = f"# {'':>{row_w}}  {'total':>{total_w}}"
    if col_ops:
        hdr += "  " + "  ".join(f"{mn:>{col_w}}" for mn in col_ops)
    lines.append(hdr)
    for mn_a in row_ops:
        row = f"# {mn_a:<{row_w}}  {r.unpaired_opcodes[mn_a]:>{total_w}d}"
        if col_ops:
            cells = []
            for mn_b in col_ops:
                v = r.unpaired_adjacent.get((mn_a, mn_b), 0)
                cells.append(f"{v:>{col_w}d}" if v else " " * col_w)
            row += "  " + "  ".join(cells)
        lines.append(row)
    return lines


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(
        description="Aggregate MISS-A/MISS-B annotations from rv32_scheduler.py output.")
    ap.add_argument("input", nargs="*", default=["-"],
                    help="Annotated assembly files to read (default: stdin).")
    ap.add_argument("--category", default="", metavar="CAT",
                    help="Restrict the reason summary to a single rule category "
                         "(chain, rsd, lspair, addrmem, dual, jumpret).  When "
                         "set, a rule-level breakdown is also emitted.")
    ap.add_argument("--side", choices=("A", "B", "both"), default="both",
                    help="Report side(s) to include (default: both).")
    ap.add_argument("--pairs", action="store_true",
                    help="Include the unpaired-opcode cross-tab.")
    ap.add_argument("--grid-rows", type=int, default=15, metavar="N")
    ap.add_argument("--grid-cols", type=int, default=12, metavar="N")
    args = ap.parse_args()

    all_lines: list = []
    for fname in args.input:
        if fname == "-":
            all_lines.extend(sys.stdin.readlines())
        else:
            with open(fname) as f:
                all_lines.extend(f.readlines())

    report = TallyReport()
    report.accumulate(list(parse_annotated_stream(all_lines)))

    out: list = []
    out.extend(_headline_lines(report))
    out.append("#")
    if args.side in ("A", "both"):
        out.extend(_category_reason_lines(report, "A", args.category))
        out.append("#")
    if args.side in ("B", "both"):
        out.extend(_category_reason_lines(report, "B", args.category))
        out.append("#")
    if args.category:
        out.extend(_rule_breakdown_lines(report, args.category))
        out.append("#")
    if args.pairs:
        out.extend(_opcode_tally_lines(report, args.grid_rows, args.grid_cols))

    for line in out:
        print(line)


if __name__ == "__main__":
    main()
