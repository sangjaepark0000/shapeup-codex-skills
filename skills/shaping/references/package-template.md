# Package Template

`03-package.md`를 작성할 때 사용한다. package는 rough, solved, bounded하게 유지한다.

```md
# Package: [Project Name]

## Why

## 왜 이것부터인가

package가 더 큰 idea의 한 slice라면, 왜 이 slice가 먼저인지와 later work가 무엇에 의존하는지 짧게 설명한다. builder가 전체 대화를 다시 읽지 않아도 shaping logic을 복원할 수 있도록 context bridge로 둔다.

## Desired Outcome

## Appetite

Human appetite:
-

Codex execution budget:
-

## Breadboard

Places:
-

Affordances:
-

Connections:
-

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

- build 중 why/what을 다시 열지 않는다.
- quality는 고정하고 필요하면 scope를 줄인다.
- package 밖 idea는 global parking lot으로 바로 보내지 말고 build-log에 남긴다.

## Parking Lot / Feature Temptations

package boundary를 설명하는 temptation만 적는다. 이미 `01-frame.md` 또는 `02-shape.md`에서 분류한 candidate를 다시 정의하지 말고 package guardrail로 짧게 참조한다. durable future candidate는 이미 repo-level `shapeup/parking-lot.md`와 reconciled되어 있어야 한다.

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
```
