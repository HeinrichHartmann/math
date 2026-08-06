---
outline_enabled: false
id: E0053
title: Permanent pairing
kind: definition
status: established
visibility: public
depends_on: [E0051]
published_at: [DDC]
---

# E0053 — Permanent pairing

**Definition.** The *permanent pairing* of
$\SS^k(V^*) \times \SS^k(V) \to \IR$ is

$$
(\alpha_1 \cdots \alpha_k, v_1 \cdots v_k)
= \sum_{\sigma \in S_k}
  \prod_i \alpha_i(v_{\sigma(i)}).
$$

Distinct degrees pair to zero. The pairing extends to
$\SH(V^*) \times \SS(V) \to \IR$ and to
$\SS(V^*) \times \SH(V) \to \IR$.

**Proposition (Non-degeneracy).** The permanent pairing is
non-degenerate: in a basis $(e_i)$ with dual $(\eps_i)$,
$(\eps^\mu, e^\nu) = \nu!\, \delta_{\mu, \nu}$. For finite-dimensional
$V$ it induces $\SS^k(V^*) \cong \SS^k(V)^*$.

**Proof.**
The pairing matrix is diagonal in the monomial basis, with
entry $\nu!$ at $(\eps^\nu, e^\nu)$. For infinite-dimensional
$V$, the same argument gives injectivity of both adjunction
maps $\SS^k(V^*) \hookrightarrow \SS^k(V)^*$ and
$\SS^k(V) \hookrightarrow \SS^k(V^*)^*$.

**Proposition (Filtered duality).** For finite-dimensional $V$:
$\SS(V)^\vee = \SH(V)^\vee = \SS(V^*)$.

**Proof.**
The filtered dual $\SS(V)^\vee$ consists of functionals
vanishing on $F^k \SS(V)$ for some $k$, i.e. functionals
depending on finitely many graded components. By
non-degeneracy, these are exactly $\SS(V^*)$. The equality
$\SH(V)^\vee = \SS(V)^\vee$ is the general filtered
completion result [E0050].
