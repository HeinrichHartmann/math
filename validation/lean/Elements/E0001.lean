import Mathlib

/-!
# Cubical setting on abelian groups  (E0001)

Shared combinatorial definitions of the discrete Möbius calculus
environment (E0001): nonempty subsets `𝒫₊(S)` and covers `Cov(S)`.
Statement modules import this environment module, mirroring how
element nodes import the E0001 environment in prose.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α]

/-! ### Combinatorial definitions -/

/-- Nonempty subsets of `S`.  Paper notation: `𝒫₊(S)`. -/
def powPlus (S : Finset α) : Finset (Finset α) :=
  S.powerset.erase ∅

/-- Covers of `S`: subfamilies of `𝒫₊(S)` whose union is `S`.
Paper notation: `Cov(S)`. -/
def coverings (S : Finset α) : Finset (Finset (Finset α)) :=
  (powPlus S).powerset.filter (fun C => C.biUnion id = S)

/-! ### Membership lemmas -/

@[simp] lemma mem_powPlus {S T : Finset α} :
    T ∈ powPlus S ↔ T.Nonempty ∧ T ⊆ S := by
  simp [powPlus, Finset.mem_erase, Finset.mem_powerset, Finset.nonempty_iff_ne_empty]

/-- The union of a family in `(powPlus S).powerset` is contained in `S`. -/
lemma biUnion_subset_of_mem_powPlus_powerset {S : Finset α} {C : Finset (Finset α)}
    (hC : C ∈ (powPlus S).powerset) : C.biUnion id ⊆ S := by
  intro x hx
  rw [Finset.mem_biUnion] at hx
  obtain ⟨A, hA, hxA⟩ := hx
  exact (mem_powPlus.mp (Finset.mem_powerset.mp hC hA)).2 hxA

end Elements
