---
outline_enabled: false
id: E0012
title: Coefficient recursions
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: [E0003, E0007, E0011]
checked: [ai]
published_at: [DFDB]
---

# E0012 — Coefficient recursions

The iterated Faà di Bruno formula [E0011] has two coefficient
systems — the Taylor-side (Newton) coefficients
$\mathrm{Pow}_m(\gamma, \kappa)$ and the difference-side
(covering) coefficients $\Cov_m(\gamma, \kappa)$ — both
computable by level recursion in $m$. The factorial extends to
higher multi-indices [E0007] verbatim:
$\kappa! = \prod_{\lambda \in \supp(\kappa)} \kappa(\lambda)!$.

**Definition (Taylor coefficients).** For
$\gamma \in \IN_0^S$ and $\kappa \in \KM_+^m(S)$, define
$C_m(\gamma, \kappa)$ recursively:

- $C_1(\gamma, \alpha) = (\gamma)_\alpha / \alpha!$ for
  $\alpha \in \KM_+(S)$ (zero unless $\alpha \leq \gamma$).
- For $m \geq 1$ and $\kappa \in \KM_+^{m+1}(S)$:

    $$
    C_{m+1}(\gamma, \kappa)
    = \frac{1}{\kappa!}
      \prod_{\lambda \in \supp(\kappa)}
      (C_m(\gamma, \lambda))_{\kappa(\lambda)}.
    $$

The coefficient $C_m(\gamma, \kappa)$ counts
$\mathrm{Pow}_m(\gamma, \kappa) =
\#\set{K \in \KP_+^m(S(\gamma)) : \nu(K) = \kappa}$,
the number of $m$-fold iterated subsets of $S(\gamma)$ with
profile $\kappa$.

**Proposition (Newton coefficient recursion).** The Taylor
coefficients satisfy the level recursion above, with
$\mathrm{Pow}_m(\gamma, \kappa) = C_m(\gamma, \kappa)$.

**Proof.**
Ad $m = 1$)
$\mathrm{Pow}_1(\gamma, \alpha) =
\#\set{T \subseteq S(\gamma) : \nu(T) = \alpha} =
(\gamma)_\alpha / \alpha!$, counting subsets with profile
$\alpha$.

Ad $m \geq 2$) An element $K \in \KP_+^m(S(\gamma))$ is a
nonempty collection of elements of $\KP_+^{m-1}(S(\gamma))$.
The profile $\kappa$ records
$\kappa(\lambda) = \#\set{L \in K : \nu(L) = \lambda}$.
These are chosen as a set (no repeats) from
$\mathrm{Pow}_{m-1}(\gamma, \lambda)$ available elements with
profile $\lambda$, so the count is
$\prod_\lambda (\mathrm{Pow}_{m-1}(\gamma, \lambda))_{\kappa(\lambda)}
/ \kappa(\lambda)!$.

**Proposition (Covering coefficient recursion).** The
difference-side coefficients $\Cov_m(\gamma, \kappa) =
\#\set{K \in \Cov_m(S(\gamma)) : \nu(K) = \kappa}$ satisfy:

- *Cross recursion* ($\Cov_m$ from $\mathrm{Pow}_m$):

    $$
    \Cov_m(\gamma, \kappa)
    = \sum_{\beta \leq \gamma}
      (-1)^{\mathrm{wt}(\gamma - \beta)}\,
      \frac{(\gamma)_\beta}{\beta!}\,
      \mathrm{Pow}_m(\beta, \kappa).
    $$

- *Level recursion* ($\Cov_m$ from $\Cov_{m-1}$, $m \geq 2$):

    $$
    \Cov_m(\gamma, \kappa)
    = \sum_{\beta \leq \gamma}
      (-1)^{\mathrm{wt}(\gamma - \beta)}\,
      \frac{(\gamma)_\beta}{\beta!}\,
      \frac{1}{\kappa!}
      \prod_{\lambda \in \supp(\kappa)}
      \left(\sum_{\alpha \leq \beta}
      \frac{(\beta)_\alpha}{\alpha!}\,
      \Cov_{m-1}(\alpha, \lambda)
      \right)_{\!\kappa(\lambda)}.
    $$

**Proof.**
Ad cross recursion) Each $K \in \KP_+^m(S(\gamma))$ with
profile $\kappa$ has leaf support $\lf(K) \subseteq S(\gamma)$.
Each subset $R \subseteq S(\gamma)$ with $\nu(R) = \beta$
supports $\Cov_m(\beta, \kappa)$ coverings with profile
$\kappa$ — a fiberwise bijection $R \cong S(\beta)$ over $S$
transports coverings and preserves profiles at every level —
and there are $(\gamma)_\beta / \beta!$ such subsets [E0003].
Hence
$\mathrm{Pow}_m(\gamma, \kappa) =
\sum_{\beta \leq \gamma}
((\gamma)_\beta / \beta!)\, \Cov_m(\beta, \kappa)$.
Binomial Möbius inversion [E0003] gives the stated formula.

Ad level recursion) Substitute the Newton recursion
$\mathrm{Pow}_m(\beta, \kappa) =
(1/\kappa!) \prod_\lambda
(\mathrm{Pow}_{m-1}(\beta, \lambda))_{\kappa(\lambda)}$
into the cross recursion, then replace
$\mathrm{Pow}_{m-1}(\beta, \lambda) =
\sum_{\alpha \leq \beta}
((\beta)_\alpha / \alpha!)\, \Cov_{m-1}(\alpha, \lambda)$,
which is the zeta inverse of the cross recursion at level
$m - 1$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Checked both recursions against the counting definitions and the
transport step $R \cong S(\beta)$; numeric spot check $m = 2$,
$\gamma = 2 \cdot 1_s$ (all seven $K$, partition profiles match
Constantine–Savits $\gamma!/(\kappa! \prod_\alpha
(\alpha!)^{\kappa(\alpha)})$); edge cases $\gamma = 0$, $m = 1$,
$S = \emptyset$. Fixed: recursion index $m \geq 2$ to
$m \geq 1$ (else $C_2$ undefined), added $m \geq 2$ to the level
recursion, introduced $\kappa!$ for higher multi-indices, removed
unused E0009 dependency.
