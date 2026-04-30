# Workspace

Use this when starting a shaping session or deciding where to write outputs.

## Read First

Read these files if they exist:

- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- A specific `project.md` if the user provides a project path

Do not read every closed project. Closed projects are history, not default context.

`shapeup/notes/operating-model.md` is reference material. Read it only when the user asks or when local conventions are unclear.

## Product Memory

Look for:

- Vision
- Strategy
- Pressures
- Core objects
- Durable decisions
- Repeated no-go decisions

Do not add project logs here. Add only decisions that future projects should inherit by default.

## Parking Lot

Parking lot is not a backlog or queue. Do not pick the next project from it.

Only revive an item when it has become important again in the current context. Treat revived items as candidates that still need Framing.

## Default Project Workspace

When the user does not specify a location, create:

```text
shapeup/
  active/
    NNN-topic-slug/
      project.md
      01-frame.md
      02-shape.md
      03-package.md
```

If the repo already uses `cycles/`, keep the existing structure for that project. Use `shapeup/active/` for new projects.

## Project Status Board

```md
# Project NNN: Topic

Status: Shaping
Source of Truth: ./03-package.md

## Checkpoints

- Candidate sorting:
- Frame Go:
- Shape Go:
- Package Approved:

## Current Summary

## Carries Forward
```
