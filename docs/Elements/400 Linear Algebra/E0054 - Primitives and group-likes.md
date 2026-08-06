---
outline_enabled: false
id: E0054
title: Primitives and group-likes
kind: proposition
status: established
visibility: public
depends_on: [E0051, E0052]
published_at: [DDC]
---

# E0054 — Primitives and group-likes

The primitives and group-likes of the symmetric bialgebra
$(\SS(V), \Delta)$ [E0052] are classified by exp/log.

**Proposition.**

- An element $p \in \SH(V)$ is *primitive*
  ($\Delta(p) = p \otimes 1 + 1 \otimes p$) if and only if
  $p \in V = \SS^1(V)$.

- An element $g \in \SH(V)$ is *group-like*
  ($\Delta(g) = g \otimes g$, $\varepsilon(g) = 1$) if and
  only if $g = \exp(v) = \sum_{k \geq 0} v^k / k!$ for a
  unique $v \in V$.

- $\exp$ and $\log$ are inverse bijections between primitives
  and group-likes.

**Proof.**
Ad primitives) Expand $a = \sum_k a_k$ and
$\Delta(a) = \sum_k \Delta(a_k)$. For $k \geq 2$,
$\Delta(a_k)$ has a nonzero middle component in
$\bigoplus_{i,j \geq 1} \SS^i \otimes \SS^j$, but the
primitive condition forces this to vanish. Hence $a = a_1 \in V$.

Ad group-likes) If $g$ is group-like, $h = g - 1$ lies in
$\SS_+(V)$ and $\log(1 + h) = \sum_{k \geq 1}
(-1)^{k+1} h^k / k$ converges in $\SH(V)$. The coproduct of
$\log(g)$ is $\log(g \otimes g) = \log(g) \otimes 1 +
1 \otimes \log(g)$ by the functional equation, so $\log(g)$
is primitive, hence $\log(g) \in V$.
