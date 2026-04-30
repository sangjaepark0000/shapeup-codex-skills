# Package Check

Use this before building.

## Required

- Package path.
- Explicit approval signal.
- Why.
- Desired outcome.
- Appetite.
- Breadboard.
- Not doing / no-go.
- Risks.
- Build rules.
- Build context, or enough package context to infer it safely.

Approval can come from:

- The user's current message explicitly says to build from or approve the package.
- `project.md` has a filled `Package Approved` checkpoint.
- The package contains an approval marker used by the repo.

If approval is missing, stop and ask for approval or return to package review.

If any package content is missing and the missing information affects `why/what/scope`, stop and return to shaping or package review.

## Read Context

Read if present:

- `shapeup/product-memory.md`
- `shapeup/project-index.md`
- `project.md` beside the package

Do not read every closed project unless the user names one.

## Status Board

If `project.md` exists, set `Status: Building`. If it does not exist, create:

```md
# Project: Topic

Status: Building
Source of Truth: ./03-package.md

## Checkpoints

- Package Approved:
- Built:
- Released:
- Closed:

## Current Summary

## Carries Forward
```
