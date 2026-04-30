# Fit Check

Shape Up이 요청에 맞는지 조용히 판단할 때 사용한다.

## Default

사용자가 `shaping`을 호출했다면 기본값은 계속 진행하는 것이다. 목표는 "Shape Up을 쓸까요?"를 다시 묻는 것이 아니라, 명백한 mismatch를 초기에 걸러내는 것이다.

## Good Fit

- Feature 또는 product flow 변경.
- build 전에 shape가 필요함.
- problem과 solution을 build 전에 bounded하게 만들 수 있음.
- scope control이 중요함.
- appetite가 solution choice를 제약해야 함.

## Poor Fit

- urgent bug 또는 production incident.
- 반나절 이하로 끝나는 작은 task.
- 작업 대상 자체가 불명확한 unknown-first research.
- flow를 통제할 수 없는 dependency-heavy work.
- launch cleanup 또는 punch list.

## Lighter Alternatives

- Reactive work: reproduce, minimise, hypothesise, instrument, fix, regression-check의 diagnosis loop를 사용한다.
- Unknown-first work: spike 또는 exploration.
- Dependency-heavy work: dependency-tracking flow.
- Launch cleanup: cleanup checklist.
- Small task: direct execution 또는 짧은 checklist.

애매하면 Framing으로 계속 가고, mismatch가 분명해졌을 때 멈춘다.
