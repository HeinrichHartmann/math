---
outline_enabled: false
id: E0035
title: Inverse pushforward
kind: proposition
status: established
visibility: public
notation: E0020
depends_on: [E0027, E0028]
published_at: [DDC]
---

# E0035 — Inverse pushforward

The symmetric pushforward $D_+(\phi; x)$ [E0027] is invertible
whenever the first derivative is, by a finite Neumann sum that
separates the inverse of the linear part from the higher-order
corrections.

**Proposition.** Let $\phi$ be $C^k$ near $x$ with invertible
differential $D(\phi; x) \in \KL(E, F)$. Split the pushforward
by partition type:

$$
D_+(\phi; x) = S + N,
\qquad
S := \bigoplus_{r=0}^{k} \SYM^r(D(\phi; x)),
$$

where $S$ collects the singleton partitions and $N$ the
partitions containing a block of size $\geq 2$.

- $N$ strictly lowers the degree (a partition with a block of
  size $\geq 2$ has fewer blocks than elements).
- $S$ is degreewise invertible with
  $S^{-1} = \bigoplus_{r=0}^{k} \SYM^r(D(\phi; x)^{-1})$.
- $S^{-1} N$ is nilpotent: $(S^{-1} N)^k = 0$ on $ST_k$.
- $D_+(\phi; x)$ is invertible with

    $$
    D_+(\phi; x)^{-1}
    = \left(\sum_{m=0}^{k-1} (-S^{-1} N)^m\right) S^{-1}.
    $$

- If $\phi$ has a $C^k$ local inverse at $x$, then
  $D_+(\phi^{-1}; y) = D_+(\phi; x)^{-1}$ by smooth
  functoriality [E0028].

**Proof.**
A partition of $[r]$ with a block of size $\geq 2$ has at most
$r - 1$ blocks, so its term in the pushforward [E0027] lands
in degree $\leq r - 1$: $N$ strictly lowers degree and vanishes
in degrees $\leq 1$, while $S$ is degreewise invertible with the
stated inverse. Hence $S^{-1} N$ strictly lowers degree,
$(S^{-1} N)^k = 0$ on $ST_k(X; x)$, and the finite geometric
sum inverts $1 + S^{-1} N$. Then
$D_+(\phi; x) = S(1 + S^{-1} N)$ is invertible with the stated
sum. No smallness condition enters — the inversion is purely
algebraic.

For the last claim, apply functoriality [E0028] to
$\phi^{-1} \circ \phi = \id$ and $\phi \circ \phi^{-1} = \id$.

**Remark.** In degree two, the degree-one component of the
inverse gives
$D(\phi^{-1}; y; w_1, w_2) =
-A\, D(\phi; x; Aw_1, Aw_2)$ where $A = D(\phi; x)^{-1}$.
Expanded, the Neumann sum is the tree expansion of the
classical inverse Faà di Bruno formula.
