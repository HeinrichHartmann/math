import Elements.E0001

/-!
# Weight bound  (E0008)

Formalises `Lem:weight-bound` from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026).

The weight bound says `|S| ≤ wt(C) = ∑_{A∈C} |A|` for any cover C of S.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α]

/-! ### Weight bound for coverings -/

/-- **Weight bound** (`Lem:weight-bound`).
For a cover C of S, `|S| ≤ ∑_{A ∈ C} |A|`.
This is the subadditivity of cardinality: `|⋃ C| ≤ ∑ |A|`. -/
lemma weight_bound {S : Finset α} {C : Finset (Finset α)}
    (hC : C ∈ coverings S) : S.card ≤ ∑ A ∈ C, A.card := by
  -- coverings S = (powPlus S).powerset.filter (fun C => C.biUnion id = S)
  simp only [coverings, Finset.mem_filter] at hC
  rw [← hC.2]
  exact Finset.card_biUnion_le

/-- If a cover has at most `e` blocks each of size at most `d`,
then `|S| ≤ e * d`. -/
lemma cover_size_bound {S : Finset α} {C : Finset (Finset α)}
    (hC : C ∈ coverings S) {e d : ℕ}
    (he : C.card ≤ e) (hd : ∀ A ∈ C, A.card ≤ d) :
    S.card ≤ e * d :=
  calc S.card ≤ ∑ A ∈ C, A.card := weight_bound hC
    _ ≤ C.card * d := Finset.sum_le_card_nsmul C _ d hd
    _ ≤ e * d := Nat.mul_le_mul_right d he

end Elements
