# Codebase Context

Use this before kickoff when the package touches unfamiliar code or shared surfaces.

This borrows the useful part of `zoom-out`: go up one level and map the system before changing it.

## Map

Briefly identify:

- Relevant modules or app surfaces.
- Main callers and entry points.
- Existing domain terms from `CONTEXT.md` or nearby code.
- ADRs or local docs that constrain the area.
- Existing patterns to follow.
- Shared surfaces that raise integration risk.

## Output

Add a short section to `04-build-kickoff.md`:

```md
## Codebase Context

- Relevant modules:
- Entry points:
- Existing patterns:
- Constraints / ADRs:
- Integration risks:
```

Keep this map small. It should orient the builder, not become architecture documentation.
