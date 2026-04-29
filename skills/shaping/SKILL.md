---
name: shaping
description: 사용자가 Codex에게 Shape Up 방식으로 build 전에 작업을 shape해달라고 요청할 때 사용한다. 큰 기능/제품 아이디어를 fit-check, candidate/framing, shaping, package까지 정리하고, Shape Up을 쓰지 말아야 할 명백한 이유만 빠르게 걸러내며, package가 승인되기 전에는 build를 시작하지 않는다. 트리거 예시는 "Shape Up으로 진행", "shaping 해줘", "fit-check/frame/shape/package로 정리", "build 전에 shape 잡자"이다. 사용자가 한국어로 말하면 한국어로 질문하고 한국어 문서를 작성한다.
---

# Shape Up Project Preparation

Codex와 사용자가 Shape Up 방식으로 build 전에 project를 준비하도록 돕는다. 목표는 질문을 늘리는 것이 아니라, 필요한 판단을 build 앞단으로 당겨 build 중 `왜/무엇` 질문을 줄이는 것이다.

이 skill은 하나의 파일로 유지하지만 내부 단계는 분리한다.

- Framing: 요구, 압력, 후보를 가진 쪽과 대화해서 문제와 outcome을 닫고 `Frame Go`를 판단한다.
- Shaping: build 중 핵심 불확실성이 터지지 않도록 solution, boundary, material unknown을 닫고 `Shape Go`를 판단한다.
- Package: build 인계 문서로 포장하고 `Package Approval`을 받는다.

## 입출력 언어

- 사용자가 쓰는 언어를 그대로 따른다.
- 사용자가 한국어로 요청하면 질문, 중간 설명, 산출물 문서를 한국어로 작성한다.
- Shape Up, build, package, breadboard, appetite 같은 방법론 키워드는 필요하면 그대로 쓰되, 처음 등장할 때 한국어 설명을 붙인다.
- 영어로 된 템플릿 문구를 그대로 출력하지 않는다.
- 사용자가 별도 언어를 지정하면 그 언어를 우선한다.

## 핵심 규칙

- 모든 일을 Shape Up으로 다루지 않는다.
- 시간은 고정하고 범위는 조절한다.
- Markdown을 source of truth로 둔다.
- 산출물은 project workspace 안에 묶는다.
- 파일을 마지막에 한 번에 공개하지 말고, 현재 단계와 완료 기준은 중간중간 사용자에게 보여준다.
- build 전에 결과물이 `거칠지만`, `풀렸고`, `경계가 있는지` 확인한다.
- `Frame Go`와 `Shape Go`를 요약하기 전에는 package를 쓰지 않는다.
- package가 승인되기 전에는 build를 시작하지 않는다.
- Shaping 중 problem, baseline, desired outcome, appetite가 흔들리면 그 자리에서 억지로 solution을 고정하지 말고 Framing으로 되돌아간다.
- build 중 `왜/무엇` 질문이 다시 나오면 framing 또는 shaping으로 되돌린다.
- closed project 전체를 기본으로 읽지 않는다. 다음 project에 필요한 지식은 product memory와 parking lot에서 가져온다.
- Candidate는 아직 framed 되지 않은 request or idea다. build commitment도 backlog item도 아니며, Framing을 통해 문제, outcome, appetite가 닫혀야 Shaping으로 넘어간다.
- `parking-lot`은 backlog가 아니다. 정기적으로 grooming하지 않는다. 오래된 항목은 다시 중요해졌을 때만 새 맥락과 함께 candidate로 되살려 Framing한다.
- `product-memory`는 project log가 아니다. 다음 project에도 기본값으로 가져갈 durable product 판단만 기록한다.
- Frame Go는 build 승인이 아니라 shaping에 시간을 써도 된다는 승인이다.
- Shape Go는 package를 쓸 수 있다는 뜻이지 아직 build 승인 자체는 아니다.
- Package Approved가 되어야 build로 넘어갈 수 있다.

## 시작 프로토콜

현재 작업 디렉토리에서 다음 파일이 있으면 먼저 읽는다.

- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- 사용자가 기존 project 경로를 주면 해당 `project.md`

이 파일들은 현재 작업의 기본 맥락이다. 단, 사용자가 특정 closed project를 지정하지 않는 한 `shapeup/closed/` 아래의 과거 project 문서 전체를 읽지 않는다.

`product-memory.md`를 읽을 때는 Vision, Strategy, Pressures, core object, durable decision, repeated no-go를 확인한다. `Pressures`는 제품/사업/고객/운영/기술에서 반복적으로 작용하는 압력이며, 해결책이나 backlog가 아니라 candidate가 왜 다시 떠오르는지 이해하기 위한 배경이다.

`parking-lot.md`를 읽을 때는 queue처럼 다음 작업을 고르지 않는다. 다시 중요해진 항목만 현재 요청 맥락과 연결해 candidate로 다루고, 과거 항목은 그대로 package로 만들지 않는다.

`shapeup/notes/operating-model.md`는 실행 규칙이 아니라 참고 메모다. 사용자가 명시적으로 요청할 때만 읽는다.

## Project Workspace

저장 위치를 사용자가 지정하지 않으면 현재 작업 디렉토리 아래에 project workspace를 만든다.

```text
shapeup/
  active/
    NNN-topic-slug/
      project.md
      01-frame.md
      02-shape.md
      03-package.md
```

기존 `cycles/` 구조가 이미 있는 프로젝트에서는 새 구조로 강제 이동하지 않는다. 새 project부터 `shapeup/active/`를 기본으로 사용하고, 기존 cycle 문서는 필요한 경우 참조만 한다.

`project.md`는 상태판이다. shaping 시작 시 만들거나 갱신한다.

```md
# Project NNN: Topic

Status: Shaping
Source of Truth: ./03-package.md

## Checkpoints
- Candidate:
- Frame Go:
- Shape Go:
- Package Approved:

## Current Summary

## Carries Forward
```

## 진행 흐름

1. 빠른 제외 판단
2. Mode / Candidate / 제품 영역 정리
3. Start with No / Scope Filter
4. Framing
5. Shaping
6. Package
7. Package 승인
8. 사용자 검토

## 단계 체크포인트

사용자가 "다 된 건가?"라고 느끼지 않도록, 긴 대화에서는 단계가 바뀔 때 짧은 상태를 보여준다. 체크포인트는 문서 전체 초안이 아니라 현재 판단 요약이다.

권장 형식:

```md
현재 단계: Framing
닫힌 판단:
- 문제:
- 현재 대체 방식:
- 원하는 결과:

아직 열려 있는 판단:
- 성공 기준:
- Appetite:

다음 단계: Shaping으로 넘어가기 전에 위 판단을 확인
```

체크포인트 규칙:

- Framing 완료 전에는 문제, 현재 대체 방식, 원하는 결과, 성공 기준, appetite가 보이는지 확인한다.
- Framing이 충분하면 `Frame Go`를 요약하고 `project.md`에 기록한다.
- `Frame Go`는 shaping 시작 승인이다. build 시작 승인으로 표현하지 않는다.
- Shaping 완료 전에는 핵심 변화, breadboard, 하지 않을 것, 위험 지점, material unknown 처리 방식이 보이는지 확인한다.
- Shaping이 충분하면 `Shape Go`를 요약하고 `project.md`에 기록한다.
- Package 작성 전에는 build에 남은 질문이 대부분 `어떻게`인지 확인한다.
- Package 작성 전에는 포함 기능이 첫 package 검증에 필요한지 확인한다.
- Package 승인 전에는 betting 질문을 통과하는지 확인한다.
- 사용자가 승인하거나 큰 이견이 없으면 다음 단계로 진행한다.
- compressed mode를 사용자가 명시하거나 작업이 작으면 frame/shape/package를 짧게 진행할 수 있지만, `Frame Go`, `Shape Go`, package 승인 gate는 생략하지 않는다.

## 1. 빠른 제외 판단

사용자가 이 skill을 호출했다면 기본값은 "Shape Up으로 진행"이다. 처음부터 "이 일이 Shape Up에 맞나요?"라고 묻지 않는다. 대신 Codex가 조용히 제외 조건을 확인하고, 명백히 맞지 않을 때만 짧게 중단하거나 더 가벼운 대안을 제안한다.

이 확인의 목적은 방법론 사용 허가를 다시 받는 것이 아니라, Shape Up을 쓰면 오히려 피로가 커지는 경우를 걸러내는 것이다.

그대로 진행해도 되는 신호:

- 기능 또는 제품 흐름 변화다.
- 단순 잡일이 아니라 shape가 필요하다.
- build 전에 문제와 형태를 어느 정도 정할 수 있다.
- build 중 scope 통제가 중요하다.

중단하거나 대안을 제안할 신호:

- 긴급 버그 또는 운영 대응이다.
- 반나절에서 하루 정도면 끝나는 작은 작업이다.
- 외부 의존성이 너무 커서 흐름을 통제하기 어렵다.
- 아직 무엇을 만들지도 몰라 탐색이 먼저다.
- launch 직전 cleanup work다.

명백히 맞지 않으면 더 가벼운 대안을 제안한다:

- reactive work: Kanban 또는 ops flow
- unknown-first work: spike 또는 exploration
- dependency-heavy work: dependency-tracking flow
- launch cleanup: cleanup mode
- small task: 바로 실행하거나 짧은 checklist 사용

애매하면 Shape Up을 계속 진행한다. 단, Framing 중에도 제외 조건이 분명해지면 그때 멈춰도 된다.

## 2. Mode / Candidate / 제품 영역 정리

플랫폼, 커뮤니티, 마켓플레이스, SaaS처럼 큰 제품 아이디어가 들어오면 바로 Framing으로 들어가지 않는다. 먼저 전체 제품 영역과 첫 bet 후보를 구분한다. 이 단계는 package보다 큰 맥락을 package 안에 섞지 않기 위한 것이다.

Candidate는 별도 build gate가 아니라 아직 framed 되지 않은 request or idea의 상태다. 사용자가 방금 요청한 것, 고객사 요청, parking lot에서 다시 떠오른 항목, 이전 project의 carries forward가 모두 candidate가 될 수 있다. Candidate로 다룬다는 것은 build하겠다는 뜻이 아니라 Framing에서 문제와 outcome을 확인하겠다는 뜻이다.

먼저 현재 작업 mode를 판단한다.

- Existing product / Production mode: 기존 구조에 맞는 shaped project로 진행한다.
- New product / R&D mode: 아직 핵심 구조를 모르면 package build가 아니라 spike 또는 senior exploration으로 분리한다.
- Cleanup mode: launch 전 정리라면 shaped package보다 cleanup flow가 맞을 수 있다.
- Reactive / dependency-heavy work: Shape Up project와 분리한다.

Mode 판단은 project에 맞는 기대치를 정하기 위한 것이다. 모든 일을 production-mode package로 억지로 만들지 않는다.

정리할 항목:

- 장기 비전: 크게 어디로 가려는가?
- 중심 객체: 사용자가 반복해서 만들고, 보고, 상호작용할 핵심 대상은 무엇인가?
- 사용자 역할: 누가 쓰는가?
- 가능한 project/package 후보: 첫 build 후보가 될 수 있는 덩어리 2-5개
- 첫 package 후보 선택: 가장 작게 차별점을 검증할 수 있는 후보
- Parking lot: 이번에는 하지 않지만 장기 방향으로 보존할 후보

Candidate 확인:

- mode가 분명하다.
- 전체 제품 영역과 첫 package 후보가 구분된다.
- 첫 package 후보가 하나의 appetite 안에 들어갈 수 있다.
- 첫 package 후보가 장기 비전과 연결된다.
- 후속 후보는 꼭 남겨야 할 때만 parking lot에 남긴다. parking lot은 commitment나 queue가 아니다.
- 첫 package 후보가 한 문장으로 설명되는 하나의 변화다.
- 중심 객체와 후속 객체가 섞이지 않는다.
- candidate가 grab-bag이면 더 좁은 문제로 다시 자른다.

작은 기능 요청이면 이 단계를 생략하고 Framing으로 넘어간다.

## 3. Start with No / Scope Filter

새 기능 후보는 기본값을 `No / Parking Lot`으로 둔다. 첫 bet 검증에 직접 필요하지 않으면 이번 package에 넣지 않는다.

`No`는 아이디어를 버린다는 뜻이 아니다. 이번 appetite와 첫 bet 안에서 다루지 않는다는 뜻이다. 좋은 아이디어라도 지금 넣으면 모양이 흐려지거나 build 중 `왜/무엇` 질문을 다시 열면 No가 맞다.

No가 나와야 하는 신호:

- 첫 성공 장면에 직접 등장하지 않는다.
- 없어도 원하는 결과와 배움이 유지된다.
- 새 중심 객체나 새 사용자 역할을 만든다.
- 새 권한, 공개 범위, 개인정보, 신뢰 판단을 연다.
- 독립적인 화면이나 운영 흐름이 필요하다.
- 기능이 들어가면 appetite를 늘려야 한다.
- package의 핵심 문장을 두 개 이상으로 쪼개게 만든다.
- 기존 bet의 성공 기준보다 후속 bet의 성공 기준에 가깝다.
- "이왕이면", "쉽게 할 수 있으니", "나중에 필요할 테니"가 주된 근거다.

Yes가 될 수 있는 신호:

- 없으면 첫 package 자체를 검증할 수 없다.
- 사용자의 핵심 행동을 가능하게 하는 최소 요소다.
- 현재 appetite 안에서 온전히 동작하는 형태로 끝낼 수 있다.
- 나중 확장을 막는 구조적 위험을 줄이는 최소 장치다.
- 새로운 product 판단을 열지 않고 build의 `어떻게` 문제로 남는다.

처리 원칙:

- 첫 bet 검증에 직접 필요하면 package 후보로 남긴다.
- 나중에 붙일 수 있게 막지만 않으면 되는 기능은 보통 기록하지 않는다. 반복해서 다시 등장하거나 경계 설명에 필요한 경우에만 parking lot으로 보낸다.
- 새로운 product 판단을 여는 기능은 shaping 안에서 따로 다루거나 후속 bet로 분리한다.

Scope Filter Go 확인:

- package 후보 기능이 첫 성공 장면에 직접 등장한다.
- 빠진 기능이 있어도 원하는 결과가 여전히 검증된다.
- 제외한 기능 중 다시 볼 가치가 있는 것만 parking lot에 남아 있다.
- build 중 같은 기능이 다시 나오면 package 밖 기능으로 판단할 수 있다.
- parking lot 항목은 이번 package의 commitment가 아니며, 다시 중요해졌을 때만 새 맥락으로 candidate가 되어 Framing된다.

## 4. Framing

Framing은 문서 작성보다 대화 중심으로 진행한다. 한 번에 긴 질문 목록을 던지지 말고, 필요한 질문만 순서대로 묻는다.

정리할 항목:

- 문제: 지금 실제로 어떤 문제가 있는가?
- 현재 대체 방식: 지금은 어떻게 처리하고 있는가?
- Baseline: 현재 방식이 어디서 깨지는가?
- 원하는 결과: 작업 후 어떤 상태 변화가 생겨야 하는가?
- 성공 기준: 무엇이 달라지면 좋아졌다고 볼 수 있는가?
- Appetite: 이번에 쓸 수 있는 시간과 범위 한도는 어디까지인가?

Frame Go 확인:

- 왜 필요한지 한두 문장으로 설명 가능하다.
- 현재 대체 방식이 보인다.
- baseline이 구체적인 이야기나 현재 흐름으로 설명된다.
- 원하는 결과가 상태 변화로 적혔다.
- 좋아졌다고 판단할 기준이 있다.
- 사용자가 왜 지금 이 행동을 할지 최소한의 pull이 보인다.
- 빈 상태에서도 첫 사용자가 무엇을 할지 보인다.
- 기능 요청을 그대로 받아쓴 것이 아니라 실제로 깨지는 지점이 좁혀졌다.
- appetite가 solution을 자르는 제약으로 작동한다.
- Frame Go는 "이 문제를 shape할 가치가 있다"는 뜻이지 build 승인이나 solution 승인으로 쓰지 않는다.

## 5. Shaping

Shaping은 build 가능한 형태를 찾는 단계다. 구현 세부사항을 다 정하려 하지 말고, build에 남는 질문이 대부분 `어떻게`가 되도록 만든다.

Shaping은 build 팀에게 넘길 문서를 쓰는 단계가 아니다. build 중 핵심 불확실성이 터지지 않도록 문제와 해결 구조의 unknown을 충분히 줄이는 단계다. Shaping 중에 problem, baseline, desired outcome, appetite가 흔들리면 Frame Go가 약했던 신호로 보고 Framing으로 돌아간 뒤 다시 Shape로 온다.

정리할 항목:

- 핵심 변화: 사용자 입장에서 새로 가능해지는 일
- 텍스트 breadboard: 요소와 관계
- 하지 않을 것: 이번에 명시적으로 뺄 범위
- 위험 지점: build 중 터질 수 있는 복잡성, 예외, 불확실성

텍스트 breadboard는 페이지 흐름보다 요소와 관계를 적는다.

해결안을 찾을 때는 빠르게 여러 접근을 탐색하되, wireframe이나 high-fidelity mock으로 너무 빨리 내려가지 않는다. 결과물은 화면 디자인이 아니라 요소와 연결이다.

Breadboard에는 다음을 구분해서 적는다.

- 장소: 화면, 모달, 메뉴, 상태처럼 사용자가 도달하는 곳
- 행동 가능 요소: 버튼, 입력, 링크, 문구처럼 사용자가 읽거나 조작하는 것
- 연결: 어떤 행동이 어떤 상태나 장소로 이어지는가

Fat marker sketch는 필요한 경우에만 쓴다. package 수신자가 핵심을 못 볼 위험이 있는 linchpin 영역을 설명하기 위한 용도이며, 시각 디테일을 고정하는 용도가 아니다.

### 적절한 추상도 기준

Shaping 산출물은 너무 추상적이지도, 너무 구체적이지도 않아야 한다.

너무 추상적인 신호:

- 기능 이름만 있고 사용 흐름이 없다.
- 사용자가 어디서 시작해 어디로 가는지 모른다.
- 핵심 affordance가 없다.
- build team이 무엇을 넣고 뺄지 판단할 수 없다.
- rabbit hole이 "나중에 구현하면서"로 남아 있다.

너무 구체적인 신호:

- 화면 배치, 색, spacing, 컴포넌트 구조를 고정한다.
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

```md
[사용자.Shaping 요청]
  -> 시작한다 [Codex.빠른 제외 판단]

[Codex.빠른 제외 판단]
  -> 판단한다 [Shape Up 사용 / Shape Up 미사용]

[Shape Up 사용]
  -> 연다 [Framing 대화]

[Framing 완료]
  -> 만든다 [Shape 초안]

[Shape go]
  -> 만든다 [Package 브리프]
```

Shape Go 확인:

- 대략 어떤 결과물이 나올지 보인다.
- 핵심 흐름이 있다.
- 하지 않을 것이 적혀 있다.
- 위험 지점이 드러나 있다.
- build에 남는 질문이 대부분 `어떻게`다.
- solution이 너무 추상적이지도, 너무 구체적이지도 않다.
- problem, appetite, solution이 함께 맞물린다.
- trust, privacy, empty state, reversibility처럼 첫 사용을 깨뜨릴 위험을 확인했다.
- 제품의 톤, 공개 범위, 핵심 용어의 의미처럼 build 결과를 크게 바꿀 맥락이 닫혀 있다.
- slow-motion walkthrough로 주요 사용 흐름을 한 번 걸어보고 빠진 affordance나 결정 지점을 확인했다.
- rabbit hole은 단순히 이름만 붙인 것이 아니라 해결, 절단, out-of-bounds 중 하나로 처리했다.
- technical / interaction 관점에서 material unknown이 남아 있지 않다.

Shape Go가 나지 않는 신호:

- 문제는 선명하지만 solution이 없다.
- solution은 좋아 보이지만 problem/baseline이 약하다.
- appetite 안에 맞추려면 핵심 결과가 사라진다.
- rabbit hole이 "나중에 build에서 알아서"로 남아 있다.
- package가 사실상 세부 요구사항 목록이나 high-fidelity 설계로 굳어지고 있다.

## 6. Package

Package는 shaping을 대체하지 않는다. package 단계에서 처음 중요한 product 판단이 나오면 shaping으로 되돌아간다.

최소 구성:

- 왜
- 원하는 결과
- Appetite
- Breadboard
- 하지 않을 것
- 위험 지점
- 첫 조각 힌트
- Build 규칙
- Parking lot 또는 기능 유혹 목록
- Build context
- Technical reality check 또는 생략 이유

Package는 build 인계 문서다. 다음 Codex 세션이 package만 읽고도 첫 vertical slice를 시작할 수 있어야 한다.

Package는 build 인계 문서지만 build 계획서는 아니다. vertical slice 목록, 파일 단위 task, 구현 순서는 package에서 확정하지 않는다. 단, build가 시작될 첫 진입점 힌트는 남길 수 있다.

Package에는 필요한 경우 `하지 않을 것`에 이유를 붙인다. 단순 제외 목록보다 "왜 지금 안 하는지"가 보여야 build 중 scope creep을 막기 쉽다.

`Build context`에는 package만 받은 새 세션이 놓치기 쉬운 맥락을 짧게 적는다.

- 제품/UX 톤: 어떤 종류의 제품처럼 느껴져야 하는가?
- 핵심 용어의 의미: 관심, 보유, 요청 같은 단어가 이번 bet에서 무엇을 뜻하는가?
- 초기 데이터 가정: seed catalog, 예시 카테고리, demo data는 어떤 성격인가?
- 공개 범위와 privacy: 무엇을 집계로 보여주고, 무엇을 개별 노출하지 않는가?
- 장기 방향과 이번 제외선: 나중에 붙을 방향이 이번 UI placeholder로 들어와도 되는가?
- Empty state: 숫자가 0이거나 catalog가 작을 때도 어떤 행동이 보여야 하는가?

Build context는 새 기능 목록이 아니다. build가 제품 성격을 오해하지 않도록 하는 해석 가이드다.

기존 코드베이스가 있거나 auth, database, payments, routing, permissions, deployment 같은 shared surface를 건드리면 package 전에 기술 현실 점검을 한다. 이 점검은 제품 방향을 바꾸지 않고 `can / how / risk`만 본다.

```md
## Technical Reality Check

- Existing patterns:
- Likely touched modules:
- Integration risks:
- Rabbit holes:
- Smallest viable implementation path:
```

필요하면 별도 subagent에게 맡길 수 있다. subagent에게는 product 방향을 재정의하지 말고 기술적 rabbit hole과 가장 작은 구현 경로만 반환하라고 지시한다.

Appetite에는 사람 기준 시간 블록과 Codex 실행 경계를 함께 적는다.

```md
## Appetite

Human appetite:
- 1 week MVP

Codex execution budget:
- Single app surface
- Local persistence only
- No production auth
- No backend service
- One primary flow
- One supporting flow
- Build + browser smoke verification
```

## 7. Package 승인

Package를 썼다고 자동으로 build로 넘어가지 않는다. Package Approval은 Framing 승인이 아니다.

- Framing은 shaping할 가치가 있는 문제인지 승인한다.
- Shaping은 build 가능한 solution과 boundary가 나왔는지 승인한다.
- Package Approval은 shaped package를 build로 넘겨도 되는지 승인한다.

Package Approval은 책의 betting 질문을 Codex/project 맥락에 맞춰 확인하는 gate다.

Framing에서 이미 확인했어야 하는 것:

- 문제 중요도
- baseline
- 원하는 outcome
- 지금 다룰 이유
- shaping할 appetite

Package Approval에서 확인하는 것:

승인 질문:

- 문제는 지금 중요하고 충분히 구체적인가?
- appetite와 Codex execution budget이 맞는가?
- solution이 attractive하고 appetite 안에서 viable한가?
- 지금이 맞는 타이밍인가?
- 필요한 기술/제품 맥락과 사람이 준비되어 있는가?
- no-go와 parking lot이 build 중 scope creep을 막을 만큼 선명한가?
- 이 package는 build team/Codex에게 project 책임을 넘길 만큼 rough, solved, bounded한가?

하나라도 약하면 build로 넘기지 말고 framing 또는 shaping으로 되돌린다.

## 8. 사용자 검토

package를 저장한 뒤 사용자에게 검토를 요청한다. 사용자가 승인하기 전에는 build를 시작하지 않는다.

검토 요청에는 다음을 포함한다:

- package 파일 경로
- 이번 shaping에서 닫힌 판단
- 아직 남은 build 전 확인 사항
- `project.md`의 현재 상태

사용자가 package를 승인하면 `project.md`의 `Package Approved`를 갱신한다. 승인 뒤 build가 필요하면 별도의 building skill 또는 build 절차로 전환한다.

## 산출물 위치

사용자가 저장 위치를 지정하면 그 위치를 우선한다. 지정하지 않으면 현재 작업 디렉토리 아래에 다음 구조로 저장한다.

```text
shapeup/
  active/
    001-topic-slug/
      project.md
      01-frame.md
      02-shape.md
      03-package.md
```

작업이 기존 `cycles/` 구조에서 시작되었으면 해당 구조를 유지해도 된다. 새 작업은 `shapeup/active/`를 기본으로 한다.
