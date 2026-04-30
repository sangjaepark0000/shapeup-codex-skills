# Candidate Promotion

Use this when build reveals package-outside ideas.

Do not move every idea to global parking lot. Most build-time ideas should stay in `06-build-log.md` or be dropped.

Promotion happens in the same write-time checkpoint as build-log classification. Record the idea in `06-build-log.md`; if it is classified as a durable future candidate, also reconcile it with `shapeup/parking-lot.md` immediately.

Repeated appearance is evidence of pressure, not evidence of priority. If a build-time candidate already exists in `shapeup/parking-lot.md`, update its signal, source, and last-seen context instead of creating a duplicate row.

Write two different records:

- `06-build-log.md`: the event record of the package-outside idea and promotion decision.
- `shapeup/parking-lot.md`: the durable candidate state.

Do not duplicate long rationale across both. Link the parking-lot `Sources` field back to the build-log row or section.

## Promote To Parking Lot Only When

- It may matter again with fresh context.
- It explains an important package boundary.
- It is a distinct future bet.
- It appears repeatedly across build, feedback, or projects.

When promoting, use the repo-level parking lot table:

```md
| Candidate | Return Condition | Signals | Last Seen | Sources | Status |
|---|---|---|---|---|---|
```

Set `Return Condition` to the condition that would make the candidate worth framing again. Set `Signals` to the build or feedback pressure that exposed it. Keep `Status` descriptive, such as `parked`, `watch`, `revived`, or `dropped`.

## Keep In Build Log Only When

- It explains a local build decision.
- It was a useful trade-off during this project.
- It is not likely to become a future candidate.

## Drop When

- It is only a nice-to-have.
- It came from implementation convenience.
- It does not affect current package boundaries.

## Return To Shaping When

- It changes desired outcome.
- It changes the core object.
- It changes privacy, trust, visibility, or permissions.
- The package cannot succeed without it.
