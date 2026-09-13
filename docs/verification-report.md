# Verification report

## Recorded proof-source check

The Lean proof source was checked by both workflows at revision `c92508b`
(2026-09-13). The revision is recorded because verification evidence applies to
the exact source checked; rerun the applicable checks after changing Lean
source, the toolchain, `Challenge.lean`, `Solution.lean`, or `comparator.json`.

| Check | Recorded result |
| --- | --- |
| GitHub Actions: Lean Action CI | Passed. It built the Lake targets configured at that revision with the pinned toolchain, then ran the source-policy checks and explicit axiom audit. |
| GitHub Actions: Run Comparator #1 | Passed. The manual Comparator workflow checked the four declarations listed in `comparator.json`; NanoDa checking was enabled. |
| Source policy | The formalization sources are checked for forbidden placeholders and proof-bypass mechanisms. `Challenge.lean` is an isolated Comparator specification containing exactly four intentional statement placeholders; the policy checks their names, number, and configuration. |
| Explicit axiom audit | The 31 declarations listed in `Verification.lean` depend only on `propext`, `Classical.choice`, and `Quot.sound`. |

The current regular CI builds the core formalization. `Challenge.lean` and
`Solution.lean` are built separately by the manual Comparator workflow.

## Reproduce the Lean checks locally

With the toolchain selected by `lean-toolchain`, use the committed
`lake-manifest.json` and run:

```sh
lake exe cache get
lake build
python3 -B scripts/test_proof_policy.py
python3 -B scripts/check_proof_policy.py
```

The cache command is optional but substantially reduces the initial build time.
The first build can require roughly 10 GB of free disk space, depending on the
platform and cache state. Do not run `lake update` merely to reproduce this
checkout: it is a maintainer operation that changes the dependency lockfile.
The final command performs the project source and configuration checks, then
runs the explicit transitive-axiom audit.

To display the axiom reports for the paper-facing declarations directly, run:

```sh
lake env lean QuadraticCarleson/PaperTheorems.lean
```

## Comparator check

`Challenge.lean` fixes these four statement declarations:

- `lacunary_sub_log2_modular_failure`
- `full_sub_log2_modular_failure`
- `full_LlogL_endpoint`
- `lacunary_log2_squared_log4_endpoint`

`Solution.lean` exposes the corresponding completed proofs from
`QuadraticCarleson.PaperTheorems`. The manual workflow builds these separate
modules and then runs Comparator against that exact pair. It is intentionally
manual because it is an additional long-running check; the regular Lean CI is
the check that runs on every push. Comparator checks these
four written Lean statement/proof pairs; the statement-level comparison with
the article is documented separately in `semantic-audit.md`.

## Scope

This report records build, source-policy, axiom-audit, and Comparator evidence
for the revision above. The paper-facing declarations are collected in
`QuadraticCarleson/PaperTheorems.lean`; the current statement correspondence is
documented in `semantic-audit.md`. This report does not replace inspection of
the theorem types or a final workflow run for a later release revision.
