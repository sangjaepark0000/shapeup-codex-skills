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

Do not promote package outside ideas directly to global parking lot. First classify them in `06-build-log.md`.

Package outside ideas move to `shapeup/parking-lot.md` only after candidate promotion. A nice-to-have, implementation temptation, or one-off edge case can stay in the build log or be dropped.

## Stop And Return To Shaping

Stop when build needs a change to:

- Desired outcome.
- Core object.
- No-go.
- Privacy or public visibility.
- User role or permission model.
- Appetite.
- Package success definition.
- Downside cap or circuit breaker.

Also stop and report when:

- One integrated slice is demoable or verifiable.
- A package-outside scope appears required for the desired outcome.
- The same scope remains `Uphill` across two checkpoints.
- Verification failure suggests the package shape is wrong, not merely the implementation.

## Feedback Classes

- Must-have defect: include if it blocks package desired outcome.
- Shaped-flow defect: fix inside current scope.
- Edge case: record and include only if needed.
- Nice-to-have: record in build log; do not add by default.
- New why/what: stop and return to shaping.
- Urgent production bug: separate from this project build.

## Candidate Promotion

Promote a build-time idea to `shapeup/parking-lot.md` only when it is likely to matter again:

- It represents a distinct future bet.
- It appeared repeatedly during build or feedback.
- It explains an important package boundary.
- It needs future Framing/Shaping with fresh context.

Keep it in `06-build-log.md` only when it is useful local context but not a future candidate.

Drop it when it is only a nice-to-have or implementation temptation.
