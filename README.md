# Quadratic Carleson

A Lean 4 + Mathlib formalization of the results in Anastasios Fragkos, Ben
Krause, and Michael Lacey, [*Endpoint Estimates for Stein's Purely Quadratic
Carleson Operator*](https://arxiv.org/abs/2609.04101).

## Main results

The following main results have been formally verified in Lean:

- failure of modular estimates below `t log₂ t` for the lacunary operator and
  the resulting full-modulation operator consequence;
- the full-modulation operator `L log L` modular estimate.
- the lacunary operator `L (log₂ L)² log₄ L`  modular estimate.

`lake build` checks the complete development with Lean's kernel. The explicit
axiom audit reports only Lean and Mathlib's standard logical axioms:
`propext`, `Classical.choice`, and `Quot.sound`.

This repository reports local Lean verification: the included proofs are
checked by Lean's kernel with the pinned toolchain. The
[verification report](docs/verification-report.md) records the scope and
reproducible evidence for that claim.

## Main Lean declarations

The review-facing statements are collected in
[`QuadraticCarleson.PaperTheorems`](QuadraticCarleson/PaperTheorems.lean). The
three principal exports are:

- `QuadraticCarleson.PaperTheorems.full_LlogL_endpoint`
- `QuadraticCarleson.PaperTheorems.lacunary_log2_squared_log4_endpoint`
- `QuadraticCarleson.PaperTheorems.lacunary_sub_log2_modular_failure`

The module also exports the full-modulation negative consequence, the explicit
counterexamples, weak-`(1,1)` corollaries, measurability, and the finite
modulation block estimate. The [semantic audit](docs/semantic-audit.md)
documents the precise correspondence and any Lean-level formulation details.

## Build and verify

Install the Lean toolchain selected by `lean-toolchain` (via
[elan](https://github.com/leanprover/elan)). For a fresh checkout, obtain the
pinned Mathlib dependency and then build:

```sh
lake update
lake exe cache get
lake build
python3 -B scripts/test_proof_policy.py
python3 -B scripts/check_proof_policy.py
```

The cache command is optional but makes the initial build substantially faster.
The final policy command scans every Lean source in this repository and checks
the transitive axioms of the 31 explicitly audited declarations.

To inspect the axiom report for the paper-facing declarations directly, run:

```sh
lake env lean QuadraticCarleson/PaperTheorems.lean
```

Each printed declaration depends only on `propext`, `Classical.choice`, and
`Quot.sound`.

## Navigation

- [Paper-facing theorem statements](QuadraticCarleson/PaperTheorems.lean)
- [Local verification report](docs/verification-report.md)
- [Semantic comparison with the paper](docs/semantic-audit.md)

## License

The Lean source code and repository documentation are licensed under
[Apache-2.0](LICENSE). The source article is linked above and is not included
in this repository.

## Acknowledgement

The organization and verification workflow of this formalization were informed
by [Joris Roos's public Lean repositories](https://github.com/roos-j). Codex
was explicitly instructed to use the general structure and workflow of those
repositories as a model.
