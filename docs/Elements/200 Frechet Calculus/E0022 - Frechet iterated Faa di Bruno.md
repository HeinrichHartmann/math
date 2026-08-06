---
outline_enabled: false
id: E0022
title: Fréchet iterated Faà di Bruno
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0007, E0008, E0011, E0021, E0024, E0025]
checked: [ai]
published_at: [DFDB]
---

# E0022 — Fréchet iterated Faà di Bruno

The discrete iterated Faà di Bruno [E0011] passes to Fréchet
derivatives via Taylor composition [E0025]: the covering sums
collapse to partition sums, and the iterated increments
$\Delta^\kappa$ become iterated differentials $D^\kappa$ [E0021].

**Definition (Partition grouping coefficient).** For
$\gamma \in \IN_0^S$ and $\kappa \in \KM_+^m(S)$, the
*partition grouping coefficient* is

$$
\Part_m(\gamma, \kappa)
:= \#\set{H \in \Part_m(S(\gamma)) : \nu(H) = \kappa},
$$

the number of $m$-fold partitions of the Boolean realization
$S(\gamma)$ whose higher profile map $\nu$ [E0007] equals
$\kappa$. The coefficient is zero unless $\kappa \vdash \gamma$
(i.e. $\lf(\kappa) = \gamma$). For $m = 2$ and
$\kappa \in \KM_+(S)$, this reduces to the multinomial-type
coefficient
$\Part_2(\gamma, \kappa) =
\gamma! / (\kappa! \prod_\alpha (\alpha!)^{\kappa(\alpha)})$.

**Theorem.** Let $X_0, \dots, X_m$ be Banach spaces, let
$f_r: X_{r-1} \to X_r$ be $C^n$ near $x_{r-1}$, and put
$x_0 = x$, $x_r = f_r(x_{r-1})$, $z = x_m$. Fix directions
$v_1, \dots, v_k \in X_0$ and let $\gamma \in \IN_0^k$ with
$1 \leq |\gamma| \leq n$.

- *Faà di Bruno:*

    $$
    D^\gamma(f_m \circ \cdots \circ f_1;\, x;\, v_\bullet)
    = \sum_{\kappa \in \KM_+^m(k)}
      \Part_m(\gamma, \kappa)\,
      D^\kappa(f_1, \dots, f_m;\, x;\, v_\bullet).
    $$

- *Taylor composition:*

    $$
    (f_m \circ \cdots \circ f_1)
    (x + {\textstyle\sum_i} t_i v_i)
    = z + \sum_{\substack{0 < |\gamma| \leq n \\
    \kappa \in \KM_+^m(k)}}
    \frac{t^\gamma}{\gamma!}\,
    \Part_m(\gamma, \kappa)\,
    D^\kappa(f_1, \dots, f_m;\, x;\, v_\bullet)
    + o(|t|^n).
    $$

    The sum is finite: $\Part_m(\gamma, \kappa) = 0$ unless
    $\kappa \vdash \gamma$, and only derivatives of order
    $\leq |\gamma| \leq n$ appear.

**Proof.**
Write $P_r = T^n(f_r; x_{r-1})$ for the order-$n$ Taylor
polynomials and $F = f_m \circ \cdots \circ f_1$. By Taylor
composition [E0025] applied $m - 1$ times,
$T_*^n(F; x) = \pi_{\leq n}(P_m \circ \cdots \circ P_1 - z)$,
so $F(x + h) = z + \pi_{\leq n}(P_m \circ \cdots \circ P_1
- z)(h) + o(\|h\|^n)$. The truncated composite
$Q := \pi_{\leq n}(P_m \circ \cdots \circ P_1 - z)$ is a
polynomial map between Banach spaces — in particular a map
between abelian groups — so the discrete iterated Faà di Bruno
[E0011] applies to the chain $P_1, \dots, P_m$.

The discrete formula sums over $m$-fold coverings $K$ of the
slot set, but only partitions survive the passage to
derivatives. Grade every term by its total degree in the slot
directions. Each term of a difference
$\Delta(P; x'; w_1, \dots, w_p)$ of a polynomial map contains
every direction $w_i$ at least once, since the alternating sum
kills all monomials missing some $w_i$; inductively, every term
of $\Delta^K$ contains each slot direction at least as often as
the slot occurs among the leaves of $K$, so all terms have slot
degree $\geq \mathrm{wt}(K)$. On a slot set of size $N$ the
weight bound [E0008] gives $\mathrm{wt}(K) \geq N$, with
equality exactly for $K \in \Part_m$. Hence only partitions
contribute terms that are *multilinear* in the $N$ slot
directions, and for $H \in \Part_m$ the multilinear part of
$\Delta^H$ is the levelwise polarization
$D^H(f_1, \dots, f_m; x; \cdot)$ [E0021]: under $p$
differences a homogeneous part of degree $j$ vanishes for
$p > j$, polarizes exactly to $D^j$ for $p = j$, and for
$p < j$ leaves only terms of slot degree $> p$, which are not
multilinear.

Ad Faà di Bruno) By [E0020] and Taylor coefficient
identification [E0024],
$D^\gamma(F; x; v_\bullet) = D^{|\gamma|}(Q; 0; u)$ with slot
directions $u = v \circ \pi$ on $S(\gamma)$, and
$D^{|\gamma|}(Q; 0; u)$ is the multilinear part of
$\Delta(Q; 0; u)$. Expanding $\Delta(Q; 0; u)$ by the discrete
formula on $S(\gamma)$ and extracting multilinear parts leaves
$\sum_{H \in \Part_m(S(\gamma))} D^H$ by the collapse above.
$D^H$ depends only on the profile $\kappa = \nu(H)$ by symmetry
of the differentials (as in profile invariance [E0010]).
Grouping the
$\#\set{H \in \Part_m(S(\gamma)) : \nu(H) = \kappa} =
\Part_m(\gamma, \kappa)$ partitions with the same profile gives
the stated sum.

Ad Taylor composition) Restrict to $h = \sum_i t_i v_i$.
Since $\|h\| \leq C|t|$, the Peano remainder is $o(|t|^n)$.
The polynomial part
$\pi_{\leq n}(P_m \circ \cdots \circ P_1 - z)(\sum t_i v_i)$
is a polynomial of degree $\leq n$ in the $t_i$. By the
multivariate Taylor formula [E0024], its $t^\gamma$-coefficient
is $D^\gamma(F; x; v_\bullet)/\gamma!$; substituting the Faà di
Bruno formula gives the stated expansion.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Statement verified (classical cases $m = 1$; $m = 2$ chain
rule; $\Part_2$ closed form; numeric check $n = 2$, $m = 2$
against the truncated composite). The covering→partition
collapse argument as previously written was invalid: increments
of non-partition coverings do not vanish under degree-$\leq n$
truncation (counterexample $n = 4$, $H = \set{\set{1},
\set{1,2}}$). Replaced with the slot-degree grading argument
via the weight bound [E0008] and multilinear extraction; added
E0008, E0024 to dependencies. Statement unchanged.
