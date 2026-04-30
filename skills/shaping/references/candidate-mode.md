# Candidate Sorting And Mode

Use this before Framing when the raw request may contain multiple candidates, the candidate came from parking lot, or the work may not belong in Shape Up.

Candidate Sorting does not solve uncertainty. It chooses which uncertainty is worth taking into Framing/Shaping.

## Candidate Meaning

A candidate is a request or idea that has not been framed yet. It is not a build commitment and not a backlog item.

Candidates can come from:

- The user's current request
- Customer requests
- Parking lot items that became important again
- Carries forward from a previous project

## Sorting Questions

- Is this one candidate or several mixed together?
- Which candidate should be framed now?
- Which candidates are explicitly not this package?
- Which candidates should return to parking lot?
- Which candidates should be dropped?
- Is this actually bugfix, cleanup, spike, exploration, or dependency-tracking work?

Do not answer the Framing/Shaping questions here. Leave problem importance, baseline, desired outcome, appetite, breadboard, and material unknowns for Framing/Shaping.

## Mode

Classify the work before framing:

- `Existing product / Production mode`: shape a bounded project inside known product structure.
- `New product / R&D mode`: if core structure is unknown, split out a spike or senior exploration before package build.
- `Cleanup mode`: launch cleanup may need a checklist rather than a shaped package.
- `Reactive / dependency-heavy work`: keep separate from Shape Up project work.

## Classification

- `shape-now`: take this candidate into Framing/Shaping.
- `needs-framing`: candidate seems relevant, but problem/baseline/outcome is unclear.
- `not-shapeup`: use a lighter flow.
- `not-now`: plausible candidate, wrong timing.
- `parking-lot`: may matter again, but not now.
- `spike`: learn before shaping.
- `dependency-tracking`: external dependency dominates.
- `cleanup`: use cleanup flow.
- `bugfix/diagnose`: use diagnosis loop.
- `dropped`: no clear reason to preserve it.

## Large Product Ideas

Separate:

- Long-term vision
- Core object
- User roles
- 2-5 possible package candidates
- First package candidate
- Parking lot candidates

## Output

Keep the output short:

```md
## Candidate Sorting

Source:
Raw request:
Candidates:
Selected for framing:
Not this package:
Parking lot:
Dropped:
Reason:
```

Continue to Framing when:

- Mode is clear.
- The product area and first package candidate are separate.
- The first package candidate fits inside one appetite.
- The first candidate connects to the long-term direction.
- The first candidate is one change, not a grab bag.
- Core object and follow-up objects are not mixed.

If it is a grab bag, cut it down before Framing.

If Framing or Shaping later reveals that the selected candidate is wrong, return here and select, rename, split, park, or drop the candidate.
