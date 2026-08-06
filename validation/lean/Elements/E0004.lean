import Elements.E0002

/-!
# Forward differences and translations  (E0004)

Definitions of the translation cube and the forward difference:

For an arbitrary map `g : X → Y` between abelian groups, the *translation cube*
`T(g; x; u)(S) = g(x + ∑_{i∈S} u_i)` and the *forward difference*
`Δ(g; x; u)(S) = μ(T; S)`.

The domain `X` need only be an additive commutative monoid; we use
`AddCommGroup` to match the paper's convention.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α]
         {X : Type*} [AddCommGroup X]
         {Y : Type*} [AddCommGroup Y]

/-! ### Definitions -/

/-- Translation cube: `T(g; x; u)(S) = g(x + ∑_{i∈S} u_i)`.
Paper notation: `T^S(g; x; u_•)`. -/
def tr (g : X → Y) (x : X) (u : α → X) (S : Finset α) : Y :=
  g (x + ∑ i ∈ S, u i)

/-- Forward difference: the Möbius transform of the translation cube.
`Δ(g; x; u)(S) = ∑_{T⊆S} (-1)^{|S|-|T|} g(x + ∑_{i∈T} u_i)`.
Paper notation: `Δ^S(g; x; u_•)`. -/
def fwdDiff (g : X → Y) (x : X) (u : α → X) : Finset α → Y :=
  mu (tr g x u)

/-! ### Basic lemmas -/

/-- Forward difference at the empty set is `g(x)`. -/
@[simp] lemma fwdDiff_empty (g : X → Y) (x : X) (u : α → X) :
    fwdDiff g x u ∅ = g x := by
  simp [fwdDiff, mu, tr]

end Elements
