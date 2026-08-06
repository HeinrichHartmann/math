---
outline_enabled: false
id: E0032
title: Symbol map and intertwining
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0007, E0027, E0031]
published_at: [DDC]
---

# E0032 — Symbol map and intertwining

The symbol map $\sigma_k$ extracts from a tangent cube [E0016]
a symmetric probe [E0027] that carries the same differential
information. It intertwines the cubical and symmetric
pushforwards.

**Definition (Symbol map).**

$$
\sigma_k: CT_k(X; x) \to ST_k(X; x),
\qquad
\sigma_k(c) := \sum_{\pi \in \Part(k)}
\prod_{A \in \pi} c(A),
$$

where the products are in the symmetric algebra. On affine
cubes, $\sigma_k(\Aff(v_1, \dots, v_k)) = v_1 \cdots v_k$.

**Lemma (Spanning).** For every $1 \leq r \leq k$ and
$v_1, \dots, v_r \in E$, the monomial $v_1 \cdots v_r$ lies
in the image of $\sigma_k$. The image of $\sigma_k$ together
with $1$ spans $ST_k(X; x)$.

**Proof.**
Choose a partition $[k] = B_1 \sqcup \cdots \sqcup B_r$ and
set $c(B_j) := v_j$, $c(A) := 0$ for all other $A$. Only
$\pi = \set{B_1, \dots, B_r}$ contributes to $\sigma_k(c)$,
giving $v_1 \cdots v_r$.

**Proposition (Symbol factorization).** For $f \in C^k(X, G)$
and $c \in CT_k(X; x)$,

$$
D^\square(f; x; c) = D(f; x; \sigma_k(c)).
$$

**Proof.**
The collapse partition formula [E0031]
$D^\square(f; x; c) =
\sum_\pi D(f; x; (c(A))_{A \in \pi})$ is exactly the
differential pairing evaluated at $\sigma_k(c)$.

**Theorem (Intertwining).** For $\phi$ $C^k$ near $x$,

$$
\sigma_k \circ D^\square_+(\phi; x)
= D_+(\phi; x) \circ \sigma_k.
$$

**Proof.**
Expand $\sigma_k(D^\square_+(\phi; x) c)$: the partition
formula [E0031] on each face gives
$\sum_{\pi \in \Part(k)} \prod_{A \in \pi}
\sum_{\rho_A \in \Part(A)} D(\phi; x; (c(B))_{B \in \rho_A})$.
Expanding the product, the index data $(\pi, (\rho_A))$
correspond bijectively to pairs $(\rho, \KQ)$ of a partition
$\rho \in \Part(k)$ and a partition $\KQ$ of the block set of
$\rho$: set $\rho = \bigsqcup_A \rho_A$ and
$\KQ = \set{\rho_A : A \in \pi}$.

On the other side,
$D_+(\phi; x; \sigma_k(c)) =
\sum_{\rho \in \Part(k)} \sum_{\KQ \in \Part(\rho)}
\prod_{Q \in \KQ} D(\phi; x; (c(B))_{B \in Q})$.
The two sums agree term by term.

**Proposition (Contravariant collapse).** For $f$ $C^k$ near
$x$ and $c \in CT_k(X; x)$,

$$
\lim_{t \to 0} t^{-k}
\langle \Delta(f; x), \lambda_t c \rangle
= D(f; x; \sigma_k(c)).
$$

**Proof.**
Apply collapse [E0031] and symbol factorization.
