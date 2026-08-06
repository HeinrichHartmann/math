---
outline_enabled: false
id: E0025
title: Taylor composition
kind: theorem
status: established
visibility: public
notation: E0020
depends_on: [E0024]
checked: [ai]
published_at: [FDB]
---

# E0025 — Taylor composition

Taylor polynomials compose under truncation: the Taylor
polynomial of a composite is the truncated composite of the
Taylor polynomials.

**Theorem.** Let $g \in C^n(U, Y)$ and $f \in C^n(V, Z)$
with $g(x) \in V$. Then $f \circ g \in C^n(U, Z)$ and

$$
T_*^n(f \circ g;\, x)
= \pi_{\leq n}(T_*^n(f;\, y) \circ T_*^n(g;\, x)),
$$

where $\pi_{\leq n}$ truncates a polynomial to degree $\leq n$.

**Proof.**
The composite is $C^n$ near $x$ by the chain rule and
induction on $n$.
Write $g(x + v) = y + T_*^n(g; x; v) + R_g(v)$ and
$f(y + w) = z + T_*^n(f; y; w) + R_f(w)$ with Peano
remainders [E0024]. Substituting $w = T_*^n(g; x; v) + R_g(v)$:

$$
(f \circ g)(x + v)
= z + T_*^n(f; y; T_*^n(g; x; v) + R_g(v))
+ R_f(T_*^n(g; x; v) + R_g(v)).
$$

Since $T_*^n(g; x; v) = O(\|v\|)$ and $R_g(v) = o(\|v\|^n)$,
expanding $T_*^n(f; y; \cdot)$ and collecting terms of degree
$\leq n$ gives $\pi_{\leq n}(T_*^n(f; y) \circ T_*^n(g; x))(v)$,
with all remaining terms $o(\|v\|^n)$. By uniqueness of the
Taylor polynomial [E0024], the result follows.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Expansion bookkeeping verified: cross terms
$D^\ell(f; y; P^{\ell-i}, R_g^i)$, $i \geq 1$, are
$o(\|v\|^n)$ by boundedness; degree-$>n$ polynomial part is
$O(\|v\|^{n+1})$; $R_f(w) = o(\|v\|^n)$ via
$\|w\| \leq C\|v\|$; truncated composite has zero constant
term as uniqueness requires. Added the (standard) chain-rule
sentence for $f \circ g \in C^n$. No issues found.
