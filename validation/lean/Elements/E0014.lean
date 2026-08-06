import Elements.E0005

/-!
# Discrete product rule — general r

Formalises `Thm:product-rule` (general r) from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026).

For maps `f : Fin r → (X → A)` into a commutative ring `A`:

  Δ(∏ᵢ fᵢ; x; u_S) = ∑_{J ∈ OrdCov(r,S)} ∏ᵢ Δ(fᵢ; x; u_{Jᵢ})

where `OrdCov(r,S)` is the set of ordered r-covers: tuples
`(J₀,…,J_{r-1})` of subsets of S whose union is S.

The proof directly parallels the r = 2 case: expand r Taylor
expansions via `prod_univ_sum`, apply `coeff_sum`, filter to covers.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α]
         {X : Type*} [AddCommGroup X]
         {A : Type*} [CommRing A]

/-! ### Ordered r-covers -/

/-- Ordered r-covers of S: tuples `J : Fin r → Finset α` with each `Jᵢ ⊆ S`
and `⋃ᵢ Jᵢ = S`. -/
def orderedCovers (r : ℕ) (S : Finset α) : Finset (Fin r → Finset α) :=
  (Fintype.piFinset (fun _ : Fin r => S.powerset)).filter
    (fun J => Finset.univ.biUnion (fun i => J i) = S)

/-! ### Interchange predicate -/

/-- Interchange for the general product rule:
`(R ⊆ S, J ∈ piFinset(R.powerset^r))` ↔
`(J ∈ piFinset(S.powerset^r) with ⋃Jᵢ ⊆ R, R ⊆ S)`. -/
private lemma interchange_general (r : ℕ) (S : Finset α)
    (R : Finset α) (J : Fin r → Finset α) :
    (R ∈ S.powerset ∧ J ∈ Fintype.piFinset (fun _ : Fin r => R.powerset))
      ↔ (R ∈ S.powerset.filter (Finset.univ.biUnion (fun i => J i) ⊆ ·)
          ∧ J ∈ Fintype.piFinset (fun _ : Fin r => S.powerset)) := by
  simp only [Finset.mem_powerset, Finset.mem_filter, Fintype.mem_piFinset]
  constructor
  · rintro ⟨hRS, hJR⟩
    refine ⟨⟨hRS, fun x hx => ?_⟩, fun i => (hJR i).trans hRS⟩
    rw [Finset.mem_biUnion] at hx
    obtain ⟨i, _, hxi⟩ := hx
    exact (hJR i) hxi
  · rintro ⟨⟨hRS, hUR⟩, hJS⟩
    exact ⟨hRS, fun i x hx => hUR (Finset.mem_biUnion.mpr ⟨i, Finset.mem_univ i, hx⟩)⟩

/-! ### Main theorem -/

/-- **General discrete product rule** (`Thm:product-rule`).

  `Δ(∏ᵢ fᵢ; x; u_S) = ∑_{J ∈ orderedCovers r S} ∏ᵢ Δ(fᵢ; x; u_{Jᵢ})`.

Proof: expand r Taylor formulas via `prod_univ_sum`, interchange,
apply `coeff_sum`, filter to r-covers. -/
theorem product_rule_general (r : ℕ) (f : Fin r → (X → A))
    (x : X) (u : α → X) (S : Finset α) :
    fwdDiff (fun y => ∏ i, f i y) x u S
      = ∑ J ∈ orderedCovers r S, ∏ i, fwdDiff (f i) x u (J i) := by
  -- Step 1: tr(∏fᵢ) = ∏(tr fᵢ)  (products distribute over evaluation)
  show mu (tr (fun y => ∏ i, f i y) x u) S = _
  have htr : tr (fun y => ∏ i, f i y) x u = fun R => ∏ i, tr (f i) x u R := by
    ext R; simp [tr, Finset.prod_apply]
  rw [htr]
  -- Step 2: replace tr with zeta(fwdDiff) via Taylor formula
  conv_lhs => rw [show (fun R => ∏ i, tr (f i) x u R) =
    fun R => ∏ i, zeta (fwdDiff (f i) x u) R from
    funext fun R => by simp_rw [taylor_formula]]
  -- Step 3: expand product of sums via prod_univ_sum
  simp only [zeta]
  simp_rw [Finset.prod_univ_sum]
  -- Step 4: unfold mu and distribute sign
  unfold mu
  simp_rw [Finset.smul_sum]
  -- Step 5: interchange ∑_{R⊆S} ∑_{J∈piFinset} → ∑_{J∈piFinset(S)} ∑_{R⊇⋃J}
  rw [Finset.sum_comm' (interchange_general r S)]
  -- Step 6: factor product out of inner sign-sum, apply coeff_sum
  simp_rw [← Finset.sum_smul]
  have hstep : ∀ J ∈ Fintype.piFinset (fun _ : Fin r => S.powerset),
      (∑ R ∈ S.powerset.filter (Finset.univ.biUnion (fun i => J i) ⊆ ·),
        (-1 : ℤ) ^ (S.card - R.card))
        • (∏ i, fwdDiff (f i) x u (J i))
      = (if Finset.univ.biUnion (fun i => J i) = S then (1 : ℤ) else 0)
        • (∏ i, fwdDiff (f i) x u (J i)) := by
    intro J hJ
    congr 1
    have hU : Finset.univ.biUnion (fun i => J i) ⊆ S := by
      intro x hx
      rw [Finset.mem_biUnion] at hx
      obtain ⟨i, _, hxi⟩ := hx
      exact Finset.mem_powerset.mp ((Fintype.mem_piFinset.mp hJ) i) hxi
    exact coeff_sum S (Finset.univ.biUnion (fun i => J i)) hU
  rw [Finset.sum_congr rfl hstep]
  -- Step 7: only r-covers survive
  simp_rw [ite_smul, one_smul, zero_smul, ← Finset.sum_filter]
  rfl

end Elements
