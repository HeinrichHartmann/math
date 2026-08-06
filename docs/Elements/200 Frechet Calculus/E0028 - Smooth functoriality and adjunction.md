---
outline_enabled: false
id: E0028
title: Smooth functoriality and adjunction
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0027]
published_at: [DDC]
---

# E0028 — Smooth functoriality and adjunction

The symmetric pushforward $D_+$ [E0027] is functorial, and
the smooth adjunction intertwines pullback of functions with
pushforward of tangent probes.

**Theorem (Coalgebra property).** $D_+(\phi; x)$ is a
coalgebra morphism for the shuffle coproduct:

$$
\Delta^\times \circ D_+(\phi; x)
= (D_+(\phi; x) \otimes D_+(\phi; x))
  \circ \Delta^\times.
$$

**Proof.**
Evaluate on $v_1 \cdots v_r$ and set
$w_A := D(\phi; x; v_A)$. Applying $\Delta^\times$ to each
partition term splits its block set into two parts: the data
$(\pi, \pi_1, \pi_2)$ with $\pi = \pi_1 \sqcup \pi_2$
correspond bijectively to $(I \sqcup J = [r],
\pi_1 \in \Part(I), \pi_2 \in \Part(J))$, giving
$(D_+ \otimes D_+) \Delta^\times(v_1 \cdots v_r)$.

**Corollary (Coalgebra lift).** $D_+(\phi; x)$ is the unique
coalgebra morphism $ST_k(X; x) \to ST_k(Y; y)$ whose
degree-one component is the differential $D(\phi; x)$.

**Proof.**
The coalgebra property is the theorem above. Uniqueness: by
the cofree property of the truncated symmetric coalgebra
[E0055], a coalgebra morphism $ST_k \to ST_k$ is determined
by its degree-one projection, which is the differential
$D(\phi; x)$. Its partition expansion is the definition of
$D_+$ [E0027].

**Theorem (Smooth functoriality).** For $\phi$ $C^k$ near $x$
and $\psi$ $C^k$ near $y$,

$$
D_+(\psi \circ \phi; x) = D_+(\psi; y) \circ D_+(\phi; x).
$$

**Proof.**
Both sides are coalgebra morphisms
$ST_k(X; x) \to ST_k(Z; z)$ with the same degree-one
component: $D(\psi \circ \phi; x; v) =
D(\psi; y; D(\phi; x; v))$ is the first-order chain rule.
By the coalgebra lift, they are equal.

**Theorem (Smooth adjunction).** For $\phi$ $C^k$ near $x$,
$f \in C^k(Y, G)$ near $y$, and $\xi \in ST_k(X; x)$,

$$
D(\phi^* f; x; \xi) = D(f; y; D_+(\phi; x)\, \xi).
$$

**Proof.**
Both sides are linear in $\xi$ and agree at $\xi = 1$ (both
give $f(y)$). On monomials $\xi = v_1 \cdots v_r$, the left
side is $D^r(f \circ \phi; x; v_1, \dots, v_r)$. Expanding by
the partition Faà di Bruno [E0022]:
$D^r(f \circ \phi; x; v_\bullet) =
\sum_{\pi \in \Part(r)} D^{|\pi|}(f; y;
(D(\phi; x; v_A))_{A \in \pi})
= D(f; y; D_+(\phi; x; v_1 \cdots v_r))$.
