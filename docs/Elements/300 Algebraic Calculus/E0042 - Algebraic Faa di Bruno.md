---
outline_enabled: false
id: E0042
title: Algebraic Faà di Bruno
kind: theorem
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0008, E0040, E0041]
published_at: [DFDB]
---

# E0042 — Algebraic Faà di Bruno

The Faà di Bruno formula in the Taylor algebras [E0040]:
coverings in $B_k$, partitions in $A_k$, and the deformation
in $C_k$ that interpolates between them.

**Theorem (Boolean Faà di Bruno in $B_k$ and $A_k$).** Let
$q: \ik^e \to \ik^d$ and $p: \ik^d \to \ik$ be polynomials,
$x \in \ik^e$, $v_1, \dots, v_k \in \ik^e$, $y = q(x)$.

- In $B_k$ (coverings):

    $$
    \Delta(p \circ q; x; v_{[k]})
    = \sum_{\substack{H \subseteq \KP_+([k]) \\
    \bigcup H = [k]}}
    \Delta(p; y; (\Delta(q; x; v_T))_{T \in H}).
    $$

- In $A_k$ (partitions):

    $$
    D(p \circ q; x; v_{[k]})
    = \sum_{\pi \in \Part([k])}
    D(p; y; (D(q; x; v_B))_{B \in \pi}).
    $$

**Proof.**
Write $q_T := \Delta(q; x; v_T)$. By Taylor–Möbius duality
[E0041] in $B_k$,
$q(x + \sum_i \delta_i v_i) = y + \sum_T q_T \delta^T$.
Since $(\delta^T)^2 = \delta^T$, the map
$\delta_T \mapsto \delta^T$ defines an algebra map
$B_l \to B_k$ with $l = 2^k - 1$ directions $q_T$. Applying
Taylor–Möbius duality to $p$ at $y$ via this map:
$(p \circ q)(x + \sum_i \delta_i v_i) =
p(y + \sum_T q_T \delta^T)$. Extracting $[\delta^{[k]}]$:
the covering condition $\bigcup H = [k]$ comes from
$\delta^{T_1} \cdots \delta^{T_r} = \delta^{T_1 \cup \cdots \cup T_r}$.

The same argument in $A_k$: since $(\eps^T)^2 = 0$, the
product $\eps^{T_1} \cdots \eps^{T_r} = 0$ unless the $T_i$
are pairwise disjoint. Coverings reduce to partitions.

**Theorem (Faà di Bruno deformation).** With the same setup,
write $c_S(t)$ for the $x^S$-coefficient of
$(p \circ q)(x + \sum_i v_i x_i) \in C_k$. Then

$$
c_S(t) = \frac{1}{t^{|S|}}
\sum_{\substack{H \subseteq \KP_+(S) \\ \bigcup H = S}}
\Delta(p; y; (\Delta(q; x; (tv_i)_{i \in T}))_{T \in H}).
$$

Each covering summand is divisible by $t^{\mathrm{wt}(H)}$,
so $c_S \in \ik[t]$. At $t = 0$ only partitions survive
(weight bound [E0008]):

$$
c_S(0) = \sum_{\pi \in \Part(S)}
D(p; y; (D(q; x; v_B))_{B \in \pi}).
$$

**Proof.**
By Taylor–Möbius duality in $C_k$ [E0041],
$c_S(t) = t^{-|S|} \Delta(p \circ q; x; (tv_i)_{i \in S})$.
The discrete covering formula, applied over $\ik[t]$, expands
this as
$t^{-|S|} \sum_{H \in \Cov(S)}
\Delta(p; y; (\Delta(q; x; (tv_i)_T))_{T \in H})$.
Each inner increment $\Delta(q; x; (tv)_T)$ is divisible by
$t^{|T|}$ by the $C_k$ duality [E0041]. The outer difference
$\Delta(p; y; w_1, \dots, w_r)$ vanishes on every hyperplane
$w_j = 0$, so substituting $w_j = t^{|T_j|} \tilde{q}_{T_j}$
extracts $t^{\mathrm{wt}(H)}$. At $t = 0$, terms with
$\mathrm{wt}(H) > |S|$ vanish; the remaining terms have
$\mathrm{wt}(H) = |S|$, i.e. $H \in \Part(S)$ [E0008]. For
a partition $\pi$, the multilinear part of the substituted
difference is $D(p; y; (D(q; x; v_B))_{B \in \pi})$ by
the multinomial theorem in $A_k$ (nilpotent generators kill
all non-multilinear monomials).
