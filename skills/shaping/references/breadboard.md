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

In Korean output, do not mechanically translate `place` or `surface` into labels ending with `면`. Names like `후보 비교면`, `판단 해석면`, or `탐색 소스면` sound unnatural. If the place is an actual page or screen, use the natural page name, with or without `페이지` when that helps. If it is not a page and is really a state, artifact, or mode, prefix it with `_` when a marker would improve readability: `_탐색 영역 후보`, `_판단 해석`, `_구분 기록`, `_다음 탐색 세팅`.

````md
## Breadboard

```text
[Page name or _state/artifact name]
  (Affordance) -> [State, artifact, decision, or next place]
  (Affordance) -> [State, artifact, decision, or next place]

[Another page or _state]
  (Affordance) -> [State, artifact, decision, or next place]
```

Legend, only if needed:
- `[Place]`: what the user reaches, sees, edits, compares, or reviews.
- `(Affordance)`: what the user can read, enter, click, choose, correct, compare, approve, or reject.
- `->`: why the action moves the system to the next state, artifact, or decision.
````

## Places

Places are screens, modals, menus, states, artifacts, or conceptual locations the user reaches. A place is not necessarily a full page. It can be a state or artifact the user meaningfully encounters.

Name places in the user's language as ordinary nouns. Do not add a suffix just to signal that it is a place. Use `_` as a lightweight prefix for non-page states or artifacts when the distinction matters.

Good place names:

- Product detail
- Comparison tray
- Draft package
- Review state
- Carry-forward notes
- 상품 상세 페이지
- 후보 비교
- _판단 해석
- _탐색 소스
- _다음 탐색 세팅

Avoid:

- React component
- Database table
- API route
- CSS layout region
- Task list item
- 후보 비교면
- 판단 해석면
- 탐색 소스면
- 모든 항목에 기계적으로 `페이지` 붙이기
- 모든 상태를 화면처럼 부르기

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

Good Korean connection shape:

```text
[탐색 세션 시작]
  (탐색 목적 말하기) -> [_탐색 소스] -> [후보 비교]
  (탐색할 것 찾기) -> [_탐색 영역 후보]

[후보 비교]
  (더 낫다/나쁘다 말하기) -> [_판단 해석]
  (같음/다름 짚기) -> [_판단 해상도 높이기]

[_판단 해석]
  (해석 수정하기) -> [_구분 기록] -> [Taste brief]

[Taste brief]
  (다음 탐색 모드 선택하기) -> [_다음 탐색 세팅]
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
