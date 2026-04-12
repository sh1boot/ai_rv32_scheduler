"""
rv32_bnb.py

Branch-and-bound optimal instruction scheduler for the RV32 toolchain.

Exports
-------
_BNB_WINDOW         – default window size for a single BnB pass
_bnb_schedule_window – schedule a contiguous window via BnB
_bnb_schedule        – schedule all instructions in a DepGraph
"""

from rv32_analysis import DepGraph
from rv32_scorers import PairScoreFn

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
        #
        # Also try the reverse direction: if (prev, cand) doesn't pair but
        # (cand, prev) does and they are independent, we can swap them so
        # that cand occupies the A slot and prev the B slot.
        if prev_free and scheduled:
            prev = scheduled[-1]
            fwd = {c: pair_score(prev, idx_map[c]) for c in ready}
            prev_succs = graph.successors[prev.index]
            rev = {}
            for c in ready:
                if fwd[c] == 0 and c not in prev_succs:
                    s = pair_score(idx_map[c], prev)
                    if s > 0:
                        rev[c] = s
            candidates = sorted(ready,
                                key=lambda c: (0 if fwd[c] > 0
                                               else 1 if c in rev
                                               else 2, c))
        else:
            fwd = {}
            rev = {}
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

            if prev_free and scheduled and fwd.get(cand, 0) > 0:
                score_delta = 1
                new_prev_free = False
                do_swap = False
            elif prev_free and scheduled and cand in rev:
                score_delta = 1
                new_prev_free = False
                do_swap = True
            else:
                score_delta = 0
                new_prev_free = True
                do_swap = False

            if do_swap:
                scheduled[-1] = instr   # cand becomes A
                scheduled.append(prev)  # prev becomes B
            else:
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

            if do_swap:
                scheduled.pop()         # remove prev (B slot)
                scheduled[-1] = prev    # restore prev as the free instruction
            else:
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
            # Also consider swapping if (cand, prev) pairs but (prev, cand)
            # does not and there is no dependency edge prev -> cand.
            if result:
                prev = result[-1]
                prev_succs = graph.successors[prev.index]

                def _greedy_key(c):
                    fwd = pair_score(prev, idx_map[c])
                    if fwd > 0:
                        return (2, -c)
                    if c not in prev_succs and pair_score(idx_map[c], prev) > 0:
                        return (1, -c)
                    return (0, -c)

                chosen = max(ready, key=_greedy_key)
                fwd_score = pair_score(prev, idx_map[chosen])
                if fwd_score == 0 and chosen not in prev_succs \
                        and pair_score(idx_map[chosen], prev) > 0:
                    # Swap: cand becomes A, prev becomes B.
                    result[-1] = idx_map[chosen]
                    result.append(prev)
                    ready.remove(chosen)
                    for succ in graph.successors[chosen]:
                        if succ in local_indices:
                            remaining_indeg[succ] -= 1
                            if remaining_indeg[succ] == 0:
                                ready.add(succ)
                    continue
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
