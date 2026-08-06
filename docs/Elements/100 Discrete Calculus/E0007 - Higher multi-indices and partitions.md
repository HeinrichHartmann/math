---
outline_enabled: false
id: E0007
title: Higher multi-indices and partitions
kind: definition
status: established
visibility: public
notation: E0001
depends_on: []
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0007.lean
    definitions: [partitions, partitionWeight]
    note: "Partial: partitions and weight verified; iterated types (IterSet, IterIdx via Finsupp), leaf maps, and hprofile sketched in-file (unbuilt draft, HAR-40) — design: no bound, see Remark (Formalization)"
published_at: [DFDB]
---

# E0007 — Higher multi-indices and partitions

**Definition (Higher multi-indices).**

- $\KM(S)$ is the set of finitely supported maps $S \to \IN_0$,
  and $\KM_+(S) = \KM(S) \setminus \set{0}$. For finite $S$,
  $\KM(S) = \IN_0^S$.
- The *iterated multiset sets* are $\KM_+^0(S) = S$,
  $\KM_+^1(S) = \KM_+(S)$, and
  $\KM_+^{r+1}(S) := \KM_+(\KM_+^r(S))$ for $r \geq 1$.
- The *support* of $\kappa \in \KM_+^r(S)$ with $r \geq 1$ is
  $\supp(\kappa) := \set{\lambda \in \KM_+^{r-1}(S) :
  \kappa(\lambda) > 0}$.
- The *leaf multi-index* $\lf(\kappa) \in \KM(S)$ is defined
  recursively: $\lf(\alpha) := \alpha$ for $r = 1$ and
  $\lf(\kappa) := \sum_{\lambda \in \supp(\kappa)}
  \kappa(\lambda)\, \lf(\lambda)$ for $r \geq 2$.
- The *higher profile map*
  $\nu: \KP_+^m(S(\gamma)) \to \KM_+^m(S)$ is defined
  recursively: $\nu(T) \in \IN_0^S$ for $m = 1$ as the fiber
  measure, and
  $\nu(K)(\lambda) := \#\set{L \in K : \nu(L) = \lambda}$
  for $m \geq 2$.
- The embedding $\KP_+(S) \hookrightarrow \KM_+(S)$ via
  $T \mapsto 1_T$ extends to
  $\KP_+^r(S) \hookrightarrow \KM_+^r(S)$ at every level: the
  image consists of the iterated multi-indices of height one at
  every level (hereditarily height-one).

**Definition (Partitions and higher partitions).**

- A *partition* of a finite set $S$ is a set
  $\pi = \set{B_1, \dots, B_r}$ of nonempty pairwise disjoint
  subsets with $B_1 \sqcup \cdots \sqcup B_r = S$. Write
  $\Part(S)$ for the set of partitions and $\Part(k)$ for
  $\Part([k])$.
- The *higher partitions* are defined recursively:
  $\Part_1(S) = \set{S}$, and for $m \geq 1$,
  $\Part_{m+1}(S) := \set{\set{H_B}_{B \in \pi} \mid
  \pi \in \Part(S),\; H_B \in \Part_m(B)}$.
  For $m = 2$, $\Part_2(S) = \Part(S)$.
- The *weight* of $H \in \KP_+^r(S)$ is
  $\mathrm{wt}(H) := |H|$ for $r = 1$ and
  $\mathrm{wt}(H) := \sum_{K \in H} \mathrm{wt}(K)$ for
  $r \geq 2$.
- A *multi-index partition* of $\gamma \in \IN_0^S$ is an
  iterated multi-index $\kappa \in \KM_+^m(S)$ with
  $\lf(\kappa) = \gamma$; we write $\kappa \vdash \gamma$.
  For $m = 2$ this is a multiset $\kappa$ of nonzero
  multi-indices with
  $\sum_\beta \kappa(\beta)\, \beta = \gamma$.

**Remark (Uniform recursion).**
Both $\lf$ and $\nu$ become uniform structural recursions when
extended to level $0$. Setting $\lf(s) := 1_s$ for $s \in S$
makes the level-$1$ case a consequence of the recursion step:
$\lf(\alpha) = \sum_s \alpha(s)\, 1_s = \alpha$. Similarly, for
an arbitrary base map $q: S' \to S$ define $\nu_q$ on all levels
by $\nu_q(t) := q(t)$ for $t \in S'$ and, for
$K \in \KP_+^{r+1}(S')$,

$$
\nu_q(K)(\lambda) := \#\set{L \in K : \nu_q(L) = \lambda},
\qquad\text{equivalently}\qquad
\nu_q(K) = \sum_{L \in K} 1_{\nu_q(L)}.
$$

For $q = \pi: S(\gamma) \to S$ the level-$1$ case is the fiber
measure, recovering the higher profile map $\nu$ above; for
$q = \mathrm{id}_S$ the map $\nu_q$ is exactly the embedding
$\KP_+^r(S) \hookrightarrow \KM_+^r(S)$ of the last bullet.

**Lemma (Finiteness of multi-index partitions).** Let $S$ be a
finite set and $\gamma \in \IN_0^S$. For every $m \geq 1$ the set
$\set{\kappa \in \KM_+^m(S) : \lf(\kappa) \leq \gamma}$ is
finite. In particular, at every level there are only finitely
many multi-index partitions $\kappa \vdash \gamma$.

**Proof.**
First, $\lf(\kappa) \neq 0$ for all $\kappa \in \KM_+^m(S)$, by
induction on $m$: for $m = 1$, $\lf(\kappa) = \kappa \neq 0$;
for $m \geq 2$ there is $\lambda$ with
$\kappa(\lambda) \geq 1$, and
$\lf(\kappa) \geq \kappa(\lambda)\, \lf(\lambda) \neq 0$
componentwise.

Now induct on $m$. For $m = 1$ the set
$\set{\alpha : 0 \neq \alpha \leq \gamma}$ is finite since $S$
is. For $m + 1$: if $\lf(\kappa) \leq \gamma$, then every
$\lambda \in \supp(\kappa)$ satisfies
$\lf(\lambda) \leq \kappa(\lambda)\, \lf(\lambda)
\leq \lf(\kappa) \leq \gamma$, so $\supp(\kappa)$ lies in the
finite set of the induction hypothesis, and the multiplicities
are bounded by
$\kappa(\lambda) \leq \kappa(\lambda)\, |\lf(\lambda)|
\leq |\gamma|$ using $|\lf(\lambda)| \geq 1$. A finitely
supported map with finitely many admissible supports and bounded
values has finitely many possibilities.

**Remark (Formalization).**
$\KM_+^r(S)$ is infinite for $r \geq 1$ (multiplicities are
unbounded), but no bound is needed to formalize this node:

- Represent level-$r$ multi-indices as iterated finitely
  supported maps: level-$0$ objects are the elements of $S$, and
  level-$(r+1)$ objects are finitely supported
  $\IN_0$-valued maps on level-$r$ objects. Zero is included at
  the type level; nonzero-ness ($\KM_+$) is a side condition at
  use sites, exactly as $\emptyset$ is excluded from $\KP_+$.
- $\lf$ and $\nu_q$ are structural recursions over these types,
  in the uniform level-$0$-based form of the remark above.
  Counting $\nu_q(K)(\lambda)$ requires decidable equality of
  level-$r$ objects, which holds by the same levelwise
  recursion; the sum form
  $\nu_q(K) = \sum_{L \in K} 1_{\nu_q(L)}$ avoids the counting
  altogether.
- Sums indexed by $\set{\kappa \vdash \gamma}$ are finite by the
  lemma above; alternatively they can be realized as
  pushforwards along $\nu$ of sums over the finite sets
  $\KP_+^m(S(\gamma))$ or $\Cov_m(S(\gamma))$, so that
  $\KM_+^m(S)$ itself is never enumerated.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Recursion typings, uniform-recursion remark ($\nu_\pi$,
$\nu_{\mathrm{id}}$ cases), $\Part_2(S) = \Part(S)$, and the
finiteness lemma (support containment, multiplicity bound via
$|\lf(\lambda)| \geq 1$, edge case $\gamma = 0$). Two precision
fixes: codomain of $\lf$ is $\KM(S)$, and the Boolean image of
the levelwise embedding is the hereditarily height-one
multi-indices (top-level height one does not suffice for
$r \geq 2$). No other issues found.
