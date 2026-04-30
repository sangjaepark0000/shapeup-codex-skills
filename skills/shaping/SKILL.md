---
name: shaping
description: 사용자가 Codex에게 Shape Up 방식으로 build 전에 작업을 shape해달라고 요청할 때 사용한다. 큰 기능/제품 아이디어를 fit-check, candidate/framing, shaping, package까지 정리하고, Shape Up을 쓰지 말아야 할 명백한 이유만 빠르게 걸러내며, package가 승인되기 전에는 build를 시작하지 않는다. 트리거 예시는 "Shape Up으로 진행", "shaping 해줘", "fit-check/frame/shape/package로 정리", "build 전에 shape 잡자"이다. 사용자가 한국어로 말하면 한국어로 질문하고 한국어 문서를 작성한다.
---

# Shape Up Project Preparation

Codex와 사용자가 build 전에 project를 준비하도록 돕는다. 목표는 질문을 늘리는 것이 아니라, 필요한 판단을 build 앞단으로 당겨 build 중 `왜/무엇` 질문을 줄이는 것이다.

## Language

- 사용자가 쓰는 언어를 그대로 따른다.
- 사용자가 한국어로 요청하면 질문, 중간 설명, 산출물 문서를 한국어로 작성한다.
- Shape Up, build, package, breadboard, appetite 같은 방법론 키워드는 필요하면 그대로 쓰되, 처음 등장할 때 한국어 설명을 붙인다.
- 영어 template 문구를 사용자-facing 산출물에 그대로 출력하지 않는다.

## Core Rules

- 모든 일을 Shape Up으로 다루지 않는다.
- 시간은 고정하고 범위는 조절한다.
- Markdown을 source of truth로 둔다.
- 산출물은 project workspace 안에 묶는다.
- build 전에 결과물이 `rough`, `solved`, `bounded`인지 확인한다.
- Framing과 Shaping은 엄격한 phase가 아니라 현재 불확실성이 어디에 있는지 구분하기 위한 작업 모드다.
- Framing이 충분하면 `Frame Go`, Shaping이 충분하면 `Shape Go`를 짧게 요약하고 `project.md`에 기록한다.
- package를 쓰기 전에는 문제, appetite, solution boundary가 대충이라도 닫혀 있어야 한다.
- `Package Approved` 전에는 build를 시작하지 않는다.
- problem, baseline, desired outcome, appetite가 흔들리면 Framing으로 되돌아간다.
- build 중 `왜/무엇` 질문이 다시 나오면 framing 또는 shaping으로 되돌린다.
- `parking-lot`은 backlog가 아니다.
- `product-memory`는 project log가 아니다.

## References

필요할 때만 읽는다.

- `references/workspace.md`: 시작 프로토콜, 파일 구조, project workspace를 정할 때.
- `references/fit-check.md`: Shape Up을 쓰지 말아야 할지 빠르게 판단할 때.
- `references/candidate-mode.md`: raw request를 candidate로 나누고 Framing/Shaping 대상으로 삼을 후보를 고를 때.
- `references/candidate-lifecycle.md`: Framing/Shaping 중 새 candidate, not-now, dropped 후보가 생길 때.
- `references/scope-filter.md`: 후보 기능을 이번 package에 넣을지 자를 때.
- `references/framing-checklist.md`: 문제, baseline, outcome, appetite가 흐릿할 때.
- `references/shaping-checklist.md`: solution boundary, breadboard, material unknown이 흐릿할 때.
- `references/breadboard.md`: `02-shape.md`나 `03-package.md`의 Breadboard 형식을 작성하거나 점검할 때.
- `references/domain-decisions.md`: shaping 중 용어, product memory, ADR 후보가 생길 때.
- `references/package-template.md`: `03-package.md`를 작성할 때.
- `references/betting-questions.md`: `Package Approved` 전에 gate를 확인할 때.

## Flow

1. Read workspace context.
2. Run a quiet fit check.
3. Sort the raw request into one or more candidates and choose what to frame.
4. Reconcile candidates that are not selected for this package.
5. Apply the scope filter before extra features enter the package.
6. Move between framing and shaping as needed until problem, appetite, and solution boundary are coherent.
7. Summarize `Frame Go` and `Shape Go` before packaging.
8. Write the package.
9. Ask for explicit `Package Approved`.
10. Stop before build unless the user separately asks to build from the approved package.

## Start

Read `references/workspace.md`, then inspect only the relevant workspace files:

- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- A specific `project.md` if the user provides one

Do not read all of `shapeup/closed/` unless the user names a closed project.

## Fit Check

If the user invoked this skill, default to "Shape Up으로 진행". Do not ask for permission to use Shape Up again.

Read `references/fit-check.md` only when the request looks like it may be urgent, tiny, exploratory, dependency-heavy, or launch cleanup.

If Shape Up clearly does not fit, stop and suggest a lighter flow. If unclear, continue and reassess during Framing.

## Candidate Sorting

Read `references/candidate-mode.md` before Framing when the request is broad, mixed, revived from parking lot, or could be bugfix/cleanup/spike/dependency work.

Candidate Sorting does not solve the uncertainty. It chooses which candidate deserves Framing/Shaping.

Read `references/candidate-lifecycle.md` when Framing or Shaping reveals a different candidate, a follow-up candidate, a not-now candidate, or a candidate that should be dropped.

Separate:

- Long-term product area
- First package candidate
- Follow-up candidates
- Parking lot candidates

For a narrow feature request, keep this step lightweight: name the candidate in one sentence and enter Framing.

After candidate sorting, immediately reconcile candidates that are not selected. Do not leave durable future bets only inside local project notes.

## Scope Filter

Read `references/scope-filter.md` whenever a candidate attracts "also", "while we are here", "later we need", or new user role/object/privacy/permission ideas.

Default to `No / Parking Lot` unless the feature is required for the first bet inside the appetite.

## Framing

Framing is a conversation, not a form. Ask only the next needed question.

Read `references/framing-checklist.md` while closing:

- Problem
- Current alternative
- Baseline
- Desired outcome
- Success criteria
- Appetite

When enough is known, summarize the frame and move into shaping. Do not treat this as a heavy gate; it is just a checkpoint that can be revisited.

Record the summary as `Frame Go` when there is enough problem, baseline, desired outcome, success criteria, and appetite to spend shaping time.

## Shaping

Shaping finds a buildable shape without locking implementation details.

Read `references/shaping-checklist.md` while closing:

- Core change
- Breadboard
- Not doing
- Risks
- Material unknowns
- Appropriate abstraction level

When enough is known, summarize the shaped boundary and write the package. Do not treat this as irreversible; if packaging reveals a weak problem or boundary, move back.

Use the Breadboard format from `references/breadboard.md` in `02-shape.md`: a compact text board with places, affordances, and connections. Record the summary as `Shape Go` when the shape is rough, solved, and bounded enough to package.

## Package

Read `references/package-template.md` and write `03-package.md` in the project workspace.

If an important product decision first appears while writing the package, stop and return to Framing or Shaping.

Read `references/domain-decisions.md` when shaping creates durable terminology or a hard-to-reverse decision.

The package should let a new Codex session start the first vertical slice using only the package and local repo context.

## Package Approval

Read `references/betting-questions.md`.

`Package Approved` must be explicit. Framing and shaping checkpoints can be lightweight, but build approval cannot be implied.

Accept clear signals like:

- "Package Approved"
- "이 package로 build 승인"
- "이 범위와 appetite로 진행"
- "approved for build"

Do not treat vague reactions like "ok", "go", "sounds good", or silence as approval by themselves.

After approval, update `project.md` if present. Do not start build unless the user asks for build or invokes the building flow.

## Review Response

When package writing is done, tell the user:

- Package file path
- Decisions closed or intentionally left flexible during shaping
- Remaining pre-build checks, if any
- Current `project.md` status

Keep the response short. The package is the source of truth.
