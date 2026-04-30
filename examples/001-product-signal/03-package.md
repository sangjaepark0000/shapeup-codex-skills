# Package: Product Signal

## Why

The product detail page cannot capture demand. Users either message the team manually or stay silent, leaving the team with no reliable aggregate signal.

## Desired Outcome

Users can mark interest in a product, remove that signal, and see the aggregate count update without exposing individual identities.

## Appetite

Human appetite:
- 1 week MVP

Codex execution budget:
- One product detail surface
- One primary toggle flow
- Aggregate display
- Existing or local persistence
- Build plus browser smoke verification

## Bet / Commitment

Timebox:
- 1 week MVP

Downside cap:
- If aggregate interest cannot be proven on one product detail surface inside the appetite, cut secondary states before adding new flows.

Interrupt policy:
- Build should continue through implementation trade-offs, copy choices, and persistence details as long as the aggregate-only desired outcome stays intact.

Circuit breaker:
- If the work requires chat, offers, seller identity, or a broader marketplace model, stop and return to shaping instead of extending the package.

## Breadboard

Places:
- Product detail page

Affordances:
- Interest toggle
- Interest count
- Empty count state

Connections:
- Product detail -> interest toggle -> saved user/product signal
- Saved signal -> aggregate count
- Toggle again -> remove signal -> aggregate count updates

## Not Doing

- Public list of interested users, because the first bet only needs aggregate demand.
- Direct messages, offers, pricing, or sales workflow, because that opens marketplace questions.
- Admin approval flow, because interest signals are lightweight and reversible.

## Risks

| Risk | Handling |
|---|---|
| Duplicate user signals | Enforce one signal per user/product pair. |
| Privacy confusion | Show aggregate count only. |
| Marketplace creep | Keep excluded workflows visible in the package and build log. |

## Rabbit Holes

| Risk | Assumption | Smallest Proof | Result | Handling |
|---|---|---|---|---|
| Duplicate signals | One user/product signal can be represented without creating a broader account model. | Toggle persistence behavior test or local storage harness. | Assigned to first slice proof. | Solve in first slice. |
| Marketplace creep | Aggregate interest is useful without chat, offers, or seller identity. | Product flow walkthrough. | Boundary accepted: aggregate-only display. | Bound out of package. |

## First Slice Hint

Start with one product detail page where a user can toggle interest and see the count change.

## Build Rules

- Do not reopen whether this is a marketplace.
- Keep quality fixed and cut secondary states first.
- Do not extend the appetite by default; hammer scope or return to shaping.
- Package outside ideas go to `06-build-log.md`.

## Parking Lot / Feature Temptations

- Interested user list
- Seller contact
- Price offers
- Product request queue

## Build Context

- Product tone: lightweight discovery, not commerce.
- Core term: "interest" means demand signal, not purchase commitment.
- Privacy: aggregate only.
- Empty state: count can be zero and still show the action.

## Testing / Verification Decisions

- Behavior to protect: one user can have at most one interest signal per product.
- Suggested feedback loop: behavior test for toggle persistence if the codebase has an existing test seam.
- Manual/browser check: product detail toggle updates the aggregate count and can be undone.

## Technical Reality Check

- Existing patterns:
- Likely touched modules:
- Integration risks:
- Architecture friction:
- Interface/test surface risks:
- Smallest viable implementation path:
