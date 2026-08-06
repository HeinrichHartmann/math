---
outline_enabled: false
id: E0027
title: Symmetric pushforward and pullback
kind: definition
status: established
visibility: public
notation: E0020
depends_on: [E0007]
published_at: [DDC]
---

# E0027 — Symmetric pushforward and pullback

The symmetric tangent and cotangent spaces host the smooth
counterpart of the cubical pushforward [E0016]. The symmetric
pushforward $D_+$ is defined by the partition formula and is
the unique coalgebra morphism determined by the differential.

**Definition (Symmetric tangent spaces).**

- The *symmetric tangent space* of order $k$ at $x$ is
  $ST_k(X; x) := \bigoplus_{r=0}^k \SYM^r(E)$, where
  $\SYM^r(E)$ is the $r$-th symmetric power of the model
  space $E$.
- Elements are symmetric tensors $\xi = s \cdot 1 + v_1 +
  v_1 v_2 + \cdots$, where $v_1 \cdots v_r$ denotes the
  symmetric product of $r$ vectors.
- The *shuffle coproduct* is
  $\Delta^\times(v_1 \cdots v_r) =
  \sum_{I \sqcup J = [r]} v_I \otimes v_J$, making
  $ST_k(X; x)$ a cocommutative coalgebra.
- The *differential pairing* of $f: X \to G$ at $x$ with
  $\xi \in ST_k(X; x)$ is $D(f; x; \xi)$, defined on
  monomials by
  $D(f; x; v_1 \cdots v_r) := D^r(f; x; v_1, \dots, v_r)$
  and $D(f; x; 1) := f(x)$.

**Definition (Differential and symmetric pushforward).**

- The *differential* of $\phi: X \to Y$ ($C^k$ near $x$) is
  the linear map $D(\phi; x): ST_k(X; x) \to T_y Y$ defined
  by

    $$
    D(\phi; x; v_1 \cdots v_r)
    := D^r(\phi; x; v_1, \dots, v_r),
    \qquad 1 \leq r \leq k,
    $$

    with $D(\phi; x; 1) := 0$. It collects the derivatives
    of all orders into a single linear map landing in degree
    one on the target.

- The *symmetric pushforward*
  $D_+(\phi; x): ST_k(X; x) \to ST_k(Y; y)$ is the linear
  map with $D_+(\phi; x; 1) := 1$ and

    $$
    D_+(\phi; x; v_1 \cdots v_r)
    := \sum_{\pi \in \Part(r)}
       \prod_{A \in \pi} D(\phi; x; v_A),
    \qquad 1 \leq r \leq k.
    $$

    The right side is symmetric and multilinear in
    $(v_1, \dots, v_r)$.

**Definition (Symmetric pullback).**

- The *symmetric pullback* of $\phi: X \to Y$ ($C^k$ near $x$)
  is the map $D^+(\phi; x): ST^k(Y; y) \to ST^k(X; x)$ defined
  by adjunction:

    $$
    \langle D^+(\phi; x)\, \omega, \xi \rangle
    = \langle \omega, D_+(\phi; x)\, \xi \rangle.
    $$

- The *smooth adjunction* states that the differential pairing
  intertwines pullback and pushforward: for $f \in C^k(Y, G)$,

    $$
    D(\phi^* f; x; \xi) = D(f; y; D_+(\phi; x)\, \xi).
    $$

- $D^+(\phi; x)$ is an algebra morphism for the pointwise
  product on $ST^k$.
