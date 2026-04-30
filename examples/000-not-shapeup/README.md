# Example: Not Shape Up

Use this example to keep the boundary clear. Not every request deserves a Shape Up package.

## User Request

```text
The production login button throws an error after the latest deploy. Fix it now.
```

## Classification

Reactive / urgent bugfix.

## Why Not Shape Up

- The work is urgent and production-facing.
- The desired outcome is already clear: login works again.
- The right first move is a fast reproduction and diagnosis loop, not framing a bet.
- Scope control matters, but a package would add process overhead.

## Better Flow

Use a diagnosis loop:

1. Reproduce the login failure.
2. Minimise the repro.
3. Capture the exact symptom.
4. Form ranked hypotheses.
5. Instrument the smallest useful boundary.
6. Fix the cause.
7. Add or update a regression check.
8. Release the fix.

## What To Record

If the bug reveals durable product or technical learning, record only that durable learning in `shapeup/product-memory.md`. Do not turn the incident into a parking-lot backlog item by default.
