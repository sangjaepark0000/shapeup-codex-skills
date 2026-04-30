# Workspace

shaping session을 시작하거나 산출물을 어디에 둘지 정할 때 사용한다.

## 먼저 읽기

있으면 다음 파일을 읽는다.

- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- 사용자가 project path를 제공한 경우 해당 `project.md`

모든 closed project를 읽지 않는다. closed project는 history이지 기본 context가 아니다.

`shapeup/notes/operating-model.md`는 reference material이다. 사용자가 요청했거나 local convention이 불명확할 때만 읽는다.

## Product Memory

다음을 확인한다.

- Vision
- Strategy
- Pressures
- Core objects
- Durable decisions
- Repeated no-go decisions

여기에 project log를 추가하지 않는다. future project가 기본값으로 이어받아야 하는 decision만 추가한다.

## Parking Lot

Parking lot은 backlog나 queue가 아니다. 여기서 다음 project를 고르지 않는다.

현재 context에서 다시 중요해졌을 때만 항목을 되살린다. 되살린 항목도 Framing이 필요한 candidate로 다룬다.

현재 요청이 기존 parking-lot row와 관련되면 중복 row를 만들지 말고 `Signals`, `Last Seen`, `Sources`를 갱신한다. 반복 출현은 pressure signal이지 그 자체로 선택 이유가 아니다.

기본적으로 old active 또는 closed project notes를 훑어 candidate를 찾지 않는다. 사용자가 previous candidate를 review, harvest, reconcile하라고 명시했을 때만 한다.

## Default Project Workspace

사용자가 위치를 지정하지 않으면 다음 구조를 만든다.

```text
shapeup/
  active/
    NNN-topic-slug/
      project.md
      01-frame.md
      02-shape.md
      03-package.md
```

repo가 이미 `cycles/`를 쓰고 있으면 해당 project는 기존 구조를 유지한다. 새 project에는 `shapeup/active/`를 사용한다.

## Project Status Board

```md
# Project NNN: Topic

Status: Shaping
Source of Truth: ./03-package.md

## Checkpoints

- Candidate sorting:
- Frame checkpoint:
- Shape checkpoint:
- Package Approved:

## Current Summary

## Carries Forward
```
