# Package Approval Questions

Use these before marking `Package Approved`.

Package Approval must be explicit. A lack of objection is enough to keep shaping, but not enough to start building.

Do not treat a vague reaction like "ok", "go", "sounds good", or silence as approval by itself. Accept approval only when the user, `project.md`, or package marker clearly says this package is approved for build, for example `Package Approved`, `이 package로 build 승인`, or `이 범위와 appetite로 진행`.

## Questions

- Is the problem important now and specific enough?
- Why is this worth betting on now instead of a competing candidate?
- Does the appetite match the Codex execution budget?
- Is the downside cap clear: what happens if the outcome does not fit inside the appetite?
- Is the solution attractive and viable inside that appetite?
- Is now the right time?
- Are the needed product and technical contexts available?
- Is the interrupt policy clear enough for Codex to keep building without reopening why/what?
- Are no-go items and parking lot boundaries strong enough to prevent scope creep?
- Is the package rough, solved, and bounded enough to hand to a builder?

## Rabbit Hole Verification

Before Package Approval:

- Every rabbit hole has handling: `solve`, `cut`, `bound`, or `spike`.
- Every `solve` has a result, or is explicitly assigned to the first slice with a feedback loop.
- Every `cut` is removed from Breadboard, Build Rules, and First Slice Hint.
- Every `bound` is reflected in `Not Doing` or `Build Rules`.
- Every `spike` stops package approval and becomes a spike instead.
- No rabbit hole is left as "figure out during build".

## If Weak

- Problem/baseline is weak: return to Framing.
- Solution/boundary is weak: return to Shaping.
- Build context is weak: do a technical reality check or ask a narrow question.
- Appetite does not fit: cut scope before approval.
- Downside cap or interrupt policy is unclear: clarify the bet before approval.
- Rabbit hole verification is weak: solve, cut, bound, or spike before approval.
