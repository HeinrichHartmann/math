---
outline_enabled: false
id: E0005
title: Discrete Taylor duality
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0003, E0004]
checked: [numeric, ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0005.lean
    theorems: [taylor_formula, taylor_separated, fwdDiff_inv]
published_at: [DFDB]
---

# E0005 — Discrete Taylor duality

The forward difference $\Delta$ and translation $T$ [E0004] are
Möbius duals: each determines the other by inclusion–exclusion.

**Proposition.** Let $X, Y$ be abelian groups, $g: X \to Y$,
$x \in X$, $u_\bullet = (u_1, \dots, u_k) \in X^k$, and
$y = g(x)$.

- *Boolean Taylor duality.*

    $$
    g(x + {\textstyle\sum_{i=1}^k} u_i)
    = y + \sum_{\emptyset \neq S \subseteq [k]} \Delta(g; x; u_S),
    \qquad
    \Delta(g; x; u_\bullet)
    = \sum_{S \subseteq [k]} (-1)^{k-|S|}\,
      g(x + {\textstyle\sum_{i \in S}} u_i).
    $$

- *Binomial Taylor duality.* For $\alpha \in \IN_0^k$:

    $$
    g(x + {\textstyle\sum_{i=1}^k} \alpha_i u_i)
    = y + \sum_{0 < \beta \leq \alpha}
      \frac{(\alpha)_\beta}{\beta!}\, \Delta(g; x; u_\bullet^\beta),
    \qquad
    \Delta(g; x; u_\bullet^\alpha)
    = \sum_{\beta \leq \alpha} (-1)^{|\alpha|-|\beta|}\,
      \frac{(\alpha)_\beta}{\beta!}\,
      g(x + {\textstyle\sum_{i=1}^k} \beta_i u_i).
    $$

**Proof.**
Ad 1) The second identity is the definition of $\Delta$
([E0004]). The first is its Boolean Möbius inverse [E0002],
applied to the cube $S \mapsto \Delta(g; x; u_S)$ whose zeta
transform is $S \mapsto T^S(g; x; u_\bullet)$.

Ad 2) The second identity is the profile-grouped form of
$\Delta^\alpha$ ([E0004]). The first is its binomial Möbius
inverse [E0003].

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Both parts as Möbius inverses ($\Delta = \mu(T)$, so
$\zeta(\Delta) = T$ by [E0002]/[E0003]); separated-$y$ terms
($\Delta$ at $\emptyset$, $\beta = 0$); edge cases $k = 0$,
$\alpha = 0$, height-one restriction; numeric spot check
$k = 1$, $\alpha = 2$. No issues found.
