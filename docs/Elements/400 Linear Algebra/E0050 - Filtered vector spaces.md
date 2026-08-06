---
outline_enabled: false
id: E0050
title: Filtered vector spaces
kind: definition
status: established
visibility: public
depends_on: []
published_at: [DDC]
---

# E0050 — Filtered vector spaces

**Definition (Filtered vector spaces).**

- A *filtered vector space* $S$ is a vector space with a
  decreasing filtration $(F^k S)_{k \in \IZ}$:
  $\cdots \supset F^{-1} \supset F^0 \supset F^1 \supset \cdots$

- A *morphism* $f: S \to T$ of filtered spaces is a linear map
  with $f(F^k S) \subseteq F^k T$ for all $k$.

- The *degree shift* $S[m]$ has $F^k(S[m]) = F^{k+m} S$.

**Definition (Associated constructions).**

- The *$k$-th graded piece* is $\gr^k(S) = F^k S / F^{k+1} S$.
- The *associated graded* is
  $\gr(S) = \bigoplus_k \gr^k(S)$.
- The *completion* is
  $\hat{S} = \varprojlim_k S / F^k S$.
- The filtration is *separated* if $\bigcap_k F^k S = \set{0}$,
  in which case $S \hookrightarrow \hat{S}$.

**Definition (Tensor product and inner Hom).**

- The filtered tensor product $S \otimes T$ has
  $F^k(S \otimes T) = \sum_{a+b=k} F^a S \otimes F^b T$.

- The *inner Hom* $\Hom^k(S, T) =
  \set{f: S \to T \mid f(F^p S) \subseteq F^{p+k} T}$.

- The *filtered dual* is $S^\vee = \Hom^\bullet(S, \IR[0])$
  with $(S^\vee)^k = \set{f: S \to \IR \mid f(F^{1-k} S) = 0}$
  and total space
  $S^\vee = \set{f: S \to \IR \mid \exists k: f(F^k S) = 0}$.

**Proposition (Completion).**

- $\gr_k \hat{S} = \gr_k S$ (completion preserves graded
  pieces).
- $\hat{S}^\vee = S^\vee$ (filtered dual is insensitive to
  completion).

**Proof.**
Ad graded pieces) The exact sequence
$0 \to F^{k+1}/F^n \to F^k/F^n \to F^k/F^{k+1} \to 0$
has surjective transition maps; passing to projective limits
stays exact (Mittag-Leffler), giving
$\gr_k \hat{S} \cong F^k/F^{k+1} = \gr_k S$.

Ad dual) An element $a \in \hat{S}^\vee$ vanishes on some
$F^k \hat{S}$; since $F^k S \subseteq F^k \hat{S}$, it lies
in $S^\vee$. Conversely, $a \in S^\vee$ factors through
$S/F^k$ and hence extends to $\hat{S}$.

**Proposition (Filtered adjunction).** For a filtered map
$f: S \to T$ there is a unique adjoint
$f^\vee: T^\vee \to S^\vee$ with
$(f(a), b) = (a, f^\vee(b))$, and $f^\vee$ is filtered of
degree $0$.

**Proof.**
Set $f^\vee(b)(a) := b(f(a))$. Since $f$ preserves the
filtration, $f^\vee$ maps $(T^\vee)^m$ into $(S^\vee)^m$.
Uniqueness by non-degeneracy of the pairing.
