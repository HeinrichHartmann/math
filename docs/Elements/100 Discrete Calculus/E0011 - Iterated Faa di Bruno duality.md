---
outline_enabled: false
id: E0011
title: Iterated Faà di Bruno duality
kind: theorem
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0004, E0005, E0006, E0007, E0009, E0010]
checked: [numeric, ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0011.lean
    theorems: [iter_taylor_comp, iter_covering_fdb]
published_at: [DFDB]
---

# E0011 — Iterated Faà di Bruno duality

The two-fold Faà di Bruno formula [E0006] extends to $m$-fold
compositions, indexed by higher coverings $\Cov_m(S)$ and iterated
increments $\Delta^K$ [E0009]; the binomial forms group by the
profile map $\nu$ on the higher multi-indices $\KM_+^m(S)$
[E0007].

**Theorem.** Let
$X_0 \xrightarrow{f_1} X_1 \xrightarrow{f_2} \cdots
\xrightarrow{f_m} X_m$ be arbitrary maps between abelian groups,
$x \in X_0$, and $z = (f_m \circ \cdots \circ f_1)(x)$. Let $S$
be a finite set, $u: S \to X_0$ a family of directions, and
$\gamma \in \IN_0^S$.

- *Boolean Faà di Bruno* ($S \neq \emptyset$):

    $$
    \Delta(f_m \circ \cdots \circ f_1;\, x;\, u_S)
    =
    \sum_{K \in \Cov_m(S)}
    \Delta^{K}(f_1, \dots, f_m;\, x;\, u).
    $$

- *Binomial Faà di Bruno* ($\gamma \neq 0$):

    $$
    \Delta(f_m \circ \cdots \circ f_1;\, x;\, u^\gamma)
    = \sum_{\kappa \in \KM_+^m(S)}
      \Cov_m(\gamma, \kappa)\,
      \Delta^{\kappa}(f_1, \dots, f_m;\, x;\, u),
    $$

    where
    $\Cov_m(\gamma, \kappa) =
    \#\set{K \in \Cov_m(S(\gamma)) : \nu(K) = \kappa}$
    counts $m$-fold coverings of $S(\gamma)$ with profile
    $\kappa$.

- *Boolean Taylor composition:*

    $$
    (f_m \circ \cdots \circ f_1)(x + {\textstyle\sum_{s \in S}} u_s)
    = z + \sum_{K \in \KP_+^m(S)}
      \Delta^{K}(f_1, \dots, f_m;\, x;\, u).
    $$

- *Binomial Taylor composition:*

    $$
    (f_m \circ \cdots \circ f_1)(x + {\textstyle\sum_s} \gamma_s u_s)
    = z + \sum_{\kappa \in \KM_+^m(S)}
      \mathrm{Pow}_m(\gamma, \kappa)\,
      \Delta^{\kappa}(f_1, \dots, f_m;\, x;\, u),
    $$

    where
    $\mathrm{Pow}_m(\gamma, \kappa) =
    \#\set{K \in \KP_+^m(S(\gamma)) : \nu(K) = \kappa}$
    counts $m$-fold iterated subsets of $S(\gamma)$ with profile
    $\kappa$.

    All identities are exact with integer coefficients; no
    regularity is assumed on any $f_r$.

**Proof.**
Ad 3) By induction on $m$. The cases $m = 1$ and $m = 2$ are
Taylor duality [E0005] and the two-fold Faà di Bruno [E0006].
Write $F = f_m \circ \cdots \circ f_1$,
$F' = f_{m-1} \circ \cdots \circ f_1$,
$x_r = (f_r \circ \cdots \circ f_1)(x)$, and
$d_K := \Delta^K(f_1, \dots, f_{m-1};\, x;\, u)$ for
$K \in \KP_+^{m-1}(S)$. The induction hypothesis gives
$F'(x + \sum_{s \in S} u_s) =
x_{m-1} + \sum_{K \in \KP_+^{m-1}(S)} d_K$. Applying Taylor
duality [E0005] to $f_m$ at $x_{m-1}$ in directions $d_K$:

$$
F(x + {\textstyle\sum_{s \in S}} u_s)
= x_m + \sum_{H \in \KP_+(\KP_+^{m-1}(S))}
  \Delta(f_m;\, x_{m-1};\, (d_K)_{K \in H}).
$$

Since $\KP_+(\KP_+^{m-1}(S)) = \KP_+^m(S)$ and
$\Delta(f_m;\, x_{m-1};\, (d_K)_{K \in H}) =
\Delta^H(f_1, \dots, f_m;\, x;\, u)$ by [E0009], this completes
the induction.

Ad 1) Define
$\varphi(R) := \sum_{H \in \Cov_m(R)} \Delta^H$ for
$R \subseteq S$. By Möbius inversion [E0002], it suffices to show
$\zeta(\varphi; R) = T(F; x; u_R) - z$: the $\mu$-transform of
the right side is $\Delta(F; x; u_R)$ for $R \neq \emptyset$,
the constant $z$ cancelling by $(1-1)^{|R|} = 0$. Indeed,
$\zeta(\varphi; R) = \sum_{Q \subseteq R}
\sum_{H \in \Cov_m(Q)} \Delta^H =
\sum_{H \in \KP_+^m(R)} \Delta^H$, since each
$H \in \KP_+^m(R)$ covers exactly $Q = \lf(H)$. Now apply Ad 3).

Ad 2,4) Apply Ad 1) and Ad 3) to $S(\gamma)$. By profile
invariance [E0010], $\Delta^{K}$ depends only on the profile
$\kappa = \nu(K)$, so grouping gives
$\sum_\kappa \Cov_m(\gamma, \kappa)\, \Delta^{\kappa}$ for the
Faà di Bruno side and
$\sum_\kappa \mathrm{Pow}_m(\gamma, \kappa)\, \Delta^{\kappa}$
for the Taylor side.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
All four parts and the induction in Ad 3); covering bijection in
Ad 1); coefficients checked numerically ($m = 1$,
$\gamma = 2\cdot 1_s$: $\mathrm{Pow} = 2, 1$ matches
$(\gamma)_\beta/\beta!$ [E0005]); edge cases $S = \emptyset$
(parts 3, 4 hold), $m = 2$ reduces to [E0006]. Found and fixed a
missing hypothesis: part 2 requires $\gamma \neq 0$ (at
$\gamma = 0$ the left side is $z$, the right side $0$); part 4
holds for all $\gamma$. Also made the $z$-cancellation in Ad 1)
explicit.
