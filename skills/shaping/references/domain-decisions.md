# Domain Decisions

Use this when shaping creates durable language or hard-to-reverse decisions.

This borrows the useful discipline from `grill-with-docs` without turning Shape Up shaping into a separate documentation session.

## Terminology

When a term becomes important to the product shape:

- Prefer one canonical term.
- Call out overloaded terms.
- Distinguish user-facing language from implementation names.
- Record durable product terminology in `shapeup/product-memory.md` when future projects should inherit it.

If the repo already has `CONTEXT.md`, update it only for domain terms that are meaningful outside the current project. Do not add implementation trivia.

## ADR Candidates

Offer an ADR only when all are true:

- Hard to reverse.
- Surprising without context.
- A real trade-off was made.

If any condition is missing, keep the decision in the package or product memory instead.

## Do Not Over-Document

- Do not create `CONTEXT.md` just because one package used a term.
- Do not create ADRs for ordinary scope cuts.
- Do not duplicate the package in product memory.
