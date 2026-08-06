import Elements.E0004
import Elements.E0007

/-!
# Iterated increments  (E0009)

Formalises the iterated forward difference (E0009).

For a chain of maps `f(0), f(1), ..., f(m-1)` between abelian groups:

- **Chain point**: `xᵣ = (f(r-1) ∘ ··· ∘ f(0))(x)`.
- **Iterated forward difference**: `Δ^K(f₁,...,fᵣ; x; u)` for
  `K ∈ 𝒫₊^r(S)`, defined by recursion on `r` using the level-one `Δ`.

The key observation: `fwdDiff g y d` at index type `IterSet α r` gives
a function `Finset (IterSet α r) → G = IterSet α (r+1) → G`, so the
iteration is automatic via the type system.
-/

open Finset

namespace Elements

variable {α : Type*} [DecidableEq α] {G : Type*} [AddCommGroup G]

/-! ### Chain of maps -/

/-- Chain point: `xᵣ = (f(r-1) ∘ ··· ∘ f(0))(x)`.
For `r = 0` this is `x`; for `r > 0` it is `f(r-1)(x_{r-1})`. -/
def chainPt (f : ℕ → (G → G)) (x : G) : ℕ → G
  | 0 => x
  | r + 1 => f r (chainPt f x r)

@[simp] lemma chainPt_zero (f : ℕ → (G → G)) (x : G) :
    chainPt f x 0 = x := rfl

@[simp] lemma chainPt_succ (f : ℕ → (G → G)) (x : G) (r : ℕ) :
    chainPt f x (r + 1) = f r (chainPt f x r) := rfl

/-! ### Iterated forward difference

The iterated forward difference `Δ^K(f₁,...,fᵣ; x; u)` for
`K ∈ 𝒫₊^r(S)` is defined by recursion on `r`:
- Level 0: `Δ^a(; x; u) = u(a)` (the base direction indexed by `a ∈ S`)
- Level r+1: `Δ^K(f₁,...,f_{r+1}; x; u) = Δ(f_{r+1}; x_r; (Δ^L)_{L ∈ K})`

The type of the level-r operator is `IterSet α r → G`.  At level 1 this
recovers `fwdDiff f₁ x u`; at level 2 it gives `fwdDiff f₂ y (fwdDiff f₁ x u)`,
which is exactly the nested difference in `covering_fdb`. -/

/-- Iterated forward difference: the level-`r` increment map (E0009).
`iterFwdDiff f x u r` gives `K ↦ Δ^K(f(0),...,f(r-1); x; u)` for
`K : IterSet α r`. -/
def iterFwdDiff (f : ℕ → (G → G)) (x : G) (u : α → G) : ∀ r, IterSet α r → G
  | 0 => u
  | r + 1 => fwdDiff (f r) (chainPt f x r) (iterFwdDiff f x u r)

@[simp] lemma iterFwdDiff_zero (f : ℕ → (G → G)) (x : G) (u : α → G) :
    iterFwdDiff f x u 0 = u := rfl

lemma iterFwdDiff_succ (f : ℕ → (G → G)) (x : G) (u : α → G) (r : ℕ) :
    iterFwdDiff f x u (r + 1) =
      fwdDiff (f r) (chainPt f x r) (iterFwdDiff f x u r) := rfl

/-- At level 1, the iterated forward difference is `fwdDiff f(0) x u`. -/
lemma iterFwdDiff_one (f : ℕ → (G → G)) (x : G) (u : α → G) :
    iterFwdDiff f x u 1 = fwdDiff (f 0) x u := rfl

end Elements
