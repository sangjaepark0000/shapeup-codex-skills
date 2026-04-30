# Breadboards And Fat Marker Sketches

Use this when shaping the solution in `02-shape.md` or helping the package reader see the solution in `03-package.md`.

Breadboards and Fat Marker Sketches are peer shaping tools. They both help remove uncertainty before build while staying at the right level of abstraction: concrete enough to understand what will be made, loose enough to avoid freezing implementation or visual design too early.

The goal is not to make the document short. The goal is that a builder can understand what kind of thing will be built.

Use them together when needed:

- Breadboard: best for elements, affordances, states, and how they connect.
- Fat Marker Sketch: best when the visible surface, rough arrangement, or visual grouping is part of the solution.

Do not treat Fat Marker Sketch as a fallback only after Breadboard fails. If the shaped idea has an important visible surface, include a sketch.

## Breadboard Shape

A Breadboard is the shaped solution's conceptual map: what components belong in the interaction, what affordances those components expose, and how those affordances wire the flow together. It is not a checklist, task list, wireframe, or implementation plan.

Write the Breadboard as a compact text board by default, not as three separate bullet lists. Group the board by navigable places or contexts, put components under them, put affordances under the component that exposes them, and use arrows for wiring. Add a short legend only when the board would be hard to read without it.

In Korean output, do not mechanically translate `place` or `surface` into labels ending with `면`. Names like `후보 비교면`, `판단 해석면`, or `탐색 소스면` sound unnatural. If the place is an actual page or screen, use the natural page name, with or without `페이지` when that helps. If something is not a page but a state, artifact, or mode, prefix it with `_` only when the marker improves readability: `_판단 해석`, `_구분 기록`, `_다음 탐색 세팅`.

````md
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

Legend, only if needed:
- `[Place or context]`: a page, screen, dialog, menu, or meaningful context the user can navigate to.
- `Component`: a conceptual product element, object, field, message, card, list, summary, or visible information.
- `(Affordance)`: what a component lets the user act on or understand: buttons, inputs, links, commands, choices, prompts, or copy.
- `_state/artifact`: optional marker for a non-page state, generated artifact, or mode.
- `->`: how a component's affordance wires one component, state, artifact, or place to another.
````

## Places And Contexts

Places are screens, modals, menus, or navigable contexts the user reaches. A place is not necessarily a full page. States and artifacts may appear in brackets too, but only mark them with `_` when that distinction makes the board easier to read.

Name places in the user's language as ordinary nouns. Do not add a suffix just to signal that it is a place.

Good place/context names:

- Product detail
- Comparison tray
- Draft package
- Review state
- Carry-forward notes
- 상품 상세 페이지
- 후보 비교
- _판단 해석
- _다음 탐색 세팅

Avoid:

- 후보 비교면
- 판단 해석면
- 탐색 소스면

## Components

Components are the conceptual parts that make the interaction work. These are the default building blocks of the Breadboard. They can be UI components, domain objects, cards, lists, messages, fields, summaries, states, or artifacts. They are not framework components unless the framework detail is actually the product idea.

A component owns the affordances that come from it. If an affordance is floating under a place with no component, add the component or rename the affordance as a component.

Good component names:

- Interest count
- Saved signal
- Comparison card
- Taste brief summary
- 탐색 소스
- 후보 카드
- 판단 요약

Avoid:

- React component class name
- Database table
- API route
- CSS layout region
- Task list item

## Affordances

Affordances are things a component lets the user act on or understand: buttons, inputs, links, commands, prompts, labels, visible text, choices, comparisons, or corrections. In the text board, affordances should usually be indented under their component and only then point to the next place, state, artifact, or component.

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
  Interest count
  Interest control
    (Toggle interest) -> [Saved signal] -> [Aggregate count]

[Comparison tray]
  Candidate cards
    (Correct interpretation) -> [Revised taste brief]

[Package review]
  Approval control
    (Approve package) -> [Build ready]
```

Good Korean connection shape:

```text
[탐색 세션 시작]
  탐색 목적
  탐색 소스
    (탐색 목적 말하기) -> [후보 비교]
    (탐색할 것 찾기) -> [_탐색 영역 후보]

[후보 비교]
  후보 카드
    (더 낫다/나쁘다 말하기) -> [_판단 해석]
    (같음/다름 짚기) -> [_판단 해상도 높이기]
  판단 기준

[_판단 해석]
  판단 요약
    (해석 수정하기) -> [_구분 기록] -> [Taste brief]

[Taste brief]
  현재 신호
  아직 모르는 점
  다음 탐색 제안
    (다음 탐색 모드 선택하기) -> [_다음 탐색 세팅]
```

Avoid connections that only describe implementation order:

- Write API route -> update database
- Create component -> add CSS
- Build backend -> build frontend

## Rules

- Keep it at the solution-shape level.
- Name product concepts, components, user actions, states, artifacts, and transitions.
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
