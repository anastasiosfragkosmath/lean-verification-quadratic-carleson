import QuadraticCarleson.KrauseLaceyQuadraticDirectScaleTails
open QuadraticCarleson
open QuadraticCarleson.KrauseLaceyQuadraticSmoothProjection

example (k : ℕ) :
    residueScale (⟨k % 7, Nat.mod_lt _ (by omega)⟩ : Fin 7) (k / 7) = (k : ℤ) := by
  unfold residueScale
  exact_mod_cast Nat.mod_add_div k 7

#check Nat.add_mul_mod_self_left
#check Nat.add_mul_div_left
#check Nat.add_mul_div_right
#check Nat.mod_add_div
#check Finset.sum_product
#check Finset.sum_filter

open scoped BigOperators

theorem test_bij {E : Type*} [AddCommMonoid E] (u : ℤ → E) (N q : ℕ) :
    (∑ k ∈ (Finset.range N).filter (fun k ↦ q ≤ k), u (k : ℤ)) =
      ∑ p ∈ (Finset.univ.product (Finset.range N)).filter (fun p ↦
        (q : ℤ) ≤ residueScale p.1 p.2 ∧ residueScale p.1 p.2 < (N : ℤ)),
        u (residueScale p.1 p.2) := by
  apply Finset.sum_bij (fun k _ ↦
    (⟨k % 7, Nat.mod_lt _ (by omega)⟩, k / 7))
  · intro k hk
    have hk' := Finset.mem_filter.mp hk
    have hkN : k < N := Finset.mem_range.mp hk'.1
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_product.mpr ⟨Finset.mem_univ _, ?_⟩, ?_⟩
    · exact Finset.mem_range.mpr ((Nat.div_le_self k 7).trans_lt hkN)
    · have heq : residueScale
          (⟨k % 7, Nat.mod_lt _ (by omega)⟩ : Fin 7) (k / 7) = (k : ℤ) := by
        unfold residueScale
        exact_mod_cast Nat.mod_add_div k 7
      rw [heq]
      exact ⟨by exact_mod_cast hk'.2, by exact_mod_cast hkN⟩
  · intro k₁ hk₁ k₂ hk₂ heq
    have hs := congrArg (fun p : Fin 7 × ℕ ↦ residueScale p.1 p.2) heq
    have h₁ : residueScale
        (⟨k₁ % 7, Nat.mod_lt _ (by omega)⟩ : Fin 7) (k₁ / 7) = (k₁ : ℤ) := by
      unfold residueScale
      exact_mod_cast Nat.mod_add_div k₁ 7
    have h₂ : residueScale
        (⟨k₂ % 7, Nat.mod_lt _ (by omega)⟩ : Fin 7) (k₂ / 7) = (k₂ : ℤ) := by
      unfold residueScale
      exact_mod_cast Nat.mod_add_div k₂ 7
    rw [h₁, h₂] at hs
    exact_mod_cast hs
  · intro p hp
    have hp' := Finset.mem_filter.mp hp
    let k : ℕ := (p.1 : ℕ) + 7 * p.2
    have hscale : residueScale p.1 p.2 = (k : ℤ) := by
      simp only [residueScale, k]
      norm_cast
    have hqk : (q : ℤ) ≤ (k : ℤ) := by simpa only [hscale] using hp'.2.1
    have hkN : (k : ℤ) < (N : ℤ) := by simpa only [hscale] using hp'.2.2
    refine ⟨k, ?_, ?_⟩
    · apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_range.mpr ?_, ?_⟩
      · exact_mod_cast hkN
      · exact_mod_cast hqk
    · apply Prod.ext
      · apply Fin.ext
        dsimp [k]
        omega
      · dsimp [k]
        omega
  · intro k hk
    have heq : residueScale
        (⟨k % 7, Nat.mod_lt _ (by omega)⟩ : Fin 7) (k / 7) = (k : ℤ) := by
      unfold residueScale
      exact_mod_cast Nat.mod_add_div k 7
    rw [heq]

theorem test_full {E : Type*} [AddCommMonoid E] (u : ℤ → E) (N q : ℕ)
    (hzero : ∀ k : ℤ, 0 ≤ k → (N : ℤ) ≤ k → u k = 0) :
    (∑ k ∈ (Finset.range N).filter (fun k ↦ q ≤ k), u (k : ℤ)) =
      ∑ r : Fin 7, ∑ n ∈ (Finset.range N).filter
        (fun n ↦ (q : ℤ) ≤ residueScale r n), u (residueScale r n) := by
  calc
    (∑ k ∈ (Finset.range N).filter (fun k ↦ q ≤ k), u (k : ℤ)) =
        ∑ p ∈ (Finset.univ.product (Finset.range N)).filter (fun p ↦
          (q : ℤ) ≤ residueScale p.1 p.2 ∧
            residueScale p.1 p.2 < (N : ℤ)),
          u (residueScale p.1 p.2) := test_bij u N q
    _ = ∑ r : Fin 7, ∑ n ∈ (Finset.range N).filter (fun n ↦
          (q : ℤ) ≤ residueScale r n ∧ residueScale r n < (N : ℤ)),
          u (residueScale r n) := by
      rw [Finset.sum_filter]
      calc
        (∑ p ∈ Finset.univ.product (Finset.range N),
            if (q : ℤ) ≤ residueScale p.1 p.2 ∧
                residueScale p.1 p.2 < (N : ℤ) then
              u (residueScale p.1 p.2) else 0) =
            ∑ r ∈ Finset.univ, ∑ n ∈ Finset.range N,
              if (q : ℤ) ≤ residueScale r n ∧
                  residueScale r n < (N : ℤ) then
                u (residueScale r n) else 0 :=
          Finset.sum_product Finset.univ (Finset.range N) _
        _ = _ := by simp_rw [← Finset.sum_filter]
    _ = ∑ r : Fin 7, ∑ n ∈ (Finset.range N).filter
        (fun n ↦ (q : ℤ) ≤ residueScale r n), u (residueScale r n) := by
      apply Finset.sum_congr rfl
      intro r hr
      apply Finset.sum_subset
      · intro n hn
        have hn' := Finset.mem_filter.mp hn
        exact Finset.mem_filter.mpr ⟨hn'.1, hn'.2.1⟩
      · intro n hnq hnnot
        have hnq' := Finset.mem_filter.mp hnq
        have hnN : (N : ℤ) ≤ residueScale r n := by
          by_contra hlt
          apply hnnot
          exact Finset.mem_filter.mpr ⟨hnq'.1, hnq'.2, lt_of_not_ge hlt⟩
        exact hzero (residueScale r n) (by unfold residueScale; omega) hnN
