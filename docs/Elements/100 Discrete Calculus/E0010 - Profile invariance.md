---
outline_enabled: false
id: E0010
title: Profile invariance
kind: lemma
status: established
visibility: public
notation: E0001
depends_on: [E0004, E0007, E0009]
checked: [ai]
published_at: [DFDB]
---

# E0010 — Profile invariance

The iterated increment $\Delta^K$ [E0009] of a chain of maps depends only on the profile $\nu(K)$, not on the particular Boolean realization $K \in \KP_+^m(S(\gamma))$.

**Lemma.** Let
$X_0 \xrightarrow{f_1} \cdots \xrightarrow{f_m} X_m$ be maps
between abelian groups, $x \in X_0$, $\gamma \in \IN_0^S$, and
let $u: S \to X_0$ be a direction family; equip $S(\gamma)$ with
the slot directions $u \circ \pi$. Then for every
$K \in \KP_+^m(S(\gamma))$,

$$
\Delta^K(f_1, \dots, f_m;\, x;\, u \circ \pi)
= \Delta^{\nu(K)}(f_1, \dots, f_m;\, x;\, u).
$$

**Proof.**
Ad $m = 1$) For $T \subseteq S(\gamma)$, the direction list
$(u_{\pi(t)})_{t \in T}$ is a permutation of $u^{\nu(T)}$, so
the claim is permutation invariance of $\Delta$ [E0004].

Ad $m \geq 2$) Apply the induction hypothesis to each $L \in K$:
$\Delta^L = \Delta^{\nu(L)}$. In the outer difference, exactly
$\nu(K)(\lambda) = \#\set{L \in K : \nu(L) = \lambda}$ of the
directions equal $\Delta^\lambda$, so up to a permutation of the
directions [E0004] this is the defining expression for
$\Delta^{\nu(K)}$ [E0009].

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Both cases; multiset bookkeeping
$|K| = \sum_\lambda \nu(K)(\lambda)$; edge case $\gamma = 0$
(vacuous). Fixed an undefined $\kappa$ in the proof and added
the chain hypotheses to the statement. No issues remain.
