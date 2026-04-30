# Build Kickoff Template

Use this when creating `04-build-kickoff.md`.

```md
# Build Kickoff: [Project Name]

## Package Basis

- Why:
- Desired outcome:
- Appetite:
- Downside cap:
- Circuit breaker:
- Source of truth:

## Build Context

## Absolutely Not Doing

## Feature Temptations

## Most Unknown Scope

## First Integrated Slice

## Scope Order

| Scope | Depends On | Why Now |
|---|---|---|

## Shared Assumptions

## Wired but Ugly

This build reaches Wired but Ugly when:

-

Wired but Ugly must connect the core path across data/state, user action, and visible result. Do not count a backend-only, frontend-only, or data-model-only slice as done.

## Verification

## Checkpoint Policy

Report when:
- Kickoff is written.
- One integrated slice is demoable or verifiable.
- A package-outside scope appears required.
- The same scope remains `Uphill` across two checkpoints.
- Verification failure points to product or shape judgment.

Continue without waiting when:
- The choice is implementation path, helper/module boundary, task order, tests, small copy, or package-safe technical trade-off.

## Stop Rule

Continue while remaining questions are mostly `how` questions.

Return to shaping/package when:
- Desired outcome changes.
- Core object changes.
- No-go changes.
- Privacy/public visibility changes.
- User role or permission model changes.
- Appetite no longer fits.
- First slice cannot prove the key rabbit hole.
```
