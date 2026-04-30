# Package Approval Questions

`Package Approved`를 표시하기 전에 사용한다.

Package Approval은 명시적이어야 한다. 사용자의 자연스러운 approval 표현은 받아들이되, 침묵, package path, 반대 없음만으로는 승인으로 추론하지 않는다. 반대가 없다는 것은 shaping을 계속하기에는 충분하지만 build를 시작하기에는 충분하지 않다.

## Questions

- problem이 지금 중요하고 충분히 specific한가?
- appetite가 Codex execution budget과 맞는가?
- solution이 그 appetite 안에서 attractive하고 viable한가?
- 지금이 맞는 timing인가?
- 필요한 product context와 technical context가 있는가?
- no-go item과 parking lot boundary가 scope creep을 막을 만큼 강한가?
- package가 builder에게 넘길 만큼 rough, solved, bounded한가?

## Rabbit Hole Verification

Package Approval 전에:

- 모든 rabbit hole은 `solve`, `cut`, `bound`, `spike` 중 하나의 handling을 가진다.
- 모든 `solve`는 result가 있거나, first slice에서 feedback loop로 증명하도록 명시되어 있다.
- 모든 `cut`은 Breadboard, Build Rules, First Slice Hint에서 제거되어 있다.
- 모든 `bound`는 `Not Doing` 또는 `Build Rules`에 반영되어 있다.
- 모든 `spike`는 package approval을 멈추고 spike가 된다.
- 어떤 rabbit hole도 "build 중 알아서 해결"로 남아 있지 않다.

## 약할 때

- Problem/baseline이 약함: Framing으로 돌아간다.
- Solution/boundary가 약함: Shaping으로 돌아간다.
- Build context가 약함: technical reality check를 하거나 좁은 질문을 한다.
- Appetite가 맞지 않음: approval 전에 scope를 줄인다.
- Rabbit hole verification이 약함: approval 전에 solve, cut, bound, spike 중 하나로 처리한다.
