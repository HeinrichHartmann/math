---
type: math-article
title: "A Unified Polynomial Approximation Scheme for Classical Function Spaces"
date: "2026-01-02"
author: "Heinrich Hartmann"
orcid: "0000-0002-3929-2421"
affiliation: "Hartmann IT GmbH"
email: "Heinrich@HeinrichHartmann.com"
doi: "10.5281/zenodo.18132526"
slug: "2026-Polynomial-Approximation"
status: "900 Published"
target: paper
publications:
  pdf: "https://github.com/HeinrichHartmann/math/releases/download/2026-01-02-Polynomial-Approximation/2026-01-02-Polynomial-Approximation.pdf"
  GitHub: "https://github.com/HeinrichHartmann/math/releases/tag/2026-01-02-Polynomial-Approximation"
  Zenodo: "https://doi.org/10.5281/zenodo.18132526"
hide:
  - navigation
abstract: |
    We prove polynomial density theorems for a broad class of classical function spaces on domains
    $\Omega \subset \IR^n$, in both local (compact-open) and global (Banach) topologies.
    In the local regime we show that restrictions of polynomials are dense in $C^k(\Omega)$,
    $C^\infty(\Omega)$, and $L^p_{loc}(\Omega), W^{k,p}_{loc}(\Omega)$ for arbitrary open $\Omega$.

    In the global regime on bounded domains we re-prove the classical density results for
    $C^0(\bar{\Omega})$ (Stone-Weierstrass) and $L^p(\Omega)$.
    For higher-differentiable function spaces ($k \geq 1$), polynomial density depends on regularity of
    the domain. We show density in $C^k_b(\bar{\Omega})$ for $C^k$-extension domains (e.g. smooth boundary)
    and in $W^{k,p}(\Omega)$ for Sobolev-extension domains (e.g. Lipschitz boundary).

    The proofs are organized around a single approximation pipeline: extension, compact truncation,
    analytic regularization, and Taylor approximation. This yields straightforward, standard and unified
    arguments that make explicit the domain assumptions underlying several folklore polynomial-density
    statements; we also record counterexamples showing that such hypotheses are necessary for global
    approximation in strong norms.

math:
  proof_style: expanded
  preamble: |
    \newcommand{\Coef}{\mathrm{Coef}}
    \newcommand{\csub}{\Subset}
    \newcommand{\esssup}{\operatorname*{ess\,sup}}
zenodo:
  doi: "10.5281/zenodo.18132526"
  license: "cc-by-4.0"
  upload_type: "publication"
  publication_type: "article"
---

## Introduction

The modern theory of polynomial approximation begins with Weierstrass' approximation theorem (1885), 
asserting that every continuous function on a closed interval can be uniformly approximated by algebraic 
polynomials [@Weierstrass1885]. Stone's abstraction, the Stone-Weierstrass theorem, identifies
the conceptual mechanism behind this phenomenon: on a compact Hausdorff space $X$, a subalgebra of $C(X)$ 
that contains the constants and separates points is dense in $C(X)$ [@Stone1948]. These results explain why,
on compact subsets $K\subset\IR^n$, polynomials (and trigonometric polynomials) are canonical dense
subclasses in $C(K)$; see, for example, [@Cheney1966] [@Timan1963].

Beyond the $C^0$ setting, approximation with derivatives becomes subtler. For $C^k$-spaces on manifolds,
Nachbin studied when $C^k$-subalgebras are dense in $C^k(M)$ under structural hypotheses [@Nachbin1965].
In Sobolev theory, smooth approximation is a basic tool (the Meyers-Serrin theorem, $H=W$), and standard 
references for the Sobolev scale and its approximation machinery include Adams-Fournier [@AdamsFournier2003].

In day-to-day analysis and PDEs one often needs a readily citable statement of the form
"polynomials are dense in $\mathcal X(\Omega)$" for various function spaces $\mathcal X$
and domain hypotheses on $\Omega$.  While the underlying mechanisms are classical, the
corresponding density statements are often recorded only implicitly, or dispersed across
different references and special cases, with domain assumptions left unstated or treated
as folklore. As a result, it is common in practice to cite standard approximation
ingredients (extension theorems, cutoff/localization, approximation by smooth functions,
approximate identities, etc.) and supply ad hoc arguments tailored to the situation at
hand.

The purpose of this note is to provide a self-contained account of polynomial density across
the main working function spaces on domains $\Omega\subset\IR^n$, with the domain
assumptions stated explicitly.
The proofs synthesize several classical approximation mechanisms into a single reusable template.

1. Extension. Reduce approximation on $\Omega$ to approximation on $\IR^n$, via extension operators.
2. Compact localization. Cut-off at infinity to reduce to compactly supported functions on $\IR^n$.
3. Low-pass filtering. The Heat-kernel is used to produce analytic approximants from compactly supported inputs.
4. Taylor truncation. Uniform convergence of Taylor series for analytic functions on compacts.

This unification appears not to be documented in this compact form elsewhere.
Concretely we prove the following theorems:

**Theorem (Approximation on Unbounded Domains).**
Let $\Omega$ be an open set in $\IR^n$.
Then polynomials $\IR[x^1,\dots,x^n]$ restricted to $\Omega$ are
dense in the following spaces:

1. $C^k(\Omega)$ with compact-open $C^k$-topology.
2. $C^\infty(\Omega)$ with compact-open topology.
3. $L^{p}_{loc}(\Omega)$ for $1\le p<\infty$.
4. $W^{k,p}_{loc}(\Omega)$ for $k\in\IN_0$ and $1\le p<\infty$.


**Theorem (Global Approximation on Bounded Extension Domains).**
Let $\Omega$ be an open, bounded set on $\IR^n$.
Let $k\in\IN_0$ and $1 \le p <\infty$.
Then polynomials are dense in:

- $C^0(\bar{\Omega})$ with $\|-\|_{sup}$, (Stone-Weierstrass).
- $L^p(\Omega)$ for $1 \le p < \infty$.
- $C^k_b(\bar{\Omega})$ as Banach-space with $C^k$-norm, if $\Omega$ is a $C^k$-Extension domain.
- $W^{k,p}(\Omega)$ if $\Omega$ is a Sobolev Extension domain.


Finally, we include concrete counterexamples illustrating that global approximation in strong norms
on $\bar{\Omega}$ genuinely depends on boundary regularity and/or extension properties,
underlining the importance of the domain hypotheses.

## Setting

In this section we give definitions for all local function spaces we will consider.
Here "local" means that these spaces do not control the behavior of the functions at the boundary of the domain. 
Instead function behavior is constrained on compact subsets $K$, via a family of seminorms
that depend on $K$ and some extra parameters.

We follow notation from [@hormander1983analysis], [@LangRFA], [@AdamsFournier2003]. 
We write $K \csub \Omega$ to mean that $K$ is compactly contained in $\Omega$, i.e. $K \subset \IR^n$ is compact and $K \subset \Omega$.


### Local Function Spaces

**Definition ($C^k(\Omega)$ spaces, [@LangRFA]).**
For $k\in\IN_0$ and $\Omega \subset \IR^n$ open.

* For $k\in\IN_0$, the space $C^k(\Omega)$ consists of functions $f:\Omega\to\IR$ 
    with continuous partial derivatives $\del^\alpha f$ for all $|\alpha|\le k$.
    We equip $C^k(\Omega)$ with the topology generated by the seminorms
    $$
    \rho_{K,\alpha}(f) := \sup_{x\in K}|\del^\alpha f(x)|
    $$
    where $K \csub \Omega$ is compactly contained, and $\alpha \in \IN^n$ is a multi-index with
    $|\alpha| \leq k$.

* We denote by $C^k_c(\Omega)$ the subspace of compactly supported functions.


**Definition ($L^p_{loc}(\Omega)$ Local-$L^p$-spaces, [@LangRFA]).** 
Let $1\le p<\infty$, and $\Omega \subset \IR^n$ a Lebesgue-measurable subset.

* Let $L^1_{loc}(\Omega)$ be the set of equivalence classes of measurable, 
    locally integrable functions $f: \Omega \ra \IR$, where $f,f'$ are equivalent 
    if they are equal almost everywhere.

* The space $L^p_{loc}(\Omega) \subset L^1_{loc}(\Omega)$ is defined as the set of functions with:

    $$
    \lambda^p_{K}(f) := (\int_K |f(x)|^p\;dx)^{1/p} < \infty
    $$

    for all $K \csub \Omega$.
    We equip $L^p_{loc}(\Omega)$ with the topology generated by the seminorms $\lambda^p_{K}$.

* Let $L^p_c(\Omega)$ be the subspace of $L^p_{loc}(\Omega)$ of functions with
    compact essential support (ie. $f=0$ a.e. outside of a compact set.)


**Definition ($W_{loc}^{k,p}(\Omega)$ Local-Sobolev-spaces, [@Weber2018Sobolev], Sec.4.2.4).** 
For $k\in\IN_0$ and $1\le p<\infty$, and $\Omega \subset \IR^n$ open.

* A function $f \in L^1_{loc}(\Omega)$ is weakly differentiable in the direction
    $\alpha \in \IN_0^n$ if there exists $g \in L^1_{loc}(\Omega)$ with:
    $$
        \int_\Omega (\del^\alpha \phi) \; f \, d\mu = (-1)^{|\alpha|} \int_\Omega \phi \; g\, d\mu
    $$
    for all test functions $\phi \in \KC^\infty_0(\Omega)$.
    If a weak derivative exists it is uniquely determined as a class in $L^1_{loc}(\Omega)$,
    and denoted by $\del_v f$.

* The local Sobolev space $W^{k,p}_{loc}(\Omega)$ consists of functions $f\in L^1_{loc}(\Omega)$ 
    whose weak derivatives $\del^\alpha f$ exist for all $|\alpha|\le k$ and satisfy

    $$
    \lambda^p_{K, \alpha}(f) := \lambda^p_K(\del^\alpha f) = (\int_K |\del^\alpha f(x)|^p\;dx)^{1/p} < \infty
    $$

    for all $K \csub \Omega$ and multi-indices $|\alpha| \leq k$.
    We equip $W^{k,p}_{loc}(\Omega)$ with the topology generated by the seminorms $\lambda^p_{K,\alpha}$.

* Note that $L^p_{loc}(\Omega) = W^{0,p}(\Omega)$ is a special case.

* Let $W^{k,p}_c(\Omega) \subset W^{k,p}_{loc}(\Omega)$ be the subspace of functions
    with compact essential support.


We will give several equivalent charaterizations of $W^{k,p}_{loc}$ in Lemma [#WLOC].

**Proposition (Zero extension).** {#zero-extension}
For $\Omega \subset \IR^n$ open, $E_0$ be the zero extension operator:
$$
    E_0: L^1_{loc}(\Omega) \lra L^1_{loc}(\IR^n)
$$
with $E_0(f)(x) = x$ for $x \in \Omega$ and $E_0(f)(x) = 0$ otherwise.

- $E_0$ restricts to a continuous linear operator: $E_0: W_c^{k,p}(\Omega) \ra W^{k,p}(\IR^n)$ for $k\in\IN_0$, $1\le p<\infty$.
- $E_0$ restricts to a continuous linear operator: $E_0: C^{k}_c(\Omega) \ra C^{k}(\IR^n)$ for $k \in \IN_0$.
- We have $\del^\alpha E_0(f) = E_0(\del^\alpha f)$ for all $f \in W^{k,p}_c(\Omega)$
    for the weak/distributional and classical/Frechet derivatives.


**Proof.**
Let $u\in W^{k,p}_c(\Omega)$ and choose $U$ with $\esssupp(u)\subset U\csub\Omega$. Then
$u\in W^{k,p}(U)$ and each $\del^\alpha u\in L^p(U)$ for $|\alpha|\le k$. For $\varphi\in C_c^\infty(\IR^n)$,

$$
\langle \del^\alpha(E_0u),\varphi\rangle
=(-1)^{|\alpha|}\int_\Omega u\,\del^\alpha\varphi
=(-1)^{|\alpha|}\int_U u\,\del^\alpha\varphi
=\int_U \del^\alpha u\,\varphi
=\langle E_0(\del^\alpha u),\varphi\rangle.
$$

Hence $\del^\alpha(E_0u)=E_0(\del^\alpha u)$ in $\mathcal D'(\IR^n)$, so $E_0u\in W^{k,p}(\IR^n)$ and
$\|E_0u\|_{W^{k,p}(\IR^n)}=\|u\|_{W^{k,p}(\Omega)}$. This gives continuity of
$E_0: W^{k,p}_c(\Omega)\to W^{k,p}(\IR^n)$.

If $u\in C^k_c(\Omega)$, then $E_0u$ is $C^k$ on $\IR^n$, with $\del^\alpha(E_0u)=E_0(\del^\alpha u)$
pointwise for $|\alpha|\le k$ (all derivatives vanish near $\del\Omega$ because the support is compactly contained).
In particular, $\|E_0u\|_{C^k(\IR^n)}=\|u\|_{C^k(\Omega)}$, so $E_0: C^k_c(\Omega)\to C^k(\IR^n)$ is continuous.


**Lemma (Cutoff multiplier).** {#cutoff-multiplier}
Let $\Omega\subset\IR^n$ be open, $k\in\IN_0$, $1\le p<\infty$, and $\chi\in C^\infty(\Omega)$.
Then multiplication by $\chi$ defines a continuous map

$$
M_\chi: W^{k,p}_{loc}(\Omega)\to W^{k,p}_{loc}(\Omega),\qquad f\mapsto \chi f.
$$


**Proof.**
Fix $K\csub\Omega$. Since $\chi\in C^\infty(\Omega)$, all derivatives $\del^\gamma\chi$ are bounded on $K$.
The Leibniz rule for weak derivatives ([@AdamsFournier2003]) 
$\del^\alpha(\chi f)=\sum_{\beta\le\alpha}\binom{\alpha}{\beta}(\del^{\alpha-\beta}\chi)(\del^\beta f)$ in $\mathcal D'(\Omega)$.
Taking $L^p(K)$-norms and using the bounds on $\del^{\alpha-\beta}\chi$ gives the required bounds on the semi-norms.


### Global Function Spaces

In this section we introduce all global function spaces we will consider.
Here "global" means that the topology is defined by global estimates on the whole domain of definition.

**Definition ($C^k_b$ Banach-spaces, [@LangRFA]).**

* Let $C^k_b(\Omega) \subset C^k(\Omega)$ be the subspace of functions
    with finite $C^k$-norm:

    $$
      \|f\|_{C^k_b(\Omega)} = \max_{|\alpha| \leq k} \; \sup_{x \in \Omega}\; | \del^\alpha f(x) | < \infty
    $$
    
    Then $C^k_b(\Omega)$ is Banach space with norm topology.

* Let $C^k_b(\bar{\Omega}) \subset C^k(\Omega)$ be the subspace 
    of functions $f$ where $\del^\alpha f$ admits a continuous, bounded extension to $\bar{\Omega}$ for all $|\alpha| \leq k$.
    
    Then $C^k_b(\bar{\Omega}) \subset C^k_b(\Omega)$ is a closed subspace, and hence complete (Banach).

**Definition ($W^{k,p}$ Banach-spaces, [@AdamsFournier2003]).**

* The (global) Sobolev space  $W^{k,p}(\Omega) \subset L^{1}_{loc}(\Omega)$ is the
    subspace of $k$-times weakly differentiable functions with finite Sobolev norm:

    $$
    \|f\|_{W^{k,p}(\Omega)} :=
    (\sum_{|\alpha|\le k}\|\del^\alpha f\|_{L^p(\Omega)}^p)^{1/p}
    < \infty
    $$

    It is a Banach space with norm topology.

* For $k=0$ we recover the $L^p(\Omega) = W^{0,p}(\Omega)$ space of $p$-integrable functions.


**Lemma (Local $W^{k,p}$ equivalence).** {#WLOC}
Let $\Omega \subset \IR^n$ be open, $k \in \IN_0$ and $1\le p <\infty$.
Then for a function $f \in L^1_{loc}(\Omega)$ the following are equivalent:

- $f \in W^{k,p}_{loc}(\Omega)$ (i.e. finite $\lambda^p_{K,\alpha}$ semi-norms)
- $f|_U \in W^{k,p}(U)$ for all $U \csub \Omega$ relatively compact and open.
- $\phi f \in W^{k,p}(\Omega)$ for all $\phi \in C^\infty_c(\Omega)$.

Note that for $k=0$ we get the corresponding statements for $L^p$ as special case.


**Proof.**
If $u\in W^{k,p}(\Omega)$ and $\phi\in C_c^\infty(\Omega)$, then
$\phi u\in W^{k,p}(\Omega)$ and for $|\alpha|\le k$,

$$
\del^\alpha(\phi u)=\sum_{\beta\le\alpha}\binom{\alpha}{\beta}(\del^\beta\phi)(\del^{\alpha-\beta}u)
$$

as distributions in $\mathcal{D}'(\Omega)$. Multiplication by a smooth function is well-defined in
distributions and satisfies Leibniz' rule; since $\del^\beta\phi\in L^\infty$ and
$\del^{\alpha-\beta}u\in L^p$, the right-hand side lies in $L^p$.
See [@hormander1983analysis] or [@AdamsFournier2003].

Ad 1 to 2): Fix $U\csub\Omega$. By (1), each $\del^\alpha f\in L^p_{loc}(\Omega)$, hence
$\del^\alpha f\in L^p(U)$. For $\psi\in C_c^\infty(U)\subset C_c^\infty(\Omega)$,
$$
\int_U f\,\del^\alpha\psi
=\int_\Omega f\,\del^\alpha\psi
=(-1)^{|\alpha|}\int_\Omega (\del^\alpha f)\,\psi
=(-1)^{|\alpha|}\int_U (\del^\alpha f)\,\psi,
$$
so $f|_U\in W^{k,p}(U)$.

Ad 2 to 3): Let $\phi\in C_c^\infty(\Omega)$ and choose $U\csub\Omega$ with
$\supp(\phi)\subset U$. By (2), $f|_U\in W^{k,p}(U)$, so the cutoff fact gives $\phi f\in W^{k,p}(U)$.
Extending $\phi f$ by zero to $\Omega$ yields $\phi f\in W^{k,p}(\Omega)$.

Ad 3 to 1) Fix $|\alpha|\le k$. Choose an open cover $(V_i)_{i\in I}$ of $\Omega$ by relatively
compact sets $V_i\csub\Omega$, and pick $\phi_i\in C_c^\infty(\Omega)$ with $\phi_i\equiv 1$ on $V_i$. Set
$u_i:=\phi_i f\in W^{k,p}(\Omega)$ and $g_i:=\del^\alpha u_i\in L^p(\Omega)$. For any $\psi\in C_c^\infty(V_i)$
we have $u_i=f$ on $\supp(\psi)$, hence
$$
\int_{V_i} f\,\del^\alpha\psi
=(-1)^{|\alpha|}\int_{V_i} g_i\,\psi.
$$
If $V_i\cap V_j\ne\varnothing$, the same identity with $\psi\in C_c^\infty(V_i\cap V_j)$ shows
$g_i=g_j$ a.e. on $V_i\cap V_j$. Thus we may glue the $g_i$ to a well-defined $g\in L^p_{loc}(\Omega)$ by
setting $g=g_i$ on $V_i$. The identity above shows $g$ is the weak $\alpha$-derivative of $f$ locally, so
$f\in W^{k,p}_{loc}(\Omega)$.



### Extension Domains

**Definition.**
Let $\Omega \subset \IR^n$ be open.
Let $k \in \IN_0$, and $1 \le p \le \infty$.

* We say $\Omega \subset \IR^n$ is a $C^k$-extension domain, if there is a
    bounded extension operator:
    $$
        E: C^k_b(\bar{\Omega}) \ra C^k_b(\IR^n)
    $$
    with $E(f)|_\Omega = f$ for all $f \in C^k_b(\bar{\Omega})$.
    Sometimes called a $C^k$ Whitney extension domain in the literature (cf. [@Seeley1964]).

* We say $\Omega \subset \IR^n$ is a $W^{k,p}$-extension domain, if there
    exists a bounded extension operator:
    $$
        E: W^{k,p}(\Omega) \ra W^{k,p}(\IR^n)
    $$
    so that $E(f)|_\Omega = f$ for all $f \in  W^{k,p}(\Omega)$.

* We say $\Omega$ is a Sobolev extension domain, if it is a $W^{k,p}$-extension
    domain for all choices of $k,p$.

**Example.**

- Any bounded open $\Omega \subset \IR^n$ is a $C^0$-extension domain by 
    the Urysohn–Brouwer–Tietze Lemma.

- Any open $\Omega$ is a $L^p = W^{0,p}$-extension domain, as the map:
    $$
        E_0: L^p(\Omega) \ra L^p(\IR^n)
    $$
    sending $f$ to the extension with $0$ outside of $\Omega$ is well-defined and continuous.

- ([@luyao2024seeley] Thm. 26.) 
    If $\Omega$ is a bounded smooth domain with a smooth defining function,
    then $\Omega$ is a $C^k$-extension domain.

- ([@AdamsFournier2003] Thm. 5.24 / [@stein1970singular]) 
    If $\Omega$ has a (strong, local) Lipschitz boundary, 
    then $\Omega$ is a Sobolev-extension domain.


## Approximation Methods

### Tapered Extension

**Definition (Tapered Zero Extension $E^0_{\eps}$).**

* Consider the sets:

    $$
      \Omega_\eps = \Set{ x \in \Omega }{ d(x,\del \Omega) > \eps } \subset \Omega
    $$

    We have $\Omega_{\eps'} \subset \Omega_{\eps}$ for $\eps < \eps'$ and $\union_{\eps > 0} \Omega_{\eps} = \Omega$.

* We find boundary cutoff functions $\chi_\eps \in C^\infty(\IR^n)$ with values in $[0,1]$
    and $\chi_\eps = 1$ on $\Omega_\eps$ and $\chi_\eps = 0$ outside of $\Omega_{\eps/2}$
    by the smooth Urysohn lemma (since $\overline{\Omega_\eps} \subset \Omega_{\eps/2}$).

* For $f: \Omega \ra \IR$ we define the $\eps$-tapered zero extension as:
    $$
        E^0_{\eps}(f) = E_0(\chi_\eps \cdot f)
    $$
    where $E_0$ is the zero-extension operator.


**Proposition (Local Approximation).** {#TET}
Let $\Omega \subset \IR^n$ be open, $k \in \IN_0$, and $1 \le p < \infty$, then:

1. If $f \in C^k(\Omega)$ then $E^0_{\eps}(f) \in C^k(\IR^n)$ and the resulting map:
    $E^0_\eps: C^k(\Omega) \ra C^k(\IR^n)$
    is continuous. Furthermore, we have:
    $$
        E^0_\eps(f)|_\Omega \to f \qtext{in} C^k(\Omega)
    $$
    as $\eps \to 0$ in compact-open topology.

2. If $f \in W^{k,p}_{\mathrm{loc}}(\Omega)$,
    then $E^0_\eps(f) \in W^{k,p}_{\mathrm{loc}}(\IR^n)$ 
    and the resulting map:
    $E^0_\eps: W^{k,p}_{\mathrm{loc}}(\Omega) \ra W^{k,p}_{\mathrm{loc}}(\IR^n)$
    is continuous. Furthermore, we have:
    $$
        E^0_\eps(f) \to f \qtext{in} W^{k,p}_{\mathrm{loc}}(\Omega)
    $$
    as $\eps \to 0$.


**Proof.**
Ad 1) Let $f\in C^k(\Omega)$. Then $\chi_\eps f\in C^k(\IR^n)$ and vanishes on a neighborhood of $\del\Omega$, so
$E^0_\eps(f)=E_0(\chi_\eps f)\in C^k(\IR^n)$ and the map is continuous. If $K\csub\Omega$, choose $\eps_0$
with $K\subset\Omega_\eps$ for $\eps<\eps_0$; then $\chi_\eps=1$ on $K$ and $E^0_\eps(f)|_K=f|_K$, giving
$E^0_\eps(f)|_\Omega\to f$ in the compact-open $C^k$ topology.

Ad 2) Let $f\in W^{k,p}_{loc}(\Omega)$. Fix $K\csub\IR^n$ and $\eps>0$. Since $\chi_\eps$ is supported in
$\Omega_{\eps/2}$, the set $K\cap\Omega_{\eps/2}$ is compact in $\Omega_{\eps/2}$; choose
$\eta\in C_c^\infty(\Omega_{\eps/2})$ with $\eta=1$ on $K\cap\Omega_{\eps/2}$. By Lemma [#WLOC] (3) and
Lemma [#cutoff-multiplier], $u:=\eta\chi_\eps f\in W^{k,p}(\Omega)$ and has compact essential support in
$\Omega$, so Proposition [#zero-extension] gives $E_0u\in W^{k,p}(\IR^n)$. 
On $K$ we have $E_0u=E^0_\eps(f)$,
hence the seminorms $\lambda^p_{K,\alpha}$ are finite and depend continuously on $f$, which proves
$E^0_\eps(f)\in W^{k,p}_{loc}(\IR^n)$ and continuity.
For convergence, fix $K\csub\Omega$ and choose $\eps_0$ with $K\subset\Omega_\eps$ for $\eps<\eps_0$; then
$\chi_\eps=1$ on $K$, so $\lambda^p_{K,\alpha}(E^0_\eps(f)-f)=0$ for all $|\alpha|\le k$, hence 
$E^0_\eps(f)\to f$ in $W^{k,p}_{loc}(\Omega).$


### Radial Cutoff


**Definition (Radial Cutoff).**

* We find radial cutoff functions $\psi_r \in C^\infty(\IR^n)$ with $\psi_r(x) = 1$
    on $\|x\| < r$ and $\psi_r(x) = 0$ for $\|x\| > r+1$.

* For $f: \IR^n \ra \IR$ we define the radial truncation:
    $$
        R_{r}(f) = \psi_r \cdot f.
    $$
    Clearly $\supp(R_r(f))$ is contained in the compact ball of radius r+1.


**Proposition (Approximation on Compacts).** {#radial-cutoff}
Let $k \in \IN_0$ and $1 \le p < \infty$.

1. If $f \in C^k(\IR^n)$ then $R_r(f) \in C^k_c(\IR^n)$ and the resulting map
    $R_r: C^k(\IR^n) \ra C^k_c(\IR^n)$
    is continuous.
    Furthermore $R_r(f) \to f$ in $C^k(\IR^n)$ as $r \to \infty$ in the compact-open topology.

2. If $f \in W^{k,p}_{loc}(\IR^n)$, then $R_r(f) \in W^{k,p}_{c}(\IR^n)$
    and the resulting map:
    $R_r: W^{k,p}_{loc}(\IR^n) \lra W^{k,p}_{c}(\IR^n)$
    is continuous.
    Furthermore $R_r(f) \to f$ in $W^{k,p}_{loc}(\IR^n)$ as $r \to \infty$ in the topology.


The proof is similar to Proposition [#TET].


### Low-Pass Filter via Heat Flow

**Definition (Heat kernel and filter $F_t$).** 

* For $t>0$ define the heat kernel
    $$
    H_t(x) = (4\pi t)^{-n/2}\exp(-\|x\|^2/4t).
    $$
    Then $H_t\in C^\infty(\IR^n)$, $\int_{\IR^n} H_t(x)\,dx = 1$, and $\del^\alpha H_t\in L^1(\IR^n)$ for all multi-indices $\alpha$.

* If $f\in L^p(\IR^n)$ for some $1 \le p \le \infty$ we define the low-pass filter operator:
    $$
    F_t f := H_t * f = x \mapsto \int_{\IR^n} H_t(x-y) f(y)\,dy \in L^p(\IR^n).
    $$

**Proposition (Heat Kernel Approximation).** {#HKA}

1. If $f\in L^1(\IR^n)$, and $t>0$ then $F_t f\in C^\infty(\IR^n) \cap L^1(\IR^n)$.
    The resulting map:
    $$
      F_t: L^1(\IR^n) \lra C^\infty(\IR^n)
    $$
    is continuous in the compact-open topology for $C^\infty(\IR^n)$.

2. If $f\in L^1_c(\IR^n)$, then $F_t f$ is real-analytic on $\IR^n$ and extends
    to an entire holomorphic function on $\IC^n$.

3. ($C^k$-approximation) For $f\in C^k(\IR^n)\cap L^1(\IR^n)$, $k \in \IN_0$, we have
     $F_t f\to f$ as $t\to 0$ in $C^k(\IR^n)$ (compact-open topology).

4. ($W^{k,p}$-approximation) For $f\in W^{k,p}_{\mathrm{loc}}(\IR^n)\cap L^1(\IR^n)$, 
    $k\in\IN_0$, $1\le p<\infty$ we have
    $F_tf\in W^{k,p}_{\mathrm{loc}}(\IR^n)$ and $F_t f\to f$ as $t \to 0$ in $W^{k,p}_{\mathrm{loc}}(\IR^n)$.


In the proof, we will make use of the following Lemma:

**Lemma (Off-support decay on compacts).** {#DOC}
Let $K \csub \IR^n$ and $g\in L^1(\IR^n)$. If $d(K,\supp g)\ge \delta>0$, then for every multi-index $\alpha$,

$$
\rho_{K,\alpha}\bigl((\del^\alpha H_t)*g\bigr)
\le \|g\|_{L^1}\sup_{\|z\|\ge \delta}|\del^\alpha H_t(z)|.
$$

In particular, for fixed $\delta>0$ we have $\sup_{\|z\|\ge \delta}|\del^\alpha H_t(z)|\to 0$ as $t\downarrow 0$,
hence $\rho_{K,\alpha}((\del^\alpha H_t)*g)\to 0$.


**Proof (of Lemma [#DOC]).**
For $x\in K$,

$$
|((\del^\alpha H_t)*g)(x)| \le \int_{\IR^n}|\del^\alpha H_t(x-y)|\,|g(y)|\,dy
\le \|g\|_{L^1}\sup_{y\in\supp g}|\del^\alpha H_t(x-y)|.
$$

If $d(K,\supp g)\ge \delta$ then $\|x-y\|\ge \delta$, yielding the stated bound. Since $\del^\alpha H_t$ is a polynomial
times a Gaussian, it decays uniformly away from $0$, so the supremum over $\|z\|\ge \delta$ tends to $0$ as $t\downarrow 0$.


**Proof (of Proposition [#HKA]).**
Fix $t>0$ and write $(F_t f)(x)=\int_{\IR^n}H_t(x-y)f(y)\,dy$.

Ad 1) 
For any multi-index $\alpha$, $\del^\alpha H_t\in L^1(\IR^n)\cap L^\infty(\IR^n)$, so dominated convergence gives
$$
\del^\alpha(F_t f)(x)=\int_{\IR^n}(\del^\alpha H_t)(x-y)f(y)\,dy,
$$
hence $F_t f\in C^\infty(\IR^n)$. By Young, $\|F_t f\|_{L^1}\le \|H_t\|_{L^1}\|f\|_{L^1}=\|f\|_{L^1}$.
For continuity in the compact-open topology, for any $K \csub \IR^n$ and $\alpha$,
$\rho_{K,\alpha}(F_t f)\le \|\del^\alpha H_t\|_{L^\infty}\|f\|_{L^1},$
so $f_m\to f$ in $L^1$ implies $\rho_{K,\alpha}(F_t f_m-F_t f)\to 0$.

Ad 2)
If $\supp f\subset K_0$ is compact, define

$$
\widetilde H_t(z)=(4\pi t)^{-n/2}\exp(-\frac{1}{4t}\sum_{j=1}^n z_j^2),\qquad
(T_t f)(z)=\int_{\IR^n}\widetilde H_t(z-y)f(y)\,dy.
$$

For any compact $C\subset \IC^n$ the integrand is bounded on $C\times K_0$, so the integral is absolutely convergent,
and differentiation under the integral shows $T_t f\in \mathcal O(\IC^n)$. On $\IR^n$ we have $\widetilde H_t=H_t$, hence
$T_t f|_{\IR^n}=F_t f$.

Ad 3) 
Fix $K \csub \IR^n$ and $|\alpha|\le k$. Choose $\chi\in C_c^\infty(\IR^n)$ with $\chi\equiv 1$ near $K$, and split
$f=f_1+f_2$ with $f_1=\chi f$ and $f_2=(1-\chi)f$. Then $f_1\in C_c^k$ and $d(K,\supp f_2)>0$.
For $f_1$, the standard approximate-identity argument (uniform continuity of $\del^\alpha f_1$ and a cutoff split)
gives $\rho_{K,\alpha}(F_t f_1-f_1)\to 0$ as $t\downarrow 0$. For $f_2$, the Lemma yields
$\rho_{K,\alpha}(F_t f_2)=\rho_{K,\alpha}((\del^\alpha H_t)*f_2)\to 0$. Thus
$\rho_{K,\alpha}(F_t f-f)\to 0$ for all $|\alpha|\le k$.

Ad 4) With the same split, $f_1=\chi f\in W^{k,p}(\IR^n)$ and the heat kernel is an approximate identity in $W^{k,p}$
(use translation continuity in $L^p$ and Minkowski), hence $\lambda^p_{K,\alpha}(F_t f_1-f_1)\to 0$.
On $K$, $f_2=0$, and the Lemma gives $\rho_{K,\alpha}((\del^\alpha H_t)*f_2)\to 0$, so
$$
\lambda^p_{K,\alpha}(F_t f_2-f_2)\le \lambda^p_K(1)\rho_{K,\alpha}((\del^\alpha H_t)*f_2)\to 0.
$$
Combine to obtain $F_t f\to f$ in $W^{k,p}_{\mathrm{loc}}(\IR^n)$.


### Taylor Truncation

**Definition (Taylor truncation $T_d$).**
Consider a real analytic function $f: \IR^n \ra \IR$, and a cut-off degree $d \in \IN$, and a base-point $x_0 \in \IR^n$.
The degree $d$ Taylor truncation is given by:

$$
    T_d(x_0; f) = \sum_{|\alpha| \leq d} \frac{(x-x_0)^\alpha}{\alpha!} \, \del^\alpha f(x_0) \in \IR[x^1, \dots, x^n].
$$

**Proposition (Taylor Approximation).** {#TA}
Let $f \in C^\infty(\IR^n)$ be a real-analytic function that extends to an entire function $\IC^n \ra \IC$.
Then for all $x_0 \in \IR^n$ we have:

1. $T_d(x_0; f) \ra f$ in $C^k(\IR^n)$ for $d \to \infty$ (in the compact-open topology).
2. $T_d(x_0, f) \ra f$ in $W^{k,p}_{loc}(\IR^n)$ for $d \to \infty$.


**Proof.**
Ad 1)
Fix $k\in\IN_0$, a compact $K \csub \IR^n$, and $|\alpha|\le k$. Set $g:=\del^\alpha f$.
Since $f$ is entire, so is $g$. 
The Taylor series of an entire function at $x_0$ converges uniformly on compact sets hence:
$$
  \rho_{K,\alpha}\bigl(T_d(x_0;f)-f\bigr) 
= \sup_{x\in K} |T_d(x_0; g)(x) -  g(x)| \xrightarrow[d\to\infty]{}0.
$$
Since $K$ and $|\alpha|\le k$ were arbitrary, $T_d(x_0;f)\to f$ in $C^k(\IR^n)$ with the compact-open topology.

Ad 2)
Both $f\in C^\infty(\IR^n)$ and each polynomial $T_d(x_0;f)$ lie in $W^{k,p}_{loc}(\IR^n)$ for all $k\in\IN_0$
and $1\le p<\infty$. Fix $K \csub \IR^n$ and $|\alpha|\le k$. Then
$$
\lambda^p_{K,\alpha}\bigl(T_d(x_0;f)-f\bigr)
\le \lambda^p_K(1)\,\rho_{K,\alpha}\bigl(T_d(x_0;f)-f\bigr)
\xrightarrow[d\to\infty]{}0.
$$
Hence $T_d(x_0;f)\to f$ in $W^{k,p}_{loc}(\IR^n)$.


## Approximation Theorems

**Theorem (Approximation on Unbounded Domains).**
Let $\Omega$ be an open set in $\IR^n$.
Then polynomials $\IR[x^1,\dots,x^n]$ restricted to $\Omega$ are
dense in the following spaces:

1. $C^k(\Omega)$ with compact-open $C^k$-topology.
2. $C^\infty(\Omega)$ with compact-open topology.
3. $L^{p}_{loc}(\Omega)$ for $1\le p<\infty$.
4. $W^{k,p}_{loc}(\Omega)$ for $k\in\IN_0$ and $1\le p<\infty$.


**Proof.**
In all cases we construct a polynomial approximation as a composition
of the Approximation operators we defined above:

$$
    P = T_d(x_0; F_t(R_r(E^0_\delta(f)))) \in \IR[x^1,\dots,x^n]
$$

depending on parameters $d \in \IN_0$, $x_0 \in \IR^n$, $t,r,\delta > 0$.
We can choose $x_0 = 0$.

Ad 1) To show that polynomials are dense in $C^k(\Omega)$, we have to show that for
each function $f \in C^k(\Omega)$, and a finite set $K_i,\alpha_i$, we 
find a polynomial $p$ so that: $\rho_{K_i,\alpha_i}(f - p) < \eps$.
Taking $K = \union_i K_i$ and $k = \max_i |\alpha_i|$, it suffices to show:

$$
    \rho^k_{K}(f - p) := 
    \max_{|\alpha| \leq k} \sup_{x \in K} |\del^\alpha f - \del^\alpha p|
    < \eps
$$

Ad 2) Similarly for $C^\infty(\Omega) = \bigcap_{k > 0} C^k(\Omega)$ we need to show
that for any $f \in C^\infty(\Omega)$, compact $K \subset \Omega$ and $k \geq 0$ we find a polynomial $p$ with $\rho^k_{K}(f - p) < \eps$.

In both cases we argue as follows:
As $K \csub \Omega$, we find $\delta > 0$ and $r > 0$ so that $f_1 = R_r(E^0_\delta(f)) \in C^k_c(\IR^n)$ satisfies $f_1|_K = f|_K$.
By Proposition [#HKA], we find $t > 0$ so that $f_2 = F_t(f_1)$ satisfies: $\rho^k_{K}(f_1 - f_2) < \eps/2$.
By Proposition [#TA], we find $d > 0$ so that for $p= T_d(x_0; f_2)$ we have $\rho^k_{K}(p - f_2) < \eps/2$.
In total we find:
$$
    \rho^k_{K}(f - p) \leq \rho^k_{K}(f - f_1) + \rho^k_{K}(f_1 - f_2) + \rho^k_{K}(f_2 - p)    < 0 + \eps/2 + \eps/2 = \eps.
$$

Ad 3) This is a special case of 4 for $k=0$.

Ad 4) The argument from (1) carries over verbatim replacing $\rho_{K,\alpha}$ by $\lambda^p_{K,\alpha}$.


**Theorem (Global Approximation on Bounded Extension Domains).**
Let $\Omega$ be an open, bounded set on $\IR^n$.
Let $k\in\IN_0$ and $1 \le p <\infty$.
Then polynomials are dense in:

- $C^0(\bar{\Omega})$ with $\|-\|_{sup}$, (Stone-Weierstrass).
- $L^p(\Omega)$ for $1 \le p < \infty$.
- $C^k_b(\bar{\Omega})$ as Banach-space with $C^k$-norm, if $\Omega$ is a $C^k$-Extension domain.
- $W^{k,p}(\Omega)$ if $\Omega$ is a Sobolev Extension domain.


**Proof.**
Ad 1) This is a special case of 3, for $k=0$

Ad 2) This is a special case of 4, for $k=0$.

Ad 3)
Assume $\Omega$ is a $C^k$ extension domain and let $f\in C^k_b(\bar{\Omega})$. Choose a bounded extension operator
$E: C^k_b(\bar{\Omega}) \ra C^k_b(\IR^n)$ with $E(f)|_\Omega=f$, and set $\tilde f:=E(f)$.
Since $\Omega$ is bounded, pick $r>0$ with $\bar{\Omega}\subset B_r$ and $\psi_r\equiv 1$ on $B_r$; set
$f_1:=R_r(\tilde f)=\psi_r\tilde f\in C^k_c(\IR^n)$, so $f_1|_{\bar{\Omega}}=f$.
Now $K=\bar{\Omega}$ is compact, so we can apply Proposition [#HKA] to find
$t>0$ with
$\max_{|\alpha|\le k}\sup_{\bar{\Omega}}|\del^\alpha(F_t f_1-f_1)|<\eps/2$, and set $f_2:=F_t f_1$.
Since $f_1\in L^1_c(\IR^n)$, Proposition [#HKA] (2) implies $f_2$ is entire. By Proposition [#TA] choose $d$ so that,
for $p:=T_d(x_0;f_2)$, $\max_{|\alpha|\le k}\sup_{\bar{\Omega}}|\del^\alpha(p-f_2)|<\eps/2$.
Then $\|p-f\|_{C^k_b(\bar{\Omega})}\le \max_{|\alpha|\le k}\sup_{\bar{\Omega}}|\del^\alpha(p-f_2)|
+\max_{|\alpha|\le k}\sup_{\bar{\Omega}}|\del^\alpha(f_2-f_1)|<\eps$.
Hence polynomials are dense in $C^k_b(\bar{\Omega})$.

Ad 4) Assume $\Omega$ is a Sobolev extension domain and let $f\in W^{k,p}(\Omega)$. Choose a bounded extension operator
$E: W^{k,p}(\Omega) \ra W^{k,p}(\IR^n)$ with $E(f)|_\Omega=f$, and set $\tilde f:=E(f)$.
Pick $r>0$ with $\Omega\subset B_r$ and $\psi_r\equiv 1$ on $B_r$, and set $f_1:=R_r(\tilde f)=\psi_r\tilde f$.
Then $f_1|_\Omega=f$, and $f_1$ has compact support, hence $f_1\in L^1(\IR^n)$.
As $K=\bar{\Omega}$ is compact, we can apply Proposition [#HKA] to find $t>0$ with $\|F_t f_1-f_1\|_{W^{k,p}(\Omega)}<\eps/2$,
and set $f_2:=F_t f_1$. 
Proposition [#HKA] implies $f_2$ is entire. By Proposition [#TA] choose $d$ so that,
for $p:=T_d(x_0;f_2)$, $\|p-f_2\|_{W^{k,p}(\Omega)}<\eps/2$. Therefore
$\|p-f\|_{W^{k,p}(\Omega)}\le \|p-f_2\|_{W^{k,p}(\Omega)}+\|f_2-f_1\|_{W^{k,p}(\Omega)}<\eps$.
Hence polynomials are dense in $W^{k,p}(\Omega)$.


## Counterexamples

Polynomial density holds for bounded, reasonably regular domains and moderate topologies.
Outside this zone one can construct many counterexamples.
We record a few concrete ones.

**Example (Unbounded domains, uniform norm).**
Let $f(x)=\frac{1}{1+x^2}$ on $[0,\infty)$.
If $p$ is a polynomial and $\sup_{x\ge0}|f(x)-p(x)|<1/2$, then $|p(0)-1|<1/2$, so $p(0)>1/2$.
If $\deg p\ge1$, then $|p(x)|\to\infty$ along some ray, so there exists $R$ with $|p(x)|>1$ for all $x\ge R$,
while $f(x)\le 1/2$ there, giving $|f(x)-p(x)|>1/2$ for $x\ge R$, a contradiction.
If $\deg p=0$, then $p\equiv c$; the inequalities $|1-c|<1/2$ and $|c-0|<1/2$ cannot hold simultaneously.
Thus
$$
  \inf_{p\in\IR[x]} \sup_{x\ge0} |\frac{1}{1+x^2}-p(x)| \ge \frac{1}{2},
$$
and polynomials are not dense in $C([0,\infty))$ with the supremum norm.


**Example ($\IR^n$, $L^p$ norm).**
If $p$ is a nonzero polynomial, then $p\notin L^p(\IR^n)$ for any $1\le p<\infty$.
In particular, polynomials are not dense in $L^p(\IR^n)$.


**Example (Bounded domain, sup-norm).**
Let $\Omega = (-1,0) \union (0, 1)$ and consider the function $f(x) = sign(x)$.
We have $f \in C^0_b(\Omega)$ as it is locally constant and bounded, but it does not extend
continuously to $\bar{\Omega}=[0,1]$, hence it is not in $C^0(\bar\Omega)$.
We have $\sup_{x\in\Omega} |p(x)-f(x)| \geq 1/2$ for all polynomials $p \in \IR[x]$,
as $p$ continuously extends through the jump at $0$.
Thus polynomials are not dense in $C^0_b(\Omega)$ with the sup-norm.
