# Shaping Checklist

Shaping finds a buildable solution shape. Do not lock detailed UI, component structure, file paths, or task order.

When asking a shaping question:

- Include your recommended answer when you can.
- If code, docs, or existing product behavior can answer it, inspect them instead of asking.
- Use concrete scenarios to expose hidden product boundaries.

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

## Shaping Checkpoint

Use this as a lightweight checkpoint before packaging. It is fine to return to framing if packaging exposes a weak problem, baseline, or appetite.

The shape is probably strong enough when:

- The rough result is visible.
- There is a core flow.
- Not doing is explicit.
- Risks are visible.
- Trust, privacy, empty state, and reversibility were checked when relevant.
- Product tone, visibility, and core terms are closed enough for build.
- A slow-motion walkthrough exposes no missing major affordance.
- Rabbit holes are solved, cut, or out-of-bounds.
- Material unknowns are not being thrown into build.

This checkpoint means a package can be written. It is not build approval.

## Do Not Package Yet

Do not package when:

- Problem is clear but solution is not.
- Solution seems good but baseline is weak.
- Appetite makes the core outcome impossible.
- Rabbit holes are left for builders to solve.
- Package is becoming a detailed requirements list or high-fidelity design.
