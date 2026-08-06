---
outline_enabled: false
id: E0009
title: Iterated increments
kind: definition
status: established
visibility: public
notation: E0001
depends_on: [E0004, E0007]
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0009.lean
    definitions: [chainPt, iterFwdDiff]
published_at: [DFDB]
---

# E0009 — Iterated increments

The iterated increment $\Delta^K$ for a chain of maps applies the forward difference $\Delta$ [E0004] recursively, indexed by the higher power sets $\KP_+^r(S)$ and iterated multi-indices $\KM_+^r(S)$ [E0007].

**Definition.** Let
$X_0 \xrightarrow{f_1} X_1 \xrightarrow{f_2} \cdots
\xrightarrow{f_m} X_m$ be maps between abelian groups,
$x \in X_0$, and $u: S \to X_0$ a direction family on a
finite set $S$.

- The *chain points* $x_r \in X_r$ are defined by $x_0 := x$
  and $x_r := f_r(x_{r-1})$, so
  $x_r = (f_r \circ \cdots \circ f_1)(x)$.
- The *Boolean iterated increment*
  $\Delta^{K}(f_1, \dots, f_r;\, x;\, u) \in X_r$ for
  $K \in \KP_+^r(S)$, $1 \leq r \leq m$, is defined by recursion
  on $r$. For $r = 1$ and $T \in \KP_+(S)$,

    $$
    \Delta^{T}(f_1;\, x;\, u) := \Delta(f_1;\, x;\, u_T),
    $$

    and for $r \geq 2$ and $K \in \KP_+^{r}(S)$,

    $$
    \Delta^{K}(f_1, \dots, f_r;\, x;\, u)
    :=
    \Delta(f_r;\, x_{r-1};\,
    (\Delta^{L}(f_1, \dots, f_{r-1};\, x;\, u))_{L \in K}).
    $$

    The outer $\Delta$ is a forward difference on $X_{r-1}$, with
    index set $K$ and one direction
    $\Delta^{L}(f_1, \dots, f_{r-1};\, x;\, u) \in X_{r-1}$ per
    member $L \in K$.

- The *binomial iterated increment*
  $\Delta^{\kappa}(f_1, \dots, f_r;\, x;\, u) \in X_r$ for
  $\kappa \in \KM_+^r(S)$ is defined by the same recursion. For
  $r = 1$ and $\alpha \in \KM_+(S)$,

    $$
    \Delta^{\alpha}(f_1;\, x;\, u) := \Delta(f_1;\, x;\, u^{\alpha}),
    $$

    and for $r \geq 2$ and $\kappa \in \KM_+^{r}(S)$,

    $$
    \Delta^{\kappa}(f_1, \dots, f_r;\, x;\, u)
    :=
    \Delta(f_r;\, x_{r-1};\,
    (\Delta^{\lambda}(f_1, \dots, f_{r-1};\, x;\, u)
    ^{\times \kappa(\lambda)})_{\lambda \in \supp(\kappa)}),
    $$

    where the direction family is indexed by the finite set
    $\set{(\lambda, i) : \lambda \in \supp(\kappa),\;
    1 \leq i \leq \kappa(\lambda)}$, with the direction
    $\Delta^{\lambda}(f_1, \dots, f_{r-1};\, x;\, u)$ in every
    slot $(\lambda, i)$. The Boolean case is recovered by
    restriction along the levelwise embedding
    $\KP_+^r(S) \hookrightarrow \KM_+^r(S)$.

**Remark (Recursion structure).**
Write $\Delta^{(r)}: \KP_+^r(S) \to X_r$ for the map
$K \mapsto \Delta^K(f_1, \dots, f_r;\, x;\, u)$. The definition
then reads: $\Delta^{(1)}(T) = \Delta(f_1;\, x;\, u_T)$, and

$$
\Delta^{(r+1)}(K) = \Delta(f_{r+1};\, x_r;\, \Delta^{(r)}|_K),
$$

a single application of the level-one operator [E0004], with base
point $x_r$, index set $K$, and direction family the restriction
of the previous level to the members of $K$. Since $\Delta$ is
invariant under permutation of its directions [E0004], the value
of a set-indexed family is well defined; explicitly,

$$
\Delta(f_{r+1};\, x_r;\, (d_L)_{L \in K})
= \sum_{I \subseteq K} (-1)^{|K| - |I|}\,
  f_{r+1}(x_r + {\textstyle\sum_{L \in I}}\, d_L).
$$

Chain points and increments are consumed one map at a time: level
$r$ uses only $f_1, \dots, f_r$, so both $x_r$ and
$\Delta^{(r)}$ are structural recursions on $r$ over the
truncated chain.

**Remark (Formalization).**
No boundedness assumptions are required, even though
$\KM_+^r(S)$ is infinite for nonempty $S$ and $r \geq 1$
[E0007].

- Represent levels by iterated types: level-$0$ objects are the
  elements of $S$; level-$(r+1)$ objects are the finite subsets
  (Boolean case) resp. the finitely supported multi-indices
  (binomial case) of level-$r$ objects. The sets $\KP_+^r(S)$
  and $\Cov_r(S)$ are finite subsets of the level-$r$ type, but
  the recursion never enumerates them.
- Formalize the level-one operator as $\Delta(g;\, y;\, v;\, K)$,
  where $v: J \to X$ is a *total* direction family on an index
  type $J$ with decidable equality and $K$ a finite subset of
  $J$; the value depends only on $v|_K$. The recursive step is
  then the literal reapplication of this operator at the next
  index type, with the total function $\Delta^{(r)}$ as direction
  family. This is how the case $m = 2$ already appears in the
  proof of the two-fold formula [E0006]: the nested difference of
  $f_2$ in the directions $\Delta^{(1)}$ requires no new
  definition.
- For the binomial increment only the finite support of $\kappa$
  enters: the direction family lives on the finite index set
  $\set{(\lambda, i) : \lambda \in \supp(\kappa),\;
  1 \leq i \leq \kappa(\lambda)}$. For $r = 1$ this index set is
  the Boolean realization $S(\alpha)$ with directions
  $u \circ \pi$, consistent with $u^{\alpha}$ [E0004].
- Identities summing over $\kappa \in \KM_+^m(S)$ have finitely
  supported summands: only multi-index partitions
  $\kappa \vdash \gamma$ contribute, and these form a finite set
  at every level [E0007].

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Typing and well-foundedness of both recursions against [E0004]/[E0007],
base/step consistency, Boolean restriction via the levelwise embedding
(injectivity gives multiplicity-one slots), alternating-sum display,
and the Formalization remark against the E0007 finiteness lemma and
the $m=2$ case in E0006. Edge cases: $S = \emptyset$, singleton $K$,
$m = 1$, single-support $\kappa$. Three precision fixes: $S$ finite,
embedding $\hookrightarrow$ instead of $\subset$, nonempty-$S$
qualifier on infiniteness.
