import Elements.E0006
import Elements.E0008

/-!
# Covering counts and degree bound  (E0019)

Formalises `Prop:cover-count` and `Cor:degree-bound` from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026):

  `|Cov(k)| = ∑_{j=0}^{k} (-1)^{k-j} C(k,j) 2^{2^j - 1}`   (OEIS A003465).

The proof is the paper's: apply the covering FdB formula to
`g(x) = 2^x - 1` and `f(y) = 2^y`.  Every forward difference of `g`
(order ≥ 1) and of `f` at the relevant points equals `1`, so the
covering formula reads `Δ^k(f∘g)(0) = |Cov(k)|`; expanding the left
side as a Newton sum gives the stated identity.  The covering formula
counts its own terms — the discrete parallel of `e^{e^x-1}` counting
partitions.

The degree bound: a map is *polynomial of degree ≤ d* if `Δ^{d+1} ≡ 0`;
combined with the covering FdB and the weight bound (E0008), degrees
compose multiplicatively: `deg(f ∘ g) ≤ deg f · deg g`.
-/

open Finset

namespace Elements

variable {β : Type*} [DecidableEq β]

/-- **Newton form** of the forward difference with unit directions:
`Δ(h; x; 1,…,1; S) = ∑_{j≤k} (-1)^{k-j} C(k,j) h(x+j)` with `k = |S|`. -/
lemma fwdDiff_unit_dirs (h : ℤ → ℤ) (x : ℤ) (u : β → ℤ) (S : Finset β)
    (hu : ∀ i ∈ S, u i = 1) :
    fwdDiff h x u S
      = ∑ j ∈ Finset.range (S.card + 1),
          (-1 : ℤ) ^ (S.card - j) * (S.card.choose j) * h (x + j) := by
  unfold fwdDiff mu tr
  have hsummand : ∀ T ∈ S.powerset,
      ((-1 : ℤ) ^ (S.card - T.card)) • h (x + ∑ i ∈ T, u i)
        = (-1 : ℤ) ^ (S.card - T.card) * h (x + T.card) := by
    intro T hT
    rw [Finset.mem_powerset] at hT
    rw [smul_eq_mul]
    congr 2
    rw [Finset.sum_congr rfl (fun i hi => hu i (hT hi)), Finset.sum_const,
        nsmul_eq_mul, mul_one]
  rw [Finset.sum_congr rfl hsummand, Finset.powerset_card_disjiUnion,
      Finset.sum_disjiUnion]
  refine Finset.sum_congr rfl ?_
  intro j _
  have hconst : ∀ T ∈ Finset.powersetCard j S,
      (-1 : ℤ) ^ (S.card - T.card) * h (x + T.card)
        = (-1 : ℤ) ^ (S.card - j) * h (x + j) := by
    intro T hT
    rw [(Finset.mem_powersetCard.mp hT).2]
  rw [Finset.sum_congr rfl hconst, Finset.sum_const, Finset.card_powersetCard,
      nsmul_eq_mul]
  ring

/-- `∑_{j≤k} (-1)^{k-j} C(k,j) b^j = (b-1)^k` — the Newton/binomial identity. -/
lemma newton_binomial (b : ℤ) (k : ℕ) :
    (∑ j ∈ Finset.range (k + 1), (-1 : ℤ) ^ (k - j) * (k.choose j) * b ^ j)
      = (b - 1) ^ k := by
  have h := add_pow b (-1) k
  rw [show b + -1 = b - 1 from by ring] at h
  rw [h]
  refine Finset.sum_congr rfl ?_
  intro j _
  ring

/-- Forward differences of `g(x) = 2^x - 1` with unit directions: every
increment of order ≥ 1 equals `1` (this is `(2-1)^k - (1-1)^k = 1`). -/
lemma fwdDiff_two_pow_sub_one (u : β → ℤ) (A : Finset β) (hA : A.Nonempty)
    (hu : ∀ i ∈ A, u i = 1) :
    fwdDiff (fun n : ℤ => (2 : ℤ) ^ n.toNat - 1) 0 u A = 1 := by
  rw [fwdDiff_unit_dirs _ _ _ _ hu]
  have hval : ∀ j ∈ Finset.range (A.card + 1),
      (-1 : ℤ) ^ (A.card - j) * (A.card.choose j)
          * ((fun n : ℤ => (2 : ℤ) ^ n.toNat - 1) (0 + j))
        = (-1 : ℤ) ^ (A.card - j) * (A.card.choose j) * 2 ^ j
          - (-1 : ℤ) ^ (A.card - j) * (A.card.choose j) * 1 ^ j := by
    intro j _
    simp only [zero_add, Int.toNat_natCast]
    ring
  rw [Finset.sum_congr rfl hval, Finset.sum_sub_distrib,
      newton_binomial, newton_binomial]
  have hk : A.card ≠ 0 := Finset.card_ne_zero.mpr hA
  norm_num [zero_pow hk]

/-- Forward differences of `f(y) = 2^y` with unit directions: every
increment equals `1` (this is `(2-1)^k = 1`, valid for all orders). -/
lemma fwdDiff_two_pow {γ : Type*} [DecidableEq γ] (v : γ → ℤ) (C : Finset γ)
    (hv : ∀ A ∈ C, v A = 1) :
    fwdDiff (fun n : ℤ => (2 : ℤ) ^ n.toNat) 0 v C = 1 := by
  rw [fwdDiff_unit_dirs _ _ _ _ hv]
  have hval : ∀ j ∈ Finset.range (C.card + 1),
      (-1 : ℤ) ^ (C.card - j) * (C.card.choose j)
          * ((fun n : ℤ => (2 : ℤ) ^ n.toNat) (0 + j))
        = (-1 : ℤ) ^ (C.card - j) * (C.card.choose j) * 2 ^ j := by
    intro j _
    simp only [zero_add, Int.toNat_natCast]
  rw [Finset.sum_congr rfl hval, newton_binomial]
  norm_num

/-- **Covering counts** (`Prop:cover-count`).

`|Cov(S)| = ∑_{j=0}^{k} (-1)^{k-j} C(k,j) 2^{2^j - 1}` with `k = |S|`
(OEIS A003465: 1, 5, 109, 32297, …).

Proof: the covering FdB formula applied to `g(x) = 2^x - 1`, `f(y) = 2^y`
has every covering term equal to `1`, so it counts `|Cov(S)|`; the Newton
expansion of `Δ^k(f∘g)(0)` gives the alternating sum. -/
theorem cover_count {α : Type*} [DecidableEq α] (S : Finset α) (hS : S.Nonempty) :
    ((coverings S).card : ℤ)
      = ∑ j ∈ Finset.range (S.card + 1),
          (-1 : ℤ) ^ (S.card - j) * (S.card.choose j) * 2 ^ (2 ^ j - 1) := by
  have h := covering_fdb (fun n : ℤ => (2 : ℤ) ^ n.toNat) (fun n : ℤ => (2 : ℤ) ^ n.toNat - 1)
              0 (fun _ => (1 : ℤ)) hS
  -- every covering term equals 1
  have hterm : ∀ C ∈ coverings S,
      fwdDiff (fun n : ℤ => (2 : ℤ) ^ n.toNat)
        ((fun n : ℤ => (2 : ℤ) ^ n.toNat - 1) 0)
        (fwdDiff (fun n : ℤ => (2 : ℤ) ^ n.toNat - 1) 0 (fun _ => (1 : ℤ))) C = 1 := by
    intro C hC
    have hg0 : (fun n : ℤ => (2 : ℤ) ^ n.toNat - 1) 0 = 0 := by norm_num
    rw [hg0]
    refine fwdDiff_two_pow _ _ ?_
    intro A hA
    have hApow : A ∈ powPlus S :=
      Finset.mem_powerset.mp (Finset.mem_filter.mp hC).1 hA
    exact fwdDiff_two_pow_sub_one _ _ (mem_powPlus.mp hApow).1 (fun _ _ => rfl)
  rw [Finset.sum_congr rfl hterm, Finset.sum_const, nsmul_eq_mul, mul_one] at h
  -- expand the left side as a Newton sum
  rw [fwdDiff_unit_dirs _ _ _ _ (fun _ _ => rfl)] at h
  rw [← h]
  refine Finset.sum_congr rfl ?_
  intro j _
  -- (f ∘ g)(j) = 2^(2^j - 1)
  simp only [Function.comp_apply, zero_add, Int.toNat_natCast]
  congr 1
  -- ((2:ℤ)^j - 1).toNat = 2^j - 1  (as ℕ)
  have h1 : ((2 : ℤ) ^ j - 1) = ((2 ^ j - 1 : ℕ) : ℤ) := by
    push_cast [Nat.one_le_two_pow]
    ring
  rw [h1, Int.toNat_natCast]

/-- Sanity check: `|Cov(2)| = 5` (the five covers of `{0,1}`:
`{01}`, `{0,1}`, `{0,01}`, `{1,01}`, `{0,1,01}`). -/
example : (coverings (Finset.univ : Finset (Fin 2))).card = 5 := by decide

/-- Sanity check: `|Cov(1)| = 1`. -/
example : (coverings (Finset.univ : Finset (Fin 1))).card = 1 := by decide

section DegreeBound

variable {α : Type*} [DecidableEq α]
         {X : Type*} [AddCommGroup X]
         {Y : Type*} [AddCommGroup Y]
         {Z : Type*} [AddCommGroup Z]

/-! ### Forward differences with a zero direction vanish -/

/-- If one direction is zero, the forward difference vanishes.
The cube doesn't depend on whether `i ∈ T` (since `v i = 0`),
so the `±1` contributions from `T` and `T Δ {i}` cancel pairwise. -/
lemma fwdDiff_zero_dir (f : X → Y) (x : X) (v : β → X) {S : Finset β} {i : β}
    (hi : i ∈ S) (hv : v i = 0) :
    fwdDiff f x v S = 0 := by
  unfold fwdDiff mu
  -- Pair T with T Δ {i}: the cube values are equal (v i = 0) and signs cancel
  refine Finset.sum_involution (fun T _ => if i ∈ T then T.erase i else insert i T)
    ?_ ?_ ?_ ?_
  · -- Signs cancel: f(T) + f(toggle T) = 0
    intro T hT
    split <;> rename_i h
    · have hval : tr f x v (T.erase i) = tr f x v T := by
        unfold tr; congr 1; rw [Finset.sum_erase_eq_sub h, hv, sub_zero]
      have hpos : 0 < T.card := Finset.card_pos.mpr ⟨i, h⟩
      have hle : T.card ≤ S.card := Finset.card_le_card (Finset.mem_powerset.mp hT)
      rw [Finset.card_erase_of_mem h,
          show S.card - (T.card - 1) = (S.card - T.card) + 1 from by omega,
          pow_succ, mul_neg_one, neg_smul, hval, add_neg_cancel]
    · have hval : tr f x v (insert i T) = tr f x v T := by
        unfold tr; congr 1; rw [Finset.sum_insert h, hv, zero_add]
      have hlt : T.card < S.card :=
        Finset.card_lt_card ⟨Finset.mem_powerset.mp hT, fun hle => h (hle hi)⟩
      rw [Finset.card_insert_of_notMem h,
          show S.card - T.card = (S.card - (T.card + 1)) + 1 from by omega,
          pow_succ, mul_neg_one, neg_smul, hval, neg_add_cancel]
  · -- Toggle ≠ identity
    intro T _ _
    split <;> rename_i h
    · intro he
      have h1 := Finset.card_erase_of_mem h
      have h2 := Finset.card_pos.mpr ⟨i, h⟩
      have h3 : (T.erase i).card = T.card := by rw [he]
      omega
    · intro he
      have h1 := Finset.card_insert_of_notMem h
      have h3 : (insert i T).card = T.card := by rw [he]
      omega
  · -- Toggle maps into S.powerset
    intro T hT
    rw [Finset.mem_powerset] at hT ⊢
    split <;> rename_i h
    · exact (Finset.erase_subset i T).trans hT
    · exact Finset.insert_subset hi hT
  · -- Toggle is an involution
    intro T _
    split <;> rename_i h
    · rw [if_neg (fun h' => (Finset.mem_erase.mp h').1 rfl), Finset.insert_erase h]
    · rw [if_pos (Finset.mem_insert_self i T), Finset.erase_insert h]

/-! ### Polynomial maps -/

/-- A map is *polynomial of degree ≤ d* if all forward differences of
order > d vanish.  Degree 0 means constant, degree 1 means affine, etc. -/
def IsPolyDeg (f : X → Y) (d : ℕ) : Prop :=
  ∀ (x : X) (u : α → X) (S : Finset α), d < S.card → fwdDiff f x u S = 0

/-! ### Degree bound -/

/-- **Degree bound** (`Cor:degree-bound`).
If `g : X → Y` is polynomial of degree ≤ d and `f : Y → Z` is polynomial
of degree ≤ e (both with respect to index type `Finset α`), then
`f ∘ g` is polynomial of degree ≤ `e * d`.

The proof uses the covering FdB: each covering term involves `Δ^{|C|}f`
(vanishing for `|C| > e`) applied to directions `Δ^{|A|}g` (vanishing
for `|A| > d`), and `|S| ≤ ∑|A| ≤ e·d` by the weight bound. -/
theorem degree_bound {d e : ℕ}
    (f : Y → Z) (g : X → Y)
    (hg : ∀ x (u : α → X) (S : Finset α), d < S.card → fwdDiff g x u S = 0)
    (hf : ∀ y (v : Finset α → Y) (C : Finset (Finset α)), e < C.card → fwdDiff f y v C = 0) :
    ∀ x (u : α → X) (S : Finset α), e * d < S.card → fwdDiff (f ∘ g) x u S = 0 := by
  intro x u S hS
  by_cases hSne : S.Nonempty
  · -- Apply covering FdB
    rw [covering_fdb f g x u hSne]
    apply Finset.sum_eq_zero
    intro C hC
    by_cases he' : e < C.card
    · exact hf (g x) (fwdDiff g x u) C he'
    · push_neg at he'
      have : ¬∀ A ∈ C, A.card ≤ d :=
        fun hall => absurd hS (not_lt.mpr (cover_size_bound hC he' hall))
      push_neg at this
      obtain ⟨A, hA, hAd⟩ := this
      exact fwdDiff_zero_dir f (g x) (fwdDiff g x u) hA (hg x u A hAd)
  · simp [Finset.not_nonempty_iff_eq_empty.mp hSne] at hS

end DegreeBound

end Elements
