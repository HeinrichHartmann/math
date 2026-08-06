import Elements.E0001

/-!
# Higher multi-indices and partitions  (E0007)

Formalises the definitions in E0007 of the Elements:

- **Partitions** of a finite set: `Part(S)` as a decidable `Finset`.
- **Higher multi-indices**: `M_+^r(S)` — iterated nonzero multi-indices.
- **Leaf multi-index**: `lf(κ)` — the flat multi-index obtained by
  summing leaves of the tree.
- Relationship: partitions ⊆ coverings (every partition is a cover).

The key new definition is `partitions S` — the set of all set-partitions
of `S` into nonempty pairwise-disjoint blocks — analogous to `coverings S`
but with disjointness enforced. The covering FdB formula restricts to
partitions to give the smooth/partition-indexed FdB.
-/

open Finset

namespace Elements

universe u

variable {α : Type*} [DecidableEq α] {α' : Type*} [DecidableEq α']

/-! ### Partitions of a finite set -/

/-- A set partition of `S`: a collection of nonempty pairwise-disjoint subsets
whose *disjoint* union equals `S`. Paper notation: `Part(S)`. -/
def partitions (S : Finset α) : Finset (Finset (Finset α)) :=
  (powPlus S).powerset.filter (fun π =>
    π.biUnion id = S ∧ ∀ A ∈ π, ∀ B ∈ π, A ≠ B → Disjoint A B)

lemma mem_partitions {S : Finset α} {π : Finset (Finset α)} :
    π ∈ partitions S ↔
      (∀ A ∈ π, A.Nonempty ∧ A ⊆ S) ∧
      π.biUnion id = S ∧
      ∀ A ∈ π, ∀ B ∈ π, A ≠ B → Disjoint A B := by
  simp only [partitions, Finset.mem_filter, Finset.mem_powerset]
  constructor
  · rintro ⟨hπ, hU, hD⟩
    exact ⟨fun A hA => mem_powPlus.mp (hπ hA), hU, hD⟩
  · rintro ⟨hA, hU, hD⟩
    exact ⟨fun A hA' => mem_powPlus.mpr (hA A hA'), hU, hD⟩

/-- Every partition is a covering (partitions are disjoint covers). -/
lemma partitions_subset_coverings (S : Finset α) :
    partitions S ⊆ coverings S := by
  intro π hπ
  simp only [partitions, coverings, Finset.mem_filter, Finset.mem_powerset] at hπ ⊢
  exact ⟨hπ.1, hπ.2.1⟩

/-! ### Sanity checks -/

/-- `|Part(1)| = 1` (the single partition `{{0}}`). -/
example : (partitions (Finset.univ : Finset (Fin 1))).card = 1 := by decide

/-- `|Part(2)| = 2` (the two partitions `{{0,1}}` and `{{0},{1}}`). -/
example : (partitions (Finset.univ : Finset (Fin 2))).card = 2 := by decide

/-- `|Part(3)| = 5` (Bell number B₃). -/
example : (partitions (Finset.univ : Finset (Fin 3))).card = 5 := by decide

/-! ### Weight of a partition -/

/-- Weight of a partition: sum of block sizes (= |S| for partitions of S,
since blocks are disjoint). -/
def partitionWeight (π : Finset (Finset α)) : ℕ := ∑ A ∈ π, A.card

/-- Equality in the cardinality bound for a finite union forces the members
to be pairwise disjoint.  This is the converse to `Finset.card_biUnion`. -/
private lemma pairwiseDisjoint_of_card_biUnion_eq_sum
    {ι β : Type*} [DecidableEq ι] [DecidableEq β]
    (s : Finset ι) (t : ι → Finset β)
    (h : (s.biUnion t).card = ∑ i ∈ s, (t i).card) :
    (s : Set ι).PairwiseDisjoint t := by
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
      rw [Finset.biUnion_insert, Finset.sum_insert ha] at h
      have hu : (t a ∪ s.biUnion t).card ≤ (t a).card + (s.biUnion t).card :=
        Finset.card_union_le _ _
      have hs : (s.biUnion t).card ≤ ∑ i ∈ s, (t i).card :=
        Finset.card_biUnion_le
      have hs_eq : (s.biUnion t).card = ∑ i ∈ s, (t i).card := by omega
      have hdisj : Disjoint (t a) (s.biUnion t) := by
        apply Finset.card_union_eq_card_add_card.mp
        omega
      rw [Finset.coe_insert, Set.pairwiseDisjoint_insert_of_notMem ha]
      refine ⟨ih hs_eq, ?_⟩
      intro b hb
      exact hdisj.mono_right (Finset.subset_biUnion_of_mem t hb)

/-- A covering has the minimum possible weight exactly when it is a
partition.  Equivalently, every genuine overlap makes the covering weight
strictly larger than the size of the set being covered. -/
lemma mem_partitions_iff_mem_coverings_weight_eq
    {S : Finset α} {C : Finset (Finset α)} :
    C ∈ partitions S ↔ C ∈ coverings S ∧ partitionWeight C = S.card := by
  constructor
  · intro hC
    have hp := (mem_partitions.mp hC)
    refine ⟨partitions_subset_coverings S hC, ?_⟩
    rw [partitionWeight, ← hp.2.1]
    exact (Finset.card_biUnion fun A hA B hB hAB => hp.2.2 A hA B hB hAB).symm
  · rintro ⟨hcov, hweight⟩
    have hc := (Finset.mem_filter.mp hcov)
    apply mem_partitions.mpr
    refine ⟨fun A hA => mem_powPlus.mp (Finset.mem_powerset.mp hc.1 hA), hc.2, ?_⟩
    have hpair : (C : Set (Finset α)).PairwiseDisjoint id := by
      apply pairwiseDisjoint_of_card_biUnion_eq_sum C id
      rw [hc.2, ← hweight]
      rfl
    intro A hA B hB hAB
    exact hpair hA hB hAB

/-- A non-partition covering has weight strictly larger than the covered
set. -/
lemma card_lt_partitionWeight_of_mem_coverings_not_mem_partitions
    {S : Finset α} {C : Finset (Finset α)}
    (hC : C ∈ coverings S) (hnot : C ∉ partitions S) :
    S.card < partitionWeight C := by
  have hUnion : C.biUnion id = S := (Finset.mem_filter.mp hC).2
  have hle : S.card ≤ partitionWeight C := by
    rw [partitionWeight, ← hUnion]
    exact Finset.card_biUnion_le
  exact lt_of_le_of_ne hle fun hEq =>
    hnot (mem_partitions_iff_mem_coverings_weight_eq.mpr ⟨hC, hEq.symm⟩)

/-- A sum over coverings collapses to a sum over partitions as soon as all
overlapping-cover terms vanish.  This is the finite-sum form used by the
smooth Faà di Bruno argument after taking the lowest homogeneous part. -/
lemma sum_coverings_eq_sum_partitions_of_eq_zero
    {M : Type*} [AddCommMonoid M] (S : Finset α)
    (F : Finset (Finset α) → M)
    (hzero : ∀ C ∈ coverings S, C ∉ partitions S → F C = 0) :
    ∑ C ∈ coverings S, F C = ∑ C ∈ partitions S, F C := by
  symm
  apply Finset.sum_subset (partitions_subset_coverings S)
  intro C hC hnot
  exact hzero C hC hnot

/-! ### Iterated Boolean index types  (E0001: higher power sets)

Design decision (HAR-37/HAR-40): levels are represented by *type iteration*,
generalising the `r = 2` trick of `FdB.lean` where `fwdDiff f y (fwdDiff g x u)`
lives at index type `Finset α`.  No bound (`boxBelow`) is needed anywhere:
the Boolean side works with arbitrary index types, and the binomial side
(below) uses finitely supported maps (`Finsupp`). -/

/-- Iterated `Finset` types: `IterSet α 0 = α`, `IterSet α (r+1) = Finset (IterSet α r)`.
Level-`r` elements are the possible members of `𝒫₊^r(S)`. -/
def IterSet (α : Type u) : ℕ → Type u
  | 0 => α
  | r + 1 => Finset (IterSet α r)

instance IterSet.instDecidableEq (α : Type*) [DecidableEq α] : ∀ r, DecidableEq (IterSet α r)
  | 0 => ‹DecidableEq α›
  | r + 1 => letI := IterSet.instDecidableEq α r
             inferInstanceAs (DecidableEq (Finset (IterSet α r)))

/-- Boolean leaf support `lf(K) ⊆ S` (E0001), by structural recursion.
At level 0 an element is its own leaf; at level `r+1` take the union of
the leaves of the members.  For `r = 1` this gives `lf(T) = T`. -/
def leafSet : ∀ {r : ℕ}, IterSet α r → Finset α
  | 0, a => {a}
  | r + 1, K => (show Finset (IterSet α r) from K).biUnion fun L => leafSet L

@[simp] lemma leafSet_zero (a : α) : leafSet (r := 0) a = {a} := rfl

/-- At level 1 the leaf support is the set itself (paper: `lf(T) = T`). -/
@[simp] lemma leafSet_one (T : IterSet α 1) :
    leafSet T = (show Finset α from T) := by
  show (show Finset α from T).biUnion (fun a => {a}) = T
  simp

/-- Higher power set `𝒫₊^r(S)` as a `Finset (IterSet α r)` (E0001):
`𝒫₊^0(S) = S` and `𝒫₊^{r+1}(S) = 𝒫₊(𝒫₊^r(S))` (nonempty subsets). -/
def iterPowPlus (S : Finset α) : ∀ r, Finset (IterSet α r)
  | 0 => S
  | r + 1 => (iterPowPlus S r).powerset.erase ∅

/-- Level 1 recovers `powPlus` (nonempty subsets of `S`). -/
lemma iterPowPlus_one (S : Finset α) : iterPowPlus S 1 = powPlus S := rfl

/-- `Cov_r(S)`: level-`r` iterated sets with full leaf support (E0001). -/
def iterCoverings (S : Finset α) (r : ℕ) : Finset (IterSet α r) :=
  (iterPowPlus S r).filter fun K => leafSet K = S

/-- Level-2 leaf support is the union of the members. -/
lemma leafSet_two (K : IterSet α 2) :
    leafSet K = (show Finset (Finset α) from K).biUnion id := by
  show (show Finset (Finset α) from K).biUnion (fun T => T.biUnion fun a => {a}) = _
  congr 1; ext T; simp

/-- For nonempty `S`, `Cov_2(S)` recovers the coverings of `FdB.lean`. -/
lemma iterCoverings_two {S : Finset α} (hS : S.Nonempty) :
    iterCoverings S 2 = coverings S := by
  ext K
  constructor
  · intro hK
    have hm := Finset.mem_filter.mp hK
    have hpow := Finset.erase_subset _ _ hm.1
    exact Finset.mem_filter.mpr ⟨hpow, by rw [← leafSet_two]; exact hm.2⟩
  · intro hK
    have hm := Finset.mem_filter.mp hK
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_erase.mpr ⟨?_, hm.1⟩, by rw [leafSet_two]; exact hm.2⟩
    intro he
    have hcov := hm.2
    simp [he] at hcov
    exact hS.ne_empty hcov.symm

/-! #### Sanity checks -/

/-- `|Cov_2(2)| = 5` (matches `coverings`). -/
example : (iterCoverings (Finset.univ : Finset (Fin 2)) 2).card = 5 := by decide

/-- `|Cov_3(1)| = 1` (the unique tower `{{{0}}}`). -/
example : (iterCoverings (Finset.univ : Finset (Fin 1)) 3).card = 1 := by decide

/-! ### Iterated multi-indices  (E0007: `M_+^r`, leaf, higher profile)

`M(S)` is the set of finitely supported maps `S → ℕ`, so the level-`(r+1)`
multi-indices are `Finsupp`s on the level-`r` type.  The types include zero;
nonzero-ness (`M_+`) is a predicate at use sites, exactly as `powPlus`
excludes `∅` from the powerset. -/

/-- Iterated multi-index types (E0007): `IterIdx α 0 = α`,
`IterIdx α (r+1) = IterIdx α r →₀ ℕ`.  For `r ≥ 1` these are the possible
members of `M_+^r(S)`. -/
def IterIdx (α : Type u) : ℕ → Type u
  | 0 => α
  | r + 1 => IterIdx α r →₀ ℕ

instance IterIdx.instDecidableEq (α : Type*) [DecidableEq α] : ∀ r, DecidableEq (IterIdx α r)
  | 0 => ‹DecidableEq α›
  | r + 1 => letI := IterIdx.instDecidableEq α r
             inferInstanceAs (DecidableEq (IterIdx α r →₀ ℕ))

/-- Leaf multi-index `lf(κ) ∈ ℕ^S` (E0007), by structural recursion:
`lf(a) = 1_a` at level 0 and `lf(κ) = ∑_λ κ(λ)·lf(λ)` at level `r+1`.
For `r = 1` this gives `lf(α) = α` (`leafIdx_one`). -/
noncomputable def leafIdx : ∀ {r : ℕ}, IterIdx α r → (α →₀ ℕ)
  | 0, a => Finsupp.single a 1
  | r + 1, κ => (show IterIdx α r →₀ ℕ from κ).sum fun lam n => n • leafIdx lam

@[simp] lemma leafIdx_zero (a : α) : leafIdx (r := 0) a = Finsupp.single a 1 := rfl

/-- At level 1 the leaf multi-index is the multi-index itself. -/
@[simp] lemma leafIdx_one (κ : IterIdx α 1) :
    leafIdx κ = (show α →₀ ℕ from κ) := by
  show (show α →₀ ℕ from κ).sum (fun a n => n • Finsupp.single a 1) = κ
  conv_rhs => rw [← Finsupp.sum_single (show α →₀ ℕ from κ)]
  congr 1; ext a n; rw [Finsupp.smul_single, smul_eq_mul, mul_one]

/-- A *multi-index partition* `κ ⊢ γ` (E0007): an iterated multi-index with
leaf `γ`.  `Part_m`-style statements quantify over `{κ | IsPartitionOf κ γ}`. -/
def IsPartitionOf {r : ℕ} (κ : IterIdx α r) (γ : α →₀ ℕ) : Prop :=
  leafIdx κ = γ

/-- Higher profile map `ν : 𝒫₊^r(S') → M_+^r(S)` (E0007), relative to a base
map `q : α' → α` (in E0010/E0011 this is the projection `π : S(γ) → S`).
Level 0 sends an element to its image; level `r+1` counts occurrences of each
level-`r` profile: `ν(K)(λ) = #{L ∈ K : ν(L) = λ}` (`hprofile_succ_apply`).

The Boolean embedding `𝒫₊^r(S) ↪ M_+^r(S)` of E0007 is `hprofile id`. -/
noncomputable def hprofile (q : α' → α) : ∀ {r : ℕ}, IterSet α' r → IterIdx α r
  | 0, a => q a
  | r + 1, K =>
      (∑ L ∈ (show Finset (IterSet α' r) from K), Finsupp.single (hprofile q L) 1 :
        IterIdx α r →₀ ℕ)

/-- Defining property of the higher profile map:
`ν(K)(λ) = #{L ∈ K : ν(L) = λ}`. -/
lemma hprofile_succ_apply (q : α' → α) {r : ℕ} (K : IterSet α' (r + 1))
    (lam : IterIdx α r) :
    (show IterIdx α r →₀ ℕ from hprofile q K) lam
      = ((show Finset (IterSet α' r) from K).filter fun L => hprofile q L = lam).card := by
  show (∑ L ∈ (show Finset (IterSet α' r) from K),
      Finsupp.single (hprofile q L) 1) lam = _
  rw [Finsupp.finsetSum_apply]
  simp only [Finsupp.single_apply]
  exact (Finset.card_filter _ _).symm

end Elements
