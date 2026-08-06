---
outline_enabled: false
id: E0020
title: Fréchet setting
kind: environment
status: established
visibility: public
depends_on: []
extends: E0001
checked: [ai]
published_at: [DFDB, FDB]
---

# E0020 — Fréchet setting

Standing notation for the smooth calculus. Extends the cubical
setting [E0001] with Banach spaces and Fréchet derivatives.

**Notation (Banach spaces).**

- A *Banach space* $E$ is a complete normed vector space over
  $\IR$.
- $\KL(E, F)$ is the Banach space of bounded linear maps
  $E \to F$ with operator norm
  $\|A\| = \sup_{\|v\| \leq 1} \|A(v)\|$.
- $\KL({}^k E, F)$ is the Banach space of bounded $k$-fold
  multilinear maps $E^{\times k} \to F$ with norm
  $\|A_k\| = \sup_{\|v_i\| \leq 1}
  \|A_k(v_1, \dots, v_k)\|$.
- $\KL^s({}^k E, F) \subset \KL({}^k E, F)$ is the subspace
  of symmetric multilinear maps.

**Definition (Fréchet differentiability).**

- A map $g: U \to F$ on an open $U \subset E$ is *Fréchet
  differentiable* at $x \in U$ if there exists
  $L \in \KL(E, F)$ such that

    $$
    \lim_{v \to 0}
    \frac{1}{\|v\|}\, \|\Delta(g; x; v) - L(v)\| = 0.
    $$

    The map $L$ is unique and written $D(g; x)$, so that
    $D(g; x; v) = L(v)$.

- A map $g$ is *$C^1$ on $U$* if $D(g; x)$ exists for every
  $x \in U$ and $x \mapsto D(g; x) \in \KL(E, F)$ is
  continuous.

- A map $g$ is *$C^k$ on $U$* if $g$ is $C^1$ and
  $x \mapsto D(g; x)$ is $C^{k-1}$. The $k$-th Fréchet
  differential is

    $$
    D^k(g; x; v_1, \dots, v_k)
    := D(z \mapsto D^{k-1}(g; z; v_1, \dots, v_{k-1});
    \, x;\, v_k).
    $$

    This is a symmetric $k$-linear form:
    $D^k(g; x) \in \KL^s({}^k E, F)$.

- For a multi-index $\alpha \in \IN_0^k$, write
  $D^\alpha(g; x; v_\bullet) :=
  D^{|\alpha|}(g; x; v_\bullet^{\times \alpha})$, where
  $v_\bullet^{\times \alpha}$ repeats $v_i$ a total of
  $\alpha_i$ times. By convention $D^0(g; x) := g(x)$.

**Definition (Taylor polynomial).**

- The *Taylor polynomial* of order $n$ of $g \in C^n(U, F)$
  at $x$ is

    $$
    T^n(g; x; v) := \sum_{\ell=0}^n
    \frac{1}{\ell!}\, D^\ell(g; x; v, \dots, v).
    $$

- The *reduced Taylor polynomial* is
  $T_*^n(g; x; v) := T^n(g; x; v) - g(x)$, so that
  $T_*^n(g; x; 0) = 0$.

- The *Taylor remainder* in Peano form is
  $R^n(g; x; v) := \Delta(g; x; v) - T_*^n(g; x; v)$;
  for $g \in C^n$ it satisfies
  $\|R^n(g; x; v)\| / \|v\|^n \to 0$ as $v \to 0$ [E0024].

**Convention (Maps and points).**

- $X, Y, Z$ denote Banach spaces; points are $x \in X$,
  $y \in Y$, $z \in Z$.
- $g: X \to Y$ and $f: Y \to Z$ are $C^n$ maps with
  $g(x) = y$, $f(y) = z$.
- Directions are $v_1, \dots, v_k \in X$.
- Explicit arguments over subscript notation:
  $D(g; x; v_1, \dots, v_k)$ not
  $D^k g(x)[v_1, \dots, v_k]$.
- Semicolons separate arguments of different kinds.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Definitions checked against standard Fréchet calculus and for
consistency with [E0001]/[E0004] ($\Delta$ reused, Banach
spaces are abelian groups). Fixed $D^{|\alpha|}$ in the
multi-index bullet, added the $D^0$ convention, attributed the
Peano decay to [E0024]. Symmetry of $D^k$ is classical
(accepted). Caveat: $T^n$ (Taylor polynomial) overloads the
translation $T^\alpha$ [E0004] across chapters.
