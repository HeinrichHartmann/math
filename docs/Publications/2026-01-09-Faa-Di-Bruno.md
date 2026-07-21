---
type: "math-article"
title: Faà di Bruno is Taylor Composition
author: "Heinrich Hartmann"
date: "2026-01-09"
status: "900 Published"
target: paper
license:
  name: "CC-BY 4.0"
  url: "https://creativecommons.org/licenses/by/4.0/"
  full_name: "Creative Commons Attribution 4.0 International License"
abstract: |
  We approach Faà di Bruno as a composition theorem for Taylor polynomials.
  For $C^k$ maps $\phi: E \to F$ and $\psi: F \to G$ between Banach spaces,
  let $T^k_\ast(\phi; x)$ denote the reduced Taylor polynomial of $\phi$ at $x$, obtained by removing the constant term.
  We show that
  
  $$T^k_\ast(\psi \circ \phi; x) = \pi_{\le k}(T^k_\ast(\psi; \phi(x)) \circ T^k_\ast(\phi; x)).$$

  The proof is an elementary estimate of the Peano remainder and does not use partitions or combinatorial enumeration.

  Expanding this composition identity recovers the classical Faà di Bruno formulas.
  Polarization gives the multivariate partition formula (Lévy 2006),
  while coefficient extraction gives the multi-index formula (Constantine and Savits 1996).
  Our approach separates the functorial nature of Taylor approximation from the combinatorial bookkeeping of polarization and coefficient extraction.

  As an application, we give a general higher-order product rule. 

bibliography: "../meta/refs.bib"
orcid: "0000-0002-3929-2421"
affiliation: "Hartmann IT GmbH"
email: "Heinrich@HeinrichHartmann.com"
doi: "10.48550/arXiv.2606.26133"
slug: "2026-Faa-Di-Bruno"
publications:
  GitHub: "https://github.com/HeinrichHartmann/math/releases/tag/2026-01-09-Faa-Di-Bruno"
  arXiv: "https://arxiv.org/abs/2606.26133"
  Zenodo: "https://doi.org/10.5281/zenodo.18203201"
hide:
  - outline
  - navigation
math:
  proof_style: expanded
zenodo:
  doi: "10.5281/zenodo.18203201"
  license: "cc-by-4.0"
  upload_type: "publication"
  publication_type: "article"
---

## Introduction

Faà di Bruno formulas describe the higher-order behavior of derivatives under composition.
In one variable, the formula expresses the $n$-th derivative of $f \circ g$ as a universal polynomial in the derivatives of $f$ and $g$.
For $f, g: \IR \to \IR$, this formula was first derived in 1855 by Faà di Bruno [@FaaDiBruno1855]:

$$
\begin{aligned}
\frac{d^n}{dx^n}(f\circ g)(x)
&=
\sum_{k=1}^n f^{(k)}(g(x))
\ssum{(\ast)}
\frac{n!}{m_1!\cdots m_n!}
\prod_{j=1}^n (\frac{g^{(j)}(x)}{j!})^{m_j},
\end{aligned}
$$

where $(\ast)$ runs over all tuples $m_1,\dots,m_n\in\IN_0$ with $m_1+\dots+m_n=k$ and $m_1+2m_2+\dots+nm_n=n$.
The multivariate generalization to maps $\phi: \IR^d \to \IR^n$, $f: \IR^n \to \IR$
was established by Constantine and Savits [@CS1996],
who gave a complete explicit formula for $\del^\alpha(f \circ \phi)$ in full multi-index form:

$$
  \frac{\del^\alpha(f \circ \phi)(x)}{\alpha!}
  \;=\;
  \ssum{\beta \in \IN_0^n \\\\ 1\le|\beta|\le|\alpha|}
  \del^\beta f(y)\;
  \sum_{s\ge 1}\;
  \sum_{(\ast)}\;
  \prod_{r=1}^s
  \frac{1}{\beta_r!}
  \frac{(\del^{\alpha_r}\phi(x))^{\beta_r}}
      {\alpha_r!^{|\beta_r|}},
$$

where $(\ast)$ runs over tuples $(\alpha_1,\dots,\alpha_s; \beta_1,\dots,\beta_s)$ with $\alpha_j \in \IN_0^d \setminus \set{0}$,
$\beta_j \in \IN_0^n \setminus \set{0}$, $\alpha_1 < \cdots < \alpha_s$,
subject to $\sum_r \alpha_r |\beta_r| = \alpha$ and $\sum_r \beta_r = \beta$.

We give a functorial repackaging of these formulas, following the philosophy that differentiable functions are functions
well approximated by polynomials, and the composition of differentiable functions should be well approximated
by the composition of their Taylor polynomials. Our main result makes this precise:

**Theorem (Taylor Composition [#thm:fdb-comp]).**
Let $E, F, G$ be Banach spaces, $U_E \subset E$ and $U_F \subset F$ open.
Let $\phi \in C^k(U_E, F)$ and $\psi \in C^k(U_F, G)$ with $y = \phi(x) \in U_F$.
Then $\psi \circ \phi \in C^k(U_E, G)$ and the reduced Taylor polynomials compose:

$$
  T_{\ast}^k(\psi\circ\phi;\, x) = \pi_{\le k}(T_{\ast}^k(\psi;\, y) \circ T_{\ast}^k(\phi;\, x)).
$$


The proof starts directly from the Peano remainder form of the Taylor approximation and establishes the Peano bounds for the composition.
This is a straightforward argument that requires neither heavy combinatorics, multi-index calculations, nor partition arguments.

The functoriality of Taylor approximation under composition is certainly well known to experts
and mentioned in passing, e.g. Malgrange ([@malgrange], p.16).
However, we are not aware of a self-contained treatment in this generality.
Hernández Encinas and Muñoz Masqué [@EM2003] are close in spirit, but work in the finite-dimensional smooth setting
and employ coordinate algebra on truncated local rings, instead of bounding the Taylor residual directly.

From this composition principle we derive independent proofs of both combinatorial forms.
The partition form (Theorem [#thm:fdb-part], [@Levy2006]) is obtained by polarization,
extracting symmetric multilinear forms from homogeneous polynomials:

$$
  D(\psi\circ\phi;\, x;\, u_1,\dots,u_k)
  =
  \sum_{\pi \part [k]}
  D(\psi;\, y;\, (D(\phi;\, x;\, u_B))_{B\in\pi}).
$$

The multi-index form (Theorem [#thm:fdb-multi], [@CS1996]) is obtained by monomial coefficient extraction
from the composed Taylor polynomials, recovering the formula above.

In summary, this note gives a short, self-contained account in the general Banach space setting
that presents all three forms of Faà di Bruno in their natural relationship:
Taylor composition as the analytic core, the partition formula as its polarization,
and the multi-index formula as its coefficient extraction.
As an application we derive a higher-order product rule in both partition and multi-index form.

**Remark (Notation).**
In the following we will use the following notational conventions.
We generally prefer explicit arguments over subscript notation, writing e.g. $\Delta(f; x; v)$ instead of $\Delta_v f(x)$.
Semicolons and commas are both argument separators;
we use semicolons as a visual hint when arguments are of different kinds, as in $D(\phi; x; v_1, \dots, v_k)$.
Dropping trailing arguments denotes currying: for a function $f(x; y; z)$, we write $f(x; y)$ for the map $z \mapsto f(x; y; z)$.
Thus $D(\phi; x; u_1, \dots, u_k)$ denotes the $k$-th derivative evaluated on directions;
dropping the vector arguments, $D(\phi; x)$ denotes the corresponding multilinear map when $k$ is clear from context.
Similarly $T_{\ast}^k(\phi; x)$ is a polynomial map and $T_{\ast}^k(\phi; x; v)$ is its evaluation at $v$.


## Polynomials in Banach Spaces

In this section we develop the basic theory of polynomials in the setting of Banach spaces, as found e.g. in Dineen [@Dineen1999].
The reader who is only interested in the finite-dimensional setting can safely skip this section.

Let $E, F$ be Banach spaces.
We write $\KL(E, F)$ for the Banach space of bounded linear maps $E \to F$ with operator norm $\|A\| = \sup_{\|v\| \leq 1} \|A(v)\|$,
and more generally $\KL(^k E, F)$ for the Banach space of bounded $k$-fold multilinear maps $E^{\times k} \to F$
with norm $\|A_k\| = \sup_{\|v_i\| \leq 1} \|A_k(v_1,\dots,v_k)\|$.
We write $\KL^s(^k E, F) \subset \KL(^k E, F)$ for the subspace of symmetric multilinear maps.

**Definition (Polynomials).**
A map $p: E\to F$ is a *$k$-homogeneous polynomial* if there exists $A \in \KL^s(^k E,F)$ such that

$$
  p(x)=\frac{1}{k!}\,A[x,\dots,x]=\frac{1}{k!}\,A[x^{\tensor k}], \qquad x\in E.
$$

We write $\KP^k(E,F)$ for the space of such maps.
A *polynomial map* $p: E \to F$ is a finite sum of homogeneous polynomials $p = \sum_{k=0}^n p_k$ with $p_k \in \KP^k(E,F)$.
We write $\KP(E,F)$ for the space of all polynomial maps, $\KP_{\le n}(E,F)$ for those of degree $\le n$,
and $\KP(E) := \KP(E,\IR)$.


**Definition (Forward differences).**
For $f: E \to F$ and $x, v \in E$, define the *forward difference*

$$
  \Delta(f; x; v) := f(x + v) - f(x).
$$

The *iterated forward difference* is defined recursively: $\Delta(f; x) := f(x)$ for $k = 0$, and

$$
  \Delta(f; x; v_1, \dots, v_k) := \Delta(w \mapsto \Delta(f; x; v_2, \dots, v_k);\, x;\, v_1)
$$

for $k \geq 1$.
Since the operators $\Delta_{v_i}$ commute, this is symmetric in $v_1, \dots, v_k$.
Expanding the recursion gives the alternating sum over vertices of the $k$-cube:

$$
  \Delta(f; x; v_1, \dots, v_k) = \sum_{S \subseteq [k]} (-1)^{k - |S|}\, f(x + \textstyle\sum_{i \in S} v_i).
$$


**Lemma (Polarization).** {#lem:polarization}
Let $p: E \to F$ be a polynomial map, represented as $p(x) = \sum_{k=0}^n \frac{1}{k!} A_k[x^{\tensor k}]$ with $A_k \in \KL^s(^k E, F)$.
Then the top-degree multi-linear form is recovered as a forward difference:

$$
  A_n[v_1,\dots,v_n] = \Delta(p; 0; v_1, \dots, v_n).
$$

Furthermore, every polynomial map $p$ has a unique representation $p(x) = \sum_{k=0}^n \frac{1}{k!} A_k[x^{\tensor k}]$ with $A_k \in \KL^s(^k E, F)$.

**Proof.**
The polarization formula is Möbius inversion on the Boolean lattice $2^{[n]}$:
By multilinearity,

$$
p(\sum_{i \in I} v_i) 
= \sum_{k=0}^n \sum_{i_1,\dots,i_k \in I}  \frac{1}{k!} A_k[v_{i_1},\dots,v_{i_k}] 
= \sum_{J \subset I} A_{|J|}[v_J]
$$

where $A_k[v_J]$ denotes evaluation on the $|J|$-tuple indexed by $J$.
The alternating sum $\sum_{I \subset [n]} (-1)^{n-|I|}$ inverts this:
all terms with $J \subsetneq [n]$ cancel by the identity $\sum_{I \supset J} (-1)^{n-|I|} = (1-1)^{n-|J|} = 0$, leaving only $J = [n]$.
Uniqueness follows by induction: recover $A_n$ via polarization, subtract, and repeat.


**Definition (Degree Truncation).**
Let $p: E \ra F$ be a polynomial map.
By Lemma [#lem:polarization] the representation $p(x) = \sum_{k=0}^n  \frac{1}{k!} A_k[x^{\tensor k}]$ is unique.
We can hence define:

- $\deg(p):= n \in \IN_0$ the degree of $p$. By convention $\deg(0) = - \infty$.
- $\pi_k(p) := p_k: E \ra F$ the degree-k part of $p$.
- $\Pol_k(p) := A_k \in \KL^s(^k E, F)$ the degree-k polarization of $p$.
- $\pi_{\leq k}(p) \in \KP_{\le k}(E,F)$ the (lower) degree truncation of $p$.
- $\pi_{> k}(p) \in \KP_{> k}(E,F)$ the upper degree truncation of $p$.


We will make use of the following properties of polynomial maps:

**Lemma (Polynomial Properties).** {#lem:poly-props}
Let $p : E \ra F$, $q: F \ra G$ be polynomial maps.

1. (Composition) The composition $q \circ p: E \ra G$ is a polynomial with $\deg(q \circ p) \leq \deg(q) \cdot \deg(p)$.
2. (Lipschitz) There exists $\eps > 0, C>0$ such that $\|\Delta(p; 0; x)\| \le C \|x\|$ for all $\|x\| < \eps$.
3. (Upper Vanishing) We have $\| \pi_{> k}(p)(x)\| / \|x\|^{k} \ra 0$ for $x \ra 0$.
4. (Lower Vanishing) If $\|p(x)\| / \|x\|^{k} \ra 0$ for $x \ra 0$, and $k \geq \deg(p)$ then $p = 0$.

**Proof.**
Ad 1) Expanding $q(p(x))$ by multilinearity yields a sum of terms
$B[A_1[x^{\tensor j_1}], \dots, A_\ell[x^{\tensor j_\ell}]]$
where $B \in \KL(^\ell F, G)$ and $A_i \in \KL(^{j_i} E, F)$ are bounded multilinear.

The composition $(u_1,\dots,u_k) \mapsto B[A_1[u_{I_1}], \dots, A_\ell[u_{I_\ell}]]$ is bounded multilinear,
hence each term is a homogeneous polynomial of degree $j_1 + \cdots + j_\ell \leq \ell \cdot \deg(p)$.
Thus $q \circ p$ is a polynomial with $\deg(q \circ p) \leq \deg(q) \cdot \deg(p)$.

Ad 2)
Write $\Delta(p; 0; x) = p(x) - p(0) = \sum_{j=1}^m \frac{1}{j!} A_j[x^{\tensor j}]$ with $A_j \in \KL^s(^j E, F)$ bounded.
For $\|x\| < 1$ we have $\|x\|^j \leq \|x\|$,
hence $\|\Delta(p; 0; x)\| \leq \sum_{j=1}^m \frac{\|A_j\|}{j!} \|x\|^j \leq C\|x\|$ with $C = \sum_{j=1}^m \frac{\|A_j\|}{j!}$.

Ad 3) 
Each homogeneous component $p_j$ of degree $j > k$ satisfies $\|p_j(x)\| \leq C_j \|x\|^j$,
hence $\|p_j(x)\|/\|x\|^k = C_j \|x\|^{j-k} \to 0$ as $x \to 0$.

Ad 4)
If $p \neq 0$, let $j_0 := \min\{j : p_j \neq 0\} \leq \deg(p) \leq k$
and choose $v \in E$ with $p_{j_0}(v) \neq 0$.
Then $p(tv) = t^{j_0} p_{j_0}(v) + O(t^{j_0+1})$.
If $j_0 < k$, then $\|p(tv)\|/t^k$ diverges as $t \to 0^+$.
If $j_0 = k$, then $\|p(tv)\|/t^k \to \|p_{j_0}(v)\| \neq 0$.
In either case $p = o(\|x\|^k)$ is impossible.


## Fréchet Differentiability

We summarize the classical notion of Fréchet differentiability following [@LangRFA].

**Definition (Fréchet differentiability [@LangRFA] XIII.6).**
Let $E,F$ be Banach spaces, $U_E \subset E$ an open subset and $\phi:U_E \ra F$ a map.

* (Fréchet differentiable)
    We say that $\phi$ is Fréchet differentiable at a point $x \in U_E$ if there
    exists a bounded linear map $L \in \KL(E,F)$ such that

    $$
      \lim_{v\to 0} \frac{1}{\|v\|}\, \|\Delta(\phi; x; v) - L(v)\| = 0.
    $$

    The map $L$ is uniquely determined and written $D(\phi; x)$, so that $D(\phi; x; v) = L(v)$.

* ($C^1$ maps)
    We say that $\phi$ is continuously Fréchet differentiable ($C^1$) on $U_E$
    if $D(\phi; x)$ exists for every $x \in U_E$ and the map $x \mapsto D(\phi; x) \in \KL(E,F)$ is continuous.

* ($C^k$ maps)
    Recursively, $\phi$ is $k$-times continuously Fréchet differentiable ($C^k$)
    if $\phi$ is $C^1$ and $x \mapsto D(\phi; x)$ is $C^{k-1}$.
    We write $C^k(U_E, F)$ for the space of such maps, and denote by

    $$
      D^k(\phi; x; v_1,\dots,v_k) := D(z \mapsto D^{k-1}(\phi; z; v_1,\dots,v_{k-1});\, x;\, v_k)
    $$

    the $k$-th Fréchet differential. This is a symmetric $k$-linear form: $D^k(\phi; x) \in \KL^s(^k E, F)$.
    When the order is clear from context, we write $D(\phi; x; v_1,\dots,v_k)$ for $D^k(\phi; x; v_1,\dots,v_k)$.


**Definition (Taylor polynomials).** {#def:taylor}
Let $\phi \in C^k(U_E, F)$ and $x \in U_E$. The *Taylor polynomial* of $\phi$ at $x$ is

$$
  T^k(\phi; x; v) := \sum_{\ell=0}^k \frac{1}{\ell!} D^\ell(\phi; x; v,\dots,v), \quad T^k(\phi; x) \in \KP_{\le k}(E, F).
$$

The *reduced Taylor polynomial* is $T_{\ast}^k(\phi; x; v) := T^k(\phi; x; v) - \phi(x)$,
so that $T_{\ast}^k(\phi; x; 0) = 0$.

**Remark.**
The full Taylor polynomial $T^k$ is the correct object for studying the commutative algebra of functions under pointwise multiplication.
The reduced Taylor polynomial $T_{\ast}^k$ is the correct object for studying functions under composition.
We will focus on the reduced version in what follows, returning to the full version for the Leibniz rule ([#prop:leibniz]).


**Proposition (Taylor Approximation [@LangRFA], XIII.6).** {#prop:taylor}
Let $\phi \in C^k(U_E, F)$ and $x \in U_E$.

1. The Taylor remainder in Peano form $R^k(\phi; x) := \Delta(\phi; x) - T_{\ast}^k(\phi; x)$ satisfies:

    $$
    \Delta(\phi; x; v) = T_{\ast}^k(\phi; x; v) + R^k(\phi; x; v)
    $$

    and $\|R^k(\phi; x; v)\|/\|v\|^k \to 0$ as $v \to 0$.

2. (Uniqueness) Let $\Delta(\phi; x) = T + R$ be any other decomposition with
    $T \in \KP_{\leq k}(E,F)$, $T(0) = 0$, and
    $\|R(v)\|/\|v\|^k \ra 0$ as $v \ra 0$.
    Then $T = T_{\ast}^k(\phi; x)$ and $R = R^k(\phi; x)$.


**Proof.**
Part 1 is standard ([@LangRFA], XIII.6).
For the uniqueness (part 2), assume $\Delta(\phi; x) = T + R = T' + R'$ are two such decompositions.
Then $p = T-T' = R-R'$ is a polynomial of degree $\leq k$ with $\|p(v)\|/\|v\|^k \ra 0$ for $v \ra 0$.
By Lemma [#lem:poly-props] we must have $p = 0$.


**Lemma (Lipschitz Continuity).** {#lem:lipschitz}
If $\phi \in C^k(U_E, F)$ with $k \geq 1$, then $\phi$ is locally Lipschitz continuous:
for every $x \in U_E$ there exist $C > 0, \eps > 0$ such that $\| \Delta(\phi; x; v) \| \leq C \|v\|$
for all $\|v\| < \eps$.

**Proof.**
We may assume $x = 0$.
Write $T_{\ast}^k(\phi; 0) = P$ and $R^k(\phi; 0) = R$.
By Lemma [#lem:poly-props] there exist $\eps > 0$ and $C_1 > 0$ such that $\|P(v)\| \leq C_1\|v\|$ for $\|v\| < \eps$.
Since $R(v) = o(\|v\|^k)$ we have $\|R(v)\| \leq C_2\|v\|^k \leq C_2\|v\|$ for $\|v\| < \min(\eps, 1)$.
Thus $\|\Delta(\phi; 0; v)\| \leq \|P(v)\| + \|R(v)\| \leq (C_1 + C_2)\|v\|$ for $\|v\|$ small.


## Taylor Composition

We now prove the main result: reduced Taylor polynomials compose, up to degree truncation.

**Theorem (Taylor Composition).** {#thm:fdb-comp}
Let $E,F,G$ be Banach spaces.
Let $U_E \subset E$ be open, $x \in U_E$, and $\phi \in C^k(U_E, F)$.
Let $U_F \subset F$ be open with $y = \phi(x) \in U_F$ and $\psi \in C^k(U_F, G)$.

Then $\psi \circ \phi \in C^k(U_E, G)$ and the reduced Taylor polynomials compose:

$$
   T_{\ast}^k(\psi \circ \phi;\, x) = \pi_{\leq k}( T_{\ast}^k(\psi;\, y) \circ T_{\ast}^k(\phi;\, x) ).
$$

**Proof.**
By translation, we may assume $x=0$ and $\phi(x) = y = 0$ as well as $\psi(y) = 0$ throughout the proof.
In particular $\Delta(\phi; 0) = \phi$, $\Delta(\psi; 0) = \psi$.

Choose Taylor decompositions $\phi = P + R$ and $\psi = Q + S$,
with polynomials $P,Q$ of degree $\le k$ and remainders $R,S$ vanishing to order $k$ at $0$.
Now write $\psi\circ\phi = Q(\phi) + S(\phi)=\pi_{\le k}(Q\circ P) + E$, with:

$$
  E := Q(\phi) + S(\phi) - Q(P) + \pi_{> k}(Q\circ P).
$$
We have to show that $\|E(x)\| / \|x\|^k \to 0$ for $x \to 0$.

Clearly $\| \pi_{> k}(Q\circ P) \| / \|x\|^k \to 0$ for $x \to 0$ by Lemma [#lem:poly-props].

To see that $\|S(\phi(x))\|/\|x\|^k \to 0$ we argue as follows:
By the Lipschitz property of $\phi$ (Lemma [#lem:lipschitz]),
we find $\delta > 0, C > 0$ so that $\|\phi(x)\| < C \|x\|$ for all $\|x\| < \delta$.
Since $S$ is a Taylor residual we have $\|S(y)\| < \eta(y) \|y\|^k$ with $\eta(y) \to 0$ as $y \to 0$.
Hence $\|S(\phi(x))\|/\|x\|^k \leq \eta(\phi(x)) C^k \to 0$ as $x \to 0$.

For the term $Q(P+R) - Q(P)$, we decompose $Q(y) = \sum_{\ell=0}^k Q_\ell(y) = \sum_\ell \frac{1}{\ell!} B_\ell[y^{\tensor \ell}]$
where $Q_\ell = \pi_\ell Q$ and $B_\ell = \Pol_\ell Q$.
Then

$$
  Q_\ell(P+R) - Q_\ell(P)
  = \sum_{\substack{i+j=\ell\\ j\ge1}} \frac{1}{i!\,j!}\,B_\ell(P^{\tensor i}, R^{\tensor j}).
$$

It suffices to show that each summand $B_\ell(P^{\tensor i}, R^{\tensor j})$ is in $o(\|x\|^k)$.
To this end we note that:

- $\|B_\ell(P(x)^{\tensor i}, R(x)^{\tensor j})\| \leq \|B_\ell\| \cdot \|P(x)\|^i \|R(x)\|^j$ as $B_\ell \in \KL^s(^\ell F,G)$ bounded.
- $\|P(x)\| \le C\|x\|$ for $\|x\| < \delta$ as $P$ is Lipschitz (Lemma [#lem:poly-props]) and $P(0) = 0$.
- $\|R(x)\| < \eta(x) \|x\|^k$ with $\eta(x) \ra 0$ for $x \to 0$ as $R$ is a Taylor remainder.

So that:

$$
  \|B_\ell(P^{\tensor i}(x),R^{\tensor j}(x))\| / \|x\|^k
  \leq
  \|B_\ell\| \; C^i \; \eta(x)^j \; \|x\|^{i + (j - 1) k}
  \to 0 \qtext{as} x \to 0
$$

For the last step, note that $j \geq 1$ so the factor $\eta(x)^j \to 0$ as $x \to 0$,
and $i + (j - 1) k \geq 0$ hence $\|x\|^{i + (j - 1) k}$ stays bounded (and even goes to zero for $j \geq 2$).


**Remark (Pointwise Taylor approximation).**
The assumptions of this theorem can be slightly weakened.
The proof does not use the existence of derivatives in a neighborhood or the continuity of $z \mapsto D^j(\phi; z)$.
What is needed is only a decomposition $\Delta(\phi; x) = P + R$ with $P \in \KP_{\le k}(E,F)$, $P(0) = 0$,
and $\|R(v)\|/\|v\|^k \to 0$ as $v \to 0$ (the Peano remainder condition), and similarly for $\psi$ at $y$.
The theorem therefore applies to a broader class of functions that are well approximated by a polynomial at a single point.


## Partition Form Faà di Bruno

The partition form of Faà di Bruno is obtained by polarizing the Taylor composition theorem:
extracting the degree-$k$ symmetric multilinear part from both sides.

**Definition.**
Let $I$ be a finite set.

* An un-ordered (non-empty) partition $\pi$ of $I$
    is a set $\pi = \set{B_1,\dots,B_r}$ of subsets $B_i \subset I$ ("blocks"),
    so that $B_i$ are disjoint, $I = \union_{i=1}^r B_i$ and $B_i \neq \emptyset$.
    We write $\pi \part I$ in this case and call $|\pi| = r$ the rank of $\pi$.

* An *ordered $r$-decomposition* of $I$
    is a tuple $(B_1,\dots,B_r)$ of subsets $B_i \subset I$, so that
    $B_i$ are disjoint and $I = \union_{i=1}^r B_i$.
    We write $(B_1,\dots,B_r) \opart I$ in this case.

    Note that we allow empty blocks, so that this datum is equivalent to a
    map $\sigma: I \ra [r]$ with $B_i = \sigma^{-1}\set{i}$.

* For a set $X$, a tuple $v = (v_i)_{i \in I} \in X^I$ and a block $B \subset I$,
    we write $v_B := (v_b)_{b \in B} \in X^B$ for the restricted tuple.


**Theorem (Multivariate Faà di Bruno - Partition Form, cf. [@Levy2006]).** {#thm:fdb-part}
Let $x \in U_E \subset E$ and set $y := \phi(x) \in F$.
Assume that $\phi \in C^k(U_E, F)$ and $\psi \in C^k(U_F, G)$.
For $u_1,\dots,u_k\in E$ we have:

$$
  D(\psi\circ\phi;\, x;\, u_1,\dots,u_k)
  =
  \sum_{\pi \part [k]}
  D(\psi;\, y;\, (D(\phi;\, x;\, u_B))_{B\in\pi}).
$$

The order of the blocks is immaterial because higher derivatives are symmetric.


**Proof.**
Fix $u_1,\dots,u_k\in E$.
By translation, we may again assume $x=0$ and $y=0$ throughout the proof.
Fix Taylor decompositions $\phi = P + R$, $\psi = Q + S$ with $P,Q$ polynomial of degree $\le k$.
By [#thm:fdb-comp] we have $T_{\ast}^k(\psi \circ \phi; 0) = \pi_{\leq k}(Q \circ P)$,
and hence $D(\psi\circ\phi; 0) = \Pol_k (Q \circ P)$.

Write the polynomial maps in polarized form as

$$
  P(x) = \sum_{m=1}^k \frac{1}{m!}\,P_m[x^{\tensor m}], \qquad
  Q(y) = \sum_{r=1}^k \frac{1}{r!}\,Q_r[y^{\tensor r}].
$$

Expanding $Q_r$ by multilinearity and isolating the degree $k$ term gives:

$$
  \pi_k Q(P(x))
  = 
  \sum_{r=1}^k
  \sum_{\substack{m_1,\dots,m_r\ge1 \\\\ m_1+\cdots+m_r = k}}
  \frac{1}{r!} Q_r[\frac{1}{m_1!} P_{m_1}[x^{\tensor m_1}],\dots,\frac{1}{m_r!} P_{m_r}[x^{\tensor m_r}]].
$$

Applying $\Pol_k$ on both sides using Lemma [#lem:pol-comp] below gives:

$$
  D(\psi\circ\phi; 0; u_1,\dots,u_k)
  = 
  \sum_{r=1}^k
  \ssum{m_1,\dots,m_r\ge1 \\\\ m_1+\cdots+m_r = k}
  \ssum{(B_1,\dots,B_r) \opart [k] \\\\ |B_i| = m_i}
  \frac{1}{r!}
  Q_r[P_{m_1}[u_{B_1}],\dots,P_{m_r}[u_{B_r}]].
$$

Now observe that there are exactly $r!$ re-orderings of each ordered decomposition $(B_1,\dots,B_r)$,
and these re-orderings yield the same summand as $Q_r$ is symmetric.
Hence the sum over $m_i, B \opart [k]$ can be replaced by a single sum over un-ordered partitions $\pi \part [k]$
with given block sizes $|B_i| = m_i$.
Furthermore we have $Q_r[v_1,\dots,v_r] = D(\psi; 0; v_1,\dots,v_r)$
and $P_m[u_1,\dots,u_m] = D(\phi; 0; u_1,\dots,u_m)$ by definition.
Substituting these into the above formulas yields the claim.


It remains to prove the composition polarization lemma used above.

**Lemma (Composition Polarization).** {#lem:pol-comp}
If $k = m_1 + \dots + m_r \in \IN_0$ and $A_i \in \KL^s(^{m_i} E,F)$, and $B \in \KL^s(^r F,G)$.
Let

$$
H(x) = B[\frac{1}{m_1!}A_1[x^{\tensor m_1}], \dots, \frac{1}{m_r!}A_r[x^{\tensor m_r}]]
$$

then:

$$
\Pol_k(H)[u_1,\dots,u_k] = \ssum{(B_1,\dots,B_r) \opart [k], \\\\ |B_i| = m_i} B[A_1[u_{B_1}], \dots, A_r[u_{B_r}]].
$$

**Proof.**
Let $G[u_1,\dots,u_k]$ be the claimed expression for $\Pol_k(H)[u_1,\dots,u_k]$.
As both sides are symmetric, bounded $k$-multilinear forms in $u_1,\dots,u_k$
we only have to validate that $\frac{1}{k!} G[x^{\tensor k}] = H$.
We find:

$$
G[x^{\tensor k}] 
= \sum_{(B_1,\dots,B_r) \opart [k], \\\\ |B_i| = m_i} B[A_1[x^{\tensor m_1}], \dots, A_r[x^{\tensor m_r}]] 
= \frac{k!}{m_1! \dots m_r!} \cdot B[A_1[x^{\tensor m_1}], \dots, A_r[x^{\tensor m_r}]]
$$

as there are $k! / m_1! \dots m_r!$ ordered decompositions of $[k]$ into subsets of sizes $m_1,\dots,m_r$.
Re-arranging the factorials yields the claim.


## Multi-index Faà di Bruno

In coordinates, the Taylor composition theorem yields an explicit formula for partial derivatives of a composition by monomial coefficient extraction.

**Definition (Multi-Indices).**

* Elements $\nu = (\nu_1,\dots,\nu_d) \in \IN_0^d$ are called multi-indices of dimension $d$.
    We write $|\nu| = \sum_i \nu_i$ for the degree and $\nu! := \nu_1! \cdots \nu_d!$ for the factorial.

* If $A$ is a commutative algebra and $v \in A^d$ is a $d$-tuple,
    then we write: $v^\nu = \prod_i v_i^{\nu_i} \in A$.

* If $E = \IR^d$, write $v^1,\dots,v^d: E \ra \IR$ for the coordinate projections.
    The monomials $v^\nu$, $\nu \in \IN_0^d$, form a basis of $\KP(E)$.

* If $U \subset \IR^d$ is open and $\phi \in C^k(U, F)$ with $x \in U$.
    Let $\nu \in \IN_0^d$ with $k = |\nu|$.
    We define the partial derivative $\del^\nu \phi (x) \in F$ via the basis expansion of
    $T_{\ast}^k(\phi; x) \in \KP(\IR^d,F) = \KP(\IR^d) \tensor F$ as coefficient of $v^\nu/\nu!$:

    $$
      T_{\ast}^k(\phi; x; v) = \sum_{1 \leq |\nu| \leq k} \frac{v^\nu}{\nu!} \; \del^\nu \phi(x).
    $$


**Theorem (Multivariate Faà di Bruno - Multi-index Form, cf. [@CS1996]).** {#thm:fdb-multi}
Let $x \in U \subset \IR^d$ and set $y := \phi(x) \in \IR^n$.
Assume that $\phi \in C^k(U, \IR^n)$ and $f \in C^k(\IR^n, \IR)$.

For $\alpha \in \IN_0^d$, $\alpha \neq 0$ the partial derivatives of the composition are given by:

\begin{align*}
  \frac{\del^\alpha (f \circ \phi) (x)}{\alpha!}
=
  \sum_{\beta\in\IN_0^n}
  \del^\beta f(y)\,
  \sum_{\rho\,(\ast)}
  (
    \prod_{\gamma \in \IN_0^d}
    \frac{1}{\rho(\gamma)!}
    \frac{(\del^\gamma \phi(x))^{\rho(\gamma)}}{(\gamma!)^{|\rho(\gamma)|}}
  )
\end{align*}

where $(\ast)$ runs over all finitely supported maps $\rho:\IN_0^d\setminus\set{0} \ra \IN_0^n$
satisfying $\sum_\gamma \rho(\gamma) = \beta$ and $\sum_\gamma \gamma|\rho(\gamma)| = \alpha$.


This is equivalent to the tuple form stated in the introduction:
enumerating the support of $\rho$ in any total order on $\IN_0^d$ recovers the Constantine--Savits formula.

**Proof.**
We may assume that $x = y = f(y) = 0$, without loss of generality.

Step 1: Taylor Expansion)
Write $v^1,\dots,v^d$ for the coordinate functions on $\IR^d$ and $w^1,\dots,w^n$ for the coordinates on $\IR^n$.
Expand the Taylor polynomials of $\phi$ and $f$ as

$$
  P(v) = T_{\ast}^k(\phi; 0; v) = \ssum{\alpha \in \IN_0^d \\\\ 1 \leq |\alpha| \leq k} \frac{v^\alpha}{\alpha!} \; p_\alpha,
  \qquad
  F(w) = T_{\ast}^k(f; 0; w) = \ssum{\beta \in \IN_0^n \\\\ 1\leq |\beta| \leq k} \frac{w^\beta}{\beta!} \; f_\beta,
$$

with $p_\alpha = \del^\alpha \phi(0) \in \IR^n$ and $f_\beta = \del^\beta f(0) \in \IR$.

Step 2: Polynomial Composition)
By Theorem [#thm:fdb-comp] we have $\del^\nu (f \circ \phi)(0)/\nu! = [v^\nu](F \circ P)$.
We compute $[v^\nu](F \circ P)$ as follows: Let $m \geq 0$. For each coordinate $w^i$ we have:

$$
(w^i\circ P)^{m}
=
  (\sum_{\alpha \in \IN_0^d}
  \frac{p_\alpha^i}{\alpha!}\; v^\alpha)^{m}
=
  \sum_{\alpha_1,\dots,\alpha_m \in \IN_0^d}
  \prod_{j=1}^m
  \frac{p_{\alpha_j}^i}{\alpha_j!} v^{\alpha_j}
=
  \ssum{\rho_i:\IN_0^d \ra \IN_0 \\\\ \sum_\alpha \rho_i(\alpha) = m}
  (\frac{m!}{\prod_{\alpha \in \IN_0^d} \rho_i(\alpha)!})
  \prod_{\alpha\in \IN_0^d}
  (\frac{p_\alpha^i}{\alpha!}\,v^\alpha)^{\rho_i(\alpha)}.
$$

Note that there are only finitely many maps $\rho:\IN_0^d \ra \IN_0$ with $\sum_\alpha \rho(\alpha) = n$,
and that each of those maps is finitely supported i.e. $\rho(\alpha) = 0$ except for finitely many $\alpha \in \IN_0^{d}$.
In the second step the map $\rho_i$ counts the number of occurrences of $\alpha$ in a given
tuple $(\alpha_1,\dots,\alpha_m)$, i.e. $\rho_i(\alpha) = \# \Set{j}{\alpha_j = \alpha}$.
For each given map $\rho_i$ we have $m!/\prod_{\alpha \in \IN_0^d} \rho_i(\alpha)!$
tuples which give the same map.

Now let $\beta \in \IN_0^n$ and apply this formula to each $m = \beta_i \in \IN_0$.
Write $\rho: \IN_0^d \ra \IN_0^n$, $\rho(\alpha) = (\rho_1(\alpha),\dots,\rho_n(\alpha))$, so that:

\begin{align*}
  (w \circ P)^\beta
&=
  \prod_{i=1}^n (w^i \circ P)^{\beta_i}
=
  \ssum{\rho:\IN_0^d \ra \IN_0^n\\\\ \sum_\alpha \rho(\alpha) = \beta}
  (
    \prod_{i=1}^n
    \frac{\beta_i!}{\prod_\alpha \rho_i(\alpha)!}
  )
  \prod_{i=1}^n
  \prod_{\alpha \in \IN_0^d}
  (
    \frac{p_\alpha^i}{\alpha!}\,v^\alpha
  )^{\rho_i(\alpha)}
  \\\\
&=
  \beta! \;
  \ssum{\rho:\IN_0^d \ra \IN_0^n \\\\ \sum_\alpha \rho(\alpha) = \beta}
  (
    \prod_{\alpha \in \IN_0^d}
    \frac{1}{\rho(\alpha)!}
    \frac{(p_\alpha)^{\rho(\alpha)}}{(\alpha!)^{|\rho(\alpha)|}}
  ) \;
  v^{\sum_\alpha \alpha|\rho(\alpha)|}.
\end{align*}

Substituting into $F(P(v))$ and extracting the $v^\alpha$ coefficient gives:

\begin{align*}
  \frac{\del^\alpha (f \circ \phi) (0)}{\alpha!}
= 
  [v^\alpha]\, (F \circ P)
=
  [v^\alpha]\,
  \sum_{\beta\in\IN_0^n}
  \frac{f_\beta}{\beta!}\,(w \circ P)^\beta
=
  \sum_{\beta\in\IN_0^n}
  f_\beta\,
  \sum_{\rho\,(*)}
  (
    \prod_{\gamma \in \IN_0^d}
    \frac{1}{\rho(\gamma)!}
    \frac{(p_\gamma)^{\rho(\gamma)}}{(\gamma!)^{|\rho(\gamma)|}}
  )
\end{align*}

Here $(\ast)$ runs over all maps $\rho:\IN_0^d \ra \IN_0^n$
satisfying $\sum_\gamma \rho(\gamma) = \beta$ and $\sum_\gamma \gamma|\rho(\gamma)| = \alpha$.
Since $P(0) = 0$, only maps with $\rho(0) = 0$ contribute,
so we may restrict to $\rho:\IN_0^d\setminus\set{0} \ra \IN_0^n$.
The constraint $\sum_\gamma \gamma|\rho(\gamma)| = \alpha$ with $|\gamma| \geq 1$ forces $1 \leq |\beta| \leq |\alpha|$.


**Remark (Factorials and Symmetry).**
Controlling the complexity of combinatorial expressions is a key technical difficulty when working with Faà di Bruno.
An important insight in this presentation is that factorials are always associated with symmetrization:
passing from multilinear maps to polynomials via diagonal evaluation,
or quotienting out ordering information (e.g., from ordered decompositions to unordered partitions).
Formulas are often simpler when symmetry is not yet imposed.
We deliberately keep each factorial adjacent to the corresponding symmetrized quantity to make the combinatorics transparent.


## Product Rule

As an application of the Taylor composition theorem, we derive a higher-order product rule for pointwise multiplication.

**Proposition (Leibniz rule).** {#prop:leibniz}
Let $E$ be a Banach space and let $f_1,\dots,f_n:E\to\IR$ be $k$-times Fréchet differentiable at a point $x \in E$.
Recall the (unital) Taylor polynomial $T^k(f; x; v) = f(x) + T_{\ast}^k(f; x; v)$ from [#def:taylor].
Then:

1. (Taylor form).

    $$
    T^k(f_1 \cdots f_n;\, x;\, v) = \pi_{\leq k}(T^k(f_1;\, x;\, v) \cdots T^k(f_n;\, x;\, v)).
    $$

2. (Ordered-decomposition form.) For $u_1,\dots,u_k\in E$,

    $$
    D(f_1 \cdots f_n;\, x;\, u_1,\dots,u_k)
    =
    \ssum{(B_1,\dots,B_n) \opart [k]}\ D(f_1;\, x;\, u_{B_1}) \cdots D(f_n;\, x;\, u_{B_n})
    $$

    where we use the convention $D(f_i; x; u_\emptyset) = f_i(x)$ for the empty block.

3. (Multi-index form.) If $E=\IR^d$ and $\nu\in\IN_0^d$ with $|\nu|=k$, then

    $$
    \frac{\del^\nu}{\nu!}(f_1 \cdots f_n)(x)
    =
    \ssum{\nu_1,\dots,\nu_n \in \IN_0^d \\\\ \nu_1 + \dots + \nu_n = \nu}\ \frac{\del^{\nu_1}f_1(x)}{\nu_1!} \cdots \frac{\del^{\nu_n}f_n(x)}{\nu_n!}
    $$

    where the sum ranges over all tuples $(\nu_1,\dots,\nu_n)\in(\IN_0^d)^n$ with
    $\nu_i \in \IN_0^d$ with $\nu_1+\cdots+\nu_n=\nu$.


**Proof.**
For $k = 0$ both expressions are trivially true. Hence we may assume $k \geq 1$.

Ad 1) 
Set $\phi = (f_1,\dots,f_n): E \ra \IR^n$, and $\psi(y) = \prod_{i=1}^n y_i: \IR^n \ra \IR$,
$c_i = f_i(x)$ so that $\psi \circ \phi = f_1\cdots f_n$ and $c = \phi(x)$.

As $\psi(y) = \prod_{i=1}^n y_i$ is a polynomial itself, the reduced Taylor polynomial at $c$
can be calculated by translation and degree truncation: $T_{\ast}^k(\psi; c; v) = \pi_{\leq k} (\psi(c + v) - \psi(c))$.
Furthermore $T_{\ast}^k(\phi; x; v) = (T_{\ast}^k(f_1; x; v), \dots, T_{\ast}^k(f_n; x; v)) \in \KP(E,\IR^n)=\KP(E)\tensor \IR^n$.

Now Faà di Bruno in composition form (Theorem [#thm:fdb-comp]) yields
$T_{\ast}^k(f_1 \cdots f_n; x; v) = \pi_{\leq k} (\prod_{i=1}^n (c_i + T_{\ast}^k(f_i; x; v)) - \prod_{i=1}^n c_i)$.
Adding $\prod_{i=1}^n c_i$ on both sides gives the claimed identity:

$$
      T^k(f_1 \cdots f_n;\, x;\, v) = \pi_{\leq k}(T^k(f_1;\, x;\, v) \cdots T^k(f_n;\, x;\, v)).
$$

Ad 2) The decomposition formula is derived by applying $\Pol_k$ to both sides of (1).
We hence find:

$$
    D(f_1 \cdots f_n; x)
  =
    \Pol_k \prod_{i=1}^n \sum_{m=0}^k \frac{1}{m!} D(f_i; x; \underbrace{v,\dots,v}_{m})
  =
    \Pol_k \ssum{m_1,\dots,m_n \in \IN_0 \\\\ m_1 + \dots + m_n = k} \prod_{i=1}^n  \frac{1}{m_i!} D(f_i; x; \underbrace{v,\dots,v}_{m_i}).
$$

The claim follows by the Polarization Lemma [#lem:pol-comp] applied to $B[a_1,\dots,a_n] = \prod a_i$.

Ad 3)
Expanding the Taylor polynomial in multi-index form $T^k(f_i; x; v) = \sum_{0 \leq |\mu| \leq k} \frac{v^\mu}{\mu!} \del^\mu f_i(x)$,
we find:

$$
\frac{\del^\nu F(x)}{\nu!} 
= [v^\nu] \prod_{i=1}^n \sum_{0 \leq |\mu| \leq k} \frac{v^\mu}{\mu!} \del^\mu f_i(x) 
= \sum_{\nu_1 + \cdots + \nu_n = \nu} \frac{\del^{\nu_1} f_1(x)}{\nu_1!} \cdots \frac{\del^{\nu_n} f_n(x)}{\nu_n!}.
$$
