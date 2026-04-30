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

## Core Rules

- 모든 일을 Shape Up으로 다루지 않는다.
- 시간은 고정하고 범위는 조절한다.
- Markdown을 source of truth로 둔다.
- 산출물은 project workspace 안에 묶는다.
- build 전에 결과물이 `rough`, `solved`, `bounded`인지 확인한다.
- Framing과 Shaping은 엄격한 phase가 아니라 현재 불확실성이 어디에 있는지 구분하기 위한 작업 모드다.
- package를 쓰기 전에는 문제, appetite, solution boundary가 대충이라도 닫혀 있어야 한다.
- `Package Approved` 전에는 build를 시작하지 않는다.
- problem, baseline, desired outcome, appetite가 흔들리면 Framing으로 되돌아간다.
- build 중 `왜/무엇` 질문이 다시 나오면 Framing 또는 Shaping으로 되돌린다.
- `parking-lot`은 backlog가 아니다.
- `product-memory`는 project log가 아니다.

## References

필요할 때만 읽는다.

- `references/workspace.md`: 시작 프로토콜, 파일 구조, project workspace를 정할 때.
- `references/fit-check.md`: Shape Up을 쓰지 말아야 할지 빠르게 판단할 때.
- `references/candidate-mode.md`: raw request를 candidate로 나누고 Framing/Shaping 대상으로 삼을 후보를 고를 때.
- `references/candidate-lifecycle.md`: Framing/Shaping 중 새 candidate, not-now, dropped 후보가 생길 때.
- `references/scope-filter.md`: 후보 기능을 이번 package에 넣을지 자를 때.
- `references/framing-checklist.md`: problem, baseline, outcome, appetite가 흐릿할 때.
- `references/shaping-checklist.md`: solution boundary, breadboard, material unknown이 흐릿할 때.
- `references/domain-decisions.md`: shaping 중 용어, product memory, ADR 후보가 생길 때.
- `references/package-template.md`: `03-package.md`를 작성할 때.
- `references/betting-questions.md`: `Package Approved` 전에 gate를 확인할 때.

## Flow

1. workspace context를 읽는다.
2. 조용히 fit check를 한다.
3. raw request를 하나 이상의 candidate로 나누고 무엇을 frame할지 고른다.
4. 선택되지 않은 candidate를 `references/candidate-lifecycle.md`에 따라 즉시 정리한다. durable future candidate를 project-local notes 안에만 남기지 않는다.
5. extra feature가 package에 들어오기 전에 scope filter를 적용한다.
6. problem, appetite, solution boundary가 coherent해질 때까지 Framing과 Shaping 사이를 오간다.
7. package 전에 현재 frame/shape를 요약한다.
8. 왜 이 shape가 나왔는지 설명한다. 더 큰 아이디어의 첫 slice라면 왜 이 slice가 먼저인지도 설명하고, package로 굳히기 전에 가볍게 다듬을 시간을 둔다.
9. package를 작성한다.
10. 명시적인 `Package Approved`를 요청한다.
11. 사용자가 별도로 승인된 package에서 build를 요청하지 않으면 build 전에 멈춘다.

## Start

`references/workspace.md`를 읽고, 관련 workspace 파일만 확인한다.

- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- 사용자가 특정 project path를 제공한 경우 해당 `project.md`

사용자가 closed project를 지정하지 않는 한 `shapeup/closed/` 전체를 읽지 않는다.

## Fit Check

사용자가 이 skill을 호출했다면 기본값은 "Shape Up으로 진행"이다. 다시 Shape Up을 쓸지 허락받지 않는다.

요청이 urgent, tiny, exploratory, dependency-heavy, launch cleanup처럼 보일 때만 `references/fit-check.md`를 읽는다.

Shape Up이 명백히 맞지 않으면 멈추고 더 가벼운 흐름을 제안한다. 애매하면 Framing으로 계속 가되, 진행 중 다시 판단한다.

## Candidate Sorting

요청이 넓거나, 여러 일이 섞여 있거나, parking lot에서 되살아났거나, bugfix/cleanup/spike/dependency work일 수 있으면 Framing 전에 `references/candidate-mode.md`를 읽는다.

Candidate Sorting은 불확실성을 해결하지 않는다. 어떤 candidate를 Framing/Shaping으로 가져갈지 고른다.

Framing 또는 Shaping 중 다른 candidate, follow-up candidate, not-now candidate, dropped candidate가 드러나면 `references/candidate-lifecycle.md`를 읽는다.

다음을 분리한다.

- Long-term product area
- First package candidate
- Follow-up candidates
- Parking lot candidates

좁은 feature request라면 이 단계는 가볍게 유지한다. candidate를 한 문장으로 이름 붙이고 Framing으로 들어간다.

Candidate Sorting 뒤에는 선택되지 않은 모든 candidate를 작성 시점에 정리한다.

- `Not this package`: 현재 project notes에 boundary로 남긴다.
- `Parking lot`: distinct future bet으로 돌아올 수 있으면 repo-level `shapeup/parking-lot.md`를 즉시 갱신한다.
- `Dropped`: decision을 설명할 때만 durable record를 남긴다.
- `Spike`: 선택된 package 안에 숨기지 말고 별도 learning candidate로 기록한다.

## Scope Filter

candidate가 "also", "while we are here", "later we need" 또는 새 user role/object/privacy/permission 아이디어를 끌어들이면 `references/scope-filter.md`를 읽는다.

기본값은 `No`다. 첫 bet이 appetite 안에서 작동하는 데 필수일 때만 package에 남긴다. 제외된 기능이 distinct future bet으로 돌아올 수 있을 때만 `Parking Lot`을 사용한다.

## Framing

Framing은 conversation이지 form이 아니다. checklist를 그대로 chat에 던지지 않는다.

닫아야 할 항목을 확인할 때 `references/framing-checklist.md`를 읽는다.

- Problem
- Current alternative
- Baseline
- Desired outcome
- Success criteria
- Appetite

충분히 알게 되면 frame을 요약하고 shaping으로 간다. 이것은 무거운 gate가 아니라 다시 돌아올 수 있는 checkpoint다.

## Shaping

Shaping은 구현 세부사항을 고정하지 않고 build 가능한 shape를 찾는다.

닫아야 할 항목을 확인할 때 `references/shaping-checklist.md`를 읽는다.

- Core change
- Breadboard
- Not doing
- Risks
- Material unknowns
- Appropriate abstraction level

충분히 알게 되면 shaped boundary를 요약하고 package를 작성한다. 되돌릴 수 없는 단계로 취급하지 않는다. package 작성 중 problem이나 boundary가 약하다는 것이 드러나면 다시 돌아간다.

package 전에 reasoning path를 짧게 설명한다. 왜 이 solution boundary가 나왔는지, 어떤 대안을 잘랐는지, 왜 이 slice가 later candidate보다 먼저인지 설명한다. 결론이 package로 굳기 전에 사용자가 가볍게 조정할 수 있게 한다.

## Package

`references/package-template.md`를 읽고 project workspace 안에 `03-package.md`를 작성한다.

package 작성 중 중요한 product decision이 처음 나타나면 멈추고 Framing 또는 Shaping으로 돌아간다.

shaping 중 durable terminology나 되돌리기 어려운 decision이 생기면 `references/domain-decisions.md`를 읽는다.

package는 새 Codex session이 package와 local repo context만으로 첫 vertical slice를 시작할 수 있어야 한다.

## Package Approval

`references/betting-questions.md`를 읽는다.

`Package Approved`는 명시적이어야 한다. 사용자의 자연스러운 approval 표현은 받아들이되, 침묵, package path, 반대 없음만으로는 승인으로 추론하지 않는다. Framing과 Shaping checkpoint는 가벼울 수 있지만 build approval은 암시될 수 없다.

approval 뒤에는 `project.md`가 있으면 갱신한다. 사용자가 build를 요청하거나 building flow를 호출하지 않는 한 build를 시작하지 않는다.

## Review Response

package 작성이 끝나면 사용자에게 다음을 짧게 알려준다.

- Package file path
- shaping 중 닫은 decision 또는 의도적으로 유연하게 남긴 decision
- 남은 pre-build check가 있다면 그것
- 현재 `project.md` status

응답은 짧게 유지한다. package가 source of truth다.
