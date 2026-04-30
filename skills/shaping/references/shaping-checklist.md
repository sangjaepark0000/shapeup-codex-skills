# Shaping Checklist

Shaping finds a buildable solution shape. Do not lock detailed UI, component structure, file paths, or task order.

## Close These

- Core change: what becomes possible for the user?
- Breadboard: places, affordances, and connections.
- Not doing: explicit boundaries.
- Risks: build complexity, exceptions, uncertainty.
- Material unknowns: product, interaction, technical unknowns that could break the build.

## Breadboard

Use text breadboards before wireframes.

- Places: screens, modals, menus, states.
- Affordances: buttons, inputs, links, text users read or act on.
- Connections: which action leads to which state or place.

Fat marker sketches are optional. Use them only for linchpin areas where text cannot show the idea.

## Right Abstraction Level

Too abstract:

- Feature name without user flow.
- No start/end point.
- No core affordance.
- Builders cannot decide what to include.
- Rabbit holes are left for build.

Too concrete:

- Fixed layout, color, spacing, component structure.
- High-fidelity mock becomes a requirement.
- File-level tasks are fixed in the package.
- Builders cannot trade off.

Good:

- Problem, appetite, and solution fit together.
- Core places, affordances, and connections are visible.
- No-go is clear.
- Risks are handled by solving, cutting, or marking out-of-bounds.
- Build questions are mostly `how`.

## Shape Go

Say `Shape Go` only when:

- The rough result is visible.
- There is a core flow.
- Not doing is explicit.
- Risks are visible.
- Trust, privacy, empty state, and reversibility were checked when relevant.
- Product tone, visibility, and core terms are closed enough for build.
- A slow-motion walkthrough exposes no missing major affordance.
- Rabbit holes are solved, cut, or out-of-bounds.
- Material unknowns are not being thrown into build.

`Shape Go` means a package can be written. It is not build approval.

## No Shape Go

Do not package when:

- Problem is clear but solution is not.
- Solution seems good but baseline is weak.
- Appetite makes the core outcome impossible.
- Rabbit holes are left for builders to solve.
- Package is becoming a detailed requirements list or high-fidelity design.
