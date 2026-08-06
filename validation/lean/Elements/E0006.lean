import Elements.E0001
import Elements.E0005

/-!
# Discrete Faà di Bruno duality  (E0006)

Formalises `Cor:discrete-fdb` from
*Discrete and Differential Calculus* (Hartmann, 2026).

For arbitrary maps `φ : X → Y`, `f : Y → Z` between abelian groups,

  Δ(f ∘ φ; x; v₁,…,vₖ) = ∑_{C ∈ Cov(k)} Δ(f; y; (Δ(φ; x; v_A))_{A ∈ C})

where `Cov(k)` is the set of covers of `[k]` by nonempty subsets.

The proof composes two Taylor expansions (one for `φ`, one for `f`)
and applies the Boolean sieve (`coeff_sum`) to collapse to covers.

The key observation is that the second-level Taylor expansion of `f`
reuses `tr`/`fwdDiff` at type `α := Finset α`, so the expression
`fwdDiff f y (fwdDiff φ x u)` automatically represents the nested
forward difference `C ↦ Δ(f; y; (Δ(φ; x; v_A))_{A ∈ C})`.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α]
         {X : Type*} [AddCommGroup X]
         {Y : Type*} [AddCommGroup Y]
         {Z : Type*} [AddCommGroup Z]

/-! ### Taylor composition (Thm:dfdb, Part 2)

Composing two Taylor expansions: the translation of `f ∘ φ` equals
the second-level Taylor expansion of `f` in the inner differences. -/

/-- **Taylor composition.**
`tr(f ∘ g; x; u; S) = tr(f; g(x); Δ(g;x;u); 𝒫₊(S))`.

The translation of a composition equals the translation of `f`
at `g(x)` with the inner forward differences as directions,
indexed by the nonempty subsets of `S`. -/
theorem taylor_comp (f : Y → Z) (g : X → Y) (x : X) (u : α → X) (S : Finset α) :
    tr (f ∘ g) x u S =
      tr f (g x) (fwdDiff g x u) (powPlus S) := by
  simp only [tr, Function.comp_apply]
  congr 1
  exact taylor_separated g x u S

/-! ### Covering Faà di Bruno (Cor:discrete-fdb) -/

/-- Interchange predicate for the covering FdB proof.
Swaps the order of summation: for `R ∈ S.powerset` and `C ∈ (powPlus R).powerset`,
the pair `(R, C)` is equivalent to `C ∈ (powPlus S).powerset` with
`R ∈ S.powerset.filter (C.biUnion id ⊆ ·)`. -/
private lemma interchange_fdb (S : Finset α) (R : Finset α) (C : Finset (Finset α)) :
    (R ∈ S.powerset ∧ C ∈ (powPlus R).powerset)
      ↔ (R ∈ S.powerset.filter (C.biUnion id ⊆ ·) ∧ C ∈ (powPlus S).powerset) := by
  simp only [Finset.mem_powerset, Finset.mem_filter]
  constructor
  · rintro ⟨hRS, hCR⟩
    refine ⟨⟨hRS, fun x hx => ?_⟩, fun A hA => ?_⟩
    · rw [Finset.mem_biUnion] at hx
      obtain ⟨A, hA, hxA⟩ := hx
      exact (mem_powPlus.mp (hCR hA)).2 hxA
    · have hAR := hCR hA
      rw [mem_powPlus] at hAR ⊢
      exact ⟨hAR.1, hAR.2.trans hRS⟩
  · rintro ⟨⟨hRS, hUR⟩, hCS⟩
    refine ⟨hRS, fun A hA => ?_⟩
    rw [mem_powPlus]
    exact ⟨(mem_powPlus.mp (hCS hA)).1,
           fun x hx => hUR (Finset.mem_biUnion.mpr ⟨A, hA, hx⟩)⟩

/-- **Covering Faà di Bruno formula** (`Cor:discrete-fdb`).

For `S.Nonempty` and arbitrary maps `g : X → Y`, `f : Y → Z`:

  `Δ(f ∘ g; x; u_S) = ∑_{C ∈ Cov(S)} Δ(f; y; (Δ(g; x; u_A))_{A ∈ C})`.

The sum ranges over all covers of `S` by nonempty subsets. -/
theorem covering_fdb (f : Y → Z) (g : X → Y) (x : X) (u : α → X)
    {S : Finset α} (hS : S.Nonempty) :
    fwdDiff (f ∘ g) x u S =
      ∑ C ∈ coverings S, fwdDiff f (g x) (fwdDiff g x u) C := by
  -- Replace tr(f∘g) with zeta of fwdDiff-of-fwdDiff via taylor_comp + taylor_formula
  show mu (tr (f ∘ g) x u) S = _
  rw [show tr (f ∘ g) x u = fun R =>
        zeta (fwdDiff f (g x) (fwdDiff g x u)) (powPlus R) from
      funext fun R => (taylor_comp f g x u R).trans
        (taylor_formula f (g x) (fwdDiff g x u) (powPlus R))]
  -- Unfold mu and zeta to bare sums
  unfold mu zeta
  simp_rw [Finset.smul_sum]
  -- Interchange: ∑_{R⊆S} ∑_{C⊆powPlus R} → ∑_{C⊆powPlus S} ∑_{R with C.biUnion id ⊆ R}
  rw [Finset.sum_comm' (interchange_fdb S)]
  -- Factor out fwdDiff from inner sum, apply coeff_sum
  simp_rw [← Finset.sum_smul]
  have hstep : ∀ C ∈ (powPlus S).powerset,
      (∑ R ∈ S.powerset.filter (C.biUnion id ⊆ ·), (-1 : ℤ) ^ (S.card - R.card))
        • fwdDiff f (g x) (fwdDiff g x u) C
      = (if C.biUnion id = S then (1 : ℤ) else 0)
        • fwdDiff f (g x) (fwdDiff g x u) C := by
    intro C hC
    congr 1
    exact coeff_sum S (C.biUnion id) (biUnion_subset_of_mem_powPlus_powerset hC)
  rw [Finset.sum_congr rfl hstep]
  -- Only covers survive
  simp_rw [ite_smul, one_smul, zero_smul, ← Finset.sum_filter]
  rfl

end Elements
