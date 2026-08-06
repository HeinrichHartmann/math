---
outline_enabled: false
id: E0003
title: Binomial Möbius inversion
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: [E0002]
checked: [numeric, ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0003.lean
    theorems: [muB_zetaB, zetaB_muB, zetaBEquiv]
published_at: [DFDB]
---

# E0003 — Binomial Möbius inversion

The Boolean Möbius inversion [E0002] lifts to multi-index grids: the binomial zeta and mu are inverse bijections on grid-valued maps, with the Boolean case recovered as the height-one restriction.

**Proposition.** Let $G$ be an abelian group and $S$ a finite
set. For a map $A: \IN_0^S \to G$ and $\alpha \in \IN_0^S$, let
$A_\alpha = A \circ \nu: \KP(S(\alpha)) \to G$ be the pullback
along the fiber measure of the Boolean realization. Set

$$
\zeta(A; \alpha)
:= \zeta(A_\alpha; S(\alpha))
= \sum_{\beta \leq \alpha} \frac{(\alpha)_\beta}{\beta!}\, A(\beta),
\qquad
\mu(A; \alpha)
:= \mu(A_\alpha; S(\alpha))
= \sum_{\beta \leq \alpha} (-1)^{\mathrm{wt}(\alpha-\beta)}\,
  \frac{(\alpha)_\beta}{\beta!}\, A(\beta).
$$

Then $\zeta$ and $\mu$ define inverse bijections on
$\mathrm{Map}(\IN_0^S, G)$.

**Proof.**

The number of subsets $T \subseteq S(\alpha)$ with $\nu(T) = \beta$
is $\frac{(\alpha)_\beta}{\beta!}$, giving the explicit sums.

For the inversion, observe that the cube $A_\alpha = A \circ \nu$
satisfies $(\zeta A)_\alpha = \zeta(A_\alpha)$: for
$T \subseteq S(\alpha)$ with $\nu(T) = \beta$, the restriction of
$A_\alpha$ to $\KP(T)$ is the realization of $A_\beta$ on $T$,
hence $\zeta(A_\alpha; T) = \sum_{R \subseteq T} A(\nu(R)) =
\zeta(A; \beta)$. Applying Boolean Möbius inversion [E0002] to
$A_\alpha$ on $\KP(S(\alpha))$:

$$
\mu(\zeta A; \alpha)
= \mu((\zeta A)_\alpha; S(\alpha))
= \mu(\zeta(A_\alpha); S(\alpha))
= A_\alpha(S(\alpha))
= A(\alpha),
$$

and symmetrically for $\zeta\mu$.

Alternatively: exchange summation order, use
$\binom{\alpha}{\beta}\binom{\beta}{\gamma} =
\binom{\alpha}{\gamma}\binom{\alpha-\gamma}{\beta-\gamma}$ to
decouple, and apply the multi-index binomial theorem
$(1-1)^\alpha = \sum_{\beta \leq \alpha}
(-1)^{\mathrm{wt}(\beta)} \binom{\alpha}{\beta} =
\delta_{\alpha,0}$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Counting coefficient $\binom{\alpha}{\beta}$, the pullback
identity $(\zeta A)_\alpha = \zeta(A_\alpha)$ (fiberwise
bijection $T \cong S(\beta)$ over $S$), the symmetric direction,
and edge cases $\alpha = 0$, height-one restriction, numeric
spot check $\alpha = 2$. Added the missing hypothesis that $S$
is finite. No other issues found.
