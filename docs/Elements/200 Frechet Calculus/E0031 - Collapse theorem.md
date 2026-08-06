---
outline_enabled: false
id: E0031
title: Collapse theorem
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0008, E0016, E0018]
published_at: [DDC]
---

# E0031 — Collapse theorem

Under weighted rescaling $(\lambda_t c)(A) = t^{|A|} c(A)$
of a tangent cube [E0016], the forward difference
$t^{-k} \Delta(\phi; x; \lambda_t c)$ converges as $t \to 0$.
The limit is the *cubical differential*, a partition sum that
bridges discrete and smooth calculus.

**Theorem.** Let $\phi$ be $C^k$ near $x$ and
$c \in CT_k(X; x)$. The limit

$$
D^\square(\phi; x; c)
:= \lim_{t \to 0} t^{-k} \Delta(\phi; x; \lambda_t c)
$$

exists uniformly on bounded subsets of $CT_k(X; x)$, and

$$
D^\square(\phi; x; c)
= \sum_{\pi \in \Part(k)}
  D(\phi; x; (c(A))_{A \in \pi}).
$$

On affine cubes,
$D^\square(\phi; x; \Aff(v_\bullet)) =
D(\phi; x; v_1, \dots, v_k)$.

**Proof.**
By the coordinate formula [E0016] and affine reconstruction
[E0018],
$t^{-k} \Delta(\phi; x; \lambda_t c) =
t^{-k} \sum_{\KC \in \Cov(k)}
\Delta(\phi; x; (t^{|A|} c(A))_{A \in \KC})$.

For a cover $\KC$ with $r = |\KC|$ blocks and $r \leq k$,
the iterated fundamental theorem gives
$\Delta(\phi; x; (t^{|A|} c(A))_{A \in \KC}) =
t^{\mathrm{wt}(\KC)}
(D(\phi; x; (c(A))_{A \in \KC}) + \eta_\KC(t))$
where $\eta_\KC(t) \to 0$ uniformly on bounded $c$, by
continuity of $D^r(\phi; \cdot)$ at $x$. For $r > k$, the
term is bounded by $C t^{k+1}$ (at least one block has
$|A| \geq 2$, producing excess weight).

After dividing by $t^k$: covers with $r > k$ are $O(t)$;
covers with $\mathrm{wt}(\KC) > k$ carry $t^{\mathrm{wt}-k}$
and vanish; by the weight bound [E0008],
$\mathrm{wt}(\KC) = k$ iff $\KC \in \Part(k)$. Only
partitions survive with coefficient $1$.

**Definition (Cubical differential pushforward).**
The map $D^\square_+(\phi; x): CT_k(X; x) \to CT_k(Y; y)$
with $D^\square_+(\phi; x; c)(T) := D^\square(\phi; x; \del_T c)$
is the *cubical differential pushforward*.

**Theorem (Differential functoriality).**
$D^\square_+(\psi \circ \phi; x) =
D^\square_+(\psi; y) \circ D^\square_+(\phi; x)$.

**Proof.**
Set $c_t(A) := t^{-|A|} \Delta_+(\phi; x; \lambda_t c)(A)$,
so $\Delta_+(\phi; x; \lambda_t c) = \lambda_t c_t$, and
$c_t \to D^\square_+(\phi; x) c$ by the collapse theorem on
each face. By exact functoriality [E0017],
$t^{-k} \Delta(\psi \circ \phi; x; \lambda_t c) =
t^{-k} \Delta(\psi; y; \lambda_t c_t)$. By uniformity of the
collapse for $\psi$ at $y$ on the bounded family $(c_t)$,
the right side converges to $D^\square(\psi; y; c')$ with
$c' = D^\square_+(\phi; x) c$.
