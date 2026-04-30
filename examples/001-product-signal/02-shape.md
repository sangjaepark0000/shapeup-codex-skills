# Shape: Product Signal

## Core Change

The product detail page gains a single interest action and an aggregate count.

## Breadboard

```text
[Product detail page]
  (Interest toggle) -> [Saved user/product signal] -> [Interest count updates]
  (Interest toggle again) -> [Signal removed] -> [Interest count updates]
  (Empty count state) -> [User can still mark interest]
```

## Not Doing

- No list of interested users.
- No seller contact.
- No offers, pricing, or marketplace workflow.
- No admin approval screen.

## Risks

| Risk | Handling |
|---|---|
| Duplicate signals from same user | Store one signal per user/product pair. |
| Privacy ambiguity | Show aggregate counts only. |
| Feature creep into marketplace | Name excluded workflows in the package. |

## Shape Checkpoint

The shape is narrow enough to build as one vertical slice. Remaining questions are implementation details.
