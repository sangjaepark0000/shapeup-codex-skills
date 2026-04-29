---
name: building
description: 사용자가 승인된 Shape Up package를 기반으로 build를 진행해달라고 요청할 때 사용한다. package.md를 source of truth로 읽고, kickoff, integrated slice, scope map, discovered tasks, hill status, checkpoint 보고, scope hammering, verification, build-log를 통해 구현한다. build 중 why/what 질문이 다시 열리면 구현을 멈추고 shaping으로 되돌린다. 트리거 예시는 "package 승인했으니 build 해줘", "building 시작", "이 package로 구현 진행", "Shape Up build 단계로 가자"이다. 사용자가 한국어로 말하면 한국어로 진행하고 산출물을 작성한다.
---

# Building

승인된 Shape Up package를 실제 동작하는 결과물로 만드는 단계다. 목표는 package의 `왜/무엇/어디까지`를 다시 열지 않고, build 중 발견되는 task와 scope를 다루며 timebox 안에서 meaningful feature를 끝내는 것이다.

## 입출력 언어

- 사용자가 쓰는 언어를 그대로 따른다.
- 사용자가 한국어로 요청하면 질문, 중간 보고, build 산출물을 한국어로 작성한다.
- Shape Up, build, package, scope, hill status, vertical slice 같은 방법론 키워드는 필요하면 그대로 쓰되, 처음 등장할 때 한국어 설명을 붙인다.

## 입력 조건

- 승인된 `package.md`가 있어야 한다.
- package의 appetite, no-go, 위험 지점이 읽을 수 있어야 한다.
- 사용자가 package 파일 경로를 주고 build를 요청하면, 그 package는 승인된 것으로 간주하고 build를 시작한다.
- package가 없거나 승인 여부가 불명확하면 build를 시작하지 말고 shaping 또는 package 검토로 되돌린다.
- 새 스레드에서는 package 경로만으로도 충분해야 한다. Codex는 package를 읽고 build kickoff에 필요한 맥락을 복원한다.

## 시작 프로토콜

현재 작업 디렉토리에서 다음 파일이 있으면 먼저 읽는다.

- `shapeup/product-memory.md`
- `shapeup/project-index.md`
- package와 같은 폴더의 `project.md`

이 파일들은 build의 운영 맥락이다. 사용자가 특정 closed project를 지정하지 않는 한 `shapeup/closed/` 아래의 과거 project 문서 전체를 읽지 않는다.

`shapeup/notes/operating-model.md`는 실행 규칙이 아니라 참고 메모다. 사용자가 명시적으로 요청할 때만 읽는다.

## 핵심 규칙

- package.md를 source of truth로 둔다.
- package가 속한 project workspace를 build 산출물의 기준 위치로 둔다.
- `project.md`가 있으면 상태를 계속 갱신한다.
- build 중 `왜/무엇` 질문을 다시 정하지 않는다.
- `어떻게` 질문은 build 안에서 해결한다.
- horizontal layer만 쌓지 말고 integrated slice로 동작하는 조각을 만든다.
- async build는 모든 scope를 동시에 병렬 구현한다는 뜻이 아니라, 명확한 package와 scope map 덕분에 잦은 sync 없이 자율 실행한다는 뜻이다.
- task는 build 중 발견되는 것을 정상으로 본다.
- 진행률은 task 개수가 아니라 unknown이 known으로 바뀌는 정도로 본다.
- scope를 깎을 때 품질을 낮추지 말고 범위를 줄인다.
- package 밖 기능은 추가하지 않는다.
- 쉬워 보여서 넣는 기능은 scope creep으로 본다.
- build 단계에서 bet를 다시 검증하거나 재정의하지 않는다. bet 검증은 shaping/package의 일이고, build는 package 충족 여부를 확인한다.
- 구현 완료와 release를 구분한다. 검증된 구현은 `Built`, 사용자가 접근 가능한 상태는 `Released`, memory/index/parking lot 정리까지 끝난 상태는 `Closed`다.
- `parking-lot`은 backlog가 아니다. build 중 잘린 모든 항목을 전역 parking lot에 올리지 않는다. 반복해서 다시 등장했거나 project boundary를 이해하는 데 필요한 항목만 후보로 남긴다.
- `product-memory`는 project log가 아니다. 다음 project에도 기본값으로 가져갈 durable product 판단만 반영한다.

정본 순서:

1. package
2. `project.md` status
3. `05-scope-map.md` / `06-build-log.md`
4. `agent-notes/`

`agent-notes/`는 정본이 아니다. 메인 빌더가 승격한 내용만 정본이 된다.

## 진행 흐름

1. Package 확인
2. Project workspace 확인
3. Build kickoff
4. Rough task dump
5. Scope map
6. First integrated slice 선택
7. Slice 구현과 검증
8. Hill status 업데이트
9. Checkpoint 보고
10. Scope hammering 또는 다음 slice
11. Built 검증
12. Release 기록
13. Close / retro / memory 정리

## 1. Package 확인

먼저 package를 읽고 다음을 짧게 요약한다.

- 왜
- 원하는 결과
- appetite
- breadboard
- no-go
- 위험 지점
- build 규칙
- build context

package 밖 판단이 필요하면 build를 시작하지 않는다.

Package에 build context가 명시되어 있으면 kickoff에 반영한다. 없으면 package 안에서 추론 가능한 범위만 적고, 제품/UX 톤, 핵심 용어 의미, 공개 범위처럼 구현 결과를 크게 바꿀 맥락이 불명확한 경우에는 build를 시작하기 전에 짧게 확인한다.

## 2. Project Workspace 확인

package와 같은 폴더를 project workspace로 본다. `project.md`가 있으면 `Status: Building`으로 갱신한다. 없으면 최소 상태판을 만든다.

```md
# Project: Topic

Status: Building
Source of Truth: ./03-package.md

## Checkpoints
- Package Approved:
- Built:
- Released:
- Closed:

## Current Summary

## Carries Forward
```

## 3. Build Kickoff

build 시작 전에 `04-build-kickoff.md`를 만든다. 기존 cycle 구조에서는 `build-kickoff.md`를 유지해도 된다. 이 문서는 package를 다시 shape하지 않고, 실행을 시작하기 위한 최소 합의만 담는다.

포함할 항목:

- Package 기준 요약
- Build context 요약
- 이번 build에서 절대 안 할 것
- 기능 유혹 목록 또는 parking lot
- 가장 unknown한 scope 후보
- 첫 integrated slice 후보
- scope 순서와 dependency
- async 진입 전 shared assumptions
- `Wired but Ugly` 완료 기준
- 검증 방법
- checkpoint 방식

Kickoff를 작성한 뒤 사용자에게 한 번 보고한다. 사용자가 명시적으로 멈추라고 하지 않으면 package 안에서 계속 진행할 수 있다.

## 4. Rough Task Dump

build 초기에 떠오르는 task를 대략 적는다. 이 task 목록은 약속이 아니라 출발점이다.

규칙:

- task를 완전한 계획으로 착각하지 않는다.
- 구현하면서 발견되는 discovered task를 정상으로 본다.
- task 목록을 너무 일찍 세부 파일 단위로 고정하지 않는다.
- rough task와 discovered task는 `06-build-log.md` 또는 기존 `build-log.md`에 기록한다.

## 5. Scope Map

task를 사람, 화면, 기술 layer가 아니라 concern 중심의 scope로 묶는다.

좋은 scope:

- integrated하게 동작하는 결과와 연결된다.
- build 대화에서 macro language로 쓸 수 있다.
- trade-off와 scope hammering 단위가 된다.

나쁜 scope:

- backend 전부
- frontend 전부
- styling 전부
- database setup 전부

scope가 너무 커서 hill status를 말하기 어렵다면 더 작게 나눈다.

`05-scope-map.md` 또는 기존 `scope-map.md`는 kickoff 때 완성하려 하지 않는다. 첫 slice를 구현하면서 scope를 갱신한다.

Scope map에는 가능한 경우 scope의 권장 순서와 dependency를 함께 적는다. scope를 나눴다고 곧바로 병렬 구현할 수 있다고 보지 않는다. 데이터 모델, route, 권한, shared component, 상태명처럼 여러 scope를 묶는 결정은 async로 들어가기 전에 shared assumptions로 정리한다.

## 6. Integrated Slice

첫 slice는 end-to-end로 동작하는 가장 작은 조각이어야 한다.

규칙:

- 백엔드만, 프론트만, 데이터 모델만 따로 끝내지 않는다.
- 실제 사용자가 데모로 볼 수 있는 흐름을 우선한다.
- wiring first, polish later로 간다.
- 먼저 `Wired but Ugly` 상태를 목표로 한다. 기존 스타일이나 임시 UI여도 backend와 frontend가 붙어 실제로 클릭하고 검증할 수 있으면 된다.
- 가장 unknown한 scope를 빨리 건드린다.
- slice 시작 전에 짧은 `조각 계약`을 `06-build-log.md` 또는 기존 `build-log.md`에 기록한다.

예시:

```text
제품 목록
  -> 제품 상세
  -> 관심 있음 토글
  -> 관심자 수 표시
```

### 조각 계약

각 integrated slice를 시작하기 전에 메인 빌더는 조각 계약을 짧게 적는다. 조각 계약은 package를 다시 shape하는 문서가 아니라, 현재 slice를 build 안에서 안전하게 실행하기 위한 최소 합의다.

```md
## Slice Contract: 제품 신호

사용자 흐름:
- 로그인 사용자 -> 제품 상세 -> 보유/관심 토글 -> 집계 갱신

필요한 최소 데이터/상태:
- userId
- productId
- signal kind: owned / interested
- product별 집계 숫자

이번 조각에서 하지 않을 것:
- 개별 보유자 공개
- 판매글 / 가격 제안 / 커뮤니티 기능
- 운영 수준 인증

성공 확인:
- 같은 사용자가 같은 제품에 같은 signal을 중복 저장하지 않는다.
- 토글 해제와 재등록이 동작한다.
- 집계 숫자가 즉시 갱신된다.

현재 unknown:
- local persistence로 중복 없는 signal과 집계를 충분히 표현할 수 있는가?
```

조각 계약이 package와 충돌하면 build를 멈추고 shaping/package로 되돌린다.

### Async Build

Build는 kickoff 이후 긴 async 구간을 기본값으로 둔다. 단, async는 모든 scope를 동시에 병렬 구현한다는 뜻이 아니다. package, breadboard, scope map, first slice, shared assumptions가 충분히 명확할 때 회의 없이 전진할 수 있다는 뜻이다.

Async로 들어가기 전 확인할 것:

- 첫 integrated slice가 정해져 있다.
- scope 순서가 있다.
- scope 간 dependency가 드러나 있다.
- 공통 데이터, 상태, 용어, route, 권한 가정이 정리되어 있다.
- `Wired but Ugly`의 완료 기준이 있다.
- `05-scope-map.md`와 `06-build-log.md`를 메인 빌더가 갱신한다.

Async 중 진행 공유:

- task 개수가 아니라 scope별 hill status로 공유한다.
- `Over the hill`은 코드, 데이터, 브라우저, 테스트 중 하나로 확인된 경우에만 표시한다.
- demo 가능한 slice, screenshot, short recording, test result를 status text보다 우선한다.
- scope boundary 변경, cut scope, package 밖 아이디어는 build-log에 남긴다.

Live session 또는 사용자 checkpoint가 필요한 경우:

- scope dependency가 새로 발견됐다.
- 같은 scope가 오래 uphill에 머문다.
- wired prototype을 함께 보고 punch list를 정해야 한다.
- feedback이 why/what을 다시 연다.
- scope map을 다시 그려야 한다.

## 7. Hill Status

각 scope의 진행은 퍼센트가 아니라 unknown 상태로 본다.

상태:

- Uphill: 아직 접근법을 찾는 중이다.
- Over the hill: 핵심 unknown이 풀렸고 실행 경로가 보인다.
- Downhill: 남은 일은 주로 구현과 마무리다.

`build-log.md` 또는 `scope-map.md`에 다음처럼 기록한다.

```md
| Scope | Hill Status | Unknown | Next Move |
|---|---|---|---|
| 관심 신호 | Uphill | 사용자별 상태 저장 방식 | 가장 단순한 persistence로 slice 검증 |
```

접근법을 생각한 것만으로 over the hill로 보지 않는다. 작은 코드, 실제 데이터, 브라우저 확인, 테스트 중 하나로 검증해야 한다.

## 8. Build 중 변화 분류

Build 중 변화는 정상이다. 중요한 것은 어떤 변화가 build 안의 구현 판단이고, 어떤 변화가 package를 다시 열어야 하는 신호인지 분류하는 것이다.

### 자유롭게 바꿔도 되는 것

다음은 package 경계를 침범하지 않는 한 메인 빌더가 build 안에서 판단한다.

- 구현 경로
- helper / component / module 경계
- 작은 UI 문구와 상태 표현
- task 순서
- discovered task
- slice 안의 작은 기술 trade-off

### 바꿀 수 있지만 기록해야 하는 것

다음은 바꿀 수 있지만 `06-build-log.md` 또는 `05-scope-map.md`에 남긴다.

- first slice 절단선 변경
- scope map 재분할 또는 scope 이름 변경
- hill status 변경과 그 근거
- scope hammering 결정
- 기술 제한과 known limits
- package 밖 후보
- QA / feedback triage 결과
- release target 변경
- subagent가 발견한 risk 또는 parking lot 후보

### 바뀌면 멈춰야 하는 것

다음 변화가 필요해 보이면 build 안에서 해결하지 말고 멈춰서 사용자에게 보고하고 shaping/package로 되돌린다.

- desired outcome 변경
- 중심 객체 변경
- no-go 침범
- privacy / public visibility rule 변경
- 새 사용자 역할 또는 권한 모델 필요
- appetite 안에서 핵심 결과 불가능
- package 밖 기능이 없으면 성공할 수 없음
- feedback이 why/what을 다시 엶

## 9. Checkpoint 정책

Codex는 다음 경우 사용자에게 멈춰서 보고한다.

- build kickoff가 끝났을 때
- integrated slice 하나가 데모 가능하게 끝났을 때
- package 밖 기능이 필요해 보일 때
- why/what 질문이 다시 열렸을 때
- scope를 자르거나 순서를 크게 바꿔야 할 때
- build 중 변화가 `바뀌면 멈춰야 하는 것`에 해당할 때
- 같은 scope가 두 번 연속 uphill에 머물 때
- verification 실패 원인이 product/shape 판단일 때

Codex는 다음 경우 멈추지 않고 진행할 수 있다.

- 구현 세부사항 선택
- 파일 구조 조정
- 테스트 추가
- 작은 UI/UX 결정
- package 안에서의 기술적 trade-off

사용자가 "각 slice마다 승인받아"라고 하면 strict mode로 전환하고, slice 완료 후 승인 전까지 다음 slice를 시작하지 않는다.

## 10. 하위 에이전트 사용과 기록

기본값은 메인 빌더가 project와 현재 integrated slice를 책임진다. 하위 에이전트는 layer owner가 아니라 같은 slice를 다른 관점에서 공략하는 보조 팀원이다.

하위 에이전트 역할:

- 제품/디자인 관점: affordance, 상태 표현, 제품 톤, responsive, 접근성
- 데이터/백엔드 관점: persistence, 식별, 집계, 권한, 중복 방지, integration risk
- 검증 관점: 실제 브라우저 흐름, edge case, no-go 침범, release readiness
- 탐색 관점: 기존 코드 패턴, 위험한 연결 지점, 가장 작은 구현 경로

규칙:

- 하위 에이전트는 project 전체가 아니라 현재 slice 하나만 본다.
- 메인 빌더가 조각 계약을 먼저 정한다.
- 하위 에이전트는 horizontal layer 전체를 소유하지 않는다.
- 하위 에이전트는 package 경계와 no-go를 바꾸지 않는다.
- 각 하위 에이전트에는 좁은 파일/책임 범위를 준다.
- 메인 빌더가 통합, e2e 검증, scope-map 갱신을 책임진다.

하위 에이전트는 canonical 문서를 직접 확정하지 않는다. 다음 문서는 메인 빌더가 최종 갱신한다.

- package
- `project.md` status
- `05-scope-map.md` hill status
- `07-release.md`
- `08-retro.md`
- `shapeup/product-memory.md`
- `shapeup/project-index.md`

하위 에이전트가 기록해야 할 내용은 `agent-notes/` 아래에 role 또는 slice 이름으로 남긴다.

```text
agent-notes/
  product-signal-design.md
  product-signal-data.md
  product-signal-qa.md
```

권장 형식:

```md
# Agent Notes: Design / 제품 신호

## Current Slice

## Findings

## Changes Made

## Scope Suggestions

## Risks

## Parking Lot Candidates

## Verification Performed
```

메인 빌더는 slice checkpoint마다 agent notes를 검토하고 필요한 내용만 `05-scope-map.md`, `06-build-log.md`, `parking-lot.md`로 승격한다. `parking-lot.md`에는 다시 중요해질 가능성이 있는 candidate만 남기고, 일회성 nice-to-have는 project 내부 기록에만 둔다.

### 하위 에이전트 동기화 오류 방지

하위 에이전트가 실행 중일 때 다음이 바뀌면 메인 빌더는 update notice를 보낸다.

- scope map
- current slice contract
- no-go 또는 cut scope
- execution budget
- 제품 용어와 의미
- privacy / public visibility rule
- data contract
- file ownership
- verification target
- feedback triage
- release target
- project status

update notice에는 다음을 포함한다.

- 무엇이 바뀌었는가
- 왜 바뀌었는가
- 계속할 것
- 중단할 것
- 버릴 가정
- 유지되는 package 경계와 no-go
- `agent-notes/` 갱신 요청

운영 중인 하위 에이전트가 있으면 즉시 update를 보낸다. 이미 종료된 하위 에이전트의 기록은 이전 기준으로 작성되었는지 표시하고, 새 기준에도 유효한 내용만 정본 문서로 승격한다.

## 11. Feedback 처리

build 중 feedback은 받을 수 있지만 자동으로 scope가 되지 않는다. 먼저 분류한다.

- package desired outcome을 깨는 must-have defect인가?
- 현재 shaped flow의 결함인가?
- edge case인가?
- nice-to-have인가?
- 새로운 why/what 판단을 여는가?
- 긴급 production bug인가?

처리:

- must-have defect: 현재 scope에 포함할 수 있다.
- edge case: QA 또는 nice-to-have로 기록하고 필요할 때만 승격한다.
- nice-to-have: 보통 `06-build-log.md`에만 기록한다. 반복해서 다시 등장했거나 boundary 설명에 필요할 때만 `parking-lot.md` 후보로 남긴다.
- why/what 재개방: build를 멈추고 shaping으로 되돌린다.
- 긴급 bug: 이 project build와 분리된 bugfix/ops flow로 다룬다.

## 12. Scope Hammering

시간이 부족하거나 scope가 커질 때 품질을 낮추지 말고 범위를 줄인다.

원칙:

- package의 원하는 결과를 유지한다.
- nice-to-have를 자른다.
- package 밖으로 나온 새 아이디어는 build-log에 기록하고, 반복 신호나 boundary 가치가 있을 때만 parking lot 또는 후속 shaping으로 보낸다.
- 핵심 흐름이 깨지는 절단은 하지 않는다.

Scope Hammering 질문:

- 이 기능이 없어도 package의 원하는 결과가 충족되는가?
- 이 기능은 첫 integrated slice에 직접 등장하는가?
- 지금 넣지 않으면 나중에 구조적으로 막히는가?
- 이 기능을 넣으면 새로운 why/what 판단이 열리는가?

하나라도 package 밖 판단을 열면 구현하지 않고 `build-log.md`의 parking lot에 기록한다.

## 13. 산출물

사용자가 저장 위치를 지정하면 그 위치를 우선한다. 지정하지 않으면 package가 있는 cycle 폴더에 저장한다.

```text
shapeup/
  active/
    001-topic-slug/
      project.md
      03-package.md
      04-build-kickoff.md
      05-scope-map.md
      06-build-log.md
      agent-notes/
      07-release.md
      08-retro.md
```

기존 `cycles/` 구조의 package에서 시작했다면 해당 폴더의 기존 이름(`build-kickoff.md`, `scope-map.md`, `build-log.md`, `retro.md`)을 유지해도 된다.

`07-release.md`는 release 시 작성한다. `08-retro.md`는 project를 close할 때 작성한다.

`build-log.md`에는 build 중 발견된 package 밖 기능과 제외 이유를 기록한다. 예:

```md
## Parking Lot

- 제품별 리뷰 작성: 장기 방향은 맞지만 이번 package는 보유/관심 신호 검증이 목적이다.
- 관리자 승인 화면: 제품 추가 요청 저장을 넘어서므로 후속 사이클로 분리한다.
```

## 14. Built 기준

`Built`라고 말하기 전 다음을 확인한다.

- package의 desired outcome이 충족되었다.
- no-go를 침범하지 않았다.
- integrated slice가 실제로 동작한다.
- 테스트 또는 수동 검증을 실행했다.
- 남은 위험과 잘린 scope를 기록했다.
- build 중 발견된 package 밖 기능을 parking lot에 기록했다.

통과하면 `project.md`가 있는 경우 `Status: Built`와 `Built` checkpoint를 갱신한다.

## 15. Release 기준

Shape Up의 build는 사용 가능한 상태로 내보내는 것까지 포함한다. production deploy가 아니어도 사용자가 접근 가능한 경로를 기록해야 한다.

`07-release.md` 또는 기존 구조의 `release.md`에 다음을 기록한다.

```md
# Release

## Release Target
- Production / Preview URL / Local runnable app / Artifact handoff

## Access
- URL or command:

## Verification
- Build:
- Tests:
- Browser:
- Known limits:

## Release Notes

## Not Included
```

사용자가 release를 원하지 않고 local build만 요청했다면 `Built`에서 멈춘다. release까지 요청했거나 작업 성격상 전달이 필요하면 release 기록 후 `project.md`를 `Status: Released`로 갱신한다.

## 16. Close 기준

project를 닫으려면 다음을 완료한다.

- `08-retro.md` 또는 기존 `retro.md` 작성
- `project.md` 상태를 `Closed`로 갱신
- 다음 project에도 기본값으로 가져갈 durable decision만 `shapeup/product-memory.md`에 반영
- 반복해서 다시 등장했거나 경계 설명에 필요한 future candidate와 raw feedback만 `shapeup/parking-lot.md`에 반영
- `shapeup/project-index.md` 갱신
- `shapeup/active/NNN-topic-slug/`에서 시작한 project라면 `shapeup/closed/NNN-topic-slug/`로 이동

사용자가 close를 요청하지 않았으면 release 후 active에 남겨도 된다. 단, final response에서 현재 상태가 `Built`, `Released`, `Closed` 중 어디인지 명확히 말한다.
