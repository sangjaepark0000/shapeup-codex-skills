# Shape Up Codex Skills

Codex가 바로 build부터 달리지 않고, Shape Up 방식으로 `rough, solved, bounded`한 package를 만든 뒤 구현하도록 돕는 스킬 모음입니다.

## Why

AI agent로 제품을 만들 때 자주 터지는 실패가 있습니다.

- 처음부터 구현해서 `왜/무엇` 질문이 build 중에 다시 열린다.
- backlog와 parking lot이 섞여 scope creep이 생긴다.
- package 없이 구현을 시작해서 다음 세션이 맥락을 잃는다.
- task 수로 진행률을 보다가 진짜 unknown이 남아 있는지 놓친다.

이 repo는 그 실패를 세 단계로 막습니다.

- `setup-shapeup`: repo 안에 Shape Up 운영 문서를 세팅합니다.
- `shaping`: candidate를 frame, shape, package로 정리합니다.
- `building`: 승인된 package를 기준으로 integrated slice, scope map, release, close까지 진행합니다.

## Quickstart

Install the skills:

```powershell
.\install.ps1
```

Then run these in Codex:

```text
setup-shapeup으로 이 repo의 shapeup 작업 공간을 세팅해줘.
이 기능을 Shape Up으로 shaping해서 package까지 만들어줘.
package 승인했으니 building 시작해줘.
```

Manual install still works:

```powershell
$skillsHome = if ($env:CODEX_HOME) { "$env:CODEX_HOME\skills" } else { "$env:USERPROFILE\.codex\skills" }
Copy-Item -Recurse -Force .\skills\setup-shapeup "$skillsHome\setup-shapeup"
Copy-Item -Recurse -Force .\skills\shaping "$skillsHome\shaping"
Copy-Item -Recurse -Force .\skills\building "$skillsHome\building"
```

## English Quickstart

```powershell
.\install.ps1
```

Then ask Codex:

```text
Set up this repo for the Shape Up Codex skills.
Shape this feature into a package before building.
The package is approved. Start building from it.
```

## Skills

### `setup-shapeup`

Creates repo-local operating files:

- `shapeup/product-memory.md`
- `shapeup/parking-lot.md`
- `shapeup/project-index.md`
- `shapeup/active/`
- `shapeup/closed/`

### `shaping`

Build 전에 candidate를 좁힙니다.

- 빠른 제외 판단
- candidate / mode 정리
- scope filter
- framing
- shaping
- package
- explicit package approval

### `building`

승인된 package를 source of truth로 구현합니다.

- build kickoff
- rough task dump
- scope map
- first integrated slice
- hill status
- scope hammering
- verification
- release / close

## Example

See `examples/001-product-signal/` for a small shaped package.

See `examples/000-not-shapeup/` for a request that should use a lighter bugfix flow instead of Shape Up.

## Validate

```powershell
.\scripts\validate-skills.ps1
```

## Contents

This repository intentionally includes portable skill files and examples:

- `skills/*/SKILL.md`
- `skills/*/agents/openai.yaml`
- `skills/*/references/*.md`
- `examples/*`
- `install.ps1`
- `.github/workflows/validate.yml`

Codex app logs, sessions, auth files, caches, SQLite databases, and local project documents are not part of this repository.
