---
outline_enabled: false
id: E0024
title: Taylor formula
kind: proposition
status: established
visibility: public
notation: E0020
depends_on: []
validation:
  ai:
    anchor: validation-ai-review-2026-07-19-gpt-5-codex-pass
published_at: [FDB, FFF]
---

# E0024 — Taylor formula

**Proposition (Taylor approximation).** Let $k \geq 0$ and
$g \in C^k(U, Y)$ on an open $U \subset X$, $x \in U$.
Write $T_k = T_*^k(g; x)$ for the reduced Taylor polynomial
and $R_k = \Delta(g; x) - T_k$ for the Taylor residual.

- *Peano residual.*

    $$
    g(x + v) = g(x) + T_k(v) + R_k(v),
    \qquad
    \frac{\|R_k(v)\|}{\|v\|^k} \to 0
    \text{ as } v \to 0.
    $$

- *Lagrange residual* (for scalar-valued maps in coordinates)*.*
  If $X = \IR^d$, $Y = \IR$, and $g \in C^{k+1}$ near $x$,
  then for each sufficiently small nonzero $v$ there exists
  $\tau \in (0,1)$ with

    $$
    R_k(v) = \sum_{|\alpha| = k+1}
    \frac{v^{\alpha}}{\alpha!}\,
    (\partial^{\alpha} g)(x + \tau v).
    $$

- *Integral residual.* If $g \in C^{k+1}$ near $x$, then for
  every sufficiently small $v$,

    $$
    R_k(v) = \frac{1}{k!} \int_0^1 (1-t)^k
    D^{k+1}(g; x+tv; v, \dots, v)\,dt.
    $$

    In coordinates, $X = \IR^d$, this becomes

    $$
    R_k(v) = (k+1) \sum_{|\alpha| = k+1}
    \frac{v^{\alpha}}{\alpha!}
    \int_0^1 (\partial^{\alpha} g)(x + tv)\,
    (1-t)^{k}\, dt
    = \sum_{|\alpha| = k+1} a_\alpha(v) \cdot v^\alpha,
    $$

    where $a_\alpha(v) = (k+1)/\alpha!\,
    \int_0^1 (\partial^\alpha g)(x + tv)\, (1-t)^k\, dt$. The
    functions $a_\alpha$ are continuous at $0$.

- *Multivariate form.* For directions
  $v_1, \dots, v_s \in X$:

    $$
    g(x + {\textstyle\sum_i} t_i v_i)
    = g(x) + \sum_{1 \leq |\alpha| \leq k}
      \frac{t^\alpha}{\alpha!}\,
      D^\alpha(g;\, x;\, v_\bullet)
    + o(|t|^k).
    $$

- *Uniqueness.* If $\Delta(g; x) = T + R$ with
  $T \in \KP_{\leq k}(X, Y)$, $T(0) = 0$, and
  $\|R(v)\| / \|v\|^k \to 0$, then $T = T_k$.

**Proof.**
For fixed $v$, set $\phi_v(t) := g(x+tv)$. By the chain rule,
$\phi_v^{(j)}(t) = D^j(g; x+tv; v, \dots, v)$. Thus
$\phi_v^{(j)}(0)/j!$ is the value at $v$ of the degree-$j$
homogeneous part of $T_k$. This restriction to affine lines
gives the Peano, Lagrange, and integral formulas.

Ad Peano) For $k = 0$, the claim is continuity of $g$ at $x$.
Suppose $k \geq 1$. Iterating the Banach-valued fundamental
theorem of calculus along the segment from $x$ to $x+v$ gives
the integral remainder at order $k-1$. After subtracting the
degree-$k$ Taylor term, we obtain

$$
R_k(v) = \frac{1}{(k-1)!} \int_0^1 (1-t)^{k-1}
\bigl(D^k(g; x+tv)-D^k(g; x)\bigr)
[v^{\tensor k}]\,dt.
$$

Consequently,

$$
\frac{\|R_k(v)\|}{\|v\|^k}
\leq \frac{1}{k!}
\sup_{0 \leq t \leq 1}
\|D^k(g; x+tv)-D^k(g; x)\|.
$$

The supremum tends to zero as $v \to 0$ by continuity of
$D^k g$ at $x$. This proves the Peano estimate for arbitrary
Banach-valued maps; no mean-value theorem is required.

Ad Lagrange) When $Y = \IR$, the auxiliary function $\phi$ is
scalar-valued. The one-dimensional Lagrange remainder gives
$\tau \in (0,1)$ such that
$R_k(v) = \phi^{(k+1)}(\tau)/(k+1)!$.
For $X = \IR^d$, expanding $\phi^{(k+1)}(\tau)$ by the
multinomial theorem gives the stated coordinate formula.

Ad Integral) The Banach-valued fundamental theorem of calculus,
iterated $k+1$ times along the segment, gives

$$
R_k(v) = \frac{1}{k!} \int_0^1 (1-t)^k
D^{k+1}(g; x+tv; v, \dots, v)\,dt.
$$

In coordinates, expand the differential by the multinomial
theorem. The coefficient of $v^\alpha$ is
$(k+1)/\alpha!$ times the corresponding integral, giving the
factored form. Continuity of $a_\alpha$ at $0$ follows from
continuity of $\partial^\alpha g$ at $x$, uniformly along the
shrinking segment.

Ad Multivariate) Set $v = \sum_i t_i v_i$. The Taylor
polynomial $T_k(v)$ is a polynomial of degree $\leq k$ in
$v$, hence a polynomial of degree $\leq k$ in the $t_i$.
Expanding by the multinomial theorem: the monomial
$t^\alpha$ with $|\alpha| = j$ collects the term
$D^j(g; x; v_\bullet^{\times \alpha}) / j!$. Since
$D^j(g; x; \cdot)$ is symmetric $j$-linear, the
multinomial coefficient $j! / \alpha!$ arises from
symmetrization, giving coefficient
$D^\alpha(g; x; v_\bullet) / \alpha!$. The Peano remainder
satisfies $\|R_k(v)\| / \|v\|^k \to 0$, and
$\|v\| \leq C |t|$, so $R_k = o(|t|^k)$.

Ad Uniqueness) Suppose $\Delta(g; x) = T + R = T_k + R_k$.
Then $p := T-T_k = R_k-R$ is a polynomial of degree at most
$k$ satisfying $p(v) = o(\|v\|^k)$. For $k=0$, the condition
$p(0)=0$ immediately gives $p=0$. If $k \geq 1$ and
$p \neq 0$, write
$p = \sum_{\ell=j}^k p_\ell$, where $p_j \neq 0$ is its lowest
nonzero homogeneous part, and choose $v$ with $p_j(v) \neq 0$.
On the one hand, $t^{-j}p(tv) \to p_j(v)$. On the other hand,
$p(tv) = o(|t|^k)$ gives
$t^{-j}p(tv) = o(|t|^{k-j}) \to 0$, also when $j=k$.
This contradiction proves $p=0$ and hence $T=T_k$.

---

**Validation (AI review, 2026-07-19, gpt-5-codex, pass).**
{#validation-ai-review-2026-07-19-gpt-5-codex-pass}
Peano, Lagrange, integral, and multivariate remainders checked for
Banach targets; the case $k=0$ and the scalar-target restriction
were verified. Corrected the vector-valued Lagrange step and the
uniqueness argument. No issues remain.
