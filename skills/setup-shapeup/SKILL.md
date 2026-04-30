---
name: setup-shapeup
description: Shape Up Codex skills를 처음 쓰는 repo에 shapeup 작업 공간과 운영 문서를 세팅할 때 사용한다. 사용자가 "Shape Up 스킬 세팅", "shapeup 폴더 만들어줘", "product-memory/parking-lot/project-index 초기화", "이 repo에서 shaping/building 쓸 준비"처럼 요청하면 사용한다. 기존 문서가 있으면 덮어쓰지 않고 현재 구조를 읽은 뒤 부족한 파일만 만든다. 사용자가 한국어로 말하면 한국어로 질문하고 한국어 문서를 작성한다.
---

# Setup Shape Up

이 skill은 `shaping`과 `building`이 공유할 repo-local 운영 맥락을 만든다. 목표는 모든 project를 같은 문서 구조로 몰아넣는 것이 아니라, 다음 세션의 Codex가 product 판단, parking lot, project 상태를 잃지 않게 하는 것이다.

## 원칙

- 기존 파일을 덮어쓰지 않는다.
- 기존 `cycles/` 또는 다른 Shape Up 구조가 있으면 강제 이전하지 않는다.
- 새 project의 기본 구조만 `shapeup/active/`로 제안한다.
- `product-memory`는 project log가 아니라 durable product 판단만 담는다.
- `parking-lot`은 backlog가 아니라 다시 중요해졌을 때 candidate로 되살릴 후보만 담는다.
- 사용자가 쓰는 언어를 그대로 따른다.

## 1. Explore

현재 repo에서 다음을 확인한다.

- `shapeup/`
- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- `shapeup/active/`
- `shapeup/closed/`
- 기존 `cycles/`, `docs/`, `AGENTS.md`, `CLAUDE.md`, `README.md`

있는 것과 없는 것을 짧게 요약한다. 기존 project 문서가 있으면 구조만 파악하고, 사용자가 요청하지 않는 한 closed project 전체를 읽지 않는다.

## 2. Decide

필요하면 다음 결정을 한 번에 너무 많이 묻지 말고 순서대로 확인한다.

- Product memory에 넣을 제품/팀 이름
- 기본 appetite 단위: 예) 1 day spike, 1 week MVP, 2 week cycle
- release target: local artifact, preview URL, production, document handoff
- verification default: tests, browser smoke, manual checklist, build only

작은 개인 repo면 합리적인 기본값으로 진행하고, 애매한 항목만 묻는다.

## 3. Write

부족한 파일과 폴더만 만든다.

```text
shapeup/
  product-memory.md
  parking-lot.md
  project-index.md
  active/
  closed/
  notes/
    operating-model.md
```

`notes/operating-model.md`는 참고 메모다. `shaping`과 `building`은 사용자가 명시적으로 요청할 때만 읽는다.

## Templates

`shapeup/product-memory.md`:

```md
# Product Memory

## Vision

## Strategy

## Pressures

## Core Objects

## Durable Decisions

## Repeated No-Go
```

`shapeup/parking-lot.md`:

```md
# Parking Lot

Parking lot은 backlog가 아니다. 다시 중요해졌을 때 새 맥락과 함께 candidate로 되살릴 후보만 둔다.

## Candidates

| Candidate | Why It Might Return | Last Context |
|---|---|---|
```

`shapeup/project-index.md`:

```md
# Project Index

| Project | Status | Source of Truth | Notes |
|---|---|---|---|
```

`shapeup/notes/operating-model.md`:

```md
# Shape Up Operating Model

## Default Appetite

## Release Target

## Verification Default

## Local Conventions
```

## 4. Done

마지막에 다음을 알려준다.

- 생성한 파일
- 이미 있어서 건드리지 않은 파일
- 다음에 쓸 수 있는 skill: `shaping`, `building`
- 첫 shaping 요청 예시 한 문장
