# Candidate Lifecycle

Use this when a candidate is discovered, changed, parked, or dropped during Candidate Sorting, Framing, Shaping, or Building.

## Principle

Not every discovered idea becomes a candidate. Not every candidate goes to parking lot.

Promote an idea only when:

- It may become important again with new context.
- It explains the boundary of the current package.
- It is a distinct future bet.
- It repeatedly appears across projects, feedback, or build trade-offs.

Otherwise keep it in project notes, build log, or drop it.

## During Candidate Sorting

Raw requests may split into multiple candidates.

Possible outcomes:

- Selected for Framing.
- Not this package.
- Parking lot candidate.
- Spike.
- Dependency-tracking.
- Cleanup.
- Bugfix/diagnose.
- Dropped.

## During Framing

Framing may reveal that the original candidate was a symptom, not the problem.

Possible outcomes:

- Replace current candidate with a better candidate.
- Rename the candidate.
- Split the candidate.
- Mark as not-now.
- Drop it.
- Park only if it may matter again.

Do not force the original candidate forward when the frame points elsewhere.

## During Shaping

Shaping may reveal candidate boundaries:

- A feature outside the first bet.
- A new core object.
- A new user role.
- A privacy, trust, or permission decision.
- A follow-up product bet.
- A spike needed before shaping can continue.

Possible outcomes:

- Include only if required for the selected candidate's first bet.
- Return to Candidate Sorting if the selected candidate is wrong or too large.
- Record as not this package.
- Park only if it may return as a distinct bet.
- Drop if it is only a feature temptation.

## During Building

Building may reveal package-outside ideas. Do not move them directly to global parking lot by default.

Possible outcomes:

- Current build: only if it blocks the package desired outcome.
- Build log only: useful context but not a future candidate.
- Candidate promotion: distinct future bet or repeated signal.
- Return to shaping: if it reopens why/what/scope.
- Dropped: nice-to-have without boundary value.

## Promotion Targets

- `project.md`: current status and selected candidate.
- `01-frame.md` or `02-shape.md`: shaping context and boundaries.
- `06-build-log.md`: build-time discoveries and package-outside ideas.
- `shapeup/parking-lot.md`: only candidates likely to matter again.
- Dropped: no durable record needed unless it explains a decision.
