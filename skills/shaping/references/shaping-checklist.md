# Shaping Checklist

Shaping은 build 가능한 형태를 찾는 단계다. 구현 세부사항을 다 정하려 하지 말고, build에 남는 질문이 대부분 `어떻게`가 되도록 만든다.

Shaping은 build 팀에게 넘길 문서를 쓰는 단계가 아니다. build 중 핵심 불확실성이 터지지 않도록 문제와 해결 구조의 unknown을 충분히 줄이는 단계다. Shaping 중에 problem, baseline, desired outcome, appetite가 흔들리면 Frame Go가 약했던 신호로 보고 Framing으로 돌아간 뒤 다시 Shape로 온다.

빠르게 여러 접근을 탐색하되, wireframe이나 high-fidelity mock으로 너무 빨리 내려가지 않는다. 결과물은 화면 디자인이 아니라 요소와 연결이다.

When asking a shaping question:

- Include your recommended answer when you can.
- If code, docs, or existing product behavior can answer it, inspect them instead of asking.
- Use concrete scenarios to expose hidden product boundaries.

## Close These

- Core change: 사용자 입장에서 새로 가능해지는 일.
- Text Breadboard: 요소와 관계.
- Not doing: 이번에 명시적으로 뺄 범위.
- Risks: build 중 터질 수 있는 복잡성, 예외, 불확실성.
- Material unknowns: build를 깨뜨릴 수 있는 product, interaction, technical unknown.

## Breadboard

Breadboard와 Fat Marker Sketch는 같은 목적을 가진 서로 다른 shaping 도구다. 둘 다 build 전 불확실성을 줄이되, 너무 구체적이지도 너무 추상적이지도 않게 만든다. `02-shape.md`나 `03-package.md`에서 둘 중 하나를 쓰거나 함께 쓸 때는 `references/breadboard.md`를 읽는다.

텍스트 Breadboard는 페이지 흐름보다 요소와 관계를 적는다. 기본 출력은 bullet list가 아니라, places, affordances, connections가 한 화면에서 보이는 compact text board다.

- `[Place]`: 화면, 모달, 메뉴, 상태, artifact처럼 사용자가 도달하는 곳.
- `(Affordance)`: 버튼, 입력, 링크, 명령, prompt, 문구처럼 사용자가 읽거나 조작하는 것.
- `->`: 어떤 행동이 어떤 상태, 장소, artifact, decision으로 이어지는가.

```text
[Place]
  (Affordance) -> [State or artifact]
```

Fat Marker Sketch는 보이는 표면, rough arrangement, grouping, emphasis가 solution의 중요한 부분일 때 쓴다. Breadboard의 대체재로만 취급하지 않는다. Breadboard와 나란히 둘 수 있고, 시나리오 안에서 중요한 여러 순간의 rough visible surface를 그릴 수 있다. 흐름도나 logic diagram이 아니며, package 수신자가 핵심 형태를 볼 수 있게 하는 용도다.

Do not replace the Breadboard with a paragraph, checklist, implementation plan, or screen-by-screen wireframe.

## Right Abstraction Level

Shaping 산출물은 너무 추상적이지도, 너무 구체적이지도 않아야 한다.

너무 추상적인 신호:

- 기능 이름만 있고 사용 흐름이 없다.
- 사용자가 어디서 시작해 어디로 가는지 모른다.
- 핵심 affordance가 없다.
- build team이 무엇을 넣고 뺄지 판단할 수 없다.
- rabbit hole이 "나중에 구현하면서"로 남아 있다.

너무 구체적인 신호:

- 화면 배치, 색, spacing, component structure를 고정한다.
- wireframe이나 high-fidelity mock이 사실상 요구사항이 된다.
- 구현 파일, task list, 세부 UI 상태를 package에서 확정한다.
- designer/builder가 trade-off할 여지가 없다.
- 시각 detail 때문에 problem/solution fit 논의가 흐려진다.

적절한 상태:

- problem, appetite, solution이 함께 맞물린다.
- 핵심 장소, affordance, 연결이 보인다.
- 하지 않을 것이 분명하다.
- 위험 지점은 해결, 절단, out-of-bounds 중 하나로 처리됐다.
- build에 남은 질문은 주로 `어떻게`다.

## Flow Sketch

Use this as a mental model, not as a required diagram in every output.

```md
[사용자.Shaping 요청]
  -> 시작한다 [Codex.빠른 제외 판단]

[Codex.빠른 제외 판단]
  -> 판단한다 [Shape Up 사용 / Shape Up 미사용]

[Shape Up 사용]
  -> 연다 [Framing 대화]

[Framing 완료]
  -> 만든다 [Shape 초안]

[Shape Go]
  -> 만든다 [Package 브리프]
```

## Rabbit Hole Check

A rabbit hole is a risk that can consume the appetite because a key assumption is still unproven.

For each rabbit hole, identify:

- Assumption: what must be true?
- Smallest proof: test, harness, fixture, browser check, code inspection, or spike.
- Handling: solve, cut, bound, or spike.

Handling options:

- `Solve`: prove it before package approval or in the first slice.
- `Cut`: remove the scope that creates it.
- `Bound`: keep it explicitly out of the package.
- `Spike`: stop shaping and learn first.

Architecture-flavored rabbit holes:

- Existing module is shallow and will spread complexity across callers.
- No clear interface or test surface exists.
- A new seam would be fake indirection with only one adapter.
- Shared surface changes create integration risk.

Do not pass a rabbit hole to build as "figure it out later". Either prove it, cut it, bound it, or stop for a spike.

## Shaping Checkpoint

Use this as a lightweight checkpoint before packaging. It is fine to return to framing if packaging exposes a weak problem, baseline, or appetite.

The shape is probably strong enough when:

- The rough result is visible.
- There is a core flow.
- The Breadboard shows places, affordances, and connections in a compact text board.
- If the shape is hard to picture, a Fat Marker Sketch shows the important scenario moments as rough surfaces, not as a pure flow diagram.
- Not doing is explicit.
- Risks are visible.
- Trust, privacy, empty state, and reversibility were checked when relevant.
- Product tone, visibility, and core terms are closed enough for build.
- A slow-motion walkthrough exposes no missing major affordance.
- Rabbit holes are solved, cut, or out-of-bounds.
- Material unknowns are not being thrown into build.

This checkpoint means a package can be written. It is not build approval.

## Do Not Package Yet

Do not package when:

- Problem is clear but solution is not.
- Solution seems good but baseline is weak.
- Appetite makes the core outcome impossible.
- Rabbit holes are left for builders to solve.
- Package is becoming a detailed requirements list or high-fidelity design.
