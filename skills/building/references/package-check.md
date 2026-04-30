# Package Check

Use this before building.

## Required

- Approved package path.
- Why.
- Desired outcome.
- Appetite.
- Breadboard.
- Not doing / no-go.
- Risks.
- Build rules.
- Build context, or enough package context to infer it safely.

If any of these are missing and the missing information affects `why/what/scope`, stop and return to shaping or package review.

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
