# Final verification report

Verified: **2026-09-09, 22:23 UTC**.

> Current-repository note (2026-09-13): this report records the completed
> core-source snapshot above. The repository now also contains `Challenge.lean`,
> whose four intentional statement placeholders are checked against
> `Solution.lean` by the separate manual Comparator workflow. They are not part
> of the completed core formalization, and this report does not claim that the
> Comparator workflow has run.

The local Lean formalization of arXiv:2609.04101v1 has passed its completion
gates. All three headline conclusions and all seven distinct theorem,
lemma, proposition, and corollary statements in the source have unconditional
checked counterparts. The repeated positive theorem is counted once.
`SEMANTIC_AUDIT.md` records the exact statement correspondence, subsidiary
coverage, and the approved quadratic-specific proof-route replacements.

## Completion gates

| Requirement | Authoritative result |
| --- | --- |
| Full package build | `lake build`: **9057 jobs, exit 0**. |
| Fresh dependency hashing and cache-disabled confirmation | `lake --rehash --no-cache build`: **9057 jobs, exit 0**. This is a separate confirmation, not a claim to have recompiled all unchanged Mathlib sources. |
| Every delivered Lean file covered | Exhaustive hidden/no-ignore inventory: **296 files**. The root imports **294**; the only exceptions are the separately checked `Check.lean` and `Verification.lean`. No unresolved project import. |
| Root-level scratch proofs | `lake env lean Check.lean`: **exit 0**. No file was removed to obtain a passing build. |
| Explicit headline and subsidiary axiom audit | `lake env lean Verification.lean`: **31 dependency reports, exit 0**. Each contains only `propext`, `Classical.choice`, and `Quot.sound`. |
| All project-library declarations, including private declarations | Independent module-origin audit: **294 modules, 6619 declarations, including 294 private declarations; zero forbidden axiom dependencies and zero custom axiom declarations; exit 0**. These are declaration counts, not a count of mathematical theorems. |
| Forbidden proof placeholders/custom axioms | Exhaustive project `.lean` token scan: **no matches** for `sorry`, `admit`, `sorryAx`, or `axiom`. |
| Additional kernel-bypass checks | No project source matches for unsafe/native/compiler-backed proof escape mechanisms, custom elaboration commands, or kernel-check disabling options in the expanded scan below. |
| Pinned dependencies | All **nine** Git dependencies have clean working trees and HEADs exactly equal to their manifest revisions. |
| Semantic fidelity | Primary and independent full-TeX review; all seven source-result statements and required subsidiary facts matched to actual checked declarations. No undischarged analytic hypothesis in a headline. |
| Source fidelity | The copied TeX and PDF have exactly the same SHA-256 hashes as the original user-provided Downloads files. |
| Snapshot stability | All **299** proof/configuration file hashes (296 Lean files plus the three pin/configuration files) are identical before and after the final build and audits. |
| Permanent author decisions | `FORMALIZATION_DECISIONS.md` preserves the approved principal-value construction, negative domination argument, `c=2` specialization, direct one-node proof, half-open atom scales, nonzero-modulation convention and sparse-density convention. |

The source inventory contains **75,780 lines of Lean**, including comments,
definitions, tests and audit commands. This is not a completion-percentage metric.
Informational messages and linter warnings remain in some historical auxiliary
modules; no compiler errors or unfinished proofs remain.

## Reproduce the main checks

From the project directory, with the pinned Lean toolchain available:

```sh
lake build
lake --rehash --no-cache build
lake env lean Check.lean
lake env lean Verification.lean
```

The exhaustive source scan used was:

```sh
rg -n --hidden --no-ignore -g '*.lean' -g '!**/.lake/**' -g '!**/.git/**' '\b(sorry|admit|sorryAx|axiom|unsafe|implemented_by|extern|native_decide|trustCompiler|run_tac|run_cmd|run_elab|elab|macro|opaque)\b|debug\.skipKernelTC|kernel\.trust|Lean\.ofReduce|^\s*#eval\b' .
```

For `rg`, exit code 1 with empty output means **no matches**, not a scan error.
The excluded `.lake` directory contains dependencies and generated artifacts,
not delivered project source. Dependency cleanliness and transitive proof
axioms were checked separately.

The supplementary all-declaration audit used a temporary diagnostic outside
the delivered project. It imported `QuadraticCarleson`, selected constants by
their **defining module** using `Environment.getModuleIdxFor?`, included private
and generated names, and applied `Lean.collectAxioms` to every selected
constant. It rejected both local axiom declarations and dependencies other
than the three standard axioms. The main agent reviewed the helper and reran
it after the final root build. Its final output was:

```text
PROJECT_AXIOM_AUDIT: modules=294; declarations=6619; privateDeclarations=294; forbiddenDependencies=0; customAxiomDeclarations=0
```

The permanent explicit audit is `Verification.lean`; its 31 entries include
all ten paper-facing exports, both raw a.e.-measurable-input positive bounds,
the direct PV Fourier identity, off-support decay, Bohr results, finite sparse
lemma, fixed-height decay, Kalton estimate, resolved frozen-block input, and
the final notation identities.

## Exact verified snapshot

- Lean: `4.34.0-rc2`, commit `6a10ac8c22beadecabdbb0919c2b50214762f91d`,
  `arm64-apple-darwin24.6.0`, Release.
- Mathlib: `85e3a25e006c35636f0e53b0e9296caca2685bc0`.
- SHA-256 of the sorted proof/configuration hash inventory:
  `9f3123c4c019de1264a4fbfdb6411896791e96d01c269a7acaa7d2b300ab87cf`.
- `paper/SteinEndpointArxiv.tex`:
  `5bec65f4014654c9937c8f4b29171ccb5a36f1ed10c2f3bfc1b27ceeb6bb5ab3`.
- `paper/2609.04101v1.pdf`:
  `cfb74b34dcd21520b91c6c1e4ab5e7fd65f41c2750483ee4e81c475ae112d92e`.
- `QuadraticCarleson/PaperTheorems.lean`:
  `6bedbd400c80da45219653a46f0865c154a5a0b457ed0225231bc426569512ec`.
- `Verification.lean`:
  `22ed1364e4c612f7e5172fd01bae24d828483364b755927d1bde7776774b8904`.
- `FORMALIZATION_DECISIONS.md`:
  `9930ff19a53139d21aec064048626f3c9bc7846bd5efaea16a48150ed223717b`.

The inventory digest is computed by applying `shasum -a 256` to all project
Lean files and `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, sorting
the resulting lines by their relative `./` paths with `LC_ALL=C sort -k2`,
then hashing that output. Documentation edits after verification do not alter
this proof/configuration snapshot.

## Review and scope

`QuadraticCarleson/PaperTheorems.lean` is the concise paper-facing entry point.
This report certifies the verified local formalization, not an independent
human mathematical review, external publication, or GitHub/CI execution.
The directory is not a Git working tree. No remote publication was performed.

No author approval of a statement freeze is inferred from compiler success.
The explicit headline snapshot above is preserved for review; any later change
to an author-approved definition or theorem statement must first receive the
author's approval and be recorded permanently.
