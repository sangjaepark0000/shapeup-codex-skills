# Candidate Sorting And Mode

raw request에 여러 candidate가 섞여 있거나, candidate가 parking lot에서 왔거나, 작업이 Shape Up에 맞지 않을 수 있을 때 Framing 전에 사용한다.

Candidate Sorting은 uncertainty를 해결하지 않는다. 어떤 uncertainty를 Framing/Shaping으로 가져갈지 고른다.

## Candidate Meaning

candidate는 아직 framed되지 않은 request 또는 idea다. build commitment도 아니고 backlog item도 아니다.

candidate는 다음에서 올 수 있다.

- 사용자의 현재 request
- customer request
- 다시 중요해진 parking lot item
- 이전 project에서 carry forward된 항목

## Sorting Questions

- 하나의 candidate인가, 여러 개가 섞였는가?
- 지금 어떤 candidate를 frame해야 하는가?
- 어떤 candidate가 명확히 this package가 아닌가?
- 어떤 candidate를 parking lot으로 돌려야 하는가?
- 어떤 candidate를 dropped 처리해야 하는가?
- 실제로는 bugfix, cleanup, spike, exploration, dependency-tracking work인가?

여기서 Framing/Shaping 질문에 답하지 않는다. problem importance, baseline, desired outcome, appetite, breadboard, material unknowns는 Framing/Shaping에 남긴다.

## Mode

framing 전에 작업 mode를 분류한다.

- `Existing product / Production mode`: 알려진 product structure 안에서 bounded project를 shape한다.
- `New product / R&D mode`: core structure가 불명확하면 package build 전에 spike 또는 senior exploration을 분리한다.
- `Cleanup mode`: launch cleanup은 shaped package보다 checklist가 맞을 수 있다.
- `Reactive / dependency-heavy work`: Shape Up project work와 분리한다.

## Classification

- `shape-now`: 이 candidate를 Framing/Shaping으로 가져간다.
- `needs-framing`: relevant해 보이지만 problem/baseline/outcome이 불명확하다.
- `not-shapeup`: 더 가벼운 flow를 사용한다.
- `not-now`: 가능성은 있지만 지금은 아니다.
- `parking-lot`: 다시 중요해질 수 있지만 지금은 아니다.
- `spike`: shaping 전에 배운다.
- `dependency-tracking`: 외부 dependency가 지배적이다.
- `cleanup`: cleanup flow를 사용한다.
- `bugfix/diagnose`: diagnosis loop를 사용한다.
- `dropped`: 보존할 명확한 이유가 없다.

## Large Product Ideas

다음을 분리한다.

- Long-term vision
- Core object
- User roles
- 2-5 possible package candidates
- First package candidate
- Parking lot candidates

## Output

출력은 짧게 유지한다.

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

다음 조건이면 Framing으로 간다.

- Mode가 명확하다.
- product area와 first package candidate가 분리되어 있다.
- first package candidate가 하나의 appetite 안에 들어간다.
- first candidate가 long-term direction과 연결된다.
- first candidate가 grab bag이 아니라 하나의 change다.
- core object와 follow-up object가 섞이지 않았다.

grab bag이면 Framing 전에 줄인다.

Framing 또는 Shaping 중 selected candidate가 틀렸다는 것이 드러나면 여기로 돌아와 select, rename, split, park, drop한다.
