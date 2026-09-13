# Verification report

Proof-source revision checked by both workflows: `c92508b` on `main`
(2026-09-13).

## Recorded checks

| Check | Result |
| --- | --- |
| GitHub Actions: Lean Action CI | Passed. This builds the complete development with the pinned Lean and Mathlib toolchain, runs the source-policy checks, and runs the explicit axiom audit. |
| GitHub Actions: Run Comparator #1 | Passed. The manual Comparator workflow checked the four declarations listed in `comparator.json`. NanoDa checking was enabled for this run. |
| Source policy | Every Lean source other than `Challenge.lean` is checked for forbidden placeholders and proof-bypass mechanisms. `Challenge.lean` contains exactly four intentional statement placeholders, one for each Comparator target; the policy checks their names, number, and configuration. |
| Explicit axiom audit | The 31 declarations listed in `Verification.lean` depend only on `propext`, `Classical.choice`, and `Quot.sound`. |

## Reproduce the Lean checks locally

With the toolchain from `lean-toolchain` installed, run:

```sh
lake update
lake exe cache get
lake build
python3 -B scripts/test_proof_policy.py
python3 -B scripts/check_proof_policy.py
```

The cache command is optional but substantially reduces the initial build
time. The final command performs the project source and configuration checks,
then runs the explicit transitive-axiom audit.

To display the axiom reports for the paper-facing declarations directly, run:

```sh
lake env lean QuadraticCarleson/PaperTheorems.lean
```

## Comparator check

`Challenge.lean` contains fixed statements for these four declarations:

- `lacunary_sub_log2_modular_failure`
- `full_sub_log2_modular_failure`
- `full_LlogL_endpoint`
- `lacunary_log2_squared_log4_endpoint`

`Solution.lean` exposes their completed formal proofs from
`QuadraticCarleson.PaperTheorems`. The manual workflow in
`.github/workflows/run-comparator.yml` runs Comparator against this pair. It
is intentionally manual because it performs an additional, long-running
check; the regular Lean CI remains the check that runs on every push.

## Scope

This report records Lean and Comparator verification of the included source at
the revision above. The paper-facing declarations are collected in
`QuadraticCarleson/PaperTheorems.lean`; the detailed correspondence between
those declarations and the article is documented in `semantic-audit.md`.

The source article itself is linked from the README and is not included in this
repository.
