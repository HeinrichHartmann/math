---
outline_enabled: false
id: E0026
title: Classical Faà di Bruno formulas
kind: corollary
status: established
visibility: public
notation: E0020
depends_on: [E0022]
checked: [ai]
published_at: [DFDB]
---

# E0026 — Classical Faà di Bruno formulas

The Fréchet iterated Faà di Bruno [E0022] specializes to the
classical multi-index formula of Constantine–Savits and the
univariate Bell polynomial form.

**Corollary (Constantine–Savits).** For two $C^n$ maps
$g: X \to Y$, $f: Y \to Z$ between Banach spaces, $x \in X$,
$y = g(x)$, and $\gamma \in \IN_0^k$ with
$1 \leq |\gamma| \leq n$:

$$
D(f \circ g;\, x;\, v_\bullet^{\times \gamma})
= \sum_{\kappa \vdash \gamma}
  \frac{\gamma!}{\kappa!\,
  \prod_\alpha (\alpha!)^{\kappa(\alpha)}}\,
  D(f;\, y;\,
  (D(g;\, x;\, v_\bullet^{\times \alpha}))
  _\alpha^{\times \kappa(\alpha)}).
$$

The sum runs over multisets $\kappa$ of nonzero multi-indices
with $\sum_\beta \kappa(\beta)\, \beta = \gamma$. The
coefficient is the partition grouping coefficient
$\Part_2(\gamma, \kappa) =
\gamma! / (\kappa! \prod_\alpha (\alpha!)^{\kappa(\alpha)})$.

**Proof.**
Set $m = 2$ in the Fréchet iterated Faà di Bruno [E0022]. The
iterated multi-index $\kappa \in \KM_+^2(k)$ is a multiset of
nonzero multi-indices with $\lf(\kappa) = \gamma$, i.e.
$\sum_\alpha \kappa(\alpha) \alpha = \gamma$. The iterated
differential $D^\kappa(g, f; x; v_\bullet) =
D^{|\kappa|}(f; y; (D^\alpha(g; x; v_\bullet))
_\alpha^{\times \kappa(\alpha)})$. The partition grouping
coefficient is $\Part_2(\gamma, \kappa) =
\gamma! / (\kappa! \prod_\alpha (\alpha!)^{\kappa(\alpha)})$,
which counts the number of partitions of $S(\gamma)$ with
block-type profile $\kappa$.

**Corollary (Univariate Faà di Bruno).** For $C^n$ functions
$f, g: \IR \to \IR$, the Constantine–Savits formula with
$k = 1$ and $\gamma = n$ gives:

$$
(f \circ g)^{(n)}(x)
= \sum_{\substack{k_1 + 2k_2 + \cdots + nk_n = n \\
k_j \geq 0}}
\frac{n!}{k_1!\, k_2! \cdots k_n!}\,
f^{(k_1 + \cdots + k_n)}(g(x))
\prod_{j=1}^n
\left(\frac{g^{(j)}(x)}{j!}\right)^{k_j}.
$$

This is the classical Faà di Bruno formula in Bell polynomial
form.

**Proof.**
Set $k = 1$ in the Constantine–Savits formula. A multiset
$\kappa$ of positive integers with
$\sum_j j \kappa(j) = n$ corresponds to a tuple
$(k_1, \dots, k_n)$ with $k_j = \kappa(j)$ and
$\sum j k_j = n$. The $\alpha$-th derivative of a univariate
map is $D^\alpha(g; x; v) = g^{(\alpha)}(x) v^\alpha$, so
$D(g; x; v^{\times \alpha}) = g^{(\alpha)}(x) v^\alpha$.
Setting $v = 1$ and substituting gives the stated formula; the
coefficient $\gamma! / (\kappa! \prod (\alpha!)^{\kappa(\alpha)})$
becomes $n! / \prod_j k_j!$ after absorbing the $(j!)^{k_j}$
into the derivative terms.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Both specializations checked against [E0022] ($m = 2$
instantiation; univariate coefficient identity
$n!/(\prod_j k_j!\, (j!)^{k_j})$ matches the Bell form with
$(j!)^{k_j}$ absorbed). Added the missing hypothesis
$1 \leq |\gamma|$ (at $\gamma = 0$ the sum is empty but the
left side is $(f \circ g)(x)$); the univariate form is
unaffected. No other issues found.
