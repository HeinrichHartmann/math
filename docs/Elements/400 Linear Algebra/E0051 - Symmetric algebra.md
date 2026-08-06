---
outline_enabled: false
id: E0051
title: Symmetric algebra
kind: definition
status: established
visibility: public
depends_on: [E0050]
published_at: [DDC]
---

# E0051 — Symmetric algebra

**Definition (Tensor algebra).**

- The *tensor algebra* over a vector space $V$ is
  $T(V) = \bigoplus_{k \geq 0} V^{\otimes k}$, with
  concatenation product and unit $1 \in V^{\otimes 0} = \IR$.

**Definition (Symmetric algebra).**

- The *symmetric algebra* is the quotient
  $\SS(V) = T(V) / (v \otimes w - w \otimes v)$. It is a
  commutative, associative, graded $\IR$-algebra with unit
  $1 \in \SS^0(V) = \IR$.
- $\SS^k(V)$ is the $k$-th graded component (the image of
  $V^{\otimes k}$ under the projection).
- $\SS_+(V) = \bigoplus_{k \geq 1} \SS^k(V)$ is the positive
  ideal.
- $\SH(V) = \prod_{k \geq 0} \SS^k(V)$ is the degree
  completion [E0050].
- Monomials are written $v_1 \cdots v_k$ for the symmetric
  product of vectors $v_i \in V$.

**Proposition (Universal property).** For any linear map
$f: V \to A$ into a unital commutative algebra $A$, there is
a unique algebra morphism $f^+: \SS(V) \to A$ extending $f$.

**Proof.**
$T(V)$ has the universal property for associative algebras:
$f$ extends uniquely to an algebra map $T(V) \to A$. Since
$A$ is commutative, this map kills the commutator ideal
$(v \otimes w - w \otimes v)$ and descends to $\SS(V)$.

**Proposition (Basis representation).** If $(e_i)_{i \in I}$
is a basis of $V$, then $\SS^k(V)$ has basis
$\set{e^\nu : \nu \in \Map_f(I, \IN_0),\, |\nu| = k}$
with $e^\nu = \prod_i e_i^{\nu(i)}$.

**Proof.**
The monomials $e^\nu$ span $\SS^k(V)$ by commutativity. They
are linearly independent because the symmetric product of
basis vectors in $V^{\otimes k}$ projects to distinct classes
in $\SS^k(V)$ (the quotient identifies only permutations of
tensor factors).

**Proposition (Filtrations and direct sums).**

- The upper filtration
  $F^K \SS(V) = \bigoplus_{k \geq K} \SS^k(V)$ is stable
  under multiplication:
  $\mu(F^p \otimes F^q) \subseteq F^{p+q}$.
- $\SS(V \oplus W) = \SS(V) \otimes \SS(W)$.
- $\SH(V \oplus W) = \SH(V) \hat{\otimes} \SH(W)$.

**Proof.**
Filtration stability: a product of homogeneous elements of
degrees $p$ and $q$ has degree $p + q$. Direct sums: by the
universal property, the inclusions $V \hookrightarrow V \oplus W$
and $W \hookrightarrow V \oplus W$ induce an algebra map
$\SS(V) \otimes \SS(W) \to \SS(V \oplus W)$; it is an
isomorphism because both sides have the same monomial basis
in a basis of $V \oplus W$. The completion statement follows
degreewise.
