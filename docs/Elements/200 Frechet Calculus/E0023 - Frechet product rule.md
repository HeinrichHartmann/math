---
outline_enabled: false
id: E0023
title: Fréchet product rule
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0014, E0022, E0024]
checked: [ai]
published_at: [DFDB]
---

# E0023 — Fréchet product rule

The discrete product rule [E0014] passes to Fréchet derivatives:
ordered coverings collapse to ordered partitions, since
overlapping subsets produce zero in the symmetric derivative.

**Theorem.** Let $X$ be a Banach space, $A$ a Banach algebra,
and $f_1, \dots, f_r: X \to A$ be $C^n$ near $x$, with
$n \geq k$. For $v_1, \dots, v_k \in X$:

- *Boolean product rule:*

    $$
    D(f_1 \cdots f_r; x; v_{[k]})
    =
    \sum_{J_1 \sqcup \cdots \sqcup J_r = [k]}
    D(f_1; x; v_{J_1}) \cdots D(f_r; x; v_{J_r}).
    $$

- *Binomial product rule.* For $\gamma \in \IN_0^k$ with
  $|\gamma| \leq n$:

    $$
    D(f_1 \cdots f_r; x; v_\bullet^{\times \gamma})
    =
    \sum_{\alpha_1 + \cdots + \alpha_r = \gamma}
    \frac{\gamma!}{\alpha_1! \cdots \alpha_r!}\,
    D(f_1; x; v_\bullet^{\times \alpha_1}) \cdots
    D(f_r; x; v_\bullet^{\times \alpha_r}).
    $$

    The Boolean sum runs over *ordered partitions*
    $(J_1, \dots, J_r)$ of $[k]$: the $J_a$ are pairwise
    disjoint and empty $J_a$ are allowed. This is the discrete
    product rule [E0014] with coverings replaced by partitions.

**Proof.**
The coefficients of $f_1 \cdots f_r$ up to order $n$ agree with
those of the product $P_1 \cdots P_r$ of the Taylor polynomials
$P_a = T^n(f_a; x)$: multiply the Peano expansions (the
multiplication of $A$ is bounded bilinear) and use uniqueness
of the Taylor polynomial [E0024]. To the polynomial maps the
discrete product rule [E0014] applies: $\Delta(P_1 \cdots P_r)$
is the sum over ordered coverings $(J_1, \dots, J_r)$ of $[k]$
of $\prod_a \Delta(P_a; x; v_{J_a})$.

The derivative $D(f_1 \cdots f_r; x; v_{[k]})$ is the part of
this difference that is multilinear in $v_1, \dots, v_k$, as in
the collapse argument of [E0022]. Every term of
$\prod_a \Delta(P_a; x; v_{J_a})$ has slot degree
$\geq \sum_a |J_a| \geq k$, with equality iff the $J_a$ are
pairwise disjoint, so only ordered partitions contribute
multilinear terms; for those, the multilinear part of each
factor is the polarization $D(f_a; x; v_{J_a})$.

The binomial form follows by applying the Boolean form to the
slot set $S(\gamma)$ with directions $v \circ \pi$ and grouping
by the profiles $\alpha_a = \nu(J_a)$: there are
$\gamma!/(\alpha_1! \cdots \alpha_r!)$ ordered partitions of
$S(\gamma)$ with given fiberwise profiles summing to $\gamma$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Statement verified (Leibniz $r = 2$, $k = 1$; ordered
partitions at $k = 2$; binomial multinomial count). The
previous collapse justification (vanishing "after symmetrization
and truncation") was invalid — replaced with the multilinear
extraction argument of [E0022]; corrected the Taylor-product
citation to Peano + uniqueness [E0024]; added the missing proof
of the binomial form. Statement unchanged.
