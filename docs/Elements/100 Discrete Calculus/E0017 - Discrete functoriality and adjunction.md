---
outline_enabled: false
id: E0017
title: Discrete functoriality and adjunction
kind: theorem
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0016]
checked: [ai]
published_at: [DDC]
---

# E0017 — Discrete functoriality and adjunction

The cubical pushforward $\Delta_+$ [E0016] is an exact functor,
and the pullback $\Delta^+$ is its contravariant adjoint.
Throughout, $y = \phi(x)$ and $z = \psi(y)$; on cube measures,
$\phi_*$ is the linear extension of $\delta(p) \mapsto
\delta(\phi(p))$, and $\phi^* f = f \circ \phi$ is the pullback
of functions.

**Theorem (Exact functoriality).** For arbitrary maps
$\phi: X \to Y$, $\psi: Y \to Z$ and every $k \geq 1$,

$$
\Delta_+(\psi \circ \phi; x)
= \Delta_+(\psi; y) \circ \Delta_+(\phi; x),
\qquad
\Delta_+(\id_X; x) = \id.
$$

**Proof.**
The geometric pushforward composes vertexwise:
$(\psi \circ \phi)_* = \psi_* \circ \phi_*$. Insert the
identity $\zeta_y \circ \mu_y = \id$ (Möbius–zeta inversion
[E0002]) between the two factors in
$\mu_z \circ \psi_* \circ \phi_* \circ \zeta_x =
(\mu_z \circ \psi_* \circ \zeta_y)
\circ (\mu_y \circ \phi_* \circ \zeta_x)
= \Delta_+(\psi; y) \circ \Delta_+(\phi; x)$.
For the identity map,
$\Delta_+(\id_X; x) = \mu_x \circ (\id_X)_* \circ \zeta_x
= \mu_x \circ \zeta_x = \id$.

**Theorem (Discrete adjunction).** For arbitrary
$\phi: X \to Y$, $f: Y \to G$, and $c \in CT_k(X; x)$,

$$
\phi_*\, \delta(x; c) = \delta(y; \Delta_+(\phi; x)\, c),
\qquad
\Delta(\phi^* f; x; c) = \Delta(f; y; \Delta_+(\phi; x)\, c).
$$

**Proof.**
By Möbius–zeta inversion [E0002],
$\zeta_y(\Delta_+(\phi; x) c) = \phi_*(\zeta_x c)$: the
geometric realization of the pushed-forward tangent cube is
the vertexwise image of the original geometric cube. The
first identity follows vertexwise on cube measures; the
second by pairing against $f$.

**Theorem (Contravariant functoriality).** For arbitrary
$\phi: X \to Y$ and $\psi: Y \to Z$,

$$
\Delta^+(\psi \circ \phi; x)
= \Delta^+(\phi; x) \circ \Delta^+(\psi; y).
$$

**Proof.**
Precomposition reverses composition; apply exact
functoriality.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
All three proofs verified against [E0016] definitions, with
basepoint tracking $\phi_*: \Cube_k(X;x) \to \Cube_k(Y;y)$ and
termwise agreement over $T \subseteq [k]$ in the adjunction;
edge cases $k = 0$, identity map, constant $\phi$ checked.
Fixed: proof of $\Delta_+(\id_X;x) = \id$ was missing (added
one line); intro now declares $y, z$ and imports $\phi_*$ on
measures and $\phi^* f$, which were previously undefined.
