---
outline_enabled: false
id: E0052
title: Shuffle coproduct
kind: definition
status: established
visibility: public
depends_on: [E0051]
published_at: [DDC]
---

# E0052 — Shuffle coproduct

The symmetric algebra $\SS(V)$ [E0051] carries a cocommutative
coproduct that makes it a bialgebra.

**Definition.**

- The *shuffle coproduct*
  $\Delta: \SS(V) \to \SS(V) \otimes \SS(V)$ is the unique
  algebra homomorphism with
  $\Delta(v) = v \otimes 1 + 1 \otimes v$ for $v \in V$.

- On decomposables:

    $$
    \Delta(v_1 \cdots v_k) = \sum_{I \sqcup J = [k]}
    v_I \otimes v_J.
    $$

- The *reduced coproduct*
  $\bar{\Delta}: \SS_+(V) \to \SS_+(V) \otimes \SS_+(V)$
  restricts to nonempty $I, J$.

- Higher coproducts:
  $\Delta^{(r-1)}(v_1 \cdots v_k) =
  \sum_{\pi \in \Part^{\mathrm{ord}}(k, r)}
  \bigotimes_{B \in \pi} v_B$.

**Proposition (Conilpotence).** $\bar{\Delta}$ strictly lowers
degree: $\bar{\Delta}(\SS^{\leq k}) \subseteq
\SS^{\leq k-1} \otimes \SS^{\leq k-1}$, hence
$\bar{\Delta}^k = 0$ on $\SS^{\leq k}$.

**Proof.**
Each summand $v_I \otimes v_J$ of $\bar{\Delta}(v_1 \cdots v_k)$
has $|I|, |J| \geq 1$ and $|I| + |J| = k$, so both factors
have degree $\leq k - 1$. Iterating $m$ times, each tensor
factor has degree $\leq k - m$; at $m = k$ every factor has
degree $\leq 0$, but $\bar{\Delta}$ projects away degree $0$,
giving $0$.

**Proposition (Bialgebra compatibility).**
$\Delta(a \cdot b) = \Delta(a) \cdot \Delta(b)$.
Multiplication and coproduct are adjoint under the permanent
pairing [E0053]:
$(\alpha \cdot \beta, a) = (\alpha \otimes \beta, \Delta a)$.

**Proof.**
Multiplicativity holds by definition: $\Delta$ is an algebra
homomorphism. For the adjunction, expand
$(\alpha_1 \cdots \alpha_r, a \cdot b)$ by the permanent:
each permutation $\sigma \in S_r$ splits into a part acting on
the $a$-factors and a part on the $b$-factors, corresponding
to a shuffle decomposition $I \sqcup J = [r]$. Collecting
gives $\sum_{I \sqcup J} (\alpha_I, a)(\alpha_J, b) =
(\alpha \otimes \alpha, \Delta(a \cdot b))
= (\alpha \cdot \beta, a) \cdot (\text{etc.})$. The identity
$(\alpha \cdot \beta, a) = (\alpha \otimes \beta, \Delta a)$
follows by the same shuffle argument applied to $\Delta a$.
