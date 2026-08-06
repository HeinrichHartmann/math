---
outline_enabled: false
id: E0015
title: Shift identities
kind: lemma
status: established
visibility: public
notation: E0001
depends_on: [E0004]
checked: [ai]
published_at: [DFDB]
---

# E0015 — Shift identities

The forward difference $\Delta$ [E0004] expands into subset sums
when the basepoint, or a direction slot, carries a sum of
vectors.

**Lemma.** For $f: X \to Y$, $x \in X$, $u_1, \dots, u_k \in X$,
and $w_1, \dots, w_m \in X$:

- *Basepoint shift.*

    $$
    \Delta(f; x + {\textstyle\sum_j} w_j; u_1, \dots, u_k)
    = \sum_{E \subseteq [m]}
      \Delta(f; x; (w_j)_{j \in E}, u_1, \dots, u_k).
    $$

    Each shift $w_j$ is independently "in" or "out" as an
    additional direction; $E = \emptyset$ recovers the
    unshifted term.

- *Direction shift.* For $m \geq 1$,

    $$
    \Delta(f; x; {\textstyle\sum_j} w_j, u_2, \dots, u_k)
    = \sum_{\emptyset \neq E \subseteq [m]}
      \Delta(f; x; (w_j)_{j \in E}, u_2, \dots, u_k).
    $$

    A slot carrying a sum expands over the *nonempty* subsets
    of its summands; by symmetry of $\Delta$ [E0004] the same
    holds in any slot. The simplest instance is
    $\Delta(f; x; u + w) = \Delta(f; x; u) + \Delta(f; x; w)
    + \Delta(f; x; u, w)$.

**Proof.**
Ad basepoint shift) For $m = 1$: by definition,
$\Delta(f; x; w, u_1, \dots, u_k)$ is the alternating sum
over $S \subseteq \set{0} \cup [k]$, which splits as the
terms with $0 \in S$ (giving $\Delta(f; x + w; u_\bullet)$)
minus those with $0 \notin S$ (giving
$\Delta(f; x; u_\bullet)$). Rearranging:
$\Delta(f; x + w; u_\bullet) = \Delta(f; x; u_\bullet)
+ \Delta(f; x; w, u_\bullet)$. For general $m$: induct on
$m$, shifting by one $w_j$ at a time. Each step doubles the
number of terms (each existing $E$ spawns $E$ and
$E \cup \set{j}$), giving the sum over all $E \subseteq [m]$.

Ad direction shift) Let $G(\cdot) := \Delta(f; \cdot;
u_2, \dots, u_k)$, so that $\Delta(f; x; v, u_2, \dots, u_k)
= G(x + v) - G(x)$ for any $v$. Then

$$
\Delta(f; x; {\textstyle\sum_j} w_j, u_2, \dots, u_k)
= G(x + {\textstyle\sum_j} w_j) - G(x)
= \sum_{E \subseteq [m]} \Delta(G; x; (w_j)_{j \in E})
  - G(x),
$$

by the basepoint shift applied to $G$. The $E = \emptyset$
term is the $0$-fold difference $G(x)$ and cancels; each
remaining term is
$\Delta(G; x; (w_j)_{j \in E})
= \Delta(f; x; (w_j)_{j \in E}, u_2, \dots, u_k)$:
subsets of the disjoint union $E \sqcup \set{2, \dots, k}$
factor as pairs, so both sides unfold to the same alternating
sum.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Verified both identities against the defining sum in [E0004] (signs
in the m = 1 split, induction step, slot-1 co-recursion); probed
m = 0, k = 0, and the m ≥ 1 hypothesis (E = ∅ term cancellation);
numeric check with $f(x) = x^3$, m = 2, k = 2. Added a one-line
justification for the composition step
$\Delta(G; x; w_E) = \Delta(f; x; w_E, u_2, \dots, u_k)$.
