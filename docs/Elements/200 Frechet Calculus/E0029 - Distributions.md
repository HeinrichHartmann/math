---
outline_enabled: false
id: E0029
title: Distributions
kind: definition
status: established
visibility: public
notation: E0020
depends_on: [E0016, E0027]
published_at: [DDC]
---

# E0029 — Distributions

The cube measures $\delta(x; c)$ [E0016] are finitely supported
signed measures. The point distributions $\delta(x; \xi)$ are
their smooth counterparts, supported at a single point and
parameterized by symmetric probes [E0027].

**Definition (Smooth functions and distributions).**

- $\mathcal{E}(X) := C^\infty(X, \IR)$ with the standard
  Fréchet topology (for $X$ finite-dimensional).
- $\mathcal{E}'(X)$ is the space of compactly supported
  distributions (continuous dual of $\mathcal{E}(X)$).
- $\mathcal{E}'(X; x)$ is the subspace of distributions
  supported at $x$.
- $\mathcal{E}'(X; x)_{\leq k}$ is its subspace of order
  $\leq k$.

**Definition (Point distributions).**

- For $\xi \in ST_k(X; x)$, the *point distribution*
  $\delta(x; \xi)$ is

    $$
    \langle \delta(x; \xi), f \rangle := D(f; x; \xi),
    \qquad f \in C^k(X, \IR).
    $$

    In particular $\delta(x; 1) = \delta(x)$ is evaluation
    at $x$.

- The map $\xi \mapsto \delta(x; \xi)$ is a linear
  isomorphism $ST_k(X; x) \xrightarrow{\sim}
  \mathcal{E}'(X; x)_{\leq k}$ (Schwartz structure theorem).

**Proposition (Measures embed in distributions).**
Restriction along $\mathcal{E}(X) \subseteq F(X)$ embeds the
finitely supported measures into the distributions as the
order-$0$ distributions with finite support. In particular,
every cube measure $\delta(x; c)$ [E0016] is a distribution.

**Proof.**
Evaluation $f \mapsto f(z)$ at a point $z$ is continuous on
$\mathcal{E}(X)$ and extends to $C^0(X, \IR)$, so a finitely
supported measure $\mu = \sum_i \lambda_i \delta(z_i)$ defines
a distribution of order $0$. The map is injective since the
$\delta(z_i)$ are linearly independent as functionals on
$\mathcal{E}(X)$.

**Theorem (Distribution pushforward).** For $\phi$ $C^k$
near $x$ and $\xi \in ST_k(X; x)$,

$$
\phi_* \delta(x; \xi) = \delta(y; D_+(\phi; x)\, \xi).
$$

**Proof.**
$\langle \phi_* \delta(x; \xi), f \rangle =
D(\phi^* f; x; \xi) = D(f; y; D_+(\phi; x)\, \xi) =
\langle \delta(y; D_+(\phi; x)\, \xi), f \rangle$ by the
smooth adjunction [E0028].

**Proposition (Filtration and principal symbol).**
$D_+(\phi; x)$ preserves the degree filtration, and on the
associated graded it is the symmetric power of the first
derivative:

$$
\gr_r\, D_+(\phi; x)
= \SYM^r(D(\phi; x)) : \SYM^r(E) \to \SYM^r(F).
$$

**Proof.**
A partition $\pi \in \Part(r)$ contributes in degree
$|\pi| \leq r$, with equality only for the partition into
singletons, whose term is $\prod_i D(\phi; x; v_i)$.
