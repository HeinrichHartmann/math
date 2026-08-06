import Mathlib

/-!
# Boolean Möbius inversion  (Layer 1, part 1)

Formalises `Prop:moebius-inversion` from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026).

For a cube `a : Finset α → G` valued in an abelian group `G`, the zeta and
Möbius transforms

  ζ(a; S) = ∑_{T ⊆ S} a T,        μ(a; S) = ∑_{T ⊆ S} (-1)^{|S|-|T|} • a T

are mutually inverse bijections on `Finset α → G`.

The whole proof rests on the one-line cancellation
`∑_{R ⊆ P} (-1)^{|P|-|R|} = [P = ∅]` (`alternating_sum_powerset`), wrapped in a
double-sum interchange and a `T ↦ T \ U` reindexing.

Everything is over an arbitrary `AddCommGroup G`: no denominators, any
characteristic, exactly as in the paper. Signs are the ℤ-action `(-1)^n • g`.

> STATUS.  This file was authored in a sandbox with no Lean toolchain and has
> **not been compiled**.  The statements are checked exhaustively/randomly in
> `../verify/moebius_check.py` (all pass).  A few Mathlib lemma names / tactic
> steps may need adjustment on first build; the mathematical content is the
> classical Möbius-inversion argument.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α] {G : Type*} [AddCommGroup G]

/-- Zeta transform of a cube: sum over all subfaces `T ⊆ S`. -/
def zeta (a : Finset α → G) (S : Finset α) : G :=
  ∑ T ∈ S.powerset, a T

/-- Möbius transform of a cube: alternating sum over all subfaces `T ⊆ S`. -/
def mu (a : Finset α → G) (S : Finset α) : G :=
  ∑ T ∈ S.powerset, (-1 : ℤ) ^ (S.card - T.card) • a T

/-- **Core cancellation lemma.**  `∑_{R ⊆ P} (-1)^{|P|-|R|} = [P = ∅]`.
This is the discrete `(1-1)^{|P|}` and is where all the inversion comes from. -/
lemma alternating_sum_powerset (P : Finset α) :
    (∑ R ∈ P.powerset, (-1 : ℤ) ^ (P.card - R.card)) = if P = ∅ then 1 else 0 := by
  have hfact : (∑ R ∈ P.powerset, (-1 : ℤ) ^ (P.card - R.card))
      = (-1 : ℤ) ^ P.card * ∑ R ∈ P.powerset, (-1 : ℤ) ^ R.card := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl ?_
    intro R hR
    have hle : R.card ≤ P.card := Finset.card_le_card (Finset.mem_powerset.mp hR)
    -- (-1)^|P| * (-1)^|R| = (-1)^(|P|+|R|) = (-1)^(|P|-|R|), since the two
    -- exponents differ by the even number 2|R|.
    rw [← pow_add]
    have hsplit : P.card + R.card = (P.card - R.card) + R.card * 2 := by omega
    rw [hsplit, pow_add, mul_comm R.card 2, pow_mul, neg_one_sq, one_pow, mul_one]
  rw [hfact, Finset.sum_powerset_neg_one_pow_card]
  by_cases hP : P = ∅ <;> simp [hP]

/-- Interchange predicate: over `T ⊆ S`, "`U ⊆ T`" ↔ "`U ⊆ S` and `U ⊆ T ⊆ S`". -/
private lemma interchange_iff (S : Finset α) (T U : Finset α) :
    (T ∈ S.powerset ∧ U ∈ T.powerset)
      ↔ (T ∈ S.powerset.filter (U ⊆ ·) ∧ U ∈ S.powerset) := by
  simp only [Finset.mem_powerset, Finset.mem_filter]
  constructor
  · rintro ⟨hTS, hUT⟩; exact ⟨⟨hTS, hUT⟩, hUT.trans hTS⟩
  · rintro ⟨⟨hTS, hUT⟩, _⟩; exact ⟨hTS, hUT⟩

/-- The inner sign-sum over the interval `U ⊆ T ⊆ S` collapses to `[U = S]`.
Proved by the bijection `T ↦ T \ U` onto `(S \ U).powerset`, reducing to
`alternating_sum_powerset (S \ U)`. -/
lemma coeff_sum (S U : Finset α) (hUS : U ⊆ S) :
    (∑ T ∈ S.powerset.filter (U ⊆ ·), (-1 : ℤ) ^ (S.card - T.card))
      = if U = S then 1 else 0 := by
  have hbij : (∑ T ∈ S.powerset.filter (U ⊆ ·), (-1 : ℤ) ^ (S.card - T.card))
      = ∑ R ∈ (S \ U).powerset, (-1 : ℤ) ^ ((S \ U).card - R.card) := by
    refine Finset.sum_bij' (i := fun T _ => T \ U) (j := fun R _ => U ∪ R) ?_ ?_ ?_ ?_ ?_
    · -- T \ U ∈ (S \ U).powerset
      intro T hT
      simp only [Finset.mem_filter, Finset.mem_powerset] at hT
      simp only [Finset.mem_powerset]
      exact Finset.sdiff_subset_sdiff hT.1 (le_refl U)
    · -- U ∪ R ∈ filter (U ⊆ ·) S.powerset
      intro R hR
      simp only [Finset.mem_powerset] at hR
      simp only [Finset.mem_filter, Finset.mem_powerset]
      refine ⟨Finset.union_subset hUS (hR.trans (Finset.sdiff_subset)), Finset.subset_union_left⟩
    · -- left inverse: U ∪ (T \ U) = T  (since U ⊆ T)
      intro T hT
      simp only [Finset.mem_filter, Finset.mem_powerset] at hT
      exact union_sdiff_of_subset hT.2
    · -- right inverse: (U ∪ R) \ U = R  (since R ⊆ S \ U is disjoint from U)
      intro R hR
      simp only [Finset.mem_powerset] at hR
      have hdisj : Disjoint U R := Finset.disjoint_of_subset_right hR Finset.disjoint_sdiff
      simp [Finset.union_sdiff_cancel_left hdisj]
    · -- values agree: (-1)^(|S|-|T|) = (-1)^(|S\U|-|T\U|)
      intro T hT
      simp only [Finset.mem_filter, Finset.mem_powerset] at hT
      have hcardS : (S \ U).card = S.card - U.card := card_sdiff_of_subset hUS
      have hcardT : (T \ U).card = T.card - U.card := card_sdiff_of_subset hT.2
      have hUT : U.card ≤ T.card := Finset.card_le_card hT.2
      have hTS : T.card ≤ S.card := Finset.card_le_card hT.1
      have hUS' : U.card ≤ S.card := Finset.card_le_card hUS
      rw [hcardS, hcardT]
      congr 1
      omega
  rw [hbij, alternating_sum_powerset]
  by_cases h : U = S
  · subst h; simp
  · have : S \ U ≠ ∅ := by
      intro hcontra
      exact h (Finset.Subset.antisymm hUS (sdiff_eq_empty_iff_subset.mp hcontra))
    simp [this, h]

/-- **Boolean Möbius inversion, one direction:** `μ ∘ ζ = id`. -/
theorem mu_zeta (a : Finset α → G) (S : Finset α) : mu (zeta a) S = a S := by
  unfold mu zeta
  -- distribute the sign over the inner sum
  simp_rw [Finset.smul_sum]
  -- interchange to sum over U ⊆ S, then T with U ⊆ T ⊆ S
  rw [Finset.sum_comm' (interchange_iff S)]
  -- factor a U out of the inner (constant-in-T) summand
  have hstep : ∀ U ∈ S.powerset,
      (∑ T ∈ S.powerset.filter (U ⊆ ·), (-1 : ℤ) ^ (S.card - T.card) • a U)
        = (if U = S then (1 : ℤ) else 0) • a U := by
    intro U hU
    rw [← Finset.sum_smul, coeff_sum S U (Finset.mem_powerset.mp hU)]
  rw [Finset.sum_congr rfl hstep]
  -- only U = S survives
  simp_rw [ite_smul, one_smul, zero_smul, sum_ite_eq', mem_powerset, Subset.refl, ite_true]

/-- **Boolean Möbius inversion, other direction:** `ζ ∘ μ = id`. -/
theorem zeta_mu (a : Finset α → G) (S : Finset α) : zeta (mu a) S = a S := by
  unfold zeta mu
  -- ∑ T ⊆ S, ∑ U ⊆ T, (-1)^(|T|-|U|) • a U
  rw [Finset.sum_comm' (interchange_iff S)]
  have hstep : ∀ U ∈ S.powerset,
      (∑ T ∈ S.powerset.filter (U ⊆ ·), (-1 : ℤ) ^ (T.card - U.card) • a U)
        = (if U = S then (1 : ℤ) else 0) • a U := by
    intro U hU
    have hUS := Finset.mem_powerset.mp hU
    rw [← Finset.sum_smul]
    -- reindex T ↦ T \ U onto (S \ U).powerset; here the exponent is |T|-|U| = |T\U|
    have hbij :
        (∑ T ∈ S.powerset.filter (U ⊆ ·), (-1 : ℤ) ^ (T.card - U.card))
          = ∑ R ∈ (S \ U).powerset, (-1 : ℤ) ^ R.card := by
      refine Finset.sum_bij' (i := fun T _ => T \ U) (j := fun R _ => U ∪ R) ?_ ?_ ?_ ?_ ?_
      · intro T hT
        simp only [Finset.mem_filter, Finset.mem_powerset] at hT
        simp only [Finset.mem_powerset]
        exact Finset.sdiff_subset_sdiff hT.1 (le_refl U)
      · intro R hR
        simp only [Finset.mem_powerset] at hR
        simp only [Finset.mem_filter, Finset.mem_powerset]
        exact ⟨Finset.union_subset hUS (hR.trans Finset.sdiff_subset), Finset.subset_union_left⟩
      · intro T hT
        simp only [Finset.mem_filter, Finset.mem_powerset] at hT
        exact union_sdiff_of_subset hT.2
      · intro R hR
        simp only [Finset.mem_powerset] at hR
        have hdisj : Disjoint U R := Finset.disjoint_of_subset_right hR Finset.disjoint_sdiff
        simp [Finset.union_sdiff_cancel_left hdisj]
      · intro T hT
        simp only [Finset.mem_filter, Finset.mem_powerset] at hT
        have hcardT : (T \ U).card = T.card - U.card := card_sdiff_of_subset hT.2
        rw [hcardT]
    rw [hbij, Finset.sum_powerset_neg_one_pow_card]
    by_cases h : U = S
    · subst h; simp
    · have hne : S \ U ≠ ∅ := by
        intro hcontra
        exact h (Finset.Subset.antisymm hUS (sdiff_eq_empty_iff_subset.mp hcontra))
      simp [hne, h]
  rw [Finset.sum_congr rfl hstep]
  simp_rw [ite_smul, one_smul, zero_smul, sum_ite_eq', mem_powerset, Subset.refl, ite_true]

/-- `zeta` and `mu` are inverse bijections on `Finset α → G` (paper statement:
`ζ` and `μ` define inverse bijections on `Map(𝒫(k), G)`). -/
def zetaEquiv : (Finset α → G) ≃ (Finset α → G) where
  toFun a := zeta a
  invFun a := mu a
  left_inv a := funext fun S => mu_zeta a S
  right_inv a := funext fun S => zeta_mu a S

end Elements
