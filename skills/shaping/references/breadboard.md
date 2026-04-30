# Breadboards And Fat Marker Sketches

Use this when shaping the solution in `02-shape.md` or helping the package reader see the solution in `03-package.md`.

Breadboards and Fat Marker Sketches are peer shaping tools. They both help remove uncertainty before build while staying at the right level of abstraction: concrete enough to understand what will be made, loose enough to avoid freezing implementation or visual design too early.

The goal is not to make the document short. The goal is that a builder can understand what kind of thing will be built.

Use them together when needed:

- Breadboard: best for elements, affordances, states, and how they connect.
- Fat Marker Sketch: best when the visible surface, rough arrangement, or visual grouping is part of the solution.

Do not treat Fat Marker Sketch as a fallback only after Breadboard fails. If the shaped idea has an important visible surface, include a sketch.

## Breadboard Shape

A Breadboard is the shaped solution's conceptual map: where the user can be, what they can do or understand there, and how those actions move the system forward. It is not a checklist, task list, wireframe, or implementation plan.

Write the Breadboard as a compact text board by default, not as three separate bullet lists. Use brackets for places, parentheses for affordances, and arrows for connections. Add a short legend only when the board would be hard to read without it.

````md
## Breadboard

```text
[Place name]
  (Affordance) -> [State, artifact, decision, or next place]
  (Affordance) -> [State, artifact, decision, or next place]

[Another place]
  (Affordance) -> [State, artifact, decision, or next place]
```

Legend, only if needed:
- `[Place]`: what the user reaches, sees, edits, compares, or reviews.
- `(Affordance)`: what the user can read, enter, click, choose, correct, compare, approve, or reject.
- `->`: why the action moves the system to the next state, artifact, or decision.
````

## Places

Places are screens, modals, menus, states, artifacts, or conceptual locations the user reaches. A place is not necessarily a full page. It can be a state or artifact the user meaningfully encounters.

Good place names:

- Product detail
- Comparison tray
- Draft package
- Review state
- Carry-forward notes

Avoid:

- React component
- Database table
- API route
- CSS layout region
- Task list item

## Affordances

Affordances are things the user can act on or understand: buttons, inputs, links, commands, prompts, labels, visible text, choices, comparisons, or corrections.

Good affordance names:

- Interest toggle
- Add comparison candidate
- Correct interpretation
- Approve package
- Mark as not this package

Avoid:

- Add `useState`
- Create migration
- Fetch data
- Style card
- Implement service

## Connections

Connections describe transitions from a place or action to another place, state, artifact, or decision. They explain why the solution holds together.

Good connection shape:

```text
[Product detail]
  (Interest toggle) -> [Saved signal] -> [Aggregate count]

[Comparison tray]
  (Correct interpretation) -> [Revised taste brief]

[Package review]
  (Approve package) -> [Build ready]
```

Avoid connections that only describe implementation order:

- Write API route -> update database
- Create component -> add CSS
- Build backend -> build frontend

## Rules

- Keep it at the solution-shape level.
- Name product concepts, user actions, states, artifacts, and transitions.
- Prefer one readable text board over separate lists of places, affordances, and connections.
- Use bullets only for a short legend or explanatory notes, not as the main Breadboard.
- Do not replace it with a paragraph, checklist, implementation plan, or screen-by-screen wireframe.
- Do not lock layout, styling, component boundaries, file paths, or task order.

## Fat Marker Sketch

Use a Fat Marker Sketch when the visible surface matters to the shape. It is a rough sketch of what the user sees, not a logic flow and not a polished wireframe.

A Fat Marker Sketch can stand beside a Breadboard. It does not need to be justified as a replacement. Use it when rough visual arrangement, grouping, emphasis, or surface shape carries important product meaning.

A Fat Marker Sketch shows what the user roughly sees in one or more key moments of a scenario:

- visible chunks
- relative emphasis
- major regions
- rough grouping
- what is present or absent
- what the user can notice or act on

It should not show:

- exact layout
- spacing
- colors
- component hierarchy
- responsive rules
- implementation order
- a pure logic flow

## Scenario Sketches

A scenario may need more than one sketch. Do not force the whole shape into a single screen if the user has to pass through several meaningful visible surfaces.

Use this structure when multiple moments matter:

````md
## Fat Marker Sketch

Scenario: [user situation being shaped]

Moment 1: [what the user is looking at]

```text
[rough visible surface]
```

Moment 2: [what changes after the important action/state]

```text
[rough visible surface]
```
````

Each moment should be a rough view of a surface, not a node in a flowchart. If the sequence matters, name the scenario and moments in text; do not turn the sketch into only arrows.

Good:

````md
Scenario: Compare two candidates and correct Codex's interpretation

Moment 1: comparison surface

```text
Taste session: writing tools

Goal: find tools that make deep drafting easier

+----------------------+----------------------+
| Candidate A          | Candidate B          |
| feels calm           | feels busy           |
| good for long text   | good for quick notes |
+----------------------+----------------------+

Current read:
"You may prefer low-friction drafting over capture speed."

[Correct this]  [Add another candidate]
```

Moment 2: corrected working hypothesis

```text
Working taste hypothesis

Not "calm UI" exactly.
More like:
- less switching while writing
- visible structure while drafting
- quick capture is secondary

Unknown:
- whether collaboration matters

[Update taste brief]
```
````

Bad:

```md
[Start] -> [Compare] -> [Correct] -> [Brief]
```

That is a flow diagram. It may help explain connections, but it is not a Fat Marker Sketch.
