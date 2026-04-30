# Feedback Loops

Use this when choosing how a slice proves it works.

This borrows the useful parts of `tdd` and `diagnose` without making every Shape Up build test-first.

## Pick The Smallest Trustworthy Loop

- Risky behavior or business rule: prefer a behavior test before or alongside implementation.
- Regression or bug-like work: build a diagnosis loop first, then lock the fix with a regression check.
- UI interaction: use browser smoke verification or an e2e check when available.
- Simple wiring or low-risk UI: manual verification can be enough.
- Non-deterministic bug: raise reproduction rate before fixing.

## TDD Style

Use a red-green loop when the behavior is important and testable through a public interface.

- Write one failing behavior test.
- Implement the smallest code to pass it.
- Repeat per vertical slice.

Do not write all tests first. Do not test implementation details just to increase coverage.

## Diagnosis Style

Use this when something is broken:

1. Reproduce.
2. Minimise.
3. Rank hypotheses.
4. Instrument one prediction at a time.
5. Fix.
6. Regression-check.

Do not keep hypothesising without a feedback loop.

## Slice Contract Addition

Add this when useful:

```md
Feedback loop:
-
```
