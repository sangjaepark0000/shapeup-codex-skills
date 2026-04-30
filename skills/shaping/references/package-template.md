# Package Template

Use this when writing `03-package.md`. Keep it rough, solved, and bounded.

The Breadboard section should be a compact text board, not separate bullet lists. Keep it at the solution-shape level. Group by place or context, list conceptual components under them, put affordances under the component that exposes them, and wire the flow with arrows. Name product concepts, components, user actions, states, artifacts, and transitions; do not name tasks, files, database tables, UI layout, or implementation steps. In Korean output, do not add awkward `-면` suffixes to place names. Use natural names for pages/contexts, and prefix non-page states or artifacts with `_` only when the distinction helps, for example `_판단 해석` or `_다음 탐색 세팅`.

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

```text
[Place or context]
  Component or visible information
    (Affordance) -> [Next place/context or _state/artifact]
    (Affordance) -> [Next place/context or _state/artifact]

[_state/artifact when useful]
  Component or information
    (Affordance) -> [Next place/context]
```

Optional legend, only if the board is hard to read:
- `[Place or context]`: a page, screen, dialog, menu, or meaningful context.
- `Component`: a conceptual product element, object, field, message, card, list, summary, or visible information.
- `(Affordance)`: what a component lets the user act on or understand.
- `_state/artifact`: optional marker for a non-page state, generated artifact, or mode.
- `->`: how a component's affordance wires one component, state, artifact, or place to another.

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
