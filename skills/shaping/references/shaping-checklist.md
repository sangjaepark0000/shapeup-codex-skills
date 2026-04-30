# Shaping Checklist

Shaping은 build 가능한 solution shape를 찾는다. 세부 UI, component structure, file path, task order를 고정하지 않는다.

## Close These

- Core change: 사용자에게 무엇이 가능해지는가?
- Breadboard: places, affordances, connections.
- Not doing: 명시적 boundary.
- Risks: build complexity, exceptions, uncertainty.
- Material unknowns: build를 깨뜨릴 수 있는 product, interaction, technical unknown.

## Breadboard

wireframe 전에 text breadboard를 사용한다.

- Places: screens, modals, menus, states.
- Affordances: buttons, inputs, links, 사용자가 읽거나 행동하는 text.
- Connections: 어떤 action이 어떤 state 또는 place로 이어지는가.

Fat marker sketch는 선택 사항이다. text로 idea가 보이지 않는 linchpin area에만 사용한다.

## Right Abstraction Level

너무 추상적일 때:

- user flow 없는 feature name.
- start/end point가 없음.
- core affordance가 없음.
- builder가 무엇을 포함할지 결정할 수 없음.
- rabbit hole이 build에 남겨짐.

너무 구체적일 때:

- 고정된 layout, color, spacing, component structure.
- high-fidelity mock이 requirement가 됨.
- file-level task가 package에 고정됨.
- builder가 trade-off할 수 없음.

좋은 상태:

- problem, appetite, solution이 맞물린다.
- core places, affordances, connections가 보인다.
- no-go가 명확하다.
- risk가 solved, cut, out-of-bounds 중 하나로 처리된다.
- build 질문이 대부분 `how`다.

## Rabbit Hole Check

rabbit hole은 key assumption이 아직 증명되지 않아 appetite를 잡아먹을 수 있는 risk다.

각 rabbit hole에 대해 다음을 식별한다.

- Assumption: 무엇이 참이어야 하는가?
- Smallest proof: test, harness, fixture, browser check, code inspection, spike 중 최소 증명.
- Handling: solve, cut, bound, spike.

handling option:

- `Solve`: package approval 전 또는 first slice에서 증명한다.
- `Cut`: risk를 만드는 scope를 제거한다.
- `Bound`: package 밖으로 명시적으로 둔다.
- `Spike`: shaping을 멈추고 먼저 배운다.

Architecture-flavored rabbit hole:

- 기존 module이 얕아 complexity가 caller 전반으로 퍼진다.
- 명확한 interface 또는 test surface가 없다.
- 새 seam이 adapter 하나뿐인 가짜 indirection이 된다.
- shared surface 변경이 integration risk를 만든다.

rabbit hole을 "build 중 알아서 해결"로 넘기지 않는다. 증명하거나, 자르거나, 경계 밖으로 두거나, spike로 멈춘다.

## Shaping Checkpoint

packaging 전 가벼운 checkpoint로 사용한다. packaging이 weak problem, baseline, appetite를 드러내면 Framing으로 돌아가도 된다.

shape는 대체로 다음 상태면 충분히 강하다.

- rough result가 보인다.
- core flow가 있다.
- Not doing이 명시적이다.
- risk가 보인다.
- relevant할 때 trust, privacy, empty state, reversibility를 확인했다.
- product tone, visibility, core terms가 build에 충분할 만큼 닫혔다.
- slow-motion walkthrough에서 큰 affordance 누락이 보이지 않는다.
- rabbit hole이 solved, cut, out-of-bounds 처리되었다.
- material unknown을 build에 던지지 않는다.

이 checkpoint는 package를 쓸 수 있다는 뜻이다. build approval이 아니다.

## 아직 Package하지 말 것

다음 경우 아직 package하지 않는다.

- problem은 명확하지만 solution이 아님.
- solution은 좋아 보이지만 baseline이 약함.
- appetite로 core outcome이 불가능함.
- rabbit hole이 builder에게 남겨짐.
- package가 detailed requirements list 또는 high-fidelity design이 되고 있음.
