---
outline_enabled: false
id: E0001
title: Cubical setting on abelian groups
kind: environment
status: established
visibility: public
depends_on: []
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0001.lean
    definitions: [powPlus, coverings]
published_at: [DFDB]
---

# E0001 — Cubical setting on abelian groups

Standing notation for the discrete Möbius calculus. Statement nodes
import this environment; no result is asserted here.

**Notation (Sets, cubes, grids).**

- $[n] = \set{1, \dots, n}$ is the standard index set.
- $\KP(S)$ is the power set of a finite set $S$.
- $\KP_+(S) = \KP(S) \setminus \set{\emptyset}$ is the set of
  nonempty subsets; $\KP(n) = \KP([n])$.
- A *cube* in $X$ is a map $a: \KP(S) \to X$; it has $2^{|S|}$
  vertices $a(T)$ and legs $a(\set{i})$.
- A *grid* in $X$ is a map $A: \IN_0^S \to X$; the points $A(1_T)$
  for $T \subseteq S$ form its coordinate cube.

**Notation (Multi-indices).**

- A *multi-index* on a finite set $S$ is $\alpha \in \IN_0^S$, with
  componentwise partial order $\beta \leq \alpha$.
- The *weight* is $|\alpha| = \mathrm{wt}(\alpha) = \sum_s \alpha_s$.
- The *height* is $\mathrm{ht}(\alpha) = \max_s \alpha_s$.
- The *factorial* is $\alpha! = \prod_s \alpha_s!$.
- The *falling factorial* is
  $(\alpha)_\beta = \prod_s (\alpha_s)_{\beta_s}$, where
  $(n)_r = n(n-1)\cdots(n-r+1)$.
- The *Boolean realization* of $\alpha \in \IN_0^S$ is the finite set
  $S(\alpha) = \set{(s,i) : s \in S,\ 0 < i \leq \alpha_s}$, with
  projection $\pi: S(\alpha) \to S$.
- The *fiber measure* of a map $q: S' \to S$ of finite sets is
  $\nu(q) \in \IN_0^S$, $\nu(q)_s = |q^{-1}(s)|$; in particular
  $\nu(\pi) = \alpha$.
- $\KP(S) \hookrightarrow \IN_0^S$ via $U \mapsto 1_U$; the image
  consists of the multi-indices of height $\leq 1$.

**Notation (Higher power sets and coverings).**

- The *higher power sets* are defined recursively:
  $\KP_+^0(S) = S$, $\KP_+^1(S) = \KP_+(S)$, and
  $\KP_+^r(S) := \KP_+(\KP_+^{r-1}(S))$ for $r \geq 2$.
- The *leaf support* $\lf(K) \subseteq S$ for
  $K \in \KP_+^r(S)$ is defined recursively: $\lf(K) := K$ for
  $r = 1$ and $\lf(K) := \bigcup_{L \in K} \lf(L)$ for $r \geq 2$.
- The set of *$r$-fold coverings*, for $r \geq 1$, is
  $\Cov_r(S) := \set{K \in \KP_+^r(S) \mid \lf(K) = S}$.
- For $S = [k]$, we write $\KP_+^r(k)$ and $\Cov_r(k)$.
- $\Cov(S) := \Cov_2(S)$ is the set of *coverings* of $S$.

**Convention (Maps and points).**

- $X, Y, Z$ denote abelian groups; points are $x \in X$,
  $y \in Y$, $z \in Z$.
- $g: X \to Y$ and $f: Y \to Z$ are arbitrary maps (no linearity,
  continuity, or regularity assumed), with $g(x) = y$, $f(y) = z$.
- Directions are $u_1, \dots, u_k \in X$; formulas evaluate maps
  only at points $x + \sum_{i \in S} u_i$, so domains may be
  commutative monoids where noted.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Checked every bullet for internal consistency and the in-line
claims ($\nu(\pi) = \alpha$, image of $U \mapsto 1_U$ = height
$\leq 1$, $2^{|S|}$ vertices); edge cases $S = \emptyset$
($\KP_+^r(\emptyset) = \Cov_r(\emptyset) = \emptyset$), $r = 1$
boundary of both recursions, $\alpha = 0$; spot-checked symbol
usage in E0006–E0008, E0011. Two minor fixes: restricted
$\Cov_r$ to $r \geq 1$ (leaf support is undefined at $r = 0$)
and defined $\Cov(S)$ for general $S$ (E0006 uses it).
