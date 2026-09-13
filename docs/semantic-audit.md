# Semantic Audit Against the Paper

This file records statement-level comparison between the Lean development and
arXiv:2609.04101v1.  A checked proof is not marked semantically complete merely
because Lean accepts a related statement.

## Complete source-result map — current review, 2026-09-09

The primary agent and an independent reviewer read the full supplied TeX.
There are seven distinct theorem/lemma/proposition/corollary statements; the
positive endpoint theorem is printed twice. All seven have unconditional
checked counterparts. File names below identify where declarations live;
unless indicated otherwise, declarations are in namespace `QuadraticCarleson`.

| Source result | Checked counterpart | Exact scope checked |
| --- | --- | --- |
| `t:loglogfail` | `PaperTheorems.lacunary_sub_log2_modular_failure`, `.full_sub_log2_modular_failure`, `.lacunary_counterexample_at_unit_height`, `.full_counterexample_at_unit_height` | Paper Young-function convention, little-o at infinity, all test inputs and positive levels in modular failure, strict unit-height witnesses for every `0 < κ < 1`, full consequence by domination. |
| `t:LlogL` and its repeated statement | `PaperTheorems.full_LlogL_endpoint`, `.lacunary_log2_squared_log4_endpoint` | One finite constant before all inputs and all positive thresholds; literal `log₁` and `(log₂)^2 log₄` modulars; real full modulation and all integer dyadic modulation exponents; genuine PVs on a common conull set. |
| First Section 3 off-support lemma | `offSupportPaperLemma` in `OffSupportPaperLemma.lean` | Both displayed bounds, literal maximum error, arbitrary natural decay order, both sides of every interval, both signs of nonzero modulation; first bound also includes zero. |
| `l:bohrintersection` | `bohrSet_inter_volume_real_le` in `BohrIntersection.lean` | Every positive integer frequency pair, radius `0 < ρ < 1/10`, gcd/max-frequency dependence. |
| Dyadic Bohr-union proposition | `dyadicBohrLogUnion_volume_real_ge`, `dyadicBohrLogUnion_volume_real_ge_uniform` in `BohrUnion.lean` | Real logarithmic windows with `M ≥ 2`, `B ≥ 1`, source-compatible dyadic logarithm; `(Bc)^2/((Bc)^2+Bc)` lower bound and uniform lower bound when `Bc` is bounded below. |
| `l:weak11sparse` | `weak11sparseStatement_proof`, `finiteSparseMaximal_hasWeakOneOneBound` in `FiniteSparseMaximalProof.lean` | General finite sublinear family with the stated sparse-growth assumption; universal logarithmic-squared weak constant. This generic assumption is the source lemma's hypothesis, not a missing prerequisite. |
| `c:finitemodulationsweak11` | `PaperTheorems.finite_modulation_blocks_weakOneOne` | Arbitrary finite signed nonzero real modulations, exact sum `0 ≤ r ≤ B`, logarithmic-squared cardinality factor uniform in `B`; no supremum over `B` moved inside the operator. |

### Subsidiary mathematical coverage

- **Definitions and distributional meaning:** `Definitions`, `WavePacket`,
  `PrincipalValueDistribution`, `PVSymmetricLimit`, `QuadraticKernelLimit`,
  and `PVFourierIdentity` construct the specified objects and prove their
  symmetric-limit and Fourier identifications. `PositiveEndpointsAERepresentative`
  removes the Borel-representative implementation restriction from the positive
  test-function domain; negative witnesses already belong to that domain.
- **Negative quantitative argument:** `CounterexampleModular` and
  `ModularFailure` prove the `o(N)` modular bound; `BohrSetSize` gives the
  general size assertion; `BohrUnion` and `TranslatedBohrUnion` prove second
  moments and translated-union measure; `StationaryPacketSum`,
  `OscillatoryPacketSum`, `HarmonicPhaseSum`, `CounterexampleMainTerm`,
  `CounterexampleErrorBudget`, and `NegativeEndpoint` supply the quantitative
  phase, harmonic-sum, error-absorption and level-set arguments. The fixed
  constants replace only unspecified universal constants in the paper.
- **Finite sparse lemma:** `FiniteSparseMaximalProof` supplies the excision,
  measurable finite foliation, Hölder estimates, and exponent optimization.
  The proof uses a directly constructed maximal-function excision in place
  of the printed dyadic-excision construction, with the same lemma statement.
- **Fixed-height quadratic analysis:** `QuadraticL2Decay`, `QuadraticTTStar`,
  and the `QuadraticFixedHeightAveraging*` chain prove the actual all-real
  fixed-height maximal estimate, with `β = 1/10`, following the approved
  quadratic specialization. `PositiveGoodOscillatory` supplies the needed
  oscillatory `L²` bound for the good part.
- **Positive decomposition and low/high estimates:**
  `CalderonZygmundDyadicStopping`, `CalderonZygmundLevelAtoms`,
  `PositiveStoppingBadRecombination`, `PositiveHighHeightWeighted`,
  `PositiveHighHeightFullEndpoint`, `PositiveHighHeightLacunaryEndpoint`,
  `LowKernelDerivative`, `LowKernelBadAtomSharp`, `LowKernelRealMaximal`, and
  `PositiveLowFullHeightIdentity` supply the actual countable input
  decompositions, cancellation, derivative-minimum bound, and integrated
  estimates. The rigorous bound is `O(B+1)` at height zero; the source chooses
  `B_k ≥ 20`, where this is precisely its `O(B_k)` estimate.
- **Sharper lacunary closure:** `DyadicAtomScales` implements the author's
  exact half-open scale classes; the `LacunaryMiddleRange`,
  `LacunaryVerySmallOperator`, `LacunaryMiddleOperator`, `LacunaryMiddleFinalSummation`
  and `LacunaryLowAssembly` chains prove support, cancellation, frozen errors,
  residue-class disjointness and mass summation. `KaltonEndpoint` and
  `KaltonPaperApplication` prove the finite-to-countable logarithmic weak
  estimate. `LacunaryFrozenBlockDirectResolved` supplies the actual block
  input without a remaining analytic hypothesis. `PositiveEndpointOptimization`
  proves the exact single/double/triple-exponential choices and final modulars.
- **Full/PV assembly:** `OscillatoryReductionMaximal`, `OscillatoryReductionLimit`,
  `HilbertMaximalWeakResolved`, `PositivePrincipalValueEndpoints`, and the
  direct resolved endpoint modules identify the genuine operators, handle the
  ordinary Hilbert and maximal-function terms, and restore every positive
  threshold. `PositiveFullMaximalMeasurability` proves measurability of the
  actual full supremum.

### Scope and proof-route distinctions

The historical survey of other authors' results in the introduction is not
being presented as independently formalized here. In particular, the general
Stein–Wainger theorem, a general arbitrary-cutoff Calderón–Zygmund theorem,
and the entire cited Krause–Lacey article are not claimed as deliverables.
The quadratic estimates actually required by this paper are proved directly.
The full all-radius sparse theorem is not an assumed substitute for them.
The author's direct quadratic one-node proof replaces the old
standard/nonstandard architecture; statements and source operator definitions
are preserved. Historical conditional adapters remain valid lemmas with
explicit hypotheses, but the final source results above do not rely on
unproved instances of those hypotheses.

## Negative endpoint theorem (Theorem 1)

### Source statement

If the Young function `Phi` satisfies `Phi(t) = o(t log_2 t)`, then the
lacunary quadratic Carleson operator has no `Phi`-modular estimate.  Moreover,
for every `0 < kappa < 1` there is a test function whose modular mass at height
one is less than `kappa` times the measure of its strict level set.  The full
quadratic operator also fails because it dominates the lacunary operator.

### Checked Lean correspondence

- `YoungFunction` records exactly the paper's continuous, convex, strictly
  increasing nonnegative-domain convention, including the exceptional
  identity function and the alternative superlinear condition.
- `GrowsSlowerThanEndpoint` is literally the little-o relation
  `Phi(t) = o(t * paperLog 2 t)` at positive infinity.
- `HasPhiModularEstimate` quantifies over every bounded,
  compactly-supported measurable complex-valued function and every positive
  height, and uses the paper's strict level set and global unweighted modular.
- `lacunaryL0Operator` is an everywhere-defined measurable representative:
  the supremum over `2^Z` of limsups of symmetric truncation norms along a
  cofinal sequence of positive radii.  On every compactly supported Schwartz
  input it is proved pointwise equal to the distributionally defined
  principal-value operator.
- `eventually_lacunary_counterexample_level_volume_ge` supplies the actual
  linear lower level-set estimate for the paper's counterexamples.
- `negativeEndpoint_not_hasPhiModularEstimate` proves the lacunary failure on
  the full paper test domain.
- `negativeEndpoint_exists_paper_modular_witness` proves the exact printed
  `0 < kappa < 1` witness statement (and a preceding theorem proves the
  stronger range `kappa > 0`).
- `negativeEndpoint_not_hasPhiModularEstimate_of_dominates_lacunary` proves
  the abstract transfer to every measurable full-domain operator that
  pointwise dominates the lacunary one.

### Verification

At the negative-endpoint checkpoint the root build succeeded. A placeholder scan found no `sorry`, `admit`,
`sorryAx`, or custom `axiom`.  `#print axioms` on the analytic level-set
theorem and the four headline negative results reports only `propext`,
`Classical.choice`, and `Quot.sound`. The final whole-project audit must be
repeated on the finished development; this historical checkpoint is not that audit.

### Full-operator consequence

The author confirmed that the paper's full negative conclusion is to be read
by the immediate pointwise domination `C₂ f ≥ C₂,lac f`, because
`2^ℤ ⊆ ℝ`.  The Lean theorem
`lacunaryQuadraticCarlesonL0_le_quadraticCarlesonL0` proves this inclusion
directly for the full real supremum.  The theorem
`fullNegativeEndpoint_not_hasPhiModularEstimate` then proves that this
concrete full operator has no modular inequality, and
`fullNegativeEndpoint_exists_paper_modular_witness` transfers the exact
normalized witnesses.  No continuity-in-modulation or rational-density
argument is used.

### Common principal-value formulation (2026-09-09)

`NegativePrincipalValueEndpoints` now transfers the negative failure and the
strict unit-height witnesses to `lacunaryPrincipalValueMaximal` and
`fullPrincipalValueMaximal`, the exact same operators used by both positive
headlines. The transfer uses proved a.e. equality with the existing limsup
representatives, not a redefinition. `PaperTheorems` exports the explicit
negative and positive statement types and both weak-`(1,1)` failures together.
`PositiveFullMaximalMeasurability` proves a.e. measurability of the genuine
full-real supremum via common-set modulation continuity and rational density.
This measurability proof is separate from, and not needed for, the elementary
domination argument that transfers the negative conclusion.

## Positive endpoint theorem (Theorem 2)

Both positive headline inequalities are now unconditional:
`HilbertMaximalWeakResolved.full_principalValue_endpoint` and
`LacunaryEndpointDirectResolved.lacunary_principalValue_endpoint`. They retain
the paper's exact `paperLog 1` and `(paperLog 2)^2 * paperLog 4` modulars,
every positive threshold, every bounded compact-support test input, and actual
principal values on a common conull set. The latter theorem's focused build
succeeded with 9005 jobs; its axiom list contains only the standard logical
axioms. It is not the older similarly named theorem with a frozen-block premise.

`PositiveEndpointsAERepresentative` additionally transfers both inequalities
to arbitrary a.e.-measurable bounded compact-support inputs (9007 jobs). It
preserves the raw input's modular integral and actual principal values. Thus
using Borel-measurable representatives in `L0Infinity` is not a restriction on
the paper's Lebesgue-measurable input convention.

No author approval of a positive headline snapshot is inferred from compilation;
any future approved freeze must be recorded explicitly. The following is a
historical implementation ledger. Statements below described as conditional or
remaining refer to those earlier interfaces, not the current headline status:

- `DyadicAtomScales` implements the author's exact clarification
  `I ∈ 𝓈_j ↔ 2^j ≤ ℓ_I < 2^(j+1)`, including unique scale assignment,
  coverage, pairwise disjointness, and endpoint behavior.
- `PositiveDyadicKernel` identifies the paper's low kernel with the exact
  telescoped cutoff difference and proves its sharp `|tK(t)|` size bound and
  normalized support.
- `LowKernelDerivative` derives, from the fixed smooth cutoff rather than an
  assumption, the paper's estimate
  `|K'_{λ,B}(t)| ≤ C min(|λ|, 2^(2B)/|t|²)`.
- `CalderonZygmundBadPart` proves the one-dimensional cancellative-atom
  estimate cited by the author from Lemma 6.12 of the supplied notes.
  `LowKernelCalderonZygmund` applies it to the actual paper kernel, and
  `LowKernelBadAtomSharp` combines cancellation with `|K(t)| ≤ 1/|t|` to
  obtain the common modulation-independent majorant and the required
  `O(B+1) ||b_I||₁` integrated estimate (in fact outside `3I`, which is
  stronger than the paper's use outside `5I`).
- `HardyLittlewoodMaximal` constructs a measurable centered maximal operator
  over positive rational radii and proves its weak `(1,1)` and strong `L²`
  estimates. `HardyLittlewoodMaximalLp` proves its strong `L^p` estimate for
  every real `p > 1` by a localized layer-cake argument.
  `IntervalMaximalComparison` proves that arbitrary-interval `L^p` averages
  are pointwise controlled by that centered maximal operator, and
  `SparseMaximalLp` proves the resulting strong maximal and Hölder bounds used
  in the sparse lemma.
- `KaltonEndpoint` proves the countable weak-`L¹` log-convexity step and the
  comparison of Kalton's weight with the paper's `log₁(k+2)` convention.
- `LacunaryMiddleRange` proves the integer geometry of the sets `L`, `S`, `Q`,
  and `R`, including the frozen-range cardinality and sparse-residue
  disjointness assertions. `LacunaryVerySmallRange` proves the exact
  real-exponent geometric series in the very-small branch, and
  `LacunaryMiddleRangeSummation` proves the `B`, `5B`, sparse packing, and
  exact half-open atom-scale Tonelli bounds in the middle branch.
- `PositiveEndpointOptimization` proves the paper's full and lacunary choices
  of `A_k` and `B_k` and their scalar Orlicz-weight estimates.
  `PositiveLevelIntegration` constructs the measurable sets `F_k`, proves
  their disjoint coverage, and turns those scalar estimates into the exact
  countable level-mass bounds for `L log₁ L`, `L(log₂ L)²`, and
  `L(log₂ L)² log₄ L`.
- `CalderonZygmundLevelAtoms` proves the support, mean-zero, `L¹`, `L²`, and
  disjoint-family level-mass estimates for the magnitude-level atoms.
  `CalderonZygmundLevelRecombination` proves that their countable sum is the
  ordinary bad atom and justifies commuting the series with interval
  averages. `LowKernelLevelSummation` combines these atoms with the actual
  low quadratic kernel to obtain the paper's global `O(B+1)` low estimate.
  `LowKernelRealMaximal` then takes the genuine supremum over every nonzero
  real modulation and bounds its Lebesgue outer integral by the same common
  measurable majorant. Thus this step does not incorrectly infer an
  integral-of-supremum estimate from separate fixed-parameter bounds.
  `PositiveLowFullHeightIdentity` sums those majorants over the actual
  countable atom family and magnitude levels, uses the literal finite sum
  `0 ≤ r ≤ B_k` with `B_k = 20·2^k`, and proves the full low-part
  `L log₁ L` level-set bound including the fivefold exceptional-set term.
- `CalderonZygmundDecomposition` constructs an actual countable pairwise
  disjoint Vitali interval family at height one, with a.e. high-point
  coverage, total-length control, mean-zero bad atoms, and the outside good
  `L²` bound. `CalderonZygmundDyadicStopping` now supplies the canonical
  first-crossing dyadic refinement: its half-open intervals are countable and
  pairwise disjoint, have averages in `(1,2]`, cover `{x | 1 < ‖f x‖}` almost
  everywhere, have total length at most `∫ ‖f‖`, and produce the complete good
  part with `‖g‖ ≤ 2` almost everywhere and `∫ ‖g‖² ≤ 5 ∫ ‖f‖`.
  `CalderonZygmundStoppingIntervals` converts each cell to the center/length
  parameters used by the analytic atom modules. The common half-open interval
  convention makes this an exact set identity and transfers literal pairwise
  disjointness. Replacing the paper's unspecified endpoint convention by this
  representative changes no Lebesgue average or integral.
- `QuadraticFixedHeightAveragingNorm` closes the specialized `c=2` analogue
  of Lemma 6.2 of arXiv:2412.15766 for the paper's actual convolution and the
  supremum over every nonzero real modulation. It proves
  `||M_h f||₂ ≤ C 2^(-h/10) ||f||₂`; rational density is taken separately
  inside each half-open scale band, so no false global continuity assertion
  is used across scale-selector jumps.
- `PositiveHighHeightLacunaryEndpoint` closes the high-oscillation branch for
  the actual strict tail `r > B_k`.  The proof sums the genuine complex
  kernels, takes the supremum over every nonzero real modulation (and then
  restricts to dyadic modulations for the lacunary theorem), and proves
  simultaneous almost-everywhere absolute convergence.  With the explicit
  choices `B_k = 20·2^k` and `B_k = 20·2^(2^k)`, respectively, it proves the
  full `L log₁ L` and lacunary `L(log₂ L)²` high-part level-set bounds.
- `DyadicKernelInfinite` proves that the positive-height dyadic pieces have
  finite support at every nonzero spatial point and telescope exactly to the
  paper's high-pass kernel. `FiniteModulationKernelComparison` proves the
  exact finite-block comparison with two maximal quadratic truncations and
  the centered Hardy--Littlewood maximal function. This isolates, without
  postulating it, the remaining Krause--Lacey sparse estimate used in the
  finite-modulation corollary.
- `OscillatoryReductionLimit` promotes the scalar high-pass identity to the
  paper's actual compactly supported bounded input domain.  For each fixed
  modulation and observation point the height integrands are eventually
  identically zero, so the sum/integral interchange is exact.  It proves the
  pointwise reduction of every nonzero quadratic truncation limsup to the
  genuine oscillatory series, the ordinary Hilbert maximal truncation, and
  the Hardy--Littlewood maximal function.  It also proves that existence of
  all nonzero quadratic principal values at a point is equivalent to existence
  of the ordinary Hilbert principal value there; the classical Hilbert theorem
  is therefore isolated rather than assumed.
- `HilbertFiniteTruncationWeakOneOne` identifies finite annular convolutions
  exactly with differences of the project's ordinary (`lambda = 0`) sharp
  Hilbert truncations and proves their finite-family weak `(1,1)` estimates
  by Young's inequality. These estimates are fully concrete but depend on the
  selected radii; the uniform maximal-truncation theorem still requires the
  classical Calderón--Zygmund argument and is not inferred from this finite
  approximation.
- `PositiveStoppingGoodEstimate` sums the proved fixed-height decay over all
  nonnegative heights and obtains a common measurable `L²` majorant for the
  genuine full-real and lacunary oscillatory suprema. Applied to the canonical
  stopping good part it proves the normalized outer level-set estimate directly
  from `∫ ‖g‖² ≤ 5 ∫ ‖f‖`, together with simultaneous a.e. absolute convergence
  of every nonzero-real-modulation height series.
- `PositiveStoppingBadRecombination`, `PositiveStoppingBadAction`, and
  `PositiveStoppingBadEndpoint` identify the canonical bad part pointwise
  with its magnitude-level series, justify the genuine integral/series
  interchange, split the actual finite-low and strict-high height ranges, and
  prove the normalized full-real `L log₁ L` oscillatory level-set bound.
  `PositiveFullOscillatoryEndpoint` combines this with the good part using
  proved linearity and subadditivity, yielding the corresponding normalized
  theorem for the original input `f`. `PositiveFullOscillatoryScaling` proves
  genuine scalar homogeneity and upgrades it to every real threshold
  `alpha > 0`, with exactly the paper's integrand
  `(|f|/alpha) log₁(|f|/alpha)` and no change in the universal constant.
- `LacunaryLowSupport` proves the paper's too-large atom-scale contribution is
  identically zero outside the fivefold interval for the genuine dyadic low
  kernel.  With the fixed cutoff used here the explicit support inequality is
  stronger than the paper's unspecified universal-constant version.
- `KrauseLaceySparseInterface` verifies the exact dilation and conjugation
  reductions from arbitrary nonzero quadratic modulation to the two unit-sign
  phases, as well as sublinearity of finite truncations. The deep KL18 sparse
  theorem itself is not in Mathlib and remains to be formalized; it has not been
  represented by an assumption.
- `KrauseLaceyStoppingExtraction` constructs the maximal bad children for a
  finite laminar collection, proves their disjointness and one-fifth packing,
  and obtains a four-fifths major subset, hence the approved `1/4` sparse
  root/children family. `KrauseLaceyStoppingRecursion` proves the exact
  pointwise and bilinear stopping recursion for the genuine length-threshold
  maximal partial sums. `KrauseLaceyShiftedLocalization` proves the exact
  finite central-third decomposition of every compactly supported input at a
  fixed dyadic scale, including endpoints, and identifies the localized sum
  with the genuine global convolution. `KrauseLaceyThreeShiftGrid` constructs
  the source's three translated grids, proves exact central-third partitioning
  at every represented scale and laminarity within each grid, and constructs
  their complete finite descendant trees. `KrauseLaceyThreeShiftTreeInterface`
  proves those concrete trees lie under their roots and satisfy the literal
  dyadic-parent closure used by the actual bad-scale estimates.
  `KrauseLaceyRademacherMenshov` proves the finite maximal-prefix theorem with
  the exact logarithmic loss from a uniform signed-sum bound. The actual
  quadratic cross-scale correlation, localized-pairing, diagonal signed-sum,
  overlap-capped prefix, active-family packing, and pruned physical-tail bounds
  are checked. `KrauseLaceyOverlapJohnNirenberg`,
  `KrauseLaceyActiveExponentialPruning`, `KrauseLaceyOverlapSecondMoment`,
  `KrauseLaceyRemovedOperatorL2`, and `KrauseLaceyNonstandardPhysicalL2`
  prove the exponential exceptional-family estimate, the actual removed
  operator bound, and the unrestricted retained-plus-removed physical-suffix
  maximal `L²` estimate. `KrauseLaceyNonstandardSourceMaximal` identifies its
  cutoff exactly with the source range `ell ≥ k₀+s`, while
  `KrauseLaceyNonstandardPairing` and
  `KrauseLaceyNonstandardLocalInterpolation` prove the local pairing and
  threshold-interpolation estimates. `KrauseLaceyThreeShiftForest`,
  `KrauseLaceyThreeShiftAction`, and `KrauseLaceyThreeShiftMaximalAction`
  identify every finite positive-half global maximal tail with three concrete
  localized maximal actions in parent-closed shifted forests.
  `KrauseLaceyFullDyadicReflection` has already closed the negative spatial
  half: each finite full odd-kernel tail is exactly the positive-half tail on
  the original input minus the same tail on the reflected input at the
  reflected point.
- `LacunaryMiddleOperator` constructs the paper's genuine frozen middle-block
  inputs and actions, proves exact recombination with the modulation-dependent
  middle ranges, and bounds the resulting error by the already checked
  very-small contribution. `LacunaryMiddleBlockWeak` reduces the remaining
  single-block estimate to the finite maximum of genuine sharp quadratic
  Hilbert truncations plus the Hardy--Littlewood boundary term, with the exact
  coefficients from the kernel comparison.
- `LacunaryMiddleKalton` applies the checked countable Kalton theorem to the
  actual frozen-block outputs. `LacunaryMiddleFinalSummation` sums every residue
  class modulo the paper's exact `10^10`, proves the all-block mass packing
  estimate, and collapses `log₁(k+2) log₁(B_k)^2` for
  `B_k = 20·2^(2^k)` into the source modular
  `L(log₂ L)^2 log₄ L`. No residue class is discarded and the factor `20` is
  not confused with the sparse modulus.
- `LacunaryLowAssembly`, `LacunaryOscillatoryAssembly`, and
  `LacunaryOscillatoryScaling` connect the actual middle, very-small, and
  strict-high contributions to the canonical stopping bad part, then combine
  the genuine stopping good and bad parts. They prove the arbitrary positive
  threshold oscillatory estimate in the exact source modular form. The only
  remaining hypothesis in that theorem is the uniform individual frozen-block
  logarithm-squared weak estimate, i.e. the precise finite-modulation
  Krause--Lacey input rather than an assumed assembled endpoint.
- `LacunaryPositiveOperatorReduction` proves the unconditional pointwise
  reduction of the lacunary principal-value limsup operator to its oscillatory
  maximal part, the ordinary maximally truncated Hilbert transform, and the
  Hardy--Littlewood maximal function. It discharges the Hardy--Littlewood
  distribution term and leaves the ordinary Hilbert level set explicitly
  visible. `PositiveFullOperatorEndpoint` proves the analogous pointwise
  reduction for the full real-modulation operator, including modulation zero,
  and a threshold-one `L log₁ L` estimate conditional only on the exact
  ordinary Hilbert maximal weak bound.
- `HilbertMaximalWeakOneOne`, `HilbertRepresentativeBridge`, and
  `HilbertMaximalWeakResolved` now prove the complete ordinary maximally
  truncated Hilbert-transform weak `(1,1)` theorem. This includes countable
  atom recombination, off-triple cancellation, boundary-cell maximal control,
  the Fourier `L²` representative, the Poisson/conjugate-Poisson spectral
  identity, and the genuine Cotlar comparison. The uniform Hilbert interface,
  simultaneous principal-value existence for every real quadratic modulation,
  and the full-real principal-value `L log₁ L` endpoint are therefore
  unconditional. The audited headline declarations use only Mathlib's
  standard logical axioms `propext`, `Classical.choice`, and `Quot.sound`.
- `HilbertPrincipalValueClosure` proves the full principal-value closure once
  the ordinary Hilbert maximal weak estimate is supplied: compact Schwartz
  functions are dense in the required `L¹` sense, every positive tail-Cauchy
  obstruction has outer measure zero, and all real quadratic modulations have
  principal values on one common conull set. The existing limsup
  representatives are identified with those genuine principal values there.
- `LacunaryFrozenInputL0` proves that the actual frozen Calderón--Zygmund block
  input belongs to `L0Infinity`, with the exact pointwise function and exact
  `L¹` mass. `KrauseLaceyFiniteRadiusAdapter` realizes finite sharp-radius
  maxima as genuine sublinear complex-valued test operators.
  `LacunaryMiddleFiniteRadiusLimit` and `LacunaryMiddleSparseAdapter` then
  prove that a weak estimate uniform over finite radius sets passes, with no
  constant loss, through the finite modulation maximum to the genuine
  all-positive-real-radius frozen block and to the paper's exceptional-set
  restriction. Thus no pointwise-finiteness assumption on the final maximal
  truncation is hidden in the sparse adapter.
- `KrauseLaceyCompactPairingStabilization` transfers uniform finite physical
  suffix bounds to the genuine infinite dyadic smooth maximum by an exact
  compact-support stabilization of every testing pairing.
  `KrauseLaceyFiniteRadiusSmoothSparse` then dominates each finite rounded
  radius family by one such dyadic maximum without constant loss. Reflection
  is the only loss and contributes the explicit factor two.
- `HardyLittlewoodBoundaryControl` proves the common boundary maximal operator
  finite, measurable, locally integrable, and weak `(1,1)`, and moves it
  outside the finite modulation maximum. It derives the all-radius frozen
  block and the paper-facing lacunary endpoint from the sole remaining smooth
  Krause--Lacey sparse estimate, with no block-cardinality loss in the boundary
  constant.
- `KrauseLaceyBlockHypothesis` states the exact uniform individual
  finite-radius sparse input and converts it to the abstract finite-family
  hypothesis for the paper's block, proving the family cardinality is exactly
  `B`. `KrauseLaceyLacunaryBlock` proves that this input together with the
  operational finite sparse-maximal weak theorem gives
  `HasLogSquaredFrozenHilbertBlockWeakBounds` with constant `K*A`. This closes
  every logical adapter between the two sparse analytic estimates and the
  existing lacunary endpoint assembly. The final uniform hypothesis has also
  been narrowed to the exact `L0Infinity` domain used by the paper; no estimate
  for arbitrary integrable inputs is demanded.
- `PositivePrincipalValueEndpoints` supplies the final full and lacunary
  paper-facing principal-value statements at every positive threshold and
  with the source modulars. They are currently conditional only on the two
  explicitly isolated analytic inputs below; the principal-value and final
  assembly steps themselves are checked.

## Current direct route and completed source coverage

The author's direct quadratic one-node proof is checked without using the
standard/nonstandard or Rademacher--Menshov route. The high full-odd finite
suffix sparse theorem, dilation regularity, and two physical cutoff comparisons
give the actual paper block pointwise as a normalized high suffix plus `48 M f`.
The error is common to the modulation family, so it incurs no cardinality factor.
`LacunaryFrozenBlockDirectResolved.hasUniformL0LogSquaredFrozenBlockWeakBounds`
is unconditional and discharges the final analytic input of the headline.

`FiniteModulationDirectBlockResolved.finiteModulationBlock_weak_bound` proves
the finite-modulation corollary for every finite family of signed nonzero real
modulations, uniformly in height (9003-job focused build). The nonzero convention
is author-approved; the cardinality factor is exactly `paperLog 1 N ^ 2`.
`NegativeWeakOneOneCorollary` explicitly derives the advertised weak-`(1,1)`
failure from the identity Young function (8797-job focused build).

Additional checked literal source coverage:

- `OffSupportPaperLemma.offSupportPaperLemma` (the declaration is in namespace
  `QuadraticCarleson`) proves both branches of the first Section 3 lemma on the
  genuine PV packet action: the exact `max` approximation error for every real
  modulation, and the rapid-decay estimate for every natural order and both
  signs of nonzero modulation. The latter's inverse-power denominator requires
  nonzero modulation, as in the paper's oscillatory regime. Constants depend
  only on the order and fixed bump; no interval/evaluation hypotheses are added.
- `BohrSetSize` proves `bohrSet_volume_real_comparable`, with explicit
  `ρ/8 ≤ |B(k,ρ)| ≤ 4ρ` for all `k ≥ 100`, `0 < ρ < 1/10`. This covers the
  source prose's smaller radius range and arbitrary large natural frequencies,
  not merely multiples of four.
- `PVFourierIdentity.fourier_principalValueOneDiv` is an unconditional theorem
  for the canonical cancelled-integral tempered distribution, using the proved
  odd-Schwartz primitive. The Fourier multiplier is a conclusion, not the
  definition of principal value or an additional axiom.

The final source read's three subsidiary notation items are now checked:

- `DyadicKernelBilateral.hasSum_dyadicPsi` and `tsum_dyadicPsi` (declarations
  in namespace `QuadraticCarleson`) give the genuine sum over every integer
  scale for `t ≠ 0`, using existing support and one-sided telescoping proofs.
- `YoungFunction.bijOn_nonneg` and `nonnegOrderIso` prove the nonnegative-axis
  bijection and both inverse identities directly from the unchanged source
  Young-function convention, including its identity exception.
- `torusNorm_eq_abs_of_mem_Ico`, `torusNorm_isLeast_integerDistances`, and
  `torusNorm_eq_iInf_abs_sub_int` prove literal agreement of the fractional-part
  implementation with the paper's minimum-distance definition and its chosen
  representative interval.

No source-result gap remains identified by this statement audit. The final
integrated build, exhaustive source coverage/forbidden-token scan, and
dependency checks are recorded separately; this semantic review is not a
substitute for those checks. `PaperTheorems.lean` remains a reviewable
explicit-type snapshot, not an inferred author approval or statement freeze.

## Final integrated verification

The separate completion gates have now passed on the reviewed source snapshot:
actual `lake build` and rehash/no-cache confirmation (9057 jobs each), all-file
coverage including both root-level auxiliary files, the 31-entry explicit axiom
audit, all 6619 library declarations including private names, source scans and
clean pinned dependency checks. All proof/configuration hashes were unchanged
through verification. See `VerificationReport.md` for exact evidence and hashes.
Thus the semantic map above is paired with a successful complete local build,
not merely with isolated focused checks.
