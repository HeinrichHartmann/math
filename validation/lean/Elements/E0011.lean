import Elements.E0005
import Elements.E0009

/-!
# Iterated Faà di Bruno duality  (E0011)

Formalises the m-fold Boolean Taylor composition and the iterated
covering Faà di Bruno formula (E0011).

For a chain of maps `f(0), f(1), ..., f(m-1)` between abelian groups:

  `(fₘ ∘ ··· ∘ f₁)(x + Σ uₛ) = xₘ + Σ_{K ∈ 𝒫₊^m(S)} Δ^K`   (Part 3)
  `Δ(f(m-1) ∘ ··· ∘ f(0); x; u_S) = Σ_{K ∈ Cov_m(S)} Δ^K`   (Part 1)

Uses the iterated forward difference `iterFwdDiff` from `E0009.lean`.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α] {G : Type*} [AddCommGroup G]

/-! ### Boolean Taylor composition (E0011, Part 3)

The m-fold composition's Taylor expansion is a sum over `𝒫₊^m(S)`:

  `(f(m-1) ∘ ··· ∘ f(0))(x + Σₛ uₛ) = xₘ + Σ_{K ∈ 𝒫₊^m(S)} Δ^K`

The proof is induction on `m`, applying `taylor_separated` at each step. -/

/-- **Boolean Taylor composition** (E0011, Part 3).

For a chain of maps `f(0), ..., f(m-1)`, base point `x`, and directions `u`:

  `(f(m-1) ∘ ··· ∘ f(0))(x + Σₛ uₛ) = xₘ + Σ_{K ∈ 𝒫₊^m(S)} Δ^K(f; x; u)`

Proof: induction on `m`, applying `taylor_separated` at each step.
The inductive step uses:
- `iterPowPlus S (m+1) = (iterPowPlus S m).powerset.erase ∅`  (definition)
- `iterFwdDiff f x u (m+1) = fwdDiff (f m) (chainPt f x m) (iterFwdDiff f x u m)`  (definition)
- `chainPt f x (m+1) = f m (chainPt f x m)`  (definition)

so all three components of `taylor_separated` match definitionally. -/
theorem iter_taylor_comp (f : ℕ → (G → G)) (x : G) (u : α → G)
    (S : Finset α) (m : ℕ) :
    chainPt f (x + ∑ s ∈ S, u s) m =
      chainPt f x m + ∑ K ∈ iterPowPlus S m, iterFwdDiff f x u m K := by
  induction m with
  | zero => simp [chainPt, iterPowPlus, iterFwdDiff]; rfl
  | succ m ih =>
    -- LHS: f m (chainPt f (x+Σu) m) = f m (x_m + Σ d_K) by IH
    simp only [chainPt_succ]
    rw [ih]
    -- Now: f m (x_m + Σ_{K ∈ 𝒫₊^m(S)} d_K) = x_{m+1} + Σ_{H ∈ 𝒫₊^{m+1}(S)} Δ^H
    -- This IS taylor_separated for f m at x_m with directions d = iterFwdDiff f x u m
    -- over index set iterPowPlus S m, since:
    --   LHS = tr (f m) x_m d (iterPowPlus S m)  (by defn of tr)
    --   RHS = f m x_m + Σ_{H ∈ (iterPowPlus S m).powerset.erase ∅} fwdDiff (f m) x_m d H
    --       = chainPt f x (m+1) + Σ_{H ∈ iterPowPlus S (m+1)} iterFwdDiff f x u (m+1) H
    exact taylor_separated (f m) (chainPt f x m) (iterFwdDiff f x u m) (iterPowPlus S m)

/-! ### Structural lemmas for `iterPowPlus` and `leafSet` -/

/-- Members of `iterPowPlus S m` have leaf support contained in `S`. -/
lemma leafSet_subset_of_mem_iterPowPlus {S : Finset α} {m : ℕ}
    {K : IterSet α m} (hK : K ∈ iterPowPlus S m) : leafSet K ⊆ S := by
  induction m with
  | zero =>
    simp only [iterPowPlus, leafSet]
    exact Finset.singleton_subset_iff.mpr hK
  | succ m ih =>
    simp only [leafSet]
    intro a ha
    rw [Finset.mem_biUnion] at ha
    obtain ⟨L, hLK, haL⟩ := ha
    have hL : L ∈ iterPowPlus S m := by
      have hKsub : (show Finset (IterSet α m) from K) ⊆ iterPowPlus S m := by
        have := Finset.mem_powerset.mp (Finset.erase_subset _ _ hK)
        exact this
      exact hKsub hLK
    exact ih hL haL

/-- `iterPowPlus` is monotone: `R ⊆ S → iterPowPlus R m ⊆ iterPowPlus S m`. -/
lemma iterPowPlus_mono {R S : Finset α} (hRS : R ⊆ S) (m : ℕ) :
    iterPowPlus R m ⊆ iterPowPlus S m := by
  induction m with
  | zero => exact hRS
  | succ m ih =>
    intro K hK
    have hKne : (show Finset (IterSet α m) from K) ≠ ∅ :=
      (Finset.mem_erase.mp hK).1
    have hKsub : (show Finset (IterSet α m) from K) ⊆ iterPowPlus R m :=
      Finset.mem_powerset.mp (Finset.erase_subset _ _ hK)
    exact Finset.mem_erase.mpr ⟨hKne, Finset.mem_powerset.mpr (hKsub.trans ih)⟩

/-- Localization: if `K ∈ iterPowPlus S m` and `leafSet K ⊆ R ⊆ S`,
then `K ∈ iterPowPlus R m`. -/
lemma mem_iterPowPlus_of_leafSet_subset {S R : Finset α} {m : ℕ}
    {K : IterSet α m} (hKS : K ∈ iterPowPlus S m) (hleaf : leafSet K ⊆ R)
    (hRS : R ⊆ S) : K ∈ iterPowPlus R m := by
  induction m with
  | zero =>
    simp only [iterPowPlus] at hKS ⊢
    exact Finset.singleton_subset_iff.mp hleaf
  | succ m ih =>
    have hKne : (show Finset (IterSet α m) from K) ≠ ∅ :=
      (Finset.mem_erase.mp hKS).1
    have hKsub : (show Finset (IterSet α m) from K) ⊆ iterPowPlus S m :=
      Finset.mem_powerset.mp (Finset.erase_subset _ _ hKS)
    apply Finset.mem_erase.mpr
    refine ⟨hKne, Finset.mem_powerset.mpr (fun L hLK => ?_)⟩
    have hleafL : leafSet L ⊆ R := by
      intro a ha
      exact hleaf (Finset.mem_biUnion.mpr ⟨L, hLK, ha⟩)
    exact ih (hKsub hLK) hleafL

/-! ### Covering Faà di Bruno (E0011, Part 1)

The m-fold composition's forward difference is a sum over `Cov_m(S)`:

  `Δ(f(m-1) ∘ ··· ∘ f(0); x; u_S) = Σ_{K ∈ Cov_m(S)} Δ^K`

The proof follows by Möbius inversion from Part 3, exactly as the two-fold
case in `FdB.lean`. -/

/-- `mu` kills constant functions on nonempty sets. -/
private lemma mu_const (c : G) {S : Finset α} (hS : S.Nonempty) :
    mu (fun _ => c) S = 0 := by
  unfold mu
  rw [← Finset.sum_smul, show (∑ T ∈ S.powerset, (-1 : ℤ) ^ (S.card - T.card)) = 0 from by
    rw [alternating_sum_powerset]; simp [hS.ne_empty]]
  simp

/-- `mu` distributes over addition. -/
private lemma mu_add (a b : Finset α → G) (S : Finset α) :
    mu (fun R => a R + b R) S = mu a S + mu b S := by
  simp only [mu, smul_add, Finset.sum_add_distrib]

/-- Interchange predicate for the iterated covering FdB proof.
Swaps the order of summation: for `R ⊆ S` and `K ∈ iterPowPlus R m`,
the pair `(R, K)` is equivalent to `K ∈ iterPowPlus S m` with
`R ∈ S.powerset.filter (leafSet K ⊆ ·)`. -/
private lemma interchange_iter (S : Finset α) (m : ℕ)
    (R : Finset α) (K : IterSet α m) :
    (R ∈ S.powerset ∧ K ∈ iterPowPlus R m)
      ↔ (R ∈ S.powerset.filter (leafSet K ⊆ ·) ∧ K ∈ iterPowPlus S m) := by
  simp only [Finset.mem_powerset, Finset.mem_filter]
  constructor
  · rintro ⟨hRS, hKR⟩
    exact ⟨⟨hRS, leafSet_subset_of_mem_iterPowPlus hKR⟩, iterPowPlus_mono hRS m hKR⟩
  · rintro ⟨⟨hRS, hleaf⟩, hKS⟩
    exact ⟨hRS, mem_iterPowPlus_of_leafSet_subset hKS hleaf hRS⟩

/-- **Covering Faà di Bruno** (E0011, Part 1).

For `S.Nonempty` and a chain of maps `f(0), ..., f(m-1)`:

  `Δ(f(m-1) ∘ ··· ∘ f(0); x; u_S) = Σ_{K ∈ Cov_m(S)} Δ^K(f; x; u)`

where `Cov_m(S) = iterCoverings S m`.

Proof: Möbius inversion applied to `iter_taylor_comp`. The sign sum
collapses via `coeff_sum` to select only coverings (those K with
`leafSet K = S`). -/
theorem iter_covering_fdb (f : ℕ → (G → G)) (x : G) (u : α → G)
    {S : Finset α} (hS : S.Nonempty) (m : ℕ) :
    fwdDiff (chainPt f · m) x u S =
      ∑ K ∈ iterCoverings S m, iterFwdDiff f x u m K := by
  -- The forward difference is μ applied to the translation cube
  show mu (tr (chainPt f · m) x u) S = _
  -- Replace tr with the Taylor expansion from iter_taylor_comp
  rw [show tr (chainPt f · m) x u = fun R =>
        chainPt f x m + ∑ K ∈ iterPowPlus R m, iterFwdDiff f x u m K from
      funext fun R => iter_taylor_comp f x u R m]
  -- Split: mu(c + a) = mu(c) + mu(a) = 0 + mu(a)
  rw [show (fun R => chainPt f x m + ∑ K ∈ iterPowPlus R m, iterFwdDiff f x u m K)
      = fun R => (fun _ => chainPt f x m) R +
          (fun R => ∑ K ∈ iterPowPlus R m, iterFwdDiff f x u m K) R from rfl]
  rw [mu_add, mu_const _ hS, zero_add]
  -- Unfold mu and distribute sign into the sum
  unfold mu
  simp_rw [Finset.smul_sum]
  -- Interchange: ∑_{R⊆S} ∑_{K ∈ iterPowPlus R m} → ∑_{K ∈ iterPowPlus S m} ∑_{R: leafSet K ⊆ R}
  rw [Finset.sum_comm' (interchange_iter S m)]
  -- Factor out d_K from inner sum, apply coeff_sum
  simp_rw [← Finset.sum_smul]
  have hstep : ∀ K ∈ iterPowPlus S m,
      (∑ R ∈ S.powerset.filter (leafSet K ⊆ ·), (-1 : ℤ) ^ (S.card - R.card))
        • iterFwdDiff f x u m K
      = (if leafSet K = S then (1 : ℤ) else 0)
        • iterFwdDiff f x u m K := by
    intro K hK
    congr 1
    exact coeff_sum S (leafSet K) (leafSet_subset_of_mem_iterPowPlus hK)
  rw [Finset.sum_congr rfl hstep]
  -- Only coverings (leafSet K = S) survive
  simp_rw [ite_smul, one_smul, zero_smul, ← Finset.sum_filter]
  rfl

/-! ### Sanity checks -/

/-- At m = 0, `iter_taylor_comp` is trivial (`x + Σ u = x + Σ u`). -/
example (f : ℕ → (G → G)) (x : G) (u : α → G) (S : Finset α) :
    chainPt f (x + ∑ s ∈ S, u s) 0 =
      chainPt f x 0 + ∑ K ∈ iterPowPlus S 0, iterFwdDiff f x u 0 K :=
  iter_taylor_comp f x u S 0

/-- At m = 1, `iter_taylor_comp` recovers `taylor_separated`. -/
example (g : G → G) (x : G) (u : α → G) (S : Finset α) :
    g (x + ∑ s ∈ S, u s) =
      g x + ∑ T ∈ iterPowPlus S 1, fwdDiff g x u T :=
  iter_taylor_comp (fun _ => g) x u S 1

end Elements
