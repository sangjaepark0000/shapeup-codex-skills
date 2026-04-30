# Candidate Lifecycle

Candidate Sorting, Framing, Shaping, Building 중 candidate가 발견, 변경, parked, dropped될 때 사용한다.

## Principle

발견된 모든 idea가 candidate가 되는 것은 아니다. 모든 candidate가 parking lot으로 가는 것도 아니다.

candidate reconciliation은 나중 cleanup pass가 아니라 작성 시점에 한다. future maintainer가 오래된 project notes에서 durable candidate를 다시 찾아내게 만들지 않는다.

기본적으로 candidate maintenance를 실행하지 않는다. 사용자가 previous candidate를 review, harvest, reconcile하라고 명시했을 때만 old active 또는 closed project notes를 훑는다.

반복 출현은 pressure의 증거이지 priority의 증거가 아니다. candidate가 여러 번 나타나면 새 signal, source, last-seen context를 갱신하되, 현재 framing에서 중요해졌을 때만 선택한다.

candidate가 project-local document와 `shapeup/parking-lot.md` 양쪽에 기록될 때는 서로 다른 기록을 쓴다.

- Project-local docs (`01-frame.md`, `02-shape.md`, `06-build-log.md`, `08-retro.md`): event와 decision context.
- `shapeup/parking-lot.md`: durable candidate state.

양쪽에 긴 rationale을 중복하지 않는다. local note를 context source로 두고, parking-lot `Sources` field가 그쪽을 가리키게 한다.

하나의 project 안에서 같은 candidate를 여러 파일에 full local record로 중복하지 않는다. 처음 분류한 곳을 canonical local candidate record로 둔다. 이후 파일에서는 boundary context, build event, close summary로만 참조한다.

idea는 다음에 해당할 때만 promote한다.

- 새 context에서 다시 중요해질 수 있다.
- 현재 package의 boundary를 설명한다.
- distinct future bet이다.
- 여러 project, feedback, build trade-off에서 반복된다.

그 외에는 project notes나 build log에 남기거나 drop한다.

## During Candidate Sorting

raw request는 여러 candidate로 나뉠 수 있다.

가능한 outcome:

- Selected for Framing.
- Not this package.
- Parking lot candidate.
- Spike.
- Dependency-tracking.
- Cleanup.
- Bugfix/diagnose.
- Dropped.

sorting 뒤에는 선택되지 않은 모든 candidate를 즉시 정리한다.

- `Not this package`는 current `01-frame.md`에 package boundary context로 남긴다.
- `Parking lot` candidate는 distinct future bet으로 돌아올 수 있을 때 repo-level `shapeup/parking-lot.md`에 append 또는 update한다.
- `Dropped`는 decision을 설명할 때만 남긴다.
- `Spike`는 selected package 안에 숨기지 말고 별도 learning candidate로 기록한다.

## During Framing

Framing 중 original candidate가 problem이 아니라 symptom이었다는 것이 드러날 수 있다.

가능한 outcome:

- current candidate를 더 나은 candidate로 교체한다.
- candidate 이름을 바꾼다.
- candidate를 쪼갠다.
- not-now로 표시한다.
- drop한다.
- 다시 중요해질 수 있을 때만 park한다.

frame이 다른 곳을 가리키는데 original candidate를 억지로 밀고 가지 않는다.

## During Shaping

Shaping 중 candidate boundary가 드러날 수 있다.

- first bet 밖의 feature.
- 새 core object.
- 새 user role.
- privacy, trust, permission decision.
- follow-up product bet.
- shaping을 계속하기 전에 필요한 spike.

가능한 outcome:

- selected candidate의 first bet에 필수일 때만 포함한다.
- selected candidate가 틀렸거나 너무 크면 Candidate Sorting으로 돌아간다.
- not this package로 기록한다.
- distinct bet으로 돌아올 수 있을 때만 park한다.
- feature temptation일 뿐이면 drop한다.

## During Building

Building 중 package-outside idea가 드러날 수 있다. 기본적으로 바로 global parking lot으로 옮기지 않는다.

Building은 하나의 write-time checkpoint에서 두 기록을 사용한다.

1. 모든 package-outside idea를 `06-build-log.md`에서 분류한다.
2. `Candidate promotion`으로 분류되면 같은 checkpoint에서 `shapeup/parking-lot.md`와 reconcile한다.

build-time candidate를 memory 안에만 남기지 않는다. build log에 기록하거나, promote하거나, shaping으로 돌아가거나, drop한다.

가능한 outcome:

- Current build: package desired outcome을 막을 때만.
- Build log only: useful context지만 future candidate는 아님.
- Candidate promotion: distinct future bet 또는 repeated signal.
- Return to shaping: why/what/scope를 다시 열 때.
- Dropped: boundary value 없는 nice-to-have.

## Promotion Targets

- `project.md`: current status와 selected candidate.
- `01-frame.md` 또는 `02-shape.md`: shaping context와 boundaries.
- `06-build-log.md`: build-time discoveries와 package-outside ideas.
- `shapeup/parking-lot.md`: 다시 중요해질 가능성이 있는 candidate만. backlog가 아니라 repo-level candidate register로 사용한다.
- Dropped: decision을 설명하지 않는 한 durable record가 필요 없다.

## Parking Lot Updates

다음 table shape를 사용한다.

```md
| Candidate | Return Condition | Signals | Last Seen | Sources | Status |
|---|---|---|---|---|---|
```

parking-lot candidate가 다시 나타나면:

- row를 중복하지 않는다.
- 새 source를 `Sources`에 추가한다.
- `Last Seen`을 갱신한다.
- 짧은 pressure signal을 `Signals`에 추가한다.
- 새 context가 왜 다시 중요해질 수 있는지 바꿀 때만 `Return Condition`을 재검토한다.
- `Status`는 `parked`, `watch`, `revived`, `dropped`처럼 descriptive하게 둔다.
