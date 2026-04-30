# Package Template

Use this when writing `03-package.md`. Keep it rough, solved, and bounded.

The Breadboard section must keep the exact `Places`, `Affordances`, and `Connections` structure. Keep it at the solution-shape level. Name product concepts, user actions, states, artifacts, and transitions; do not name tasks, files, database tables, UI layout, or implementation steps.

`````md
# Package: [Project Name]

## Why

## Desired Outcome

## Appetite

Human appetite:
-

Codex execution budget:
-

## Bet / Commitment

Timebox:
-

Downside cap:
-

Interrupt policy:
-

Circuit breaker:
- If the desired outcome cannot be built inside the appetite, do not extend by default. Cut scope, re-shape, or stop.

## Breadboard

Places:
- [Place name]: [what the user reaches, sees, edits, compares, or reviews here]

Affordances:
- [Affordance name]: [what the user can read, enter, click, choose, correct, compare, approve, or reject]

Connections:
- [Place or action] -> [next place, state, artifact, or decision]: [why this connection matters]

## Fat Marker Sketch

Use when the visible surface, rough arrangement, grouping, or emphasis is important to understanding the shape. This can sit beside the Breadboard; it is not only a fallback. Sketch one or more important scenario moments as rough visible surfaces. Do not use this section as a flow diagram or polished wireframe.

Scenario: [user situation being shaped]

Moment 1: [what the user is looking at]

```text
[rough visible surface]
```

Moment 2: [what changes after the important action/state]

```text
[rough visible surface]
```

## Not Doing

-

## Risks

| Risk | Handling |
|---|---|

## Rabbit Holes

| Risk | Assumption | Smallest Proof | Result | Handling |
|---|---|---|---|---|

## First Slice Hint

## Build Rules

- Do not reopen why/what during build.
- Keep quality fixed and cut scope when needed.
- Do not extend the appetite by default; hammer scope or return to shaping/package.
- Package outside ideas go to build-log, not directly to global parking lot.

## Parking Lot / Feature Temptations

## Build Context

- Product/UX tone:
- Core terms:
- Initial data assumptions:
- Privacy/public visibility:
- Empty state:

## Testing / Verification Decisions

- Behavior to protect:
- Suggested feedback loop:
- Manual/browser check:

## Technical Reality Check

- Existing patterns:
- Likely touched modules:
- Integration risks:
- Architecture friction:
- Interface/test surface risks:
- Smallest viable implementation path:
`````
