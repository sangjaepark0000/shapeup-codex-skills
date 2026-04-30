# Hill Status

Use hill status to communicate unknowns, not task completion percentage.

## States

| Status | Meaning |
|---|---|
| Uphill | Still searching for the approach. |
| Over the hill | Core unknown is solved and proven by code, data, browser, or test. |
| Downhill | Remaining work is implementation and finish. |

## Rules

- Do not mark over the hill just because the idea sounds plausible.
- Prefer evidence from a working slice, test, browser check, or real data.
- If the same scope stays uphill across two checkpoints, stop and report the blocker.

## Format

```md
| Scope | Hill Status | Unknown | Next Move |
|---|---|---|---|
| Product signal | Uphill | One signal per user/product | Prove minimal persistence in first slice |
```
