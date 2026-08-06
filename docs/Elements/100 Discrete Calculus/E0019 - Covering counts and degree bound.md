---
outline_enabled: false
id: E0019
title: Covering counts and degree bound
kind: corollary
status: established
visibility: public
notation: E0001
depends_on: [E0004, E0006, E0008]
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0019.lean
    theorems: [cover_count, degree_bound]
published_at: [DFDB]
---

# E0019 — Covering counts and degree bound

The covering Faà di Bruno formula [E0006] counts its own terms
and bounds the degree of composites.

**Proposition (Covering counts).** Let $g(x) = 2^x - 1$ and
$f(y) = 2^y$ on $\IN_0$. Then, for $k \geq 1$,

$$
|\Cov(k)|
= \sum_{j=0}^{k} (-1)^{k-j} \binom{k}{j}\, 2^{2^j - 1}.
$$

The sequence begins $1, 5, 109, 32297, \dots$ (OEIS A003465).

**Proof.**
Every increment equals $1$:
$\Delta^j(g; 0) = 1$ for $j \geq 1$ and
$\Delta^p(f; 0) = 1$ for $p \geq 1$ at $y = g(0) = 0$.
The covering formula [E0006] gives
$\Delta^k(f \circ g; 0) = \sum_{H \in \Cov(k)} 1 = |\Cov(k)|$;
the monoid domain $\IN_0$ is admissible since all evaluation
points are nonnegative [E0001]. On the other hand, the
alternating-sum formula for $\Delta^k$ [E0004] evaluates
$\Delta^k(f \circ g; 0)
= \sum_{j=0}^{k} (-1)^{k-j} \binom{k}{j}\, (f \circ g)(j)$
with $(f \circ g)(j) = 2^{2^j - 1}$.

**Corollary (Degree bound).** A map $g: X \to Y$ between
abelian groups is *polynomial of degree $\leq d$* if
$\Delta^{d+1} g \equiv 0$. If $g$ has degree $\leq d$ and
$f: Y \to Z$ has degree $\leq e$, then $f \circ g$ has degree
$\leq ed$.

**Proof.**
Set $k = ed + 1$ and take any point and directions. In the
covering formula [E0006], each $H \in \Cov(k)$ either contains
a block with $|T| > d$ — then the direction
$\Delta(g; x; u_T) = 0$, and a zero direction annihilates the
iterated difference [E0004] — or has all blocks of size
$\leq d$; in the latter case $|H| \leq e$ would give
$|{\textstyle\bigcup} H| \leq \sum_{T \in H} |T| \leq ed < k$,
contradicting $\bigcup H = [k]$, so $|H| \geq e + 1$ and
$\Delta^{|H|} f = \Delta^{|H|-e-1} \Delta^{e+1} f \equiv 0$.
Every term vanishes, hence $\Delta^{ed+1}(f \circ g) = 0$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Numeric checks $k = 1, 2, 3$ ($1, 5, 109$; $k=2$ by hand
enumeration); increment values $\Delta^j g(0) = \Delta^p f(0) = 1$;
degree-bound dichotomy incl. $d = 0$, $e = 0$. Fixed: added
missing $k \geq 1$ (formula gives $1$ at $k=0$ but
$\Cov(0) = \emptyset$), made the alternating-sum step and the
zero-direction/block-count dichotomy explicit, added E0004 to
`depends_on`.
