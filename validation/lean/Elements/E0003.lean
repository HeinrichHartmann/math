import Mathlib
import Elements.E0002

/-!
# Binomial (multi-index) Möbius inversion  (Layer 1, part 2)

Formalises `Prop:multi-index-moebius` from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026).

Multi-indices are `α : ι → ℕ` for a finite index type `ι`, ordered
componentwise.  For a grid `A : (ι → ℕ) → G`,

  ζ(A; α) = ∑_{β ≤ α}  C(α,β) • A β,
  μ(A; α) = ∑_{β ≤ α}  (-1)^{wt(α-β)} C(α,β) • A β,

where `C(α,β) = ∏_i C(α_i, β_i) = (α)_β / β!` and `wt = ∑_i (·)_i`, are mutually
inverse.  This extends the Boolean case (heights ≤ 1) in `Moebius.lean`.

The crux is the **multi-index cancellation**
`∑_{β ≤ α} (-1)^{wt(α-β)} C(α,β) = [α = 0]`, which factors over coordinates into
the univariate `(1-1)^{α_i}` (`Int.alternating_sum_range_choose`).  This is
proved here in full generality (`binom_cancellation`).

Both directions are proved (`muB_zetaB`, `zetaB_muB`) and packaged as the
equivalence `zetaBEquiv`.
-/

open Finset

namespace Elements

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {G : Type*} [AddCommGroup G]

/-- Multi-index binomial coefficient `C(α,β) = ∏_i C(α_i, β_i)`. -/
def mchoose (α β : ι → ℕ) : ℕ := ∏ i, (α i).choose (β i)

/-- Weight (total degree) of a multi-index. -/
def wt (α : ι → ℕ) : ℕ := ∑ i, α i

/-- The box `{β | β ≤ α}` as a `Finset`, built as a product of intervals to make
the coordinatewise factorisation `Finset.prod_univ_sum` directly applicable. -/
def boxBelow (α : ι → ℕ) : Finset (ι → ℕ) :=
  Fintype.piFinset (fun i => Finset.Iic (α i))

@[simp] lemma mem_boxBelow {α β : ι → ℕ} : β ∈ boxBelow α ↔ ∀ i, β i ≤ α i := by
  simp [boxBelow, Fintype.mem_piFinset, Finset.mem_Iic]

/-- **Univariate cancellation factor:** `∑_{b ≤ n} (-1)^{n-b} C(n,b) = [n = 0]`.
This is `(1-1)^n`, obtained from `Int.alternating_sum_range_choose` by pulling out
`(-1)^n` (as in the Boolean `alternating_sum_powerset`). -/
lemma alternating_sum_Iic (n : ℕ) :
    (∑ b ∈ Finset.Iic n, (-1 : ℤ) ^ (n - b) * (n.choose b)) = if n = 0 then 1 else 0 := by
  have hrange : Finset.Iic n = Finset.range (n + 1) := by
    ext x; simp
  rw [hrange]
  have hfact : (∑ b ∈ Finset.range (n + 1), (-1 : ℤ) ^ (n - b) * (n.choose b))
      = (-1 : ℤ) ^ n * ∑ b ∈ Finset.range (n + 1), (-1 : ℤ) ^ b * (n.choose b) := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl ?_
    intro b hb
    have hle : b ≤ n := by simpa [Nat.lt_succ_iff] using hb
    rw [← mul_assoc, ← pow_add]
    have hsplit : n + b = (n - b) + b * 2 := by omega
    rw [hsplit, pow_add, mul_comm b 2, pow_mul, neg_one_sq, one_pow, mul_one]
  rw [hfact, Int.alternating_sum_range_choose]
  by_cases hn : n = 0 <;> simp [hn]

/-- **Multi-index cancellation:** `∑_{β ≤ α} (-1)^{wt(α-β)} C(α,β) = [α = 0]`.
Factors over coordinates: the summand is `∏_i (-1)^{α_i-β_i} C(α_i,β_i)`, and
`Finset.prod_univ_sum` turns the box-sum into `∏_i (1-1)^{α_i} = ∏_i [α_i=0]`. -/
lemma binom_cancellation (α : ι → ℕ) :
    (∑ β ∈ boxBelow α, (-1 : ℤ) ^ (wt α - wt β) * (mchoose α β))
      = if α = 0 then 1 else 0 := by
  -- rewrite the summand as a product over coordinates
  have hsummand : ∀ β ∈ boxBelow α,
      (-1 : ℤ) ^ (wt α - wt β) * (mchoose α β)
        = ∏ i, (-1 : ℤ) ^ (α i - β i) * ((α i).choose (β i)) := by
    intro β hβ
    rw [mem_boxBelow] at hβ
    have hwt : wt α - wt β = ∑ i, (α i - β i) := by
      simp only [wt]
      rw [← Finset.sum_tsub_distrib Finset.univ (fun i _ => hβ i)]
    rw [hwt, Finset.prod_mul_distrib, ← Finset.prod_pow_eq_pow_sum]
    congr 1
    · simp [mchoose]
  rw [Finset.sum_congr rfl hsummand]
  -- coordinatewise factorisation of the box-sum
  unfold boxBelow
  rw [← Finset.prod_univ_sum (fun i => Finset.Iic (α i))
        (fun i b => (-1 : ℤ) ^ (α i - b) * ((α i).choose b))]
  · -- ∏_i (if α i = 0 then 1 else 0) = if α = 0 then 1 else 0
    simp_rw [alternating_sum_Iic]
    by_cases hα : α = 0
    · subst hα; simp
    · rw [if_neg hα]
      obtain ⟨i, hi⟩ := Function.ne_iff.mp hα
      exact Finset.prod_eq_zero (Finset.mem_univ i) (by simp only [Pi.zero_apply] at hi; simp [hi])

/-- **Sign-flipped cancellation:** `∑_{β ≤ α} (-1)^{wt β} C(α,β) = [α = 0]`.
Follows from `binom_cancellation` since `(-1)^{wt β} = (-1)^{wt α}·(-1)^{wt α - wt β}`
for `β ≤ α` (the exponents differ by `2(wt α - wt β)`). -/
lemma binom_cancellation' (α : ι → ℕ) :
    (∑ β ∈ boxBelow α, (-1 : ℤ) ^ (wt β) * (mchoose α β))
      = if α = 0 then 1 else 0 := by
  have h : ∀ β ∈ boxBelow α, (-1 : ℤ) ^ (wt β) * (mchoose α β)
      = (-1 : ℤ) ^ (wt α) * ((-1 : ℤ) ^ (wt α - wt β) * (mchoose α β)) := by
    intro β hβ
    rw [mem_boxBelow] at hβ
    have hwt : wt β ≤ wt α := Finset.sum_le_sum (fun i _ => hβ i)
    rw [← mul_assoc, ← pow_add]
    congr 1
    have hsplit : wt α + (wt α - wt β) = wt β + 2 * (wt α - wt β) := by omega
    rw [hsplit, pow_add, pow_mul, neg_one_sq, one_pow, mul_one]
  rw [Finset.sum_congr rfl h, ← Finset.mul_sum, binom_cancellation]
  by_cases hα : α = 0
  · subst hα; simp [wt]
  · simp [hα]

/-! ### Zeta and Möbius transforms on grids -/

/-- Zeta transform of a grid. -/
def zetaB (A : (ι → ℕ) → G) (α : ι → ℕ) : G :=
  ∑ β ∈ boxBelow α, (mchoose α β : ℤ) • A β

/-- Möbius transform of a grid. -/
def muB (A : (ι → ℕ) → G) (α : ι → ℕ) : G :=
  ∑ β ∈ boxBelow α, ((-1 : ℤ) ^ (wt α - wt β) * (mchoose α β)) • A β

/-- Vandermonde/subset-of-a-subset identity, coordinatewise:
`C(α,β)·C(β,γ) = C(α,γ)·C(α-γ, β-γ)` for `γ ≤ β ≤ α`.

The univariate ingredient is `n.choose k * k.choose s = n.choose s * (n-s).choose (k-s)`.

> The exact Mathlib name of the univariate identity may differ across versions
> (candidates: `Nat.choose_mul_choose_eq`, `Nat.choose_mul_choose_le`); adjust on
> first build.  The identity itself is standard. -/
lemma mchoose_mul_mchoose {α β γ : ι → ℕ}
    (hγβ : ∀ i, γ i ≤ β i) (hβα : ∀ i, β i ≤ α i) :
    mchoose α β * mchoose β γ = mchoose α γ * mchoose (fun i => α i - γ i) (fun i => β i - γ i) := by
  simp only [mchoose, ← Finset.prod_mul_distrib]
  refine Finset.prod_congr rfl ?_
  intro i _
  -- univariate: (α i).choose (β i) * (β i).choose (γ i)
  --           = (α i).choose (γ i) * (α i - γ i).choose (β i - γ i)
  exact Nat.choose_mul (hγβ i)

/-- **Binomial Möbius inversion, one direction:** `μ ∘ ζ = id`.

Proof by the same interchange as the Boolean case: swap the double sum over
`γ ≤ β ≤ α`, apply the Vandermonde identity to refactor the coefficient, reindex
`β ↦ β - γ` onto `boxBelow (α - γ)`, and collapse via `binom_cancellation`.

> This proof mirrors `Elements.mu_zeta` and is the part of this file most
> likely to need lemma-name / reindexing adjustments when first compiled. -/
theorem muB_zetaB (A : (ι → ℕ) → G) (α : ι → ℕ) : muB (zetaB A) α = A α := by
  classical
  unfold muB zetaB
  simp_rw [Finset.smul_sum, smul_smul]
  -- interchange: sum over γ ≤ α, then β with γ ≤ β ≤ α
  rw [Finset.sum_comm' (t' := boxBelow α)
        (s' := fun γ => (boxBelow α).filter (fun β => ∀ i, γ i ≤ β i))
        (h := by
          intro β γ
          simp only [mem_boxBelow, Finset.mem_filter]
          constructor
          · rintro ⟨hβα, hγβ⟩
            exact ⟨⟨hβα, hγβ⟩, fun i => (hγβ i).trans (hβα i)⟩
          · rintro ⟨⟨hβα, hγβ⟩, _⟩; exact ⟨hβα, hγβ⟩)]
  -- inner coefficient over β collapses to [γ = α]
  have hstep : ∀ γ ∈ boxBelow α,
      (∑ β ∈ (boxBelow α).filter (fun β => ∀ i, γ i ≤ β i),
        ((-1 : ℤ) ^ (wt α - wt β) * (mchoose α β) * (mchoose β γ)) • A γ)
        = (if γ = α then (1 : ℤ) else 0) • A γ := by
    intro γ hγ
    rw [← Finset.sum_smul]
    rw [mem_boxBelow] at hγ
    -- reindex β ↦ β - γ onto boxBelow (α - γ); coefficient becomes
    -- (-1)^(wt(α-γ) - wt(β-γ)) * C(α,γ) * C(α-γ, β-γ)
    have hcoef :
        (∑ β ∈ (boxBelow α).filter (fun β => ∀ i, γ i ≤ β i),
          (-1 : ℤ) ^ (wt α - wt β) * (mchoose α β) * (mchoose β γ))
          = (mchoose α γ : ℤ)
              * ∑ δ ∈ boxBelow (fun i => α i - γ i),
                  (-1 : ℤ) ^ (wt (fun i => α i - γ i) - wt δ)
                    * (mchoose (fun i => α i - γ i) δ) := by
      rw [Finset.mul_sum]
      refine Finset.sum_bij' (i := fun β _ => fun i => β i - γ i)
              (j := fun δ _ => fun i => γ i + δ i) ?_ ?_ ?_ ?_ ?_
      · intro β hβ
        simp only [Finset.mem_filter, mem_boxBelow] at hβ
        simp only [mem_boxBelow]
        exact fun i => Nat.sub_le_sub_right (hβ.1 i) (γ i)
      · intro δ hδ
        simp only [mem_boxBelow] at hδ
        simp only [Finset.mem_filter, mem_boxBelow]
        exact ⟨fun i => by have := hδ i; have := hγ i; omega, fun i => Nat.le_add_right _ _⟩
      · intro β hβ
        simp only [Finset.mem_filter, mem_boxBelow] at hβ
        funext i; dsimp only; have := hβ.2 i; omega
      · intro δ hδ
        funext i; dsimp only; omega
      · intro β hβ
        simp only [Finset.mem_filter, mem_boxBelow] at hβ
        -- (-1)^(wtα-wtβ)·C(α,β)·C(β,γ) = C(α,γ)·(-1)^(wt(α-γ)-wt(β-γ))·C(α-γ,β-γ)
        have hVand : (mchoose α β * mchoose β γ : ℤ)
            = mchoose α γ * mchoose (fun i => α i - γ i) (fun i => β i - γ i) := by
          exact_mod_cast mchoose_mul_mchoose hβ.2 hβ.1
        have hsign : wt α - wt β
            = wt (fun i => α i - γ i) - wt (fun i => β i - γ i) := by
          simp only [wt]
          have h1 : ∑ i, (α i - γ i) = ∑ i, α i - ∑ i, γ i :=
            Finset.sum_tsub_distrib Finset.univ (fun i _ => hγ i)
          have h2 : ∑ i, (β i - γ i) = ∑ i, β i - ∑ i, γ i :=
            Finset.sum_tsub_distrib Finset.univ (fun i _ => hβ.2 i)
          rw [h1, h2]
          have : ∑ i : ι, γ i ≤ ∑ i : ι, β i :=
            Finset.sum_le_sum (fun i _ => hβ.2 i)
          have : ∑ i : ι, β i ≤ ∑ i : ι, α i :=
            Finset.sum_le_sum (fun i _ => hβ.1 i)
          omega
        rw [hsign]
        ring_nf
        rw [show (mchoose α β : ℤ) * mchoose β γ = _ from hVand]
    rw [hcoef, binom_cancellation]
    by_cases h : γ = α
    · rw [h, show (fun i : ι => α i - α i) = (0 : ι → ℕ) from funext fun i => Nat.sub_self _,
           if_pos rfl, if_pos rfl, mul_one,
           show (mchoose α α : ℤ) = 1 from by simp [mchoose, Nat.choose_self],
           one_smul]
    · have hne : (fun i => α i - γ i) ≠ 0 := by
        intro hcontra
        apply h
        funext i
        have : α i - γ i = 0 := congrFun hcontra i
        have := hγ i; omega
      simp [hne, h]
  rw [Finset.sum_congr rfl hstep]
  simp [ite_smul, sum_ite_eq', mem_boxBelow]

/-- **Binomial Möbius inversion, other direction:** `ζ ∘ μ = id`.

Mirrors `muB_zetaB`: interchange, Vandermonde, reindex `β ↦ β - γ`.
Here the surviving sign is `(-1)^{wt β - wt γ} = (-1)^{wt δ}` after
reindexing, so the collapse uses `binom_cancellation'`. -/
theorem zetaB_muB (A : (ι → ℕ) → G) (α : ι → ℕ) : zetaB (muB A) α = A α := by
  classical
  unfold zetaB muB
  simp_rw [Finset.smul_sum, smul_smul]
  -- interchange: sum over γ ≤ α, then β with γ ≤ β ≤ α
  rw [Finset.sum_comm' (t' := boxBelow α)
        (s' := fun γ => (boxBelow α).filter (fun β => ∀ i, γ i ≤ β i))
        (h := by
          intro β γ
          simp only [mem_boxBelow, Finset.mem_filter]
          constructor
          · rintro ⟨hβα, hγβ⟩
            exact ⟨⟨hβα, hγβ⟩, fun i => (hγβ i).trans (hβα i)⟩
          · rintro ⟨⟨hβα, hγβ⟩, _⟩; exact ⟨hβα, hγβ⟩)]
  -- inner coefficient over β collapses to [γ = α]
  have hstep : ∀ γ ∈ boxBelow α,
      (∑ β ∈ (boxBelow α).filter (fun β => ∀ i, γ i ≤ β i),
        ((mchoose α β : ℤ) * ((-1 : ℤ) ^ (wt β - wt γ) * (mchoose β γ))) • A γ)
        = (if γ = α then (1 : ℤ) else 0) • A γ := by
    intro γ hγ
    rw [← Finset.sum_smul]
    rw [mem_boxBelow] at hγ
    -- reindex β ↦ β - γ onto boxBelow (α - γ); coefficient becomes
    -- C(α,γ) * (-1)^{wt δ} * C(α-γ, δ)
    have hcoef :
        (∑ β ∈ (boxBelow α).filter (fun β => ∀ i, γ i ≤ β i),
          (mchoose α β : ℤ) * ((-1 : ℤ) ^ (wt β - wt γ) * (mchoose β γ)))
          = (mchoose α γ : ℤ)
              * ∑ δ ∈ boxBelow (fun i => α i - γ i),
                  (-1 : ℤ) ^ (wt δ) * (mchoose (fun i => α i - γ i) δ) := by
      rw [Finset.mul_sum]
      refine Finset.sum_bij' (i := fun β _ => fun i => β i - γ i)
              (j := fun δ _ => fun i => γ i + δ i) ?_ ?_ ?_ ?_ ?_
      · intro β hβ
        simp only [Finset.mem_filter, mem_boxBelow] at hβ
        simp only [mem_boxBelow]
        exact fun i => Nat.sub_le_sub_right (hβ.1 i) (γ i)
      · intro δ hδ
        simp only [mem_boxBelow] at hδ
        simp only [Finset.mem_filter, mem_boxBelow]
        exact ⟨fun i => by have := hδ i; have := hγ i; omega, fun i => Nat.le_add_right _ _⟩
      · intro β hβ
        simp only [Finset.mem_filter, mem_boxBelow] at hβ
        funext i; dsimp only; have := hβ.2 i; omega
      · intro δ hδ
        funext i; dsimp only; omega
      · intro β hβ
        simp only [Finset.mem_filter, mem_boxBelow] at hβ
        -- C(α,β)·(-1)^{wtβ-wtγ}·C(β,γ) = C(α,γ)·(-1)^{wt(β-γ)}·C(α-γ,β-γ)
        have hVand : (mchoose α β * mchoose β γ : ℤ)
            = mchoose α γ * mchoose (fun i => α i - γ i) (fun i => β i - γ i) := by
          exact_mod_cast mchoose_mul_mchoose hβ.2 hβ.1
        have hsign : wt β - wt γ = wt (fun i => β i - γ i) := by
          simp only [wt]
          rw [Finset.sum_tsub_distrib Finset.univ (fun i _ => hβ.2 i)]
        rw [hsign]
        ring_nf
        rw [show (mchoose α β : ℤ) * mchoose β γ = _ from hVand]
    rw [hcoef, binom_cancellation']
    by_cases h : γ = α
    · rw [h, show (fun i : ι => α i - α i) = (0 : ι → ℕ) from funext fun i => Nat.sub_self _,
           if_pos rfl, if_pos rfl, mul_one,
           show (mchoose α α : ℤ) = 1 from by simp [mchoose, Nat.choose_self],
           one_smul]
    · have hne : (fun i => α i - γ i) ≠ 0 := by
        intro hcontra
        apply h
        funext i
        have : α i - γ i = 0 := congrFun hcontra i
        have := hγ i; omega
      simp [hne, h]
  rw [Finset.sum_congr rfl hstep]
  simp [ite_smul, sum_ite_eq', mem_boxBelow]

/-- `zetaB` and `muB` are inverse bijections on grids `(ι → ℕ) → G`. -/
def zetaBEquiv : ((ι → ℕ) → G) ≃ ((ι → ℕ) → G) where
  toFun A := zetaB A
  invFun A := muB A
  left_inv A := funext fun α => muB_zetaB A α
  right_inv A := funext fun α => zetaB_muB A α

end Elements
