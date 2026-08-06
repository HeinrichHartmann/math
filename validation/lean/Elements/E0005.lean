import Elements.E0004

/-!
# Discrete Taylor duality  (E0005)

Formalises `Prop:taylor-duality` (Boolean case) from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026).

The translation cube `T` and the forward difference `Δ` (E0004) form a
Möbius-dual pair:

  T(g; x; u; S) = ζ(Δ(g; x; u); S)   (Taylor formula)
  Δ(g; x; u; S) = μ(T(g; x; u); S)   (definition of Δ)

Both are direct instances of `zeta_mu` / `mu_zeta` from `E0002.lean`.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α]
         {X : Type*} [AddCommGroup X]
         {Y : Type*} [AddCommGroup Y]

/-! ### Taylor duality (Prop:taylor-duality, Boolean case)

The second identity — the alternating sum formula for `Δ` — is the
*definition* of `fwdDiff` (i.e., of `mu` applied to the translation cube).
The first identity — the Taylor formula — is its Möbius inverse.  -/

/-- **Boolean Taylor formula** (paper: first equation of `Prop:taylor-duality`).
`g(x + ∑_{i∈S} u_i) = ∑_{T⊆S} Δ(g; x; u_T)`.

This is `zeta_mu` applied to the translation cube. -/
theorem taylor_formula (g : X → Y) (x : X) (u : α → X) (S : Finset α) :
    tr g x u S = zeta (fwdDiff g x u) S :=
  (zeta_mu (tr g x u) S).symm

/-- **Forward-difference inversion** (paper: second equation restated as inversion).
`Δ(g; x; u_S) = μ(T(g; x; u); S)` — the definition of `Δ`, and also the
`mu_zeta` direction: applying `μ` to the Taylor expansion recovers `Δ`. -/
theorem fwdDiff_inv (g : X → Y) (x : X) (u : α → X) (S : Finset α) :
    mu (zeta (fwdDiff g x u)) S = fwdDiff g x u S :=
  mu_zeta (fwdDiff g x u) S

/-! ### Corollaries -/

/-- **Separated Taylor formula.**
`g(x + ∑_{i∈S} u_i) = g(x) + ∑_{∅≠T⊆S} Δ(g; x; u_T)`.

Separates the `T = ∅` term (which equals `g(x)`) from the rest. -/
theorem taylor_separated (g : X → Y) (x : X) (u : α → X) (S : Finset α) :
    tr g x u S = g x + ∑ T ∈ S.powerset.erase ∅, fwdDiff g x u T := by
  rw [taylor_formula, zeta, ← fwdDiff_empty g x u]
  exact (Finset.add_sum_erase _ _ (Finset.mem_powerset.mpr (Finset.empty_subset S))).symm

end Elements
