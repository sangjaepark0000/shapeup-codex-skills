---
name: building
description: 사용자가 승인된 Shape Up package를 기반으로 build를 진행해달라고 요청할 때 사용한다. package.md를 source of truth로 읽고, kickoff, integrated slice, scope map, discovered tasks, hill status, checkpoint 보고, scope hammering, verification, build-log를 통해 구현한다. build 중 why/what 질문이 다시 열리면 구현을 멈추고 shaping으로 되돌린다. 트리거 예시는 "package 승인했으니 build 해줘", "building 시작", "이 package로 구현 진행", "Shape Up build 단계로 가자"이다. 사용자가 한국어로 말하면 한국어로 진행하고 산출물을 작성한다.
---

# Building

승인된 Shape Up package를 실제 동작하는 결과물로 만든다. 목표는 package의 `왜/무엇/어디까지`를 다시 열지 않고, build 중 발견되는 task와 scope를 다루며 timebox 안에서 meaningful feature를 끝내는 것이다.

## Language

- 사용자가 쓰는 언어를 그대로 따른다.
- 사용자가 한국어로 요청하면 질문, 중간 보고, build 산출물을 한국어로 작성한다.
- Shape Up, build, package, scope, hill status, vertical slice 같은 방법론 키워드는 필요하면 그대로 쓰되, 처음 등장할 때 한국어 설명을 붙인다.

## Input Rules

- 승인된 package가 있어야 한다.
- 사용자가 package 파일 경로를 주고 build를 요청하면 승인된 것으로 간주한다.
- package가 없거나 승인 여부가 불명확하면 build를 시작하지 말고 shaping 또는 package review로 되돌린다.
- 새 세션은 package 경로만으로 build kickoff 맥락을 복원할 수 있어야 한다.

## Core Rules

- package를 source of truth로 둔다.
- package가 속한 project workspace를 build 산출물 위치로 둔다.
- `project.md`가 있으면 상태를 갱신한다.
- build 중 `왜/무엇` 질문을 다시 정하지 않는다.
- `어떻게` 질문은 build 안에서 해결한다.
- horizontal layer가 아니라 integrated slice로 만든다.
- task는 build 중 발견되는 것이 정상이다.
- 진행률은 task 수가 아니라 unknown이 known으로 바뀌는 정도로 본다.
- 품질을 낮추지 말고 범위를 줄인다.
- package 밖 기능은 추가하지 않는다.
- 구현 완료와 release와 close를 구분한다.

## References

필요할 때만 읽는다.

- `references/package-check.md`: package를 읽고 build 가능 여부를 확인할 때.
- `references/kickoff-template.md`: `04-build-kickoff.md`를 만들 때.
- `references/build-log-template.md`: rough tasks, slice contracts, discovered tasks를 기록할 때.
- `references/scope-map-template.md`: `05-scope-map.md`와 hill status를 갱신할 때.
- `references/slice-contract.md`: integrated slice를 시작할 때.
- `references/hill-status.md`: progress를 task count 대신 unknown 기준으로 표현할 때.
- `references/feedback-triage.md`: build 중 feedback이나 새 아이디어를 분류할 때.
- `references/scope-hammering.md`: timebox 안에서 scope를 줄일 때.
- `references/release-template.md`: `07-release.md`를 만들 때.
- `references/retro-template.md`: `08-retro.md`를 만들 때.

## Flow

1. Confirm approved package.
2. Read project workspace context.
3. Create or update `project.md`.
4. Create `04-build-kickoff.md`.
5. Dump rough tasks.
6. Create initial scope map.
7. Pick the first integrated slice.
8. Write the slice contract.
9. Build and verify the slice.
10. Update hill status and build log.
11. Hammer scope or continue with the next slice.
12. Verify `Built`.
13. Record `Release` when there is an access path.
14. Close only when requested or clearly appropriate.

## Start

Read `references/package-check.md`, then read:

- The approved package
- `shapeup/product-memory.md` if present
- `shapeup/project-index.md` if present
- `project.md` beside the package if present

Do not read all closed projects unless the user names one.

## Kickoff

Read `references/kickoff-template.md` and create `04-build-kickoff.md` or the repo's existing kickoff filename.

Report briefly after kickoff. If the user does not stop you, continue inside the approved package.

## Build Log And Scope Map

Read `references/build-log-template.md` and `references/scope-map-template.md`.

Use the build log for:

- Rough task dump
- Slice contracts
- Discovered tasks
- Build decisions
- Package outside ideas
- Verification notes

Use the scope map for:

- Concern-level scopes
- Dependencies
- Hill status
- Cut scope

## Integrated Slice

Read `references/slice-contract.md` before each slice.

The first slice should be the smallest end-to-end path that is demoable or verifiable. Prefer `Wired but Ugly` before polish.

Do not finish backend-only, frontend-only, or data-model-only work as a complete slice.

## Hill Status

Read `references/hill-status.md`.

Use:

- `Uphill`: still searching for the approach.
- `Over the hill`: a core unknown was proven by code, data, browser, or test.
- `Downhill`: remaining work is implementation and polish.

Do not mark a scope over the hill because the idea sounds plausible.

## Build Changes

Read `references/feedback-triage.md` when feedback, new tasks, or package outside ideas appear.

Continue without stopping for implementation details, helper boundaries, small UI copy, task order, discovered tasks, and package-safe trade-offs.

Record but continue for scope map changes, cut scope, hill status changes, known limits, and QA triage.

Stop and return to shaping/package when desired outcome, core object, privacy/public visibility, user roles, no-go, or appetite changes.

## Scope Hammering

Read `references/scope-hammering.md` when timebox pressure appears.

Keep quality fixed. Cut nice-to-have work. Do not cut the core outcome.

## Subagents

Use subagents only when explicitly allowed by the active Codex instructions and when a bounded side task can run in parallel.

If used, give each subagent a narrow slice, file ownership, package boundaries, and no-go. Subagents write notes under `agent-notes/`; the main builder owns canonical docs.

## Built

Say `Built` only when:

- Package desired outcome is met.
- No-go was not violated.
- An integrated slice actually works.
- Tests or manual verification ran.
- Remaining risks and cut scope are recorded.

Update `project.md` to `Status: Built` when present.

## Release

Read `references/release-template.md` when recording access.

Production deploy is not required, but the user needs an access path: production URL, preview URL, local command, or artifact handoff.

Update `project.md` to `Status: Released` when present.

## Close

Read `references/retro-template.md` when closing.

Close only after:

- Retro is written.
- `project.md` is `Closed`.
- Durable product decisions are moved to `shapeup/product-memory.md`.
- Only recurring or boundary-relevant candidates are moved to `shapeup/parking-lot.md`.
- `shapeup/project-index.md` is updated.
- Active project is moved to `shapeup/closed/` when using that structure.

If the user did not request close, leave the project active and state whether it is `Built` or `Released`.
