---
outline_enabled: false
id: E0041
title: Algebraic Taylor–Möbius duality
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0003, E0040]
published_at: [DFDB]
---

# E0041 — Algebraic Taylor–Möbius duality

Evaluating a polynomial on the infinitesimal cube in the Taylor
algebras [E0040] displays its forward differences (in $B_k$)
or its derivatives (in $A_k$) as algebra coefficients.

**Proposition (Boolean Taylor–Möbius duality).** Let
$p \in \ik[y_1, \dots, y_d]$, $x \in \ik^d$, and
$v_1, \dots, v_k \in \ik^d$.

- In $B_k$:

    $$
    p(x + {\textstyle\sum_i} \delta_i v_i)
    = \sum_{S \subseteq [k]} \Delta(p; x; v_S)\, \delta^S.
    $$

- In $A_k$:

    $$
    p(x + {\textstyle\sum_i} \eps_i v_i)
    = \sum_{S \subseteq [k]} D(p; x; v_S)\, \eps^S.
    $$

**Proof.**
Ad $B_k$) Expand $p(x + \sum_i \delta_i v_i) =
\sum_S c_S \delta^S$ in the free basis. The branch maps
$\rho_T: \delta_i \mapsto 1_{i \in T}$ give
$p(x + \sum_{i \in T} v_i) = \sum_{S \subseteq T} c_S$.
Boolean Möbius inversion [E0002] gives
$c_S = \Delta(p; x; v_S)$.

Ad $A_k$) The $\eps^S$-coefficient is $D(p; x; v_S)$ by the
multinomial theorem: $\eps_i^2 = 0$ retains only the
multilinear monomials.

**Proposition (Binomial Taylor–Möbius duality).** In
$B_k^\nu$:

$$
p(x + {\textstyle\sum_i} \delta_i v_i)
= \sum_{0 \leq \alpha \leq \nu}
  \frac{1}{\alpha!}\, \Delta^\alpha(p; x; v_\bullet)\,
  (\delta)_\alpha.
$$

In $A_k^\nu$:

$$
p(x + {\textstyle\sum_i} \eps_i v_i)
= \sum_{0 \leq \alpha \leq \nu}
  \frac{1}{\alpha!}\, D^\alpha(p; x; v_\bullet)\,
  \eps^\alpha.
$$

**Proof.**
Ad $B_k^\nu$) The branch maps $\rho_\beta: \delta_i \mapsto \beta_i$
satisfy $\rho_\beta((\delta)_\alpha) = (\beta)_\alpha$, so
the expansion coefficients are determined by binomial Möbius
inversion [E0003].

Ad $A_k^\nu$) The $\eps^\alpha$-coefficient is
$D^\alpha / \alpha!$ by the multinomial theorem.

**Proposition (Taylor–Möbius duality in $C_k$).** In $C_k$,
expand $p(x + \sum_i v_i x_i) = \sum_S c_S(t) x^S$. Then

$$
c_S(t) = \frac{1}{t^{|S|}}\, \Delta(p; x; (tv_i)_{i \in S}),
\qquad c_S(0) = D(p; x; v_S).
$$

The coefficients $c_S(t)$ lie in $\ik[t]$; in particular,
$\Delta(p; x; tv_\bullet)$ is divisible by $t^k$.

**Proof.**
In the generic fiber $C_k[t^{-1}]$, set $\delta_i = t^{-1} x_i$
so $\delta_i^2 = \delta_i$. The branch maps give
$t^{|S|} c_S(t) = \Delta(p; x; (tv_i)_{i \in S})$ by Boolean
Möbius inversion [E0002]. Since $c_S \in \ik[t]$ (freeness),
the divisibility follows, and $c_S(0) = D(p; x; v_S)$.
