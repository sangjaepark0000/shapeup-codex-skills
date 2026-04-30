# Feedback Triage

Use this when feedback, QA notes, new ideas, or discovered work appears during build.

## Can Change Freely

Continue without stopping when package boundaries are intact:

- Implementation path.
- Helper/component/module boundaries.
- Small UI copy and state labels.
- Task order.
- Discovered tasks.
- Slice-level technical trade-offs.

## Record And Continue

Record in `06-build-log.md` or `05-scope-map.md`:

- First slice cut line changed.
- Scope map was split or renamed.
- Hill status changed and why.
- Scope hammering decision.
- Known technical limit.
- Package outside idea.
- QA/feedback classification.
- Release target changed.

## Stop And Return To Shaping

Stop when build needs a change to:

- Desired outcome.
- Core object.
- No-go.
- Privacy or public visibility.
- User role or permission model.
- Appetite.
- Package success definition.

## Feedback Classes

- Must-have defect: include if it blocks package desired outcome.
- Shaped-flow defect: fix inside current scope.
- Edge case: record and include only if needed.
- Nice-to-have: record in build log; do not add by default.
- New why/what: stop and return to shaping.
- Urgent production bug: separate from this project build.
