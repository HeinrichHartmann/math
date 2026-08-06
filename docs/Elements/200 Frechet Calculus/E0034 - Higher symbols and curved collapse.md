---
outline_enabled: false
id: E0034
title: Higher symbols and curved collapse
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0018, E0031, E0032]
published_at: [DDC]
---

# E0034 — Higher symbols and curved collapse

The collapse theorem [E0031] extracts the leading term of
$t^{-k} \Delta(f; x; \lambda_t c)$. The higher symbols
$\sigma_{k,m}$ capture the full asymptotic expansion to all
orders, with $\sigma_{k,0} = \sigma_k$ [E0032].

**Definition (Higher symbols).** For a cover
$\KC \in \Cov(k)$ and multiplicities
$\nu: \KC \to \IN_{>0}$, set
$\mathrm{wt}(\nu) := \sum_{A \in \KC} |A| \nu_A$ and
$\nu! := \prod_{A \in \KC} \nu_A!$. For $m \geq 0$:

$$
\sigma_{k,m}(c)
:= \sum_{\KC \in \Cov(k)}
   \sum_{\substack{\nu: \KC \to \IN_{>0} \\
   \mathrm{wt}(\nu) = k + m}}
   \frac{1}{\nu!} \prod_{A \in \KC} c(A)^{\nu_A}
\in ST_{k+m}(X; x).
$$

The multiplicity $\nu_A$ records how many times the
direction $c(A)$ occurs. Minimal weight ($m = 0$) forces
every $\nu_A = 1$ and every block disjoint — recovering
the first-order symbol $\sigma_k$ [E0032].

**Theorem (Curved collapse).** Let $M \geq 0$ and let $f$
be $C^{k+M}$ near $x$. Then

$$
\Delta(f; x; \lambda_t c)
= \sum_{m=0}^{M} t^{k+m}\, D(f; x; \sigma_{k,m}(c))
+ t^{k+M}\, R_{k,M}(f; x; c, t),
$$

where $\sup_{c \in B} \|R_{k,M}(f; x; c, t)\| \to 0$ as
$t \to 0$ for every bounded $B \subseteq CT_k(X; x)$.

**Proof.**
By affine reconstruction [E0018],
$\Delta(f; x; \lambda_t c) =
\sum_{\KC \in \Cov(k)}
\Delta(f; x; (t^{|A|} c(A))_{A \in \KC})$.
For a fixed cover $\KC$, expand the affine difference as an
alternating sum over $J \subseteq \KC$ and apply the Taylor
formula with Peano remainder to
$f(x + \sum_{A \in J} t^{|A|} c(A))$.

In the Taylor polynomial, the multinomial indexed by
$\nu: \KC \to \IN_0$ has coefficient $1/\nu!$ and contributes
$t^{\mathrm{wt}(\nu)} D(f; x; \prod_A c(A)^{\nu_A})$.
Its coefficient in the alternating sum is
$\sum_{\supp \nu \subseteq J \subseteq \KC}
(-1)^{|\KC| - |J|} = [\supp \nu = \KC]$ by the Boolean
sieve [E0002]. Only multiplicities with every $\nu_A > 0$
survive.

Group the surviving terms by weight: weights
$k, k+1, \dots, k+M$ give $\sigma_{k,0}, \dots, \sigma_{k,M}$.
Terms of weight $> k + M$ in the Taylor polynomial are
$O(t^{k+M+1})$, and the Peano remainders are
$o(t^{k+M})$, both uniformly for bounded $c$. Their sum
divided by $t^{k+M}$ defines $R_{k,M}$.

**Corollary (Affine collapse).** On affine cubes, the higher
symbols specialize to multi-index sums:

$$
\sigma_{k,m}(\Aff(v_1, \dots, v_k))
= \sum_{\substack{\nu \in \IN_{>0}^k \\
\mathrm{wt}(\nu) = k + m}}
\frac{1}{\nu!}\, v^\nu,
$$

where $v^\nu = v_1^{\nu_1} \cdots v_k^{\nu_k}$ in the
symmetric algebra. For $m = 0$, only $\nu = (1, \dots, 1)$
contributes, giving $v_1 \cdots v_k$.

**Proof.**
For an affine cube, $c(\set{i}) = v_i$ and $c(A) = 0$ for
$|A| \geq 2$. Only covers by singletons contribute
($\KC = \set{\set{1}, \dots, \set{k}}$), and the multiplicity
$\nu$ assigns $\nu_i = \nu(\set{i}) \geq 1$ to each singleton.
The weight is $\mathrm{wt}(\nu) = \sum_i \nu_i = k + m$ and
$c(\set{i})^{\nu_i} = v_i^{\nu_i}$.
