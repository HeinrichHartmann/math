---
outline_enabled: false
id: E0016
title: Cubical pushforward and pullback
kind: definition
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0004]
checked: [ai]
published_at: [DDC]
---

# E0016 — Cubical pushforward and pullback

Let $G,H$ be abelian groups, let $X$ be a $G$-torsor, and let $Y$
be an $H$-torsor. Fix an arbitrary map $\phi:X\to Y$, a point
$x\in X$, and $y:=\phi(x)$. $F'(X)$
denotes the finitely supported signed measures on $X$, spanned
by the Dirac measures $\delta(p)$ with pairing
$\langle \delta(p), f \rangle = f(p)$. The forward difference
$\Delta$ along direction lists is that of [E0004].

**Definition (Tangent cubes and geometric cubes).**

- The *tangent cubes* of order $k$ at $x$ are
  $CT_k(X; x) := \Map(\KP_+(k), G)$.
- The *geometric cubes* of order $k$ are
  $\Cube_k(X):=\Map(\KP(k),X)$.
- The *geometric cubes* of order $k$ based at $x$ are
  $\Cube_k(X; x):=\set{q\in\Cube_k(X):q(\emptyset)=x}$.
- The values $c(\set{i})$ are the *legs* of $c \in CT_k(X; x)$;
  the values $c(A)$ with $|A| \geq 2$ are its *Möbius defects*.
- The *affine cube* $\Aff(v_1, \dots, v_k)$ is defined by
  $c(\set{i}) = v_i$ and $c(A) = 0$ for $|A| \geq 2$.
- For $T \subseteq [k]$, the *face* $\del_T c := c|_{\KP_+(T)}$
  is the restriction, regarded as a cube of order $|T|$ by
  increasing relabeling of $T$.

**Definition (Zeta and Möbius transforms).**
The *geometric realization* is the map

$$
\zeta_x:CT_k(X;x)\lra\Cube_k(X;x),
\qquad
\zeta_x(c;T):=x+\sum_{\emptyset\ne R\subseteq T}c(R).
$$

The *Möbius coordinate map* is

$$
\mu_x:\Cube_k(X;x)\lra CT_k(X;x),
\qquad
\mu_x(q;T):=\sum_{R\subseteq T}(-1)^{|T|-|R|}(q(R)-x).
$$

The maps $\zeta_x$ and $\mu_x$ are inverse bijections by Boolean
Möbius inversion [E0002], applied to $T\mapsto q(T)-x$ on
$\KP(k)$. This function vanishes at $T=\emptyset$ exactly for
based cubes.

**Definition (Forward difference along a cube).**

- The *forward difference* of $f: X \to G$ along
  $c \in CT_k(X; x)$ is

    $$
    \Delta(f; x; c)
    := \sum_{T \subseteq [k]} (-1)^{k - |T|}\,
    f(x + {\textstyle\sum_{\emptyset \neq R \subseteq T}} c(R)),
    $$

    agreeing with the iterated forward difference [E0004] on
    affine cubes:
    $\Delta(f; x; \Aff(v_\bullet)) = \Delta(f; x; v_\bullet)$.
    Taking $G = Y$ covers differences $\Delta(\phi; x; c)$ of
    maps $\phi: X \to Y$.

**Definition (Cubical pushforward).**

- The *geometric pushforward* of $\phi: X \to Y$ is
  $(\phi_* q)(T) := \phi(q(T))$, acting vertexwise on
  geometric cubes.
- The *cubical pushforward* is the conjugation

    $$
    \Delta_+(\phi; x) := \mu_y \circ \phi_* \circ \zeta_x
    : CT_k(X; x) \to CT_k(Y; y).
    $$

- In coordinates: for $\emptyset \neq T \subseteq [k]$,

    $$
    \Delta_+(\phi; x; c)(T) = \Delta(\phi; x; \del_T c).
    $$

    On affine cubes,
    $\Delta_+(\phi; x; \Aff(v_\bullet))(T) =
    \Delta(\phi; x; v_T)$.

**Definition (Cube measure).**

- The *cube measure* of $c \in CT_k(X; x)$ is

    $$
    \delta(x; c)
    := \sum_{T \subseteq [k]} (-1)^{k - |T|}\,
    \delta(x + {\textstyle\sum_{\emptyset \neq R \subseteq T}} c(R))
    \in F'(X),
    $$

    so that $\langle \delta(x; c), f \rangle = \Delta(f; x; c)$.

**Definition (Cubical jet and pullback).**

- The *cubical jet* of $f: X \to G$ at $x$ is
  $\Delta(f; x) := \Delta(f; x; -)$, the function that assigns
  to each $c \in CT_k(X; x)$ the forward difference
  $\Delta(f; x; c)$.
- The *co-cubes* of order $k$ are
  $CT^k(X; x) := \Map(CT_k(X; x), \IR)$, with evaluation
  pairing $\langle \omega, c \rangle := \omega(c)$; the
  precomposition below acts verbatim on $G$-valued functions
  of cubes, such as cubical jets.
- The *cubical pullback* of $\phi: X \to Y$ is precomposition
  with the pushforward:

    $$
    \Delta^+(\phi; x): CT^k(Y; y) \to CT^k(X; x),
    \qquad
    \Delta^+(\phi; x)\, \omega := \omega \circ \Delta_+(\phi; x).
    $$

- Pushforward and pullback are adjoint under the evaluation
  pairing:
  $\langle \Delta^+(\phi; x)\, \omega, c \rangle =
  \langle \omega, \Delta_+(\phi; x)\, c \rangle$.
- The cubical jet pullback is the chain rule:
  $\Delta(f \circ \phi; x) = \Delta^+(\phi; x)\, \Delta(f; y)$,
  by the discrete adjunction [E0017].
- $\Delta^+(\phi; x)$ is an algebra morphism for the pointwise
  product of co-cubes, since precomposition is multiplicative.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Checked well-definedness of all six definitions (typing of
$\zeta_x, \mu_x$ with basepoint condition $q(\emptyset) = x
\leftrightarrow$ vanishing at $\emptyset$; pushforward lands in
$CT_k(Y; y)$ since $(\phi_* q)(\emptyset) = \phi(x)$), verified
the coordinate formula and its affine specialization by direct
expansion, and confirmed all embedded assertions (inversion,
adjoint pairing, chain rule via [E0017], multiplicativity).
Edge cases $k = 0$, $T = \emptyset$, affine cubes verified.
Fixed: imported previously undefined $E$, $y = \phi(x)$,
$F'(X)$, $\delta(p)$, co-cubes $CT^k$; added the missing
definition of $\Delta(f; x; c)$ along a cube (used by the
coordinate formula, cube measure, and jet); face relabeling
clause.
