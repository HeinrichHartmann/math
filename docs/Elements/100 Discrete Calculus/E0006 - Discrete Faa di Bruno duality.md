---
outline_enabled: false
id: E0006
title: Discrete Faà di Bruno duality
kind: theorem
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0004, E0005]
checked: [numeric, ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0006.lean
    theorems: [taylor_comp, covering_fdb]
published_at: [DFDB]
---

# E0006 — Discrete Faà di Bruno duality

The iterated forward difference $\Delta$ [E0004] of a composite
$f \circ g$ expands as a sum over coverings $\Cov(k)$ of the
direction set. Its Möbius dual is the Taylor composition, summed
over $\KP_+^2(k)$.

**Theorem.** Let $X, Y, Z$ be abelian groups, $g: X \to Y$ and
$f: Y \to Z$ arbitrary maps, $x \in X$,
$u_1, \dots, u_k \in X$. Write $y = g(x)$ and $z = f(y)$.

- *Boolean Faà di Bruno* ($k \geq 1$):

    $$
    \Delta(f \circ g; x; u_\bullet)
    = \sum_{H \in \Cov(k)}
      \Delta\bigl(f;\, y;\, (\Delta(g; x; u_T))_{T \in H}\bigr).
    $$

- *Boolean Taylor composition:*

    $$
    (f \circ g)(x + {\textstyle\sum_{i=1}^k} u_i)
    = z + \sum_{H \in \KP_+^2(k)}
      \Delta\bigl(f;\, y;\, (\Delta(g; x; u_T))_{T \in H}\bigr).
    $$

    All identities are exact with integer coefficients; no
    regularity is assumed on $f$ or $g$.

**Proof.**
Write $g_T := \Delta(g; x; u_T)$.

Ad 2) By Taylor duality [E0005],
$T(g; x; u_S) = y + \sum_{\emptyset \neq T \subseteq S} g_T$.
Applying Taylor duality to $f$ at $y$ in the directions
$(g_T)_{T \in \KP_+(S)}$ gives

$$
T(f \circ g; x; u_S)
= z + \sum_{H \in \KP_+^2(S)} \Delta(f; y; (g_T)_{T \in H}).
$$

Ad 1) Define
$\varphi(S) := \sum_{H \in \Cov(S)} \Delta(f; y; (g_T)_{T \in H})$.
By Möbius inversion [E0002] it suffices to show
$\zeta(\varphi; S) = T(f \circ g; x; u_S) - z$: the
$\mu$-transform of the right side is $\Delta(f \circ g; x; u_S)$
for $S \neq \emptyset$, the constant $z$ cancelling by
$(1-1)^{|S|} = 0$. Indeed,

$$
\zeta(\varphi; S)
= \sum_{R \subseteq S} \sum_{H \in \Cov(R)}
  \Delta(f; y; (g_T)_{T \in H})
= \sum_{H \in \KP_+^2(S)} \Delta(f; y; (g_T)_{T \in H}),
$$

since each $H \in \KP_+^2(S)$ appears in exactly one summand,
namely the one for $R = \bigcup H$. Now apply Ad 2).

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Proof logic, edge cases ($k = 1$, $k = 2$,
$g = \mathrm{id}$, additive $f$), combinatorial bijection
$\KP_+^2(S) = \bigsqcup_R \Cov(R)$, necessity of $k \geq 1$.
Made $z$-cancellation in the Möbius step explicit in the proof.
No issues found.
