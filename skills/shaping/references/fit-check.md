# Fit Check

Use this to quietly decide whether Shape Up fits the request.

## Default

If the user invoked `shaping`, default to continuing. The goal is not to ask "Should we use Shape Up?" again. The goal is to catch obvious mismatches.

## Good Fit

- Feature or product flow change.
- Shape is needed before build.
- Problem and solution can be bounded before build.
- Scope control matters.
- Appetite should constrain solution choices.

## Poor Fit

- Urgent bug or production incident.
- Small task that fits in half a day or less.
- Unknown-first research where the object of work is unclear.
- Dependency-heavy work where flow cannot be controlled.
- Launch cleanup or punch list.

## Lighter Alternatives

- Reactive work: use a diagnosis loop: reproduce, minimise, hypothesise, instrument, fix, regression-check.
- Unknown-first work: spike or exploration.
- Dependency-heavy work: dependency-tracking flow.
- Launch cleanup: cleanup checklist.
- Small task: direct execution or short checklist.

If unclear, continue to Framing and stop later if the mismatch becomes clear.
