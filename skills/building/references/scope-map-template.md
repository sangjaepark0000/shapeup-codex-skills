# Scope Map Template

Use this when creating or updating `05-scope-map.md`.

```md
# Scope Map

## Current Slice

## Scopes

| Scope | Mode | Hill Status | Unknown | Next Move |
|---|---|---|---|---|

## Scope Changes

| Date | Change | Reason |
|---|---|---|

## Cut Scope

| Item | Reason | Where Recorded |
|---|---|---|
```

## Hill Status Rules

- `Uphill`: still searching for the approach.
- `Over the hill`: a core unknown was proven by code, data, browser, or test.
- `Downhill`: remaining work is implementation and polish.

Do not mark a scope over the hill because the idea sounds plausible.

## Mode Rules

- `AFK`: Codex can proceed inside the package without human judgment.
- `HITL`: needs human judgment, external access, design review, product decision, or manual approval.
