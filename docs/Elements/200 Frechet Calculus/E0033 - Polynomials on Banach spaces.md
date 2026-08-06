---
outline_enabled: false
id: E0033
title: Polynomials on Banach spaces
kind: definition
status: established
visibility: public
notation: E0020
depends_on: [E0002, E0004]
published_at: [FDB]
---

# E0033 — Polynomials on Banach spaces

**Definition (Homogeneous polynomials).**

- A map $p: E \to F$ between Banach spaces is a
  *$k$-homogeneous polynomial* if there exists a symmetric
  bounded multilinear map
  $A \in \KL^s({}^k E, F)$ with

    $$
    p(x) = \frac{1}{k!}\, A[x^{\otimes k}].
    $$

- $\KP^k(E, F)$ is the space of $k$-homogeneous polynomials.
- A *polynomial map* is a finite sum
  $p = \sum_{k=0}^n p_k$ with $p_k \in \KP^k(E, F)$.
- $\KP_{\leq n}(E, F)$ is the space of polynomials of degree
  $\leq n$.

**Lemma (Polarization).** The top-degree multilinear form of
a polynomial $p = \sum_{k=0}^n \frac{1}{k!} A_k[x^{\otimes k}]$
is recovered by the forward difference [E0004]:

$$
A_n[v_1, \dots, v_n] = \Delta(p; 0; v_1, \dots, v_n).
$$

Every polynomial has a unique representation. The degree, the
degree-$k$ part $\pi_k(p)$, and the truncation
$\pi_{\leq k}(p)$ are therefore well defined.

**Proof.**
By multilinearity,
$p(\sum_{i \in I} v_i) = \sum_{J \subseteq I} A_{|J|}[v_J]$.
The alternating sum $\sum_I (-1)^{n-|I|}$ inverts this by
Boolean Möbius inversion [E0002]: all terms with
$J \subsetneq [n]$ cancel by $(1-1)^{n-|J|} = 0$, leaving
$A_n[v_1, \dots, v_n]$. Uniqueness follows by induction:
recover $A_n$ via polarization, subtract, and repeat.

**Lemma (Polynomial properties).**

- *Composition:* $\deg(q \circ p) \leq \deg(q) \cdot \deg(p)$.
- *Lipschitz:* $\|\Delta(p; 0; x)\| \leq C \|x\|$ for small
  $\|x\|$.
- *Upper vanishing:*
  $\|\pi_{> k}(p)(x)\| / \|x\|^k \to 0$ as $x \to 0$.
- *Lower vanishing:* If $\|p(x)\| / \|x\|^k \to 0$ and
  $k \geq \deg(p)$, then $p = 0$.

**Proof.**
Ad composition) Expanding $q(p(x))$ by multilinearity: each
term $B[A_1[x^{\otimes j_1}], \dots, A_\ell[x^{\otimes j_\ell}]]$
is a bounded multilinear composition, hence a homogeneous
polynomial of degree $j_1 + \cdots + j_\ell \leq \ell \cdot \deg(p)$.

Ad Lipschitz)
$\|\Delta(p; 0; x)\| = \|\sum_{j=1}^n \frac{1}{j!} A_j[x^{\otimes j}]\|
\leq \sum_j \frac{\|A_j\|}{j!} \|x\|^j \leq C\|x\|$ for
$\|x\| < 1$.

Ad upper vanishing) Each $p_j$ with $j > k$ satisfies
$\|p_j(x)\| \leq C_j \|x\|^j$, so
$\|p_j(x)\| / \|x\|^k = C_j \|x\|^{j-k} \to 0$.

Ad lower vanishing) If $p \neq 0$, let $j_0$ be the minimal
nonzero degree and choose $v$ with $p_{j_0}(v) \neq 0$. Then
$p(tv) = t^{j_0} p_{j_0}(v) + O(t^{j_0+1})$: for
$j_0 < k$ the ratio $\|p(tv)\| / t^k$ diverges; for $j_0 = k$
it converges to $\|p_{j_0}(v)\| \neq 0$. Either contradicts
$p = o(\|x\|^k)$.
