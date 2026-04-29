# Shape Up Codex Skills

Codex에서 Shape Up 방식으로 작업을 준비하고 실행하기 위한 개인 스킬 모음입니다.

## Skills

- `shaping`: build 전에 candidate를 frame, shape, package로 정리합니다.
- `building`: 승인된 Shape Up package를 기준으로 build, release, close 흐름을 진행합니다.

## Install

Copy the skill folders into your Codex skills directory:

```powershell
Copy-Item -Recurse -Force .\skills\shaping "$env:USERPROFILE\.codex\skills\shaping"
Copy-Item -Recurse -Force .\skills\building "$env:USERPROFILE\.codex\skills\building"
```

If `CODEX_HOME` is set, copy them into `$env:CODEX_HOME\skills` instead.

## Contents

This repository intentionally includes only portable skill files:

- `skills/*/SKILL.md`
- `skills/*/agents/openai.yaml`

Codex app logs, sessions, auth files, caches, SQLite databases, and local project documents are not part of this repository.
