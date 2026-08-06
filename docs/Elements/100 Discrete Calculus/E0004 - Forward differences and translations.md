---
outline_enabled: false
id: E0004
title: Forward differences and translations
kind: definition
status: established
visibility: public
notation: E0001
depends_on: [E0002]
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0004.lean
    definitions: [tr, fwdDiff]
published_at: [DFDB]
---

# E0004 — Forward differences and translations

**Definition.** Let $X, Y$ be abelian groups, $g: X \to Y$,
$x \in X$, and directions
$u_\bullet = (u_1, \dots, u_k) \in X^k$.

- The *iterated forward difference* is

    $$
    \Delta(g; x; u_\bullet)
    := \sum_{S \subseteq [k]} (-1)^{k-|S|}\,
       g(x + {\textstyle\sum_{i \in S}} u_i).
    $$

- The *iterated translation* is

    $$
    T(g; x; u_\bullet) := g(x + {\textstyle\sum_{i=1}^k} u_i).
    $$

- The *restricted* operators for $S \subseteq [k]$, with
  $u_S = (u_i)_{i \in S}$, are

    $$
    \Delta^S(g; x; u_\bullet) := \Delta(g; x; u_S),
    \qquad
    T^S(g; x; u_\bullet) := g(x + {\textstyle\sum_{i \in S}} u_i).
    $$

    $\Delta$ is invariant under permutation of the directions —
    a permutation $\sigma$ of $[k]$ acts on the sum by the
    bijection $S \mapsto \sigma(S)$, which preserves $|S|$ and
    the arguments $x + \sum_{i \in S} u_{\sigma(i)}
    = x + \sum_{j \in \sigma(S)} u_j$ — so $\Delta^S$ does not
    depend on the enumeration of $S$.

- The *repeated direction list* for $\alpha \in \IN_0^k$ is
  $u_\bullet^\alpha = (u_1^{\times\alpha_1}, \dots,
  u_k^{\times\alpha_k})$, with $u_i$ repeated $\alpha_i$ times.

- The *multi-index difference* and *multi-index translation* are

    $$
    \Delta^\alpha(g; x; u_\bullet)
    := \Delta(g; x; u_\bullet^\alpha)
    = \sum_{\beta \leq \alpha} (-1)^{|\alpha|-|\beta|}\,
      \frac{(\alpha)_\beta}{\beta!}\,
      g(x + {\textstyle\sum_i} \beta_i u_i),
    \qquad
    T^\alpha(g; x; u_\bullet)
    := g(x + {\textstyle\sum_{i=1}^k} \alpha_i u_i).
    $$

    The second expression groups the $2^{|\alpha|}$ Boolean terms by
    profile: exactly
    $\prod_i \binom{\alpha_i}{\beta_i} = (\alpha)_\beta / \beta!$
    subsets of the repeated list select $\beta_i$ copies of $u_i$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Checked well-definedness of all five definitions, permutation
invariance, and the profile-grouped form of $\Delta^\alpha$
(count $(\alpha)_\beta/\beta!$ verified; numeric check $k=1$,
$\alpha=2$). Edge cases $k=0$, $\alpha=0$, $S=\emptyset$ give
evaluation, as they should. Added one-line justifications for
the two in-line assertions; notation consistent with E0001.
