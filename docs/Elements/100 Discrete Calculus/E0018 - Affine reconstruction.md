---
outline_enabled: false
id: E0018
title: Affine reconstruction
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: [E0002, E0005, E0016]
checked: [ai]
published_at: [DDC]
---

# E0018 — Affine reconstruction

A forward difference along a curved cube $c$ [E0016] decomposes
as a sum over coverings of $[k]$, each term an affine difference
along the Möbius coordinates $c(A)$.

**Proposition.** For $k \geq 1$, $f: X \to G$ and $c \in CT_k(X; x)$,

$$
\Delta(f; x; c)
= \sum_{\KC \in \Cov(k)}
  \Delta(f; x; (c(A))_{A \in \KC}).
$$

**Proof.**
Each vertex $\zeta_x(c;T) = x + \sum_{\emptyset \neq R \subseteq T} c(R)$
is a vertex of the affine cube on the index set $\KP_+(k)$
with legs $(c(R))_{R \in \KP_+(k)}$. By Taylor duality [E0005],
with the empty family $\KH = \emptyset$ contributing the base
value $f(x)$,

$$
f(x + \sum_{\emptyset \neq R \subseteq T} c(R))
= \sum_{\KH \subseteq \KP_+(T)}
  \Delta(f; x; (c(R))_{R \in \KH}).
$$

Insert into the alternating sum defining $\Delta(f; x; c)$
and exchange sums: a family $\KH \subseteq \KP_+(k)$ occurs in
the term of $T$ exactly when $\bigcup \KH \subseteq T$, so
its total coefficient is
$\sum_{\bigcup \KH \subseteq T \subseteq [k]} (-1)^{k - |T|}
= [\bigcup \KH = [k]]$ by the Boolean sieve [E0002]. Since
$k \geq 1$, the empty family has $\bigcup \emptyset = \emptyset
\neq [k]$, so exactly the covers survive. (For $k = 0$ the left
side is $f(x)$ while $\Cov(0) = \emptyset$, so the hypothesis
is necessary.)

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Sieve exchange and Taylor step verified against [E0002]/[E0005];
hand-expanded $k = 2$ with defect $w$ (all five covers, coefficients
match); probed $k = 0, 1$ and affine $c$. Fixed: added missing
hypothesis $k \geq 1$ ($\Cov(0) = \emptyset$ but LHS $= f(x)$) and
made the empty-family/base-value convention explicit in the proof.
