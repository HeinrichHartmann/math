---
outline_enabled: false
id: E0043
title: Iterated algebraic Faà di Bruno
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: [E0007, E0040, E0042]
published_at: [DFDB]
---

# E0043 — Iterated algebraic Faà di Bruno

The algebraic Faà di Bruno [E0042] extends to $m$-fold
compositions of polynomial maps, indexed by higher partitions
$\Part_m(k)$ [E0007] in $A_k$.

**Proposition (Iterated infinitesimal Faà di Bruno).** Let
$f_1, \dots, f_m$ be polynomial maps with
$f_r: \ik^{d_{r-1}} \to \ik^{d_r}$, $x \in \ik^{d_0}$,
$v_1, \dots, v_k \in \ik^{d_0}$, and
$x_r = (f_r \circ \cdots \circ f_1)(x)$.

- *Boolean form:*

    $$
    D(f_m \circ \cdots \circ f_1; x; v_\bullet)
    = \sum_{H \in \Part_m(k)}
      D^H(f_1, \dots, f_m; x; v_\bullet).
    $$

- *Binomial form.* For $\gamma \in \IN_0^k$:

    $$
    D^\gamma(f_m \circ \cdots \circ f_1; x; v_\bullet)
    = \sum_{\kappa \in \KM_+^m(k)}
      \Part_m(\gamma, \kappa)\,
      D^\kappa(f_1, \dots, f_m; x; v_\bullet).
    $$

Here $D^H$ and $D^\kappa$ are the iterated differentials
[E0021] for polynomial maps, and
$\Part_m(\gamma, \kappa) =
\#\set{H \in \Part_m(S(\gamma)) : \nu(H) = \kappa}$.

**Proof.**
Ad Boolean) Evaluate $f_m \circ \cdots \circ f_1$ on the
infinitesimal cube $(x + \sum_i \eps_i v_i)$ in $A_k$ by
composing $m$ Taylor–Möbius expansions [E0041]. At each
level, the nilpotent multiplication
$\eps^{T_1} \cdots \eps^{T_p} = 0$ unless the $T_i$ are
pairwise disjoint forces partition logic: only higher
partitions $H \in \Part_m(k)$ contribute. Reading off the
$\eps^{[k]}$-component gives the scalar identity.

Ad Binomial) Apply the Boolean form to $S(\gamma)$ with
$|\gamma|$ directions where $v_i$ is repeated $\gamma_i$
times. Since $D^H$ depends only on the profile
$\kappa = \nu(H)$ by symmetry of the derivatives, grouping by
profile gives the stated sum with coefficient
$\Part_m(\gamma, \kappa)$.

**Proposition (Partition coefficient recursion).**
$\Part_m(\gamma, \kappa) = 0$ unless $\kappa \vdash \gamma$,
and $\Part_1(\gamma, \alpha) = \delta_{\gamma, \alpha}$. For
$m \geq 2$ and $\kappa \vdash \gamma$:

$$
\Part_m(\gamma, \kappa) = \frac{\gamma!}{\kappa!}
\prod_{\beta \in \supp(\kappa)}
\left(\frac{\Part_{m-1}(\lf(\beta), \beta)}
{\lf(\beta)!}\right)^{\kappa(\beta)}.
$$

The first closed case is
$\Part_2(\gamma, \kappa) =
\gamma! / (\kappa! \prod_\alpha (\alpha!)^{\kappa(\alpha)})$.

**Proof.**
An $m$-fold partition with profile $\kappa$ is built in two
steps: (1) partition $S(\gamma)$ into blocks matched with
$\supp(\kappa)$, where a block matched with $\beta$ has type
$\lf(\beta)$ — there are
$\gamma! / (\kappa! \prod_\beta (\lf(\beta)!)^{\kappa(\beta)})$
such matched partitions; (2) equip each block with an
$(m-1)$-fold partition of profile $\beta$, in
$\Part_{m-1}(\lf(\beta), \beta)$ ways. Multiplying gives the
recursion.
