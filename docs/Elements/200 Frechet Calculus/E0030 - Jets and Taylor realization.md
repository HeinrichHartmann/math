---
outline_enabled: false
id: E0030
title: Jets and Taylor realization
kind: definition
status: established
visibility: public
notation: E0020
depends_on: [E0027, E0029]
published_at: [DDC]
---

# E0030 — Jets and Taylor realization

The jet space is the completion of the smooth functions at a
point, dual to the point-supported distributions [E0029]. The
Taylor map realizes jets as elements of the completed symmetric
cotangent space.

**Definition (Maximal ideal, jets, completion).**

- $\mathfrak{m}_x := \set{f \in \mathcal{E}(X) : f(x) = 0}$
  is the *maximal ideal* of $x$.
- The *$k$-jet space* at $x$ is the quotient algebra
  $\mathcal{E}_k(X; x) :=
  \mathcal{E}(X) / \mathfrak{m}_x^{k+1}$; the *$k$-jet* of
  $f$ is its class $j^k_x f$.
- $\hat{\mathcal{E}}(X; x) :=
  \varprojlim_k \mathcal{E}_k(X; x)$ is the *formal
  completion* of the functions at $x$.

**Proposition (Jet–distribution duality).** The pairing
$\langle \hat{f}, u \rangle := u(f)$ induces an isomorphism
$\mathcal{E}'(X; x) \xrightarrow{\sim}
\hat{\mathcal{E}}(X; x)'$.

**Proof.**
A distribution of order $\leq k$ supported at $x$ vanishes on
$\mathfrak{m}_x^{k+1}$ (flat functions are approximable by
functions vanishing near $x$), so it factors through the
$k$-jet quotient. Conversely, a continuous functional on the
projective limit factors through some finite stage, giving a
distribution of finite order supported at $x$.

**Definition (Taylor map).**

- The *Taylor expansion* of $f \in C^\infty(X, \IR)$ at $x$
  is

    $$
    t(x; f) := \sum_{r \geq 0}
    \frac{1}{r!}\, D^r(f; x)
    \in \STH^*(X; x).
    $$

- The *jet pairing* is
  $\langle t(x; f), \xi \rangle = D(f; x; \xi)$ for
  $\xi \in ST_k(X; x)$.
- The Taylor map is surjective: for any
  $\alpha \in ST^k(X; x)$, the polynomial
  $p_\alpha(x + v) := \sum_r \alpha_r(v, \dots, v)$ satisfies
  $t(x; p_\alpha) = \alpha$ (*jet realization*).

**Proposition (Jets are multiplicative).**
$t(x; fg) = \pi_{\leq k}(t(x; f) \cdot t(x; g))$ for
$f, g \in C^k(X, \IR)$.

**Proof.**
The $r$-th component of $t(x; fg)$ is
$D^r(fg; x) / r!$. Expanding by the Fréchet product rule
[E0023] and matching with the truncated product of Taylor
expansions gives equality.

**Proposition (Formal functoriality).** For smooth
$\phi: X \to Y$ with $\phi(x) = y$, the pullback
$\phi^*$ preserves the maximal ideal
($\phi^* \mathfrak{m}_y \subseteq \mathfrak{m}_x$) and
descends to algebra morphisms
$\hat{\phi}^*: \hat{\mathcal{E}}(Y; y) \to
\hat{\mathcal{E}}(X; x)$ with

$$
\widehat{f \circ \phi} = \hat{\phi}^* \hat{f},
\qquad
\widehat{(\psi \circ \phi)}^* =
\hat{\phi}^* \circ \hat{\psi}^*.
$$

**Proof.**
$f(y) = 0$ implies $f(\phi(x)) = 0$, and $\phi^*$ is
multiplicative, so the ideal containments hold; functoriality
is that of $\phi^*$.

**Theorem (Jet pullback).** For $\phi$ $C^k$ near $x$ and
$\hat{f} \in \hat{\mathcal{E}}(Y; y)$,

$$
\hat{\phi}^* \hat{f}
= \langle \hat{f},\, D_+(\phi; x)\, (-) \rangle,
$$

that is, the jet pullback is the adjoint of the symmetric
pushforward $D_+(\phi; x)$ [E0027] under the jet pairing.

**Proof.**
Pair with $\xi \in ST_k(X; x)$: by the jet pairing,
$\langle \hat{\phi}^* \hat{f}, \xi \rangle =
D(f \circ \phi; x; \xi)$. By the smooth adjunction [E0028],
this equals $D(f; y; D_+(\phi; x)\, \xi) =
\langle \hat{f}, D_+(\phi; x)\, \xi \rangle$.
