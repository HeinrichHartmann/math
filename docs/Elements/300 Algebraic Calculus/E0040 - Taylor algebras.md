---
outline_enabled: false
id: E0040
title: Taylor algebras
kind: definition
status: established
visibility: public
notation: E0001
depends_on: []
published_at: [DFDB]
---

# E0040 — Taylor algebras

The grid algebra $B_k$, the Taylor algebra $A_k$, and the
deformation algebra $C_k$ are three faces of the same
polynomial ring. The discrete calculus lives in $B_k$
(coverings), the differential calculus in $A_k$ (partitions),
and $C_k$ interpolates over $\ik[t]$.

**Definition (Grid and Taylor algebras).** Let $\ik$ be a
commutative ring. For $\nu \in \IN_0^k$, define:

- The *grid algebra* is

    $$
    B_k^\nu := \ik[\delta_1, \dots, \delta_k]
    \,/\, ((\delta_i)_{\nu_i + 1}),
    $$

    where $(\delta_i)_{\nu_i+1} =
    \delta_i(\delta_i - 1) \cdots (\delta_i - \nu_i)$ is the
    falling factorial. For $\IQ \subseteq \ik$, this is the
    function algebra on the grid
    $\prod_i \set{0, \dots, \nu_i}$.

- The *Taylor algebra* is

    $$
    A_k^\nu := \ik[\eps_1, \dots, \eps_k]
    \,/\, (\eps_i^{\nu_i + 1}).
    $$

- For $\nu = \mathbf{1}$, write $B_k = B_k^{\mathbf{1}}$ and
  $A_k = A_k^{\mathbf{1}}$. Both are free of rank $2^k$ with
  basis $\delta^S$ resp. $\eps^S$ for $S \subseteq [k]$.

**Definition (Multiplication rules at $\nu = \mathbf{1}$).**

- In $B_k$: $\delta^S \delta^T = \delta^{S \cup T}$
  (idempotent — overlaps absorbed). A product
  $\delta^{T_1} \cdots \delta^{T_p}$ contributes to the top
  face $\delta^{[k]}$ iff $T_1 \cup \cdots \cup T_p = [k]$,
  i.e. a *covering*.

- In $A_k$: $\eps^S \eps^T = \eps^{S \cup T}$ if
  $S \cap T = \emptyset$, and $\eps^S \eps^T = 0$ otherwise
  (nilpotent — overlapping products vanish). A product
  $\eps^{T_1} \cdots \eps^{T_p}$ is nonzero iff the $T_i$
  are pairwise disjoint, i.e. a *partition*.

**Definition (Deformation algebra).** For $\nu \in \IN_0^k$:

- The *deformation algebra* is

    $$
    C_k^\nu := \ik[t][x_1, \dots, x_k]
    \,\big/\, \big({\textstyle\prod_{j=0}^{\nu_i}}
    (x_i - jt)\big).
    $$

- For $\nu = \mathbf{1}$, $C_k = C_k^{\mathbf{1}}$ has
  relation $x_i^2 = t x_i$, giving
  $x^S x^T = t^{|S \cap T|} x^{S \cup T}$.
  At $t = 1$ all coverings contribute; at $t = 0$ only
  partitions remain.

**Lemma (Flatness and fibers).** $C_k^\nu$ is free over
$\ik[t]$ of rank $\prod_i (\nu_i + 1)$, with fibers

$$
C_k^\nu / (t) \cong A_k^\nu,
\qquad
C_k^\nu / (t - 1) \cong B_k^\nu.
$$

**Proof.**
The relations are monic of degree $\nu_i + 1$ in $x_i$, so
$C_k^\nu$ is free over $\ik[t]$ with monomial basis
$\set{x^\alpha : 0 \leq \alpha \leq \nu}$. The fiber
identifications follow by substituting $t = 0$ and $t = 1$.
