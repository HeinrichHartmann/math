---
type: "math-article"
title: "Discrete and Differential Calculus"
tagline: "Functorial Higher Differences, Derivatives, and their Deformation"
author: "Heinrich Hartmann"
date: "2026-09-30"
status: "900 Published"
target: paper
slug: "DDC"
license:
  name: "CC-BY 4.0"
  url: "https://creativecommons.org/licenses/by/4.0/"
  full_name: "Creative Commons Attribution 4.0 International License"
abstract: |
  We introduce the symmetric pushforward $D_+(\phi;x)$, a higher differential
  for $C^k$ maps between affine Banach spaces. It acts linearly between
  truncated symmetric tensor spaces and, for $y=\phi(x)$ and $1\leq r\leq k$,
  is defined by

  $$
  D_+(\phi;x;v_1\cdots v_r)
  =\sum_{\pi\in\operatorname{Part}(r)}
  \prod_{A\in\pi}D(\phi;x;v_A),
  \qquad v_A=(v_i)_{i\in A}.
  $$

  We prove the composition law

  $$
  D_+(\psi\circ\phi;x)=D_+(\psi;y)\circ D_+(\phi;x).
  $$

  Taking the degree-one component of the composition law gives the partition
  Faà di Bruno formula. We prove that $D_+$ is the unique counital coalgebra
  map whose degree-one component is the map collecting the derivatives of
  $\phi$. The adjoint $D^+$ pulls back Taylor jets by composing their Taylor
  polynomials. In finite dimensions, we show that applying $D_+$ to a symmetric
  tensor gives the pushforward of the corresponding point-supported
  distribution.

  We construct an exact discrete counterpart, the cubical pushforward
  $\Delta_+$, which is functorial for arbitrary maps and whose coordinate
  expansion is the covering Faà di Bruno formula. Rescale each cube coordinate
  $c_A$ by $t^{|A|}$. Conjugating the cubical pushforward by this rescaling gives

  $$
  Q_k(\phi;x;t)=\lambda_t^{-1}\circ\Delta_+(\phi;x)\circ\lambda_t.
  $$

  For every $t>0$, these operators satisfy the same composition law as
  $\Delta_+$.

  For $C^k$ maps, we prove that this family extends jointly continuously to
  $t=0$, with convergence uniform on bounded sets of curved cubes at each
  base point. Its zero fiber is the restriction of the iterated tangent map,
  $Q_k^0(\phi;x)=T^k\phi|_x$. A symbol map connects this cubical boundary to
  the symmetric pushforward:

  $$
  \sigma_k\circ Q_k^0(\phi;x)=D_+(\phi;x)\circ\sigma_k.
  $$

  Under higher regularity, explicit higher symbols determine the successive
  collapse coefficients. A compatible deformation of products connects the
  discrete covering Leibniz rule to the differential rule indexed by disjoint
  decompositions.
bibliography: "../meta/refs.bib"
orcid: "0000-0002-3929-2421"
affiliation: "Hartmann IT GmbH"
email: "Heinrich@HeinrichHartmann.com"
hide:
  - navigation
math:
  proof_style: expanded
  preamble: |
    \newcommand{\wt}{\operatorname{wt}}
    \newcommand{\cstar}{\star_{\mathrm{cov}}}
    \newcommand{\pstar}{\star}
doi: "10.5281/zenodo.21433565"
publications:
  pdf: "https://github.com/HeinrichHartmann/math/releases/download/2026-07-10-Discrete-and-Differential-Calculus/2026-07-10-Discrete-and-Differential-Calculus.pdf"
  GitHub: "https://github.com/HeinrichHartmann/math/releases/tag/2026-07-10-Discrete-and-Differential-Calculus"
  Zenodo: "https://doi.org/10.5281/zenodo.21433565"
zenodo:
  doi: 10.5281/zenodo.21433565
---

## Introduction

The ordinary chain rule is a composition law. For differentiable maps
$\phi:X\to Y$ and $\psi:Y\to Z$ between affine Banach spaces, with
$y=\phi(x)$,

$$
   D^1(\psi\circ\phi;x)
   =
   D^1(\psi;y)\circ D^1(\phi;x).
$$

Higher derivatives mix orders under composition. The second
derivative of a composite depends on both first and second derivatives
of its factors. Faà di Bruno's formula is famously complicated in its
explicit multi-index form. Constantine and Savits [@CS1996] gave the
general multivariate formula in this form, with all combinatorial
coefficients.

The partition form, following Fraenkel [@Fraenkel1978] and Lévy
[@Levy2006], is particularly suitable for applications: it works directly
with symmetric multilinear derivatives, without choosing coordinates.
Fix $k\geq1$, and let $\Part(k)$ denote the partitions of
$[k]=\{1,\dots,k\}$. For composable $C^k$ maps and
$v_1,\dots,v_k\in T_xX$, the formula reads

$$
   D(\psi\circ\phi;x;v_1,\dots,v_k)
   =
   \sum_{\pi\in\Part(k)}
   D(\psi;y;(D(\phi;x;v_A))_{A\in\pi}),
   \qquad
   v_A=(v_i)_{i\in A}.
$$

Each block $A$ determines a derivative of $\phi$; the resulting vectors
are the arguments of a derivative of $\psi$ of order $|\pi|$.

In this article, we introduce the *symmetric pushforward* $D_+(\phi;x)$
to assemble these derivatives into a single linear operator that composes.
For a $C^k$ map $\phi$, it acts between the truncated symmetric tensor
spaces

$$
   D_+(\phi;x):
   \SYM_{\leq k}(T_xX)
   \lra
   \SYM_{\leq k}(T_yY)
$$

by $D_+(\phi;x;1)=1$ and, for $1\leq r\leq k$,

$$
   D_+(\phi;x;v_1\cdots v_r)
   =
   \sum_{\pi\in\Part(r)}
   \prod_{A\in\pi}D(\phi;x;v_A),
   \qquad
   v_A=(v_i)_{i\in A}.
$$

Each block contributes a derivative valued in $T_yY$; the product of
these vectors lies in the symmetric algebra. A partition with $m$
blocks therefore contributes in symmetric degree $m$. At order two,

$$
   D_+(\phi;x;v_1v_2)
   =
   D(\phi;x;v_1,v_2)
   +
   D(\phi;x;v_1)\,D(\phi;x;v_2).
$$

The two terms occupy different symmetric degrees and are retained
together.

For composable $C^k$ maps, we prove the composition law

$$
   D_+(\psi\circ\phi;x)
   =
   D_+(\psi;y)\circ D_+(\phi;x).
$$

Taking the degree-one component of this identity gives the partition
Faà di Bruno formula.

We also characterize $D_+$ intrinsically: it is the unique counital
coalgebra lift of the map collecting the positive-order derivatives of
$\phi$. Its adjoint $D^+$ acts on symmetric forms by composition of
truncated Taylor polynomials and hence pulls back Taylor jets. These
descriptions give the higher differential both a covariant and a
contravariant calculus. In finite dimensions, $D_+$ is also realized as
pushforward of point-supported distributions.

The discrete construction starts from a difficulty absent at first
order: a nonlinear map generally sends an affine cube to a curved cube.
Lists of edge directions are consequently insufficient for an exact
calculus closed under composition. We use based cubes with coordinates
$c_A$ indexed by all nonempty subsets $A\subseteq[k]$. These Möbius
coordinates record edges and higher differences; together they
determine every vertex.

Applying an arbitrary map $\phi$ to the vertices and returning to
Möbius coordinates defines the cubical pushforward

$$
   \Delta_+(\phi;x):CT_k(X,x)\lra CT_k(Y,y).
$$

We obtain an exact composition law

$$
   \Delta_+(\psi\circ\phi;x)
   =
   \Delta_+(\psi;y)\circ\Delta_+(\phi;x)
$$

without any regularity assumption. Its coordinate expansion is the
covering Faà di Bruno formula: coverings of $[k]$ take the place of the
partitions in the smooth formula. An adjoint pullback $\Delta^+$
completes the discrete calculus.

We then construct the passage from $\Delta_+$ to $D_+$. Rescale the
Möbius coordinates according to their order,

$$
   (\lambda_t c)_A=t^{|A|}c_A,
$$

and conjugate the cubical pushforward:

$$
   Q_k(\phi;x;t)
   =
   \lambda_t^{-1}\circ\Delta_+(\phi;x)\circ\lambda_t.
$$

For every $t>0$, this family is exactly functorial for arbitrary maps.
At $t=1$ it is the cubical pushforward; on affine cubes its top
coordinate is the usual normalized $k$-th forward difference. The
family therefore places difference quotients inside a calculus that
preserves composition at every positive scale.

Our main analytic theorem proves that, for a $C^k$ map, this family
extends continuously to $t=0$ on the entire curved-cube space.
Convergence is uniform on bounded sets of cubes at each base point,
and the extension is jointly continuous in the base point,
deformation parameter, and cube. The boundary has the explicit
coordinates

$$
   Q_k^0(\phi;x;c)_T
   =
   \sum_{\pi\in\Part(T)}
   D(\phi;x;(c_A)_{A\in\pi}).
$$

We identify this operator with the fiber map of the $k$-fold iterated
tangent functor,

$$
   Q_k^0(\phi;x)=T^k\phi|_x.
$$

Uniform convergence on bounded cubes allows exact functoriality to
pass to the boundary.

The connection to the symmetric pushforward is furnished by the symbol

$$
   \sigma_k(c)
   =
   \sum_{\pi\in\Part(k)}
   \prod_{A\in\pi}c_A.
$$

We prove the intertwining identity

$$
   \sigma_k\circ Q_k^0(\phi;x)
   =
   D_+(\phi;x)\circ\sigma_k.
$$

The symbol sends an affine cube with legs $v_1,\ldots,v_k$ to
$v_1\cdots v_k$; on curved cubes it retains contributions in every
symmetric degree from one to $k$. This identity explains how the
symmetric higher differential arises from the cubical boundary. In the
covering expansion, collapse suppresses the overlapping terms and
selects the partitions.

We further determine the higher coefficients of this collapse.
Explicit higher symbols $\sigma_{k,m}$, beginning with
$\sigma_{k,0}=\sigma_k$, give

$$
   \Delta(f;x;\lambda_t c)
   =
   \sum_{m=0}^{M}
   t^{k+m}D(f;x;\sigma_{k,m}(c))
   +
   o(t^{k+M})
$$

for $f\in C^{k+M}$, uniformly on bounded sets of curved cubes. Thus the
construction describes both the differential boundary and the
successive finite-scale corrections to it.

Products and jets participate in the same deformation. We construct an
associative product family whose coefficients weight each overlap by a
power of $t$. Its positive-scale fibers carry the discrete covering
product; at zero, only disjoint decompositions remain. The symbol
pullback relates this boundary product to multiplication of symmetric
forms. Together with the adjoint operators, these products yield
compatible naturality and Leibniz identities for discrete, quotient,
zero, and smooth jets.

Two companion papers establish the coefficient identities used here:
Taylor composition and the partition formula in [@FDB], and the
covering chain rule for finite differences in [@DFDB]. The present
paper introduces the symmetric pushforward as a higher differential,
develops its exact cubical counterpart, and proves the operator
identities, boundary extension, and symbol relations connecting them.
Classical jets, point-supported distributions, and higher-order tangent
bundles provide geometric realizations of this calculus. The final
exhibits develop its use in inverse differentiation, finite stencils,
the Laplace–Beltrami operator, polynomial and Newton expansions, and
Richardson extrapolation.

## Related work {#sec:related}

Classical jet theory passes to quotients by powers of the maximal
ideal [@Ehresmann1951] [@Cartan1971] [@Saunders1989]. Their full
duals are bundles of point-supported differential operators, whose
counit kernels are the higher-order tangent bundles introduced by Pohl
[@Pohl1962] [@kolar1993natural]. The cubical probe spaces used here
admit no such quotient presentation [#prop:no-quotient]; the
classical quotients and their duals are recovered at the boundary in
[#sec:completion], [#sec:distributions], and [#sec:globalization].

Bertram, Glöckner, and Neeb define $C^k$ maps over general topological
fields by requiring the difference quotient
$f^{[1]}(x, v, t) = (f(x + tv) - f(x))/t$ to extend continuously through
$t = 0$, with higher orders by iterating the construction one direction
at a time [@BGN2004]; on Banach spaces the resulting class coincides with
the Fréchet $C^k$ class.
This is the closest comparison for the extension
problem studied here. Our family instead extends all Möbius coordinates
of a $k$-cube simultaneously through one conjugated pushforward. The
Newton expansion provides the scalar counterpart of this cubical
organization, in the line of classical difference calculus with moving
basepoints [@Norlund1924] [@Jordan1965] [@RomanRota1978] [@FL2007]
[@DT2008]. Bertram's later calculus
develops the higher-order theory through simplicial divided differences
and Weil functors [@Bertram2013] and through cubic rings [@Bertram2015b]
[@Bertram2017].

At order one, the coordinate change used here is the standard chart for
deformation to the normal cone [@Fulton1998]. This connects the family to
Connes' tangent groupoid [@Connes1994] and its higher-order variants
[@vanErpYuncken2019], although no groupoid structure is used in the proofs.
The algebra fiber at $t = 0$ is the Weil algebra of the iterated tangent
functor [@kolar1993natural] [@BertramSouvay2012], compared with Bertram's
cubic rings in [#rem:weil]. Synthetic differential geometry takes
nilpotent infinitesimals as primitive via the Kock--Lawvere axiom
[@kock2006synthetic]; here the specific Weil algebra arises as the
$t = 0$ boundary of the deformation, with the Boolean vertex algebra at
$t = 1$.

The partition form of Faà di Bruno is classical [@Fraenkel1978] [@CS1996];
Johnson surveys the one-variable history [@Johnson2002] [@FaaDiBruno1855]
[@FaaDiBruno1857], and the Hopf-algebraic line treats the scalar formula
[@JR1979] [@FGB2005] [@FM2014]. The same partition lattice underlies the
moment-cumulant transform [@McCullagh1987] [@LS1959] [@Speed1983], the
transform of Yates's algorithm is Möbius inversion on the Boolean cube
[@Yates1937], and the cubical alternating sums reappear as cross-effects
in functor calculus [@EML1954] [@BJORT2018].

Point-supported distributions provide a second interpretation of the
symmetric operators. We use the structure theorem for such distributions
[@Schwartz1966] [@hormander1983analysis] and the pushforward viewpoint emphasized by
Kontsevich [@Kontsevich2003]; the closing $L_\infty$ exhibit compares the
same coalgebra map with the conventions of deformation theory
[#ex:linfty]. Murfet gives the partition formula for the
cofree-coalgebra lift [@murfet2015sweedler], Thm. 2.22, and Clift and
Murfet use the same construction in differential linear logic
[@CliftMurfet2020]. Here the cogenerating map is the total Fréchet
differential of a $C^k$ map between affine Banach spaces. We identify
$D^+$ with Taylor pullback, realize $D_+$ as distributional pushforward,
and connect $D_+$ to the cubical calculus through $Q_k$ and the symbol
map [#cor:coalgebra-lift].

Automatic differentiation gives the algorithmic counterpart. Forward
mode transports truncated Taylor coefficients through composites and
corresponds to the covariant direction; reverse mode transports covector
arrays and corresponds to the contravariant direction
[@GriewankWalther2008] [@Betancourt2018] [@Sangha2025]. The
order-condition exhibit treats finite-difference schemes through their
coefficient probes [#ex:order-conditions]; Richardson's deferred limit
[@Richardson1911] [@RichardsonGaunt1927] is expressed by cancellation of
the leading error coefficient in the deformation parameter.

## Setting {#sec:conventions}

Throughout, $X, Y, Z$ are affine spaces over real vector spaces $E, F, G$;
points are denoted $x \in X$, $y \in Y$, $z \in Z$. Maps of affine spaces are
$\phi: X \to Y$ and $\psi: Y \to Z$ with $\phi(x) = y$, $\psi(y) = z$; no
regularity is assumed. Scalar functions are $f, g: X \to \IR$. The exact
theory is topology-free; norms and the Fréchet $C^k$ convention enter only
with the extension theory in [#sec:deformation].

**Remark (Notation).** {#rem:notation}
We prefer explicit arguments over subscript and bracket notation, writing
$\Delta(f; x; c)$ instead of $\Delta_c f(x)$ and $D(f; x; v_1, \dots, v_k)$
instead of $D^k f(x)[v_1, \dots, v_k]$. Semicolons and commas are both
argument separators; we use semicolons as a visual hint when arguments are
of different kinds. Two currying conventions keep the formulas light.
Tail currying: dropping trailing arguments denotes the resulting map, so
$\Delta_+(\phi; x)$ is the map $c \mapsto \Delta_+(\phi; x; c)$;
conversely, applying a curried operator appends to the argument list,
$\Delta_+(\phi; x)\, c = \Delta_+(\phi; x; c)$. Slot currying: a dash in
an argument slot denotes the map in that slot, as in
$\Delta(-; x): f \mapsto \Delta(f; x)$.

One symbol may have several definitions, selected by the type of its
argument. Where two readings share a type, the declared role of the
argument selects between them. This distinction matters for
the differential $D$: its map reading and its observable reading
agree in positive degrees and differ in degree zero, where a based
target kills constants and an observable records the value $f(x)$
[#def:differential]; proofs that switch between the readings say so.

The direction slot of $D$ accepts a tuple or a symmetric tensor, so
$D(f; x; v_1, v_2)$ and $D(f; x; v_1 v_2)$ denote the same value. The
argument determines the order of differentiation, so no order
superscripts appear.


*Partiality.* Maps need only be defined near the base point: for $\phi: U \to Y$ on a
subset $U \subseteq X$, every operator built from $\phi$ is defined on the
locus where its finitely many required vertices lie in $U$; for $U = X$
every operator is total. We write $\phi: X \to Y$ throughout; all
statements localize by this convention.

For $k \geq 1$ write $[k] = \set{1, \dots, k}$. For a finite set $S$,
$\KP(S)$ is its power set and
$\KP_+(S) = \KP(S) \setminus \set{\emptyset}$ is the set of nonempty
subsets. The set $\Part(S)$ consists of the unordered partitions of $S$ into
nonempty blocks; for example,
$\set{\set{1,3}, \set{2}} \in \Part([3])$, and
$\Part(\emptyset) = \set{\emptyset}$, the empty partition.
A *cover* of $[k]$ is a family $H \subseteq \KP_+(k)$ with
$\bigcup H = [k]$; the set of covers is $\Cov(k)$, and
$\wt(H) := \sum_{A \in H} |A|$ is the *weight* of a cover.
Every partition of $[k]$ is a cover.
We abbreviate $\KP(k) := \KP([k])$, $\KP_+(k) := \KP_+([k])$, and
$\Part(k) := \Part([k])$.

## Discrete calculus {#sec:discrete}

This chapter develops an exact operator calculus for arbitrary maps. It
uses no topology; jets enter only after the covariant and contravariant
operators have been constructed.

### Cubes and forward differences

**Definition (Cubes).** {#def:cubes}
For $k \geq 1$ define:

- $CT_k(X, x) := \Map(\KP_+(k), E)$, the *tangent cubes* of order $k$;
  its coordinates are indexed by the nonempty subsets of $[k]$.
- $CT_*(X, x) := \bigsqcup_{k \geq 0} CT_k(X, x)$, where
  $CT_0(X, x) := \set{0}$.
- $\Cube_k(X, x) := \set{q: \KP(k) \to X,\; q_\emptyset = x}$ is the
  space of *geometric cubes* of order $k$ based at $x$.
- Coordinates are written as subscripts, $c_A := c(A)$, with
  $c_i := c_{\set{i}}$ for singletons: on cube letters, subscripts
  denote Möbius coordinates. The values $c_i$ are the *legs* of
  $c \in CT_k(X, x)$; the values
  $c_A$ with $|A| \geq 2$ are its *Möbius defects*.
- The affine cube $c = \Aff(v_1, \dots, v_k)$ is defined by
  $c_i = v_i$ and $c_A = 0$ for $|A| \geq 2$; a cube is *curved*
  if it is not affine.
- For $T \subseteq [k]$, the restriction $\del_T c := c|_{\KP_+(T)}$ is
  the *face* on $T$, regarded as a cube of order $|T|$ by increasing
  relabeling.


**Remark (Iterated tangent spaces).** {#rem:iterated-tangent-spaces}
Tangent cubes are the fibers of iterated tangent spaces. If $X$ is open in an affine Banach space
with model space $E$, then $TX\isom X\times E$, and iteration gives
$T^kX\isom X\times\Map(\KP_+(k),E)$. Thus $T(TX)$ has coordinates
$(x,v_{\set{1}},v_{\set{2}},v_{\set{1,2}})$, and each further tangent step
adds a direction for every existing coordinate. The original basepoint
remains in $X$, while all other coordinates range over $E$; fixing that
basepoint at $x$ leaves precisely $CT_k(X,x)$. We use the coordinate
identification of Duarte and Torres [@DT2008].


**Proposition (Boolean Möbius inversion).** {#prop:moebius}
Let $S$ be a finite set, $G$ an abelian group, and $a:\KP(S)\to G$. Define

$$
   (\zeta a)(T):=\sum_{A\subseteq T}a(A),
   \qquad
   (\mu a)(T):=\sum_{A\subseteq T}(-1)^{|T|-|A|}a(A).
$$

Then $\mu\circ\zeta=\zeta\circ\mu=\id$ on $\Map(\KP(S),G)$.

**Proof.**
The coefficient of $a(A)$ in $(\mu\zeta a)(T)$ is
$\sum_{A\subseteq U\subseteq T}(-1)^{|T|-|U|}
=(1-1)^{|T\setminus A|}=[A=T]$. The computation for $\zeta\mu$ is the
same.


**Corollary (Boolean sieve).** {#cor:sieve}
For $A\subseteq S$,
$\sum_{A\subseteq U\subseteq S}(-1)^{|S|-|U|}=[A=S]$.


**Definition (Zeta and Möbius transforms).** {#def:exp-log}
The *geometric realization* and the *tangent logarithm*

$$
   \zeta_x(c)_T := x + \sum_{\emptyset \neq A \subseteq T} c_A,
   \qquad
   \mu_x(q)_T := \sum_{A \subseteq T} (-1)^{|T| - |A|}\, (q_A - x)
$$

are maps $\zeta_x: CT_k(X, x) \to \Cube_k(X, x)$ and
$\mu_x: \Cube_k(X, x) \to CT_k(X, x)$.


**Lemma (Zeta-Möbius inversion).** {#lem:exp-log}
$\zeta_x$ and $\mu_x$ are inverse bijections.


**Proof.**
Apply Boolean Möbius inversion [#prop:moebius] to the function
$T \mapsto q_T - x$ on $\KP(k)$, which vanishes at $T = \emptyset$ for based
cubes. Conversely, for $c \in CT_k(X, x)$ extend $c$ to $\KP(k)$ by
$c_\emptyset := 0$ and apply [#prop:moebius] again.


**Definition (Forward difference).** {#def:pairing}
For $k \geq 1$ and an observable $h: X \to F$ with values in a real
vector space $F$ define:

- $\Delta(h; x; c) := \sum_{T \subseteq [k]} (-1)^{k - |T|}\,
  h(x+\sum_{\emptyset\neq A\subseteq T}c_A) \in F$ is the *forward
  difference* of $h$ along $c\in CT_k(X,x)$.
- $\Delta(h;x;(v_i)_{i\in S}):=
  \sum_{T\subseteq S}(-1)^{|S|-|T|}h(x+\sum_{i\in T}v_i)$, where
  $(v_i)_{i\in S}$ is a finite family in $E$.
- $\Delta(h; x; v_1, \dots, v_k)
  := \Delta(h; x; \Aff(v_1, \dots, v_k))$ is the difference along the
  affine cube with legs $v_1,\dots,v_k$.
- $\Delta(h; x; 0) := h(x)$ on the unique order-zero cube
  $0 \in CT_0(X, x)$.
- $\Delta(\phi; x; c) \in F$ for $\phi: X \to Y$ and $k \geq 1$
  is defined by the same alternating sum in the translation space of $Y$.


**Remark.**
On affine cubes, $\Delta(f; x; v_1, \dots, v_r) = (\Delta_{v_1} \circ \cdots
\circ \Delta_{v_r} f)(x)$ is the classical iterated forward difference, where
$\Delta_v f := f(\cdot + v) - f(\cdot)$; the operators $\Delta_v$ commute.


**Proposition (Discrete Taylor duality).** {#prop:taylor-duality}
For an observable $h: X \to F$ and $c \in CT_k(X, x)$, the functions
$T \mapsto \Delta(h; x; \del_T c)$ and $T \mapsto h(\zeta_x(c)_T)$ on $\KP(k)$
are Möbius and zeta transforms of each other:

$$
   h(\zeta_x(c)_T) = \sum_{A \subseteq T} \Delta(h;\, x;\, \del_A c).
$$

For affine cubes this is Newton's formula
$h(x + \sum_{i \in T} v_i)
= \sum_{A \subseteq T} \Delta(h; x; v_A)$,
where $v_A := (v_i)_{i \in A}$.


**Proof.**
$\Delta(h; x; \del_T c)$ is by definition the Möbius transform of the vertex
function; invert with [#prop:moebius].

### The cubical pushforward

**Definition (Cubical pushforward, cf. [@DT2008] Sec. 3).** {#def:pushforward}
For a map $\phi: X \to Y$ define:

- $(\phi_* q)_T := \phi(q_T)$ is the *geometric pushforward*
  $\phi_*: \Cube_k(X, x) \to \Cube_k(Y, y)$.
- $\Delta_+(\phi; x) := \mu_y \circ \phi_* \circ \zeta_x$ is the
  *cubical pushforward*
  $\Delta_+(\phi; x): CT_k(X, x) \to CT_k(Y, y)$.

In grade zero, all cubical pushforwards are the unique maps between the
singletons $CT_0 = \set{0}$, and their pullbacks act identically on the
coefficient space.


**Lemma (Coordinates of the pushforward).** {#lem:coordinates}
For $\emptyset \neq T \subseteq [k]$,

$$
   \Delta_+(\phi;\, x;\, c)_T = \Delta(\phi;\, x;\, \del_T c),
$$

and on affine cubes
$\Delta_+(\phi;\, x;\, \Aff(v_1, \dots, v_k))_T
= \Delta(\phi;\, x;\, v_T)$,
where $v_T = (v_i)_{i \in T}$.


**Proof.**
$\mu_y(\phi_* \zeta_x c)_T = \sum_{A \subseteq T} (-1)^{|T| - |A|}
(\phi(\zeta_x(c)_A) - y)$; the terms $-y$ cancel since the coefficients sum to
zero, and $\zeta_x(c)_A$ for $A \subseteq T$ depends only on $\del_T c$.


**Theorem (Exact functoriality).** {#thm:functoriality}
For arbitrary maps $\phi: X \to Y$, $\psi: Y \to Z$ and every $k \geq 1$,

$$
   \Delta_+(\psi \circ \phi;\, x) = \Delta_+(\psi;\, y) \circ \Delta_+(\phi;\, x),
   \qquad
   \Delta_+(\id_X;\, x) = \id,
$$

and the pushforward is compatible with faces: for $T \subseteq [k]$,

$$
   \del_T\bigl(\Delta_+(\phi;\, x)\, c\bigr)
   = \Delta_+(\phi;\, x)\bigl(\del_T c\bigr),
$$

the right side taken in order $|T|$.


**Proof.**
$(\psi \circ \phi)_* = \psi_* \circ \phi_*$ holds vertexwise. Insert
$\zeta_y \circ \mu_y = \id$ [#lem:exp-log] between the two factors in
$\mu_z \circ \psi_* \circ \phi_* \circ \zeta_x$. Face compatibility: by
[#lem:coordinates], both sides have coordinates
$\Delta(\phi;\, x;\, \del_A c)$ for $\emptyset \neq A \subseteq T$,
before the conventional increasing relabeling. Both sides are therefore the
same restriction to $\KP_+(T)$.

### Adjunction and pullback {#sec:contravariant-differences}

**Definition (Functions and measures).** {#def:functions-measures}
We use the following spaces, maps, and pairing.

- $F(X) := \Map(X, \IR)$ is the space of functions on $X$, with the
  topology of pointwise convergence; the bare letter $F$ remains the
  model space of $Y$, the argument distinguishing the two.
- $F'(X) := \mathcal{L}(F(X), \IR) \isom \Map_{\mathrm{fin}}(X, \IR)$
  is its continuous dual, the finitely supported signed measures
  $\nu = \sum_i \lambda_i \delta(z_i)$.
- A map $\phi: X \to Y$ acts by pullback $\phi^* f := f \circ \phi$ on
  functions and by pushforward
  $\langle \phi_* \nu, f \rangle := \langle \nu, \phi^* f \rangle$ on
  measures.
- $\langle \nu, f \rangle := \sum_i \lambda_i f(z_i)$ is the duality
  pairing between $F'(X)$ and $F(X)$. For a real vector space $F$, the
  same finite sum defines $\langle \nu, f \rangle \in F$ for
  $f: X \to F$.


The cube measure records the forward difference as a pairing in
$F'(X)$ [#def:functions-measures].


**Definition (Cube measure).** {#def:cube-measure}
The *cube measure* of $c \in CT_k(X, x)$ is

$$
   \delta(x;\, c)
   := \sum_{T \subseteq [k]} (-1)^{k - |T|}\,
      \delta(x + {\textstyle\sum_{\emptyset \neq A \subseteq T}} c_A)
   \;\in\; F'(X).
$$

The forward difference is the pairing of a cube measure against an
observable:

$$
   \langle \delta(x;\, c),\, f \rangle = \Delta(f;\, x;\, c).
$$


**Definition (Co-cubes and graded observables).** {#def:cocubes}
For $k \geq 0$ define:

- $CT^k(X, x) := \Map(CT_k(X, x), \IR)$ is the space of *co-cubes* of
  order $k$; in order zero, $CT^0(X, x) \isom \IR$.
- $CT^*(X, x) := \Map(CT_*(X, x), \IR) = \prod_{k \geq 0} CT^k(X, x)$
  is the space of *graded observables*.
- $CT^*(X, x; F) := \prod_{k \geq 0} \Map(CT_k(X, x), F)$ is the space
  of *$F$-valued graded observables*, for a real vector space $F$;
  $CT^*(X, x) = CT^*(X, x; \IR)$. Every pullback below acts on
  $F$-valued observables by the same formula.
- The *pointwise product* on $CT^k(X, x)$ and, gradewise, on
  $CT^*(X, x)$ is $(\omega\eta)(c) := \omega(c)\, \eta(c)$, with unit
  $\mathbf 1_{\mathrm{pt}} = (1, 1, 1, \dots)$. This differs from the unit
  $(1, 0, 0, \dots)$ of the covering products below.
- For $\omega \in CT^*(X, x)$, the *truncation* is
  $\omega^{\leq k} := (\omega_0, \dots, \omega_k)$.
- $\langle \omega, c \rangle := \omega(c)$ is the evaluation pairing of
  $CT^k(X, x)$ with $CT_k(X, x)$, and of $CT^*(X, x)$ with $CT_*(X, x)$.


**Definition (Cubical pullback).** {#def:cubical-pullback}
For an arbitrary map $\phi: X \to Y$, the *cubical pullback* is precomposition
with the cubical pushforward,

$$
   \Delta^+(\phi;\, x): CT^k(Y, y) \lra CT^k(X, x),
   \qquad
   \Delta^+(\phi;\, x)\, \omega := \omega \circ \Delta_+(\phi;\, x).
$$

By construction, pushforward and pullback are adjoint under the evaluation
pairing,

$$
   \langle \Delta^+(\phi;\, x)\, \omega,\; c \rangle
   = \langle \omega,\; \Delta_+(\phi;\, x)\, c \rangle.
$$


**Theorem (Discrete adjunction).** {#thm:adjunction}
For arbitrary $\phi: X \to Y$, $f: Y \to F$, and $c \in CT_k(X, x)$,

$$
   \phi_*\, \delta(x;\, c) = \delta(y;\, \Delta_+(\phi;\, x)\, c),
   \qquad
   \Delta(\phi^* f;\, x;\, c) = \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, c).
$$


**Proof.**
By [#lem:exp-log], $\zeta_y(\Delta_+(\phi; x)c) = \phi_*(\zeta_x c)$;
the first identity follows vertexwise, the second by pairing against $f$.


**Theorem (Contravariant functoriality).** {#thm:cubical-functoriality}
For arbitrary maps $\phi: X \to Y$ and $\psi: Y \to Z$,

$$
   \Delta^+(\psi \circ \phi;\, x) = \Delta^+(\phi;\, x) \circ \Delta^+(\psi;\, y),
   \qquad
   \Delta^+(\id_X;\, x) = \id.
$$


**Proof.**
Precomposition reverses composition; apply exact functoriality
[#thm:functoriality].


**Proposition (The pullback is multiplicative).** {#prop:pullback-multiplicative}
$\Delta^+(\phi;\, x)$ is a unital algebra morphism for the pointwise
product of co-cubes.


**Proof.**
Precomposition with any map is multiplicative for pointwise products:
$(\omega \eta) \circ \Delta_+(\phi; x)
= (\omega \circ \Delta_+(\phi; x))\,(\eta \circ \Delta_+(\phi; x))$;
the unit $\mathbf 1_{\mathrm{pt}}$, constant $1$, pulls back to itself.

### Affine reconstruction and Faà di Bruno

With respect to the difference pairing, a curved cube expands as a sum
of affine cubes indexed by covers.


**Proposition (Affine reconstruction).** {#prop:reconstruction}
For an observable $h: X \to F$ and $c \in CT_k(X, x)$,

$$
   \Delta(h;\, x;\, c)
   = \sum_{H \in \Cov(k)} \Delta(h;\, x;\, (c_A)_{A \in H}).
$$


**Proof.**
Each vertex is a vertex of the affine cube on the index set $\KP_+(k)$ with
legs $(c_A)_{A \in \KP_+(k)}$: by Newton's formula [#prop:taylor-duality],

$$
   h(\zeta_x(c)_T) = h(x + \sum_{A \in \KP_+(T)} c_A)
   = \sum_{H \subseteq \KP_+(T)} \Delta(h;\, x;\, (c_A)_{A \in H}).
$$

Insert this into the definition of $\Delta(h; x; c)$ and exchange sums: a
family $H \subseteq \KP_+(k)$ occurs in the term of $T$ exactly when
$\bigcup H \subseteq T$, so its total coefficient is
$\sum_{\bigcup H \subseteq T \subseteq [k]} (-1)^{k - |T|} = [\bigcup H = [k]]$
by the Boolean sieve [#cor:sieve]. Only covers remain.


**Theorem (Covering formula, [@DFDB]).** {#thm:covering}
For arbitrary maps $\phi: X \to Y$, observables $f: Y \to F$, and
$v_1, \dots, v_k \in E$,

$$
   \Delta(f \circ \phi;\, x;\, v_1, \dots, v_k)
   = \sum_{H \in \Cov(k)}
     \Delta(f;\, y;\, (\Delta(\phi;\, x;\, v_A))_{A \in H}),
$$

and for arbitrary cubes the one-term form

$$
   \Delta(f \circ \phi;\, x;\, c)
   = \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, c).
$$


**Proof.**
The one-term form is the discrete adjunction [#thm:adjunction]. For the
covering form let $c = \Aff(v_1, \dots, v_k)$: by the coordinate formula
[#lem:coordinates], $\Delta_+(\phi;\, x)\, c$ has coordinates
$\Delta(\phi;\, x;\, v_A)$, and affine reconstruction
[#prop:reconstruction] expands the one-term form over covers.


**Remark.**
The coefficient systems and iterated covering formulas are developed in
[@DFDB]. The order-two formula is computed in the exhibits
[#ex:cube-journey].

## Deformations and collapse {#sec:deformation}

This chapter constructs the deformation on the cubical $Q$ and $\Delta$
rungs and extends it to the cubical zero fiber. The next chapter applies the
symbol map and passes to symmetric tensors.

### The Q-family

**Definition (Rescalings).** {#def:rescaling}
For $c \in CT_k(X, x)$ define:

- $(\lambda_t c)_A := t^{|A|}\, c_A$ is the (isotropic) *weighted
  rescaling*, where $t \in \IR$;
- $(\lambda_{\mathbf t}\, c)_A := \bigl(\prod_{i \in A} t_i\bigr) c_A$
  is the *anisotropic rescaling* (overloaded, selected by argument
  type), where $\mathbf t = (t_1, \dots, t_k) \in (0,1]^k$.


**Remark.**
$\lambda_t = \lambda_{(t, \dots, t)}$. Then
$\lambda_t \Aff(v_1, \dots, v_k) = \Aff(t v_1, \dots, t v_k)$,
$\del_T \lambda_t = \lambda_t \del_T$, and
$\lambda_t^{-1} = \lambda_{1/t}$ for $t \neq 0$. The isotropic
rescaling defines the deformation below. We make no multiscale claim for
the anisotropic form; it reappears only in the jet ladder of [#sec:jets].


**Definition (The Q-family).** {#def:q-family}
For $t \in (0,1]$ and arbitrary $\phi: X \to Y$, the *deformed cubical
pushforward* is the conjugation

$$
   Q_k(\phi;\, x;\, t)
   := \lambda_t^{-1} \circ \Delta_+(\phi;\, x) \circ \lambda_t
   \;:\; CT_k(X, x) \lra CT_k(Y, y),
$$

with coordinates, for $\emptyset \neq T \subseteq [k]$,
$Q_k(\phi;\, x;\, t;\, c)_T
= \frac{1}{t^{|T|}}\, \Delta(\phi;\, x;\, \lambda_t\, \del_T c)$.
Across all grades we write
$Q_*(\phi;\, x;\, t): CT_*(X, x) \to CT_*(Y, y)$.


**Remark (Affine cubes).**
On affine cubes the conjugation produces the difference quotients: since
$\lambda_t \Aff(v_1, \dots, v_k) = \Aff(t v_1, \dots, t v_k)$
[#def:rescaling], the top coordinate is

$$
   Q_k(\phi;\, x;\, t;\, \Aff(v_1, \dots, v_k))_{[k]}
   = \frac{1}{t^{k}}\, \Delta(\phi;\, x;\, t v_1, \dots, t v_k),
$$

the grade-$k$ difference quotient of $\phi$ along the legs $v_i$ at
scale $t$; the lower coordinates are the same expressions on the faces.


**Definition (Deformed pullback).** {#def:q-pullback}
For $t \in (0,1]$, the *deformed pullback* is precomposition,

$$
   Q^*(\phi;\, x;\, t)
   \;:\; CT^*(Y, y) \lra CT^*(X, x),
   \qquad
   Q^*(\phi;\, x;\, t;\, \omega) := \omega \circ Q_*(\phi;\, x;\, t),
$$

acting on $F$-valued observables by the same formula.


The superscript $0$ marks the boundary value at $t = 0$, where it
exists: the zero fiber $Q^0_*$ is defined in the Extension section
below.


**Proposition (The punctured deformation).** {#prop:deformation}
For arbitrary maps $\phi: X \to Y$, $\psi: Y \to Z$ and every
$t \in (0,1]$:

1) $Q_k(\phi;\, x;\, 1) = \Delta_+(\phi;\, x)$.

2) $Q_k(\psi \circ \phi;\, x;\, t)
   = Q_k(\psi;\, y;\, t) \circ Q_k(\phi;\, x;\, t)$
   and $Q_k(\id_X;\, x;\, t) = \id$.

3) The family is compatible with faces: for $T \subseteq [k]$,
   $\del_T\bigl(Q_k(\phi;\, x;\, t)\, c\bigr)
   = Q_{|T|}(\phi;\, x;\, t)\bigl(\del_T c\bigr)$.

4) $\lambda_t$ trivializes the family:
   $\lambda_t \circ Q_k(\phi;\, x;\, t)
   = \Delta_+(\phi;\, x) \circ \lambda_t$,
   so the family is isotrivial over $(0,1]$.

5) Contravariantly,
   $Q^*(\psi \circ \phi;\, x;\, t)
   = Q^*(\phi;\, x;\, t) \circ Q^*(\psi;\, y;\, t)$,
   $Q^*(\id_X;\, x;\, t) = \id$, and
   $Q^*(\phi;\, x;\, 1) = \Delta^+(\phi;\, x)$.


**Proof.**
For 1), use $\lambda_1=\id$. For 2), conjugate exact functoriality
[#thm:functoriality] by the invertible map $\lambda_t$, whose inverse is
$\lambda_{1/t}$. The identity
$\del_T\lambda_t=\lambda_t\del_T$ [#def:rescaling], together with the face
clause of [#thm:functoriality], gives 3). Part 4) is the defining
conjugation written without the inverse. Finally, 5) follows from 1) and
2) because precomposition reverses composition.


**Lemma (Successor identities).** {#lem:successor}
For an arbitrary map $\phi: X \to Y$ and
$v_0, v_1, v_1', v_2, \dots, v_k \in E$,

$$
   \Delta(\phi;\, x;\, v_1 + v_1', v_2, \dots, v_k)
   - \Delta(\phi;\, x;\, v_1, v_2, \dots, v_k)
   - \Delta(\phi;\, x;\, v_1', v_2, \dots, v_k)
   = \Delta(\phi;\, x;\, v_1, v_1', v_2, \dots, v_k),
$$

$$
   \Delta(\phi;\, x + v_0;\, v_1, \dots, v_k)
   - \Delta(\phi;\, x;\, v_1, \dots, v_k)
   = \Delta(\phi;\, x;\, v_0, v_1, \dots, v_k).
$$

Additivity defect and base movement in grade $k$ are grade-$(k{+}1)$
differences. Normalized, for $t \in (0,1]$,

$$
\begin{aligned}
   &\frac{1}{t^k}\, \Delta(\phi;\, x;\, t(v_1 + v_1'), t v_2, \dots)
   - \frac{1}{t^k}\, \Delta(\phi;\, x;\, t v_1, t v_2, \dots)
   - \frac{1}{t^k}\, \Delta(\phi;\, x;\, t v_1', t v_2, \dots) \\
   &\qquad = t \cdot \frac{1}{t^{k+1}}\, \Delta(\phi;\, x;\, t v_1, t v_1', t v_2, \dots),
\end{aligned}
$$

$$
   \frac{1}{t^k}\, \Delta(\phi;\, x + t v_0;\, t v_1, \dots, t v_k)
   - \frac{1}{t^k}\, \Delta(\phi;\, x;\, t v_1, \dots, t v_k)
   = t \cdot \frac{1}{t^{k+1}}\, \Delta(\phi;\, x;\, t v_0, t v_1, \dots, t v_k):
$$

Thus each passage to the successor grade contributes one factor of $t$
in the normalized family.


**Proof.**
The difference operators commute, and
$\Delta_{v_1 + v_1'}
= \Delta_{v_1} + \Delta_{v_1'} + \Delta_{v_1} \Delta_{v_1'}$,
since $\phi(\cdot + v_1 + v_1') - \phi
= [\phi(\cdot + v_1) - \phi] + [\phi(\cdot + v_1') - \phi]
+ [\phi(\cdot + v_1 + v_1') - \phi(\cdot + v_1) - \phi(\cdot + v_1') + \phi]$.
Applied to $\Delta_{v_2} \cdots \Delta_{v_k} \phi$ at $x$, this is the
first identity; the second is
$\Delta_{v_0}(\Delta_{v_1} \cdots \Delta_{v_k} \phi)(x)$ written out.
The normalized forms divide by $t^k$.

### Extension

Norms enter here and remain in force for the rest of the paper: $E, F, G$
are now Banach spaces because the integrals below require complete targets.
We say $\phi$ is $C^k$ near $x$ if it is $k$ times
Fréchet differentiable with continuous derivatives on a neighborhood of
$x$ [@LangRFA]. The derivative $D^r(\phi; x; v_1, \dots, v_r)$ is
evaluated on the directions $v_i$ and is symmetric and continuous
multilinear; when the arguments determine the order, we drop the superscript:

$$
   D(\phi;\, x;\, v_1, \dots, v_r) := D^r(\phi;\, x;\, v_1, \dots, v_r).
$$

Cubes are measured coordinatewise,
$\|c\| := \max_{\emptyset \neq A \subseteq [k]} \|c_A\|$ on
$CT_k(X, x)$; faces of bounded sets are then bounded.


**Lemma (Iterated fundamental theorem).** {#lem:ftc}
Let $\phi$ be $C^r$ on an open set $U \subseteq X$, and let $x \in U$ and
$v_1, \dots, v_r \in E$ be such that the parallelotope
$x + [0,1] v_1 + \dots + [0,1] v_r$ lies in $U$. Then

$$
   \Delta(\phi;\, x;\, v_1, \dots, v_r)
   = \int_{[0,1]^r} D(\phi;\, x + {\textstyle\sum_i} \theta_i v_i;\, v_1, \dots, v_r) \; d\theta.
$$


**Proof.**
Set $g(\theta) := \phi(x + \sum_i \theta_i v_i)$ on $[0,1]^r$. Since the
parametrization is affine, $g$ is $C^r$ with
$\del_{\theta_1} \cdots \del_{\theta_r} g(\theta)
= D(\phi; x + \sum_i \theta_i v_i; v_1, \dots, v_r)$.
For a continuous Banach-space-valued function, the fundamental theorem of
calculus in one variable and Fubini give, one variable at a time,
$\int_{[0,1]^r} \del_1 \cdots \del_r g \, d\theta
= \sum_{T \subseteq [r]} (-1)^{r - |T|} g(1_T)$, the alternating sum over the
corners of the cube, which is $\Delta(\phi; x; v_\bullet)$.


**Corollary (Difference asymptotics).** {#cor:asymptotics}
Let $\phi$ be $C^k$ near $x$ and $R > 0$.

1.  For $1 \leq r \leq k$, $t_1, \dots, t_r \in \IR$, and
    $\|v_j\| \leq R$,

    $$
    \Delta(\phi;\, x;\, t_1 v_1, \dots, t_r v_r)
    = t_1 \cdots t_r ( D(\phi; x; v_1, \dots, v_r) + \eta(t, v) ),
    $$

    where $\sup_{\|v_j\| \leq R} \|\eta(t, v)\| \to 0$ as
    $\max_j |t_j| \to 0$.

2.  For $r > k$ there are $\rho > 0$ and $K < \infty$ such that for
    all $w_1, \dots, w_r \in E$ with $\|w_j\| \leq \rho$ and every
    $k$-element subset $M \subseteq [r]$,

    $$
    \|\Delta(\phi;\, x;\, w_1, \dots, w_r)\| \;\leq\; K \prod_{j \in M} \|w_j\|.
    $$


**Proof.**
1) By [#lem:ftc] with directions $t_j v_j$ and multilinearity of the
$r$-th derivative, the difference equals
$t_1 \cdots t_r \int D(\phi; x + \sum_j \theta_j t_j v_j; v_\bullet)\, d\theta$,
and $\|\eta\| \leq R^r \sup_{\xi} \|D^r(\phi; \xi) - D^r(\phi; x)\|$, the supremum
over $\xi$ in a ball that shrinks to $x$; conclude by continuity of $D^r(\phi; \cdot)$
at $x$.

2) Since $\Delta$ is symmetric in its directions we may take $M = [k]$. The
commuting operator factorization
$\Delta_{w_1} \cdots \Delta_{w_r}
= (\prod_{j > k} \Delta_{w_j}) (\prod_{j \leq k} \Delta_{w_j})$
expands into

$$
   \Delta(\phi;\, x;\, w_1, \dots, w_r)
   = \sum_{T \subseteq \set{k+1, \dots, r}} (-1)^{r - k - |T|}\,
     \Delta(\phi;\, x + w_T;\, w_1, \dots, w_k),
   \qquad w_T := \sum_{j \in T} w_j.
$$

By continuity of $D^k(\phi;\, \cdot)$ at $x$, choose $\rho$ small
enough that all basepoints $x + w_T$ and their attached parallelotopes
lie in a ball $B$ around $x$ on which $\phi$ is $C^k$ and
$\|D^k(\phi;\, \cdot)\| \leq \|D^k(\phi;\, x)\| + 1 =: M_k$; by
[#lem:ftc], each summand is bounded by $M_k \prod_{j \leq k} \|w_j\|$,
and there are $2^{r - k}$ summands. Take $K = 2^{r-k} M_k$.


**Lemma (Weight bound).** {#lem:weight-bound}
For $k\geq1$, every $H \in \Cov(k)$ satisfies
$\wt(H) \geq k$, with equality
if and only if $H \in \Part(k)$.


**Proof.**
$\sum_{A \in H} |A| \geq |\bigcup H| = k$, with equality iff the blocks
are pairwise disjoint.


**Definition (Zero fiber).** {#def:extension}
The *zero fiber* of the family is the gradewise limit

$$
   Q^0_k(\phi;\, x;\, c) := \lim_{t \downarrow 0}\, Q_k(\phi;\, x;\, t;\, c),
$$

defined wherever the limit exists. Where it exists for every
$c \in CT_k(X, x)$, this yields the operator
$Q^0_k(\phi; x): CT_k(X, x) \to CT_k(Y, y)$; where every grade exists,
these assemble into $Q^0_*(\phi; x)$. Observables pull back by
precomposition, gradewise.


Statements under a $C^k$ hypothesis are made at the top grade $k$: a
$C^k$ map is also $C^{k-1}, \dots, C^1$, so the lower grades are the
same statement with $k$ decreased, and we use them without comment.


**Theorem (Boundary extension).** {#thm:boundary-extension}
Let $k \geq 1$ and let $\phi$ be $C^k$ near $x$. The zero fiber
$Q^0_k(\phi; x)$ exists on all of $CT_k(X, x)$, with
coordinates the partition formula

$$
   Q^0_k(\phi;\, x;\, c)_T
   = \sum_{\pi \in \Part(T)} D(\phi;\, x;\, (c_A)_{A \in \pi}),
   \qquad \emptyset \neq T \subseteq [k].
$$

The convergence $Q_k(\phi;\, x;\, t;\, c) \to Q^0_k(\phi;\, x;\, c)$ as
$t \downarrow 0$ is uniform on bounded subsets of $CT_k(X, x)$, and the
right side is continuous in $c$. On affine cubes the top coordinate is
the derivative,

$$
   Q^0_k(\phi;\, x;\, \Aff(v_1, \dots, v_k))_{[k]}
   = D(\phi;\, x;\, v_1, \dots, v_k).
$$

Moreover, the extended family is
jointly continuous through the boundary: for $x'$ near $x$, the map
$(x', t, c) \mapsto Q_k(\phi;\, x';\, t;\, c)$, extended by
$Q^0_k(\phi;\, x';\, c)$ at $t = 0$, is continuous wherever defined.


**Proof.**
The proof runs in three steps: reduction of all coordinates to the
top-coordinate limit; the exact treatment of covers
with at most $k$ blocks; the bound for covers with more blocks.
Collecting the terms proves the fixed-base statement; joint
continuity is proved separately at the end.

*Reduction.* The coordinates of the family are
$Q_k(\phi;\, x;\, t;\, c)_T = \frac{1}{t^{|T|}}\,
\Delta(\phi;\, x;\, \lambda_t\, \del_T c)$ [#def:q-family]: the
$T$-coordinate is the top coordinate of the grade-$|T|$ family on the
face $\del_T c$, and faces of bounded sets are bounded. It therefore
suffices to treat the top coordinate, at grade $k$ and, by decreasing
$k$, in the lower grades: we show

$$
   \frac{1}{t^k}\, \Delta(\phi;\, x;\, \lambda_t\, c)
   \;\xrightarrow[t \downarrow 0]{}\;
   \sum_{\pi \in \Part(k)} D(\phi;\, x;\, (c_A)_{A \in \pi}),
$$

uniformly for $\|c\| \leq R$. For small $t$ all vertices of
$\lambda_t c$ lie in the domain of $\phi$. By affine reconstruction
[#prop:reconstruction],

$$
   \frac{1}{t^k}\, \Delta(\phi;\, x;\, \lambda_t\, c)
   = \frac{1}{t^k} \sum_{H \in \Cov(k)}
     \Delta(\phi;\, x;\, (t^{|A|} c_A)_{A \in H}).
$$

*Covers with at most $k$ blocks.* Consider a cover $H$ with
$r := |H| \leq k$ blocks: part 1 of
[#cor:asymptotics], applied with scales $t^{|A|}$ and directions $c_A$
for $A \in H$, gives

$$
   \Delta(\phi;\, x;\, (t^{|A|} c_A)_{A \in H})
   = t^{\wt(H)} ( D(\phi;\, x;\, (c_A)_{A \in H}) + \eta_H(t) ),
$$

with $\eta_H(t) \to 0$ uniformly for $\|c\| \leq R$.

*Covers with more than $k$ blocks.* If $r > k$, then
$H$ contains a block of size $\geq 2$: the blocks are distinct nonempty
subsets of $[k]$ and there are only $k < r$ singletons. Choose a
$k$-element subset $M \subseteq H$ containing such a block; then
$\sum_{A \in M} |A| \geq k + 1$, and part 2 of [#cor:asymptotics]
bounds the term by $K R^k t^{k+1}$.

*Collection.* Divide by $t^k$. Covers with $r > k$ are $O(t)$. Covers with
$r \leq k$ appear with the factor $t^{\wt(H) - k}$, where $\wt(H) \geq k$
[#lem:weight-bound]; those of weight $> k$ vanish in the limit with
bounded cofactor, and the partitions, exactly the covers of weight $k$
[#lem:weight-bound], converge to their leading term. All estimates are
uniform for $\|c\| \leq R$. Each partition summand is continuous
multilinear in the coordinates $(c_A)_{A \in \pi}$ and hence polynomial
in $c$. This proves continuity in $c$.

*Joint continuity.* Let $x_n \to x_0$ near $x$, $t_n \downarrow 0$, and
$c^{(n)} \to c^{(0)}$. In the covering expansion at base $x_n$, the error of
each cover with $r \leq k$ blocks is bounded, as in the proof of
[#cor:asymptotics], by
$R^r \sup_\xi \|D^r(\phi;\, \xi) - D^r(\phi;\, x_n)\|$ with $\xi$
within distance $O(t_n)$ of $x_n$; since $\xi$ and $x_n$ both converge
to $x_0$, continuity of $D^r(\phi;\, \cdot)$ at $x_0$ makes it vanish,
while the leading terms $D(\phi;\, x_n;\, (c^{(n)}_A)_{A \in H})$
converge to $D(\phi;\, x_0;\, (c^{(0)}_A)_{A \in H})$ by continuity of
the derivatives in the base and multilinearity. Covers with $r > k$
are bounded by $K t_n$, with $K$ uniform for base points near $x_0$:
by continuity of $D^k(\phi;\, \cdot)$ at $x_0$, one ball around $x_0$
has the bound $\|D^k(\phi;\, \cdot)\| \leq \|D^k(\phi;\, x_0)\| + 1$
and, for large $n$, contains every attached parallelotope. Continuity
at points with $t_0 > 0$ is composition of continuous maps.


The zero fiber agrees with the iterated tangent functor. Recall from
[#rem:iterated-tangent-spaces] that for open
$X \subseteq E$ the tangent bundle is $TX = X \times E$ and its
iteration is $T^k X = X \times \Map(\KP_+(k), E)$, with the tangent
cubes $CT_k(X, x)$ as the fiber over $x$. On maps, the tangent functor
is defined for $\phi \in C^1$ by

$$
   T\phi(x;\, v) := (\phi(x);\, D(\phi;\, x;\, v)),
$$

and its iterate $T^k\phi := T(T^{k-1}\phi)$ is defined iteratively for
$\phi \in C^k$, by considering $T^{k-1}\phi$ as a differentiable map
between affine spaces. Each tangent step takes the total derivative of
the previous one, so $T^k\phi$ is the $k$-fold iterated total derivative
of $\phi$. Under the identification
$T^k X \isom X \times \Map(\KP_+(k), E)$ above, this map corresponds to

$$
   T^k\phi(x;\, c)
   = (\phi(x);\, c'),
   \qquad
   c'_T = \sum_{\pi \in \Part(T)} D(\phi;\, x;\, (c_A)_{A \in \pi}),
$$

as the induction in the proof below shows. Functoriality
$T^k(\psi \circ \phi) = T^k\psi \circ T^k\phi$ is the chain rule,
applied $k$ times.


**Proposition (Iterated tangent functor).** {#prop:iterated-tangent}
For $\phi \in C^k$ near $x$,

$$
   Q^0_k(\phi;\, x) = T^k\phi \big|_x
   \;:\; CT_k(X, x) \lra CT_k(Y, y),
$$

the fiber map over $x$ of the $k$-fold iterated tangent map: the zero
fiber is the differential calculus of the iterated tangent bundle,
written in cube coordinates.


**Proof.**
By the partition formula [#thm:boundary-extension],
$Q^0_k(\phi;\, x;\, c)_T
= \sum_{\pi \in \Part(T)} D(\phi;\, x;\, (c_A)_{A \in \pi})$; we show
by induction on $k$ that $T^k\phi$ has the same coordinates. For
$k = 1$, $T\phi(x;\, v) = (\phi(x);\, D(\phi;\, x;\, v))$. For the
step, split the coordinates of an order-$k$ cube by whether the index
set contains $k$: the base point $x$ together with the $c_A$,
$\emptyset \neq A \subseteq [k-1]$, is a point of $T^{k-1}X$, and the
coordinates containing $k$, re-indexed as
$(c_{A \cup \set{k}})_{A \subseteq [k-1]}$ with $A$ possibly empty,
are a tangent direction at it. In this splitting,
$T^k\phi = T(T^{k-1}\phi)$ is the tangent map of
$\Phi := T^{k-1}\phi$ at that point in that direction. Its base
component $\Phi(x;\, c)$ returns the coordinates indexed by
$T \subseteq [k-1]$ unchanged, and its derivative component
differentiates each coordinate $\Phi_T$, producing the coordinates
containing $k$. The base derivative in
direction $c_k$ appends the singleton block $\set{k}$ to a
partition, and the derivative in the $c_A$-slot, in direction
$c_{A \cup \set{k}}$, replaces the block $A$ by $A \cup \set{k}$.
Together these produce every partition of $T \cup \set{k}$ exactly
once.


**Remark (Three levels of extension).** {#rem:extension-levels}
Extension through $t = 0$ comes in three strengths. For fixed $x$ and a
single grade-$k$ cube $c$, the limit $Q^0_k(\phi;\, x;\, c)$ may exist:
the *pointwise extension*. If it exists for every cube,
$Q^0_k(\phi; x)$ is an operator [#def:extension], the *operator
extension*, with no implied continuity in $(x,c)$. The strongest form is
the *continuous extension* supplied by the boundary-extension theorem for
$C^k$ maps [#thm:boundary-extension]:
convergence uniform on bounded cube sets at each base point, and joint
continuity of $(x', t, c) \mapsto Q_k(\phi;\, x';\, t;\, c)$ through
$t = 0$. Existence alone does not imply $C^k$. It does not force
additivity of the boundary values: for $f=|\cdot|$ on $\IR$ at $0$, the
grade-one fiber exists on every cube and has value $|v|$. Nor does it
force continuity in the base:
$f(x) = x^2 \sin(1/x)$, $f(0) = 0$, is differentiable everywhere with
discontinuous derivative, so the grade-one fiber exists at every base
point and is linear there, yet $f$ is not $C^1$. The converse
problem, which growth conditions on the family recover $C^k$
regularity, is not treated in this paper.

### Collapse

Exact functoriality holds for every $t>0$. The continuous extension allows
the same identity to pass to $t=0$.

**Theorem (Zero-fiber functoriality).** {#thm:zero-fiber-functoriality}
For $\phi \in C^k$ near $x$ and $\psi \in C^k$ near $y = \phi(x)$,

$$
   Q^0_k(\psi \circ \phi;\, x) = Q^0_k(\psi;\, y) \circ Q^0_k(\phi;\, x).
$$


**Proof.**
For $t \in (0,1]$ the family is exactly functorial [#prop:deformation],

$$
   Q_k(\psi \circ \phi;\, x;\, t)
   = Q_k(\psi;\, y;\, t) \circ Q_k(\phi;\, x;\, t),
$$

with no regularity assumptions; it remains to pass to the boundary.
Fix $c \in CT_k(X, x)$. The inner factor converges,
$c^{(t)} := Q_k(\phi;\, x;\, t;\, c) \to c' := Q^0_k(\phi;\, x;\, c)$
[#thm:boundary-extension], and is in particular bounded. The outer
convergence $Q_k(\psi;\, y;\, t) \to Q^0_k(\psi;\, y)$ is uniform on
bounded cubes with continuous limit [#thm:boundary-extension], so
$Q_k(\psi;\, y;\, t;\, c^{(t)}) \to Q^0_k(\psi;\, y;\, c')$. The left side
converges to $Q^0_k(\psi \circ \phi;\, x;\, c)$ by
[#thm:boundary-extension] applied to the composite, which is $C^k$
near $x$.

### The algebra of the deformation

The deformed pushforward conjugates $\Delta_+$ by the rescaling
$\lambda_t$ [#def:q-family]; the deformed product arises the same
way, by conjugating the $t = 1$ product with the grade rescaling
$\Lambda_t(\omega) := (t^k \omega_k)_{k \geq 0}$. Term by term, the
covering pair $(I, J)$ with $I \cup J = [k]$ acquires the factor
$t^{|I|}\, t^{|J|}\, t^{-k} = t^{|I \cap J|}$. Thus each overlap
contributes one power of $t$. The definition below extends this conjugate
through $t = 0$, where only the disjoint pairs remain. Its $t = 1$ fiber
is the product in the discrete Leibniz rule
[#thm:leibniz].


**Definition (Deformed product).** {#def:deformed-product}
For $t \in [0,1]$, the *deformed product* on $CT^*(X, x)$ is

$$
   (\omega \star_t \eta)_k(c)
   := \sum_{I \cup J = [k]} t^{|I \cap J|}\,
      \omega_{|I|}(\del_I c)\, \eta_{|J|}(\del_J c),
$$

the sum over ordered pairs $(I, J)$ of subsets with $I \cup J = [k]$, not
necessarily disjoint, with $t^0 := 1$; the unit is
$\mathbf 1 = (1, 0, 0, \dots)$. At the endpoints:

- $\cstar := \star_1$ is the *covering product*: every covering pair
  enters with weight one,

    $$
    (\omega \cstar \eta)_k(c)
    = \sum_{I \cup J = [k]} \omega_{|I|}(\del_I c)\, \eta_{|J|}(\del_J c).
    $$

- $\pstar := \star_0$ is the *partition product*: only disjoint pairs
  remain,

    $$
    (\omega \pstar \eta)_k(c)
    = \sum_{I \sqcup J = [k]} \omega_{|I|}(\del_I c)\, \eta_{|J|}(\del_J c),
    $$

    the sum over ordered disjoint decompositions, with possibly empty
    parts.


**Theorem (The algebra family).** {#thm:algebra-family}
For every $t \in [0,1]$, the product $\star_t$ is commutative,
associative, and unital. For $t \in (0,1]$, the grade rescaling
$\Lambda_t(\omega) := (t^k \omega_k)_{k \geq 0}$ is a unital algebra
isomorphism

$$
   \Lambda_t: (CT^*(X, x),\, \star_t) \lra (CT^*(X, x),\, \cstar):
$$

the family is trivial over the punctured interval. At the boundary it
degenerates: $(CT^*(X, x), \pstar)$ is a local algebra. Its non-units
are exactly the elements with $\omega_0 = 0$, which form an ideal. By contrast,
$(CT^*(X, x), \cstar)$ is not local, so the zero fiber is isomorphic
to no other fiber. At $t = 0$ the overlapping pairs disappear and only
disjoint decompositions remain: this overlap-to-disjoint degeneration
is the two-factor instance of the cover-to-partition collapse of the
extension theory above.


**Proof.**
Swapping $I$ and $J$ proves commutativity. If one factor is
$\mathbf 1=(1,0,0,\dots)$, only the pair with its index set empty
contributes, which proves the unit law. For associativity, expand the triple product over triples
$I \cup J \cup K = [k]$: the left bracketing has the factor
$t^{|I \cap J| + |(I \cup J) \cap K|}$, the right bracketing
$t^{|J \cap K| + |I \cap (J \cup K)|}$, and both exponents equal
$|I| + |J| + |K| - k$ by inclusion-exclusion. This expression is symmetric
in the three factors.

Multiplicativity of $\Lambda_t$: in grade $k$, the pair $(I, J)$
has the factor $t^k \cdot t^{|I \cap J|}$ on the left and
$t^{|I|}\, t^{|J|}$ on the right, and
$|I| + |J| = k + |I \cap J|$; $\Lambda_t$ fixes the unit and is
invertible for $t > 0$. Degeneration: in every $\star_t$,
$(\omega \star_t \eta)_0 = \omega_0\, \eta_0$, so elements with
$\omega_0 = 0$ are non-units, and they form an ideal. In $\pstar$
they are the only non-units: for $\omega_0 \neq 0$, the grade-$k$
equation of $\omega \pstar \eta = \mathbf 1$ determines $\eta_k$
triangularly with leading coefficient $\omega_0$. Hence $\pstar$ is
local. For $\cstar$, Taylor duality makes every vertex evaluation a
character:

$$
   \chi_c(\omega) := \sum_{T \subseteq [k]} \omega_{|T|}(\del_T c),
   \qquad
   \chi_c(\omega \cstar \eta) = \chi_c(\omega)\, \chi_c(\eta),
$$

since the pairs $(I, J)$ with $I \cup J \subseteq [k]$, grouped by
$T = I \cup J$, enumerate exactly the product of two vertex sums.
Kernels of characters consist of non-units; taking grade-one
components constant, $(1, -\tfrac12, 0, \dots)$ is killed by $\chi_c$
at every cube of order two, and $(0, \tfrac12, 0, \dots)$ by the
order-zero evaluation, yet their sum is the unit: $\cstar$ is not
local.


**Remark (Weight principle).** {#rem:weight-principle}
In the covering formula [#thm:covering], weight each cover $H$ by
the deformation monomial of its excess. On the diagonal this is
$t^{\wt(H) - k}$; per leg it is $\prod_i t_i^{m_i(H) - 1}$, where
$m_i(H)$ is the number of
blocks containing $i$. No such scalar-weighted covering formula is
an identity of the difference calculus: the outer difference
$\Delta(\phi;\, x;\, \cdot)$ is not multilinear in its slots, and
the weights cannot be moved out of the arguments. The weight
principle is exact precisely in multilinear readings: in the
algebra family [#thm:algebra-family], whose structure constants
$t^{|I \cap J|}$ realize it for pairs; in the cube-ring realization
[#rem:weil] below; and at the boundary $t \downarrow 0$, where the
excess weights select the partitions. In the nonlinear calculus it
holds only asymptotically, as the collapse rates of the
extension theory.


**Remark (Cube rings and Weil algebras).** {#rem:weil}
The family has a finite free ring model of rank $2^k$ over $\IR[t]$;
every fiber is $2^k$-dimensional. Set

$$
   C_k := \IR[t, X_1, \dots, X_k]\,/\,(X_i^2 - t\, X_i)
$$

the monomials $X_A := \prod_{i \in A} X_i$, $A \subseteq [k]$, form a
basis over $\IR[t]$, with

$$
   X_A\, X_B = t^{|A \cap B|}\, X_{A \cup B}:
$$

the structure constants of the algebra family
[#thm:algebra-family]. For $a \neq 0$, the rescaling $\lambda_a$
acts as the substitution $X_i \mapsto a\, X_i$ and identifies the
fiber at $1$ with the fiber at $a$: from $X_i^2 = X_i$ one gets
$(a X_i)^2 = a\, (a X_i)$. This is the ring-level form of the
trivialization over the punctured interval.

At $t = 1$, the coordinate algebra of the
Boolean cube, $\IR[X_\bullet]/(X_i^2 - X_i)$, is the
algebra of functions on the vertex set $\set{0,1}^k$, the monomial
and vertex-indicator bases related by the zeta and Möbius transforms
[#prop:moebius]. At $t = 0$, the square-zero ring
$\IR[X_\bullet]/(X_i^2)$ is the $k$-fold dual-numbers algebra, the
Weil algebra of the iterated tangent functor $T^k$
[@kolar1993natural], matching the zero fiber's identification with
$T^k$ [#prop:iterated-tangent]. The family
$C_k$ can be made explicit as a Rees algebra: writing
$B_k := \IR[e_1, \dots, e_k]/(e_i^2 - e_i)$ for the vertex-function
algebra with its monomial-degree filtration, $C_k$ is the Rees
algebra of $B_k$, with $X_i$ corresponding to the Rees element
$t\, e_i$. This is the isotropic case of Bertram's cubic rings
[@Bertram2017]; the per-leg version is given by his scaleoid rings
[@Bertram2015b]. The companion paper develops the realization theory
relating the cube calculus to these rings [@DFDB]. The present paper uses
$CT_*$, $CT^*$, $ST_*$, $ST^*$ alone.


The zero fiber is so far a cubical object; the next chapter builds
the symmetric multilinear calculus and identifies the two under the
symbol map.

## Differential calculus {#sec:covariant-differentials}

This chapter constructs the symmetric multilinear calculus and compares it
with the cubical zero fiber. It does not depend on the later jet calculus;
the required coalgebra facts are collected in the appendix.

### Symmetric probes and pushforward

**Definition (Symmetric tangent space).** {#def:symmetric-tangent}
For $r, k \geq 0$ define:

- $\SYM^r(E)$ is the $r$-th algebraic symmetric power of $E$, with
  $\SYM^0(E) := \IR \cdot 1$.
- $ST_r(X, x) := \SYM^r(T_x X)$ is the space of probes of exact degree
  $r$; in particular $ST_1(X, x) = T_x X$.
- $ST_{\leq k}(X, x) := \SYM_{\leq k}(T_x X)
  = \Vsum_{r=0}^{k} \SYM^r(T_x X)$ is the *symmetric tangent space* of
  order $k$.
- $ST_*(X, x) := \SYM(T_x X)$ is the symmetric tangent space of all orders.

Elements of $ST_{\leq k}$ are called *probes*; monomials are written
$v_1 \cdots v_r$. On spaces, operators, and forms, sub- and
superscripts denote exact degree, and truncation is always marked
$\leq k$; on cube letters, subscripts remain Möbius coordinates
[#def:cubes].


Besides the truncated symmetric product
$\xi \cdot \eta := \pi_{\leq k}(\xi \eta)$, the symmetric tangent space
has a coproduct.


**Definition (Coproduct).** {#def:coproduct}
The *coproduct* on $ST_{\leq k}(X, x)$ is the linear map
$\Delta^{\times}: ST_{\leq k}(X, x) \to ST_{\leq k}(X, x) \tensor
ST_{\leq k}(X, x)$ with
$\Delta^{\times}(1) = 1 \tensor 1$ and

$$
   \Delta^{\times}(v_1 \cdots v_r) := \sum_{I \sqcup J = [r]} v^I \tensor v^J,
   \qquad v^\emptyset := 1,
$$

where $v^I := \prod_{i \in I} v_i$ is the monomial (the subfamily is
$v_I$, with the index down); the right side is symmetric and
multilinear, so $\Delta^{\times}$ is well defined. The *counit* is the
linear map $\varepsilon: ST_{\leq k}(X, x) \to \IR$ with
$\varepsilon(1) := 1$ and $\varepsilon := 0$ in positive degrees.


The truncated product and the coproduct are paired structures on
$ST_{\leq k}(X, x)$: truncation makes it an algebra quotient and the degree
filtration makes it a subcoalgebra. We do not regard the truncated space as
a bialgebra. The untruncated bialgebra and the coalgebra facts used below are
collected in the appendix [#sec:appendix-b].


**Definition (Differential).** {#def:differential}
Let $\phi: X \to Y$ be $C^k$ near $x$, with $y = \phi(x)$.

- The *differential* of $\phi$ at $x$ is the linear map
    $D(\phi; x): ST_{\leq k}(X, x) \to ST_1(Y, y)$ defined on monomials by
    iterating the directional derivative
    $\del_v \phi(x) := \tfrac{d}{ds}\big|_{s=0}\, \phi(x + s v)$:

    $$
       D(\phi;\, x;\, v_1 \cdots v_r)
       = \del_{v_r} \cdots \del_{v_1} \phi(x);
    $$
  
    on the degree-zero probe, $D(\phi; x; 1) := 0$: the target has no
    degree zero, and the base point is transported by $\phi$ itself,
    $\phi(x) = y$. 

- For an observable $f: X \to F$ with values in a Banach space $F$ the same formula defines a
  *differential* $D(f; x): ST_{\leq k}(X, x) \to F$, with the degree-zero 
  convention $D(f; x; 1) := f(x)$. The two readings differ only in
  degree zero: a based target kills constants, an observable records
  $f(x)$. A map into the affine space $F$ and an $F$-valued observable
  have the same type; the declared role of the first argument selects
  the reading.


**Definition (Symmetric pushforward).** {#def:symmetric-pushforward}
For $\phi \in C^k$ near $x$, the *symmetric pushforward*
$D_+(\phi; x): ST_{\leq k}(X, x) \to ST_{\leq k}(Y, y)$ is the linear map
with
$D_+(\phi; x; 1) := 1$ and

$$
   D_+(\phi;\, x;\, v_1 \cdots v_r) := \sum_{\pi \in \Part(r)} \prod_{A \in \pi} D(\phi;\, x;\, v^A),
   \qquad 1 \leq r \leq k.
$$

The right side is symmetric and multilinear in $(v_1, \dots, v_r)$, so it
defines a linear map on $\SYM^r(E)$.


The preceding partition formula is determined by a coordinate-free
property: $D_+(\phi;x)$ is the unique coalgebra lift of the differential
$D(\phi;x)$. The next two statements establish this characterization.


**Proposition (Coalgebra property).** {#prop:coalgebra}
For $\phi \in C^k$ near $x$, $D_+(\phi; x)$ is a coalgebra morphism:

$$
   \Delta^{\times} \circ D_+(\phi; x)
   = (D_+(\phi; x) \tensor D_+(\phi; x)) \circ \Delta^{\times},
   \qquad
   \varepsilon \circ D_+(\phi; x) = \varepsilon.
$$


**Proof.**
Evaluate on $v_1\cdots v_r$ and set $w_A:=D(\phi;x;v^A)$. Applying
$\Delta^{\times}$ to each partition term splits its block set:

$$
   \Delta^{\times}(D_+(v_1\cdots v_r))
   =\sum_{\pi\in\Part(r)}\ \sum_{\pi=\pi_1\sqcup\pi_2}
     \prod_{A\in\pi_1}w_A\tensor\prod_{A\in\pi_2}w_A.
$$

The data $(\pi,\pi_1,\pi_2)$ correspond bijectively to
$(I\sqcup J=[r],\pi_1\in\Part(I),\pi_2\in\Part(J))$, with
$I=\bigcup\pi_1$ and $J=\bigcup\pi_2$. The resulting sum is
$\sum_{I\sqcup J}D_+(v^I)\tensor D_+(v^J)
=(D_+\tensor D_+)\Delta^{\times}(v_1\cdots v_r)$. For the counit,
$D_+(\phi;\, x;\, 1) = 1$, and every positive-degree probe lands in
positive degrees, each partition term being a product of at least one
degree-one factor.


**Corollary (Coalgebra lift).** {#prop:coalgebra-lift}
$D_+(\phi; x)$ is the unique coalgebra morphism
$ST_{\leq k}(X, x) \to ST_{\leq k}(Y, y)$ whose degree-one component
is the differential $D(\phi; x)$.


**Proof.**
The coalgebra property is [#prop:coalgebra]. Uniqueness is the
truncated coalgebra-lift corollary [#cor:coalgebra-lift] of the
appendix, applied to $D(\phi; x)$; its partition expansion is
[#def:symmetric-pushforward].

### The symbol map {#sec:symbol}

**Definition (Symbol map).** {#def:symbol}
The *symbol map* is

$$
   \sigma_k: CT_k(X, x) \to ST_{\leq k}(X, x),
   \qquad
   \sigma_k(c) := \sum_{\pi \in \Part(k)} \prod_{A \in \pi} c_A,
$$

where the products are taken in the symmetric algebra. On affine cubes,
$\sigma_k(\Aff(v_1,\dots,v_k))=v_1\cdots v_k$. In grade zero,
$\sigma_0(0) := 1$. Although indexed by the cube order $k$, the symbol
is not homogeneous in symmetric degree: a partition with $r$ blocks
contributes degree $r$.


**Lemma (Spanning).** {#lem:spanning}
For every $1 \leq r \leq k$ and $v_1, \dots, v_r \in T_x X$, the
monomial $v_1 \cdots v_r$ lies in the image of $\sigma_k$.
Consequently the image of $\sigma_k$, together with $1$, spans
$ST_{\leq k}(X, x)$.


**Proof.**
Choose a partition $[k] = B_1 \sqcup \dots \sqcup B_r$ into nonempty
blocks and define $c \in CT_k(X, x)$ by $c_{B_j} := v_j$ and
$c_A := 0$ for all other $A$. A partition $\pi \in \Part(k)$
contributes to $\sigma_k(c)$ only if all its blocks lie in
$\set{B_1, \dots, B_r}$, which forces $\pi = \set{B_1, \dots, B_r}$;
hence $\sigma_k(c) = v_1 \cdots v_r$.


**Proposition (Symbol factorization).** {#prop:symbol-factorization}
Let $k \geq 1$ and let $\phi$ be $C^k$ near $x$. For
$c \in CT_k(X, x)$,

$$
   Q^0_k(\phi;\, x;\, c)_{[k]} = D(\phi;\, x;\, \sigma_k(c)).
$$


**Proof.**
The top coordinate of the partition formula [#thm:boundary-extension]
reads
$Q^0_k(\phi;\, x;\, c)_{[k]}
= \sum_{\pi \in \Part(k)} D(\phi;\, x;\, (c_A)_{A \in \pi})$. Each
summand is the differential [#def:differential] evaluated on the
monomial $\prod_{A \in \pi} c_A$, so by linearity the sum is
$D(\phi;\, x;\, \cdot)$ applied to $\sigma_k(c)$.


**Remark (The classical symbol).** {#rem:symbol-classical}
The Rees deformation of a filtered ring has the ring as generic fiber
and the associated graded as special fiber, reached through the
leading-form map; for differential operators with the order filtration,
$\mathrm{gr}(\mathcal D) = \mathrm{Sym}(T)$ and the leading-form map is
the principal symbol.

The deformation here is Rees-like. The spaces $CT_k$ are constant,
$\lambda_t$ is the dilation action, and every overlap has positive
deformation weight in the algebra family [#thm:algebra-family]. At the
boundary, only the disjoint terms remain. By [#lem:weight-bound], the
smallest weight in grade $k$ is $k$, attained exactly by partitions.
Thus $\sigma_k$ is the corresponding leading-form expression, and symbol factorization
[#prop:symbol-factorization] states that the zero fiber factors
through it. Throughout, "leading" refers to deformation weight, not to
symmetric degree: the symbol mixes all degrees $1, \dots, k$.


**Remark (Order one: deformation to the normal cone).** {#rem:tangent-groupoid}
In order one, $(x,v,t) \mapsto (x,x+tv,t)$ gives the standard affine
coordinates for deformation to the normal cone of the diagonal
$X\subset X\times X$ [@Fulton1998]. The same coordinates occur in Connes'
tangent groupoid [@Connes1994]. Restriction to its special fiber $TX$
gives the principal cosymbol, a translation-invariant operator on the
tangent fibers; fiberwise Fourier transform gives the pseudodifferential
principal symbol on $T^*X$ [@vanErpYuncken2019]. We use only the coordinate
comparison, not the groupoid structure. None of the subsequent results
depends on this remark.


**Theorem (Symbol intertwining).** {#thm:intertwining}
Let $\phi$ be $C^k$ near $x$. Then

$$
   \sigma_k \circ Q^0_k(\phi;\, x) = D_+(\phi;\, x) \circ \sigma_k
   \;:\; CT_k(X, x) \lra ST_{\leq k}(Y, y).
$$


**Proof.**
In grade zero both sides send the point cube to $1$. For $k \geq 1$,
both sides are sums indexed by the same two-level partition data: a
partition $\rho$ of $[k]$ together with a partition $\kappa$ of the
block set of $\rho$. For $k=2$, these data give the three terms
$D(\phi;x;c_{12})$, $D(\phi;x;c_1,c_2)$, and
$D(\phi;x;c_1)D(\phi;x;c_2)$. In the last two terms, $\kappa$ either
groups the singleton blocks of $\rho$ together or keeps them separate.
We now write both expansions in the same indexing for arbitrary $k$.
For $c \in CT_k(X, x)$, expand the left side by the partition formula
[#thm:boundary-extension]:

$$
   \sigma_k(Q^0_k(\phi;\, x;\, c))
   = \sum_{\pi \in \Part(k)} \prod_{A \in \pi}\;
     \sum_{\rho_A \in \Part(A)} D(\phi;\, x;\, (c_B)_{B \in \rho_A}).
$$

Expanding the product, the index data is a pair
$(\pi, (\rho_A)_{A \in \pi})$ with $\rho_A \in \Part(A)$. Such pairs
correspond bijectively to pairs $(\rho, \kappa)$ of a partition
$\rho \in \Part(k)$ and a partition $\kappa$ of the block set of
$\rho$: put $\rho := \bigsqcup_{A \in \pi} \rho_A$ and
$\kappa := \set{\rho_A : A \in \pi}$; conversely
$\pi = \set{\bigcup C : C \in \kappa}$. Under this bijection the term
of $(\pi, (\rho_A))$ equals
$\prod_{C \in \kappa} D(\phi;\, x;\, (c_B)_{B \in C})$. On the other
side, the symmetric pushforward [#def:symmetric-pushforward], applied
to the monomial of the $|\rho|$ vectors $(c_B)_{B \in \rho}$, gives

$$
   D_+(\phi;\, x;\, \sigma_k(c))
   = \sum_{\rho \in \Part(k)} \; \sum_{\kappa \in \Part(\rho)} \;
     \prod_{C \in \kappa} D(\phi;\, x;\, (c_B)_{B \in C}).
$$

The two sums agree term by term.

### Higher symbols and collapse expansion {#sec:higher-symbols}

The symbol gives the leading coefficient of the *collapse function*
$t \mapsto \Delta(f;\, x;\, \lambda_t\, c)$ of an observable: by
boundary extension and symbol factorization, the function has
leading asymptotic $t^k\, D(f;\, x;\, \sigma_k(c))$. The same cover
calculus computes every subsequent coefficient.


**Definition (Higher symbols).** {#def:higher-symbols}
For $H \in \Cov(k)$ and multiplicities $\nu: H \to \IN_{>0}$ set
$\wt(\nu) := \sum_{A \in H} |A|\, \nu_A$ and
$\nu! := \prod_{A \in H} \nu_A!$. The *higher symbols* are

$$
   \sigma_{k,m}(c)
   := \sum_{H \in \Cov(k)}\;
      \sum_{\substack{\nu: H \to \IN_{>0}\\ \wt(\nu) = k + m}}
      \frac{1}{\nu!} \prod_{A \in H} c_A^{\nu_A}
   \;\in\; ST_*(X, x),
   \qquad m \geq 0,
$$

the products taken in the symmetric algebra.


Minimal weight forces $\sigma_{k,0} = \sigma_k$:
$\wt(\nu) \geq \wt(H) \geq k$ [#lem:weight-bound], with equality
only for partitions with all multiplicities equal to one. On affine
cubes only the singleton cover contributes, the multiplicities
become multi-indices, and, writing $\nu! := \prod_i \nu_i!$,
$v^\nu := v_1^{\nu_1} \cdots v_k^{\nu_k}$, and
$\wt(\nu) := \nu_1 + \dots + \nu_k$ for $\nu \in \IN_0^k$,

$$
   \sigma_{k,m}(\Aff(v_1, \dots, v_k))
   = \sum_{\substack{\nu \in \IN_{>0}^k\\ \wt(\nu) = k + m}}
     \frac{1}{\nu!}\, v^\nu,
$$

homogeneous of symmetric degree $k + m$.


**Proposition (Affine collapse).** {#prop:affine-collapse}
Let $f: X \to F$ be $C^n$ near $x$, and let $k \geq 1$ and $R > 0$.
As $t \to 0$,

$$
   \Delta(f;\, x;\, t v_1, \dots, t v_k)
   = \sum_{\substack{\nu \in \IN_{>0}^k\\ \wt(\nu) \leq n}}
     \frac{t^{\wt(\nu)}}{\nu!}\, D(f;\, x;\, v^\nu)
   + o(t^n),
$$

uniformly over $\|v_1\|, \dots, \|v_k\| \leq R$. For $n \geq k$,
divided by $t^k$ and grouped by weight, the normalized difference
expands with the affine higher symbols as coefficients,

$$
   \frac{1}{t^k}\, \Delta(f;\, x;\, t v_1, \dots, t v_k)
   = \sum_{m=0}^{n-k} t^m\,
     D(f;\, x;\, \sigma_{k,m}(\Aff(v_1, \dots, v_k)))
   + o(t^{n-k}).
$$


**Proof.**
Writing $n = k + m$, the claim $(\ast_{m,k})$ states that for every
observable $h: X \to F$ that is $C^{k+m}$ near $x$, the first
display holds uniformly over $\|v_1\|, \dots, \|v_k\| \leq R$; for
$k = 0$ read $(\ast_{m,0})$ as the exact identity
$\Delta(h;\, x) = h(x)$. We argue by lexicographic induction on
$(m,k)$.

*Base $m = 0$.* The normalized difference
$t^{-k}\, \Delta(h;\, x;\, t v_\bullet)$ is the top coordinate of
the family on the affine cube [#def:q-family], and the cubes with
$\|v_i\| \leq R$ form a bounded family; by boundary extension
[#thm:boundary-extension] it converges to the derivative
$D(h;\, x;\, v_1 \cdots v_k)$, uniformly over the family. This is
$(\ast_{0,k})$: the only multi-index of weight $k$ is
$\nu = (1, \dots, 1)$, and $\nu! = 1$.

*Step.* Let $m, k \geq 1$ and let $h$ be $C^{k+m}$ near $x$. Write
$G := D(h;\, -): X \to \mathcal L(E, F)$ for the derivative map, an
observable that is $C^{k+m-1}$ near $x$ with
$D(G;\, x;\, u_1, \dots, u_s)(u) = D(h;\, x;\, u_1, \dots, u_s, u)$.
Read from right to left, the successor identity [#lem:successor] rewrites
the last leg as a base displacement:

$$
   \Delta(h;\, x;\, t v_1, \dots, t v_k)
   = \Delta(h;\, x + t v_k;\, t v')
   - \Delta(h;\, x;\, t v'),
   \qquad t v' := (t v_1, \dots, t v_{k-1});
$$

the map $y \mapsto \Delta(h;\, y;\, t v')$ is a finite alternating
sum of translates of $h$, with derivative
$\Delta(G;\, y;\, t v')(u)$ in direction $u$, so the fundamental
theorem [#lem:ftc] along the segment to $x + t v_k$, followed by
the same successor identity applied to $G$ at the moving base
$x + \theta t v_k$, gives

$$
   \Delta(h;\, x;\, t v_\bullet)
   = t\, \Delta(G;\, x;\, t v')(v_k)
   + t \int_0^1
     \Delta(G;\, x;\, t v_1, \dots, t v_{k-1},\, \theta\, t v_k)(v_k)
     \; d\theta,
$$

all base points and segments lying in the neighborhood once $t$ is
small. Both differences on the right sit at the fixed base $x$: the
first has grade $k - 1$ and excess $m$, the second grade $k$ and
excess $m - 1$. The induction hypothesis expands both, uniformly
over legs in the $R$-ball; in the integral the legs
$(v_1, \dots, v_{k-1}, \theta v_k)$ stay in that ball for all
$\theta \in [0, 1]$, so the remainder is uniform in $\theta$. Evaluation
at $v_k$ increases the bound by at most a factor $R$. The first term
contributes, for each $\mu \in \IN_{>0}^{k-1}$ with
$\wt(\mu) \leq k - 1 + m$,

$$
   t\, \frac{t^{\wt(\mu)}}{\mu!}\, D(G;\, x;\, v'^\mu)(v_k)
   = \frac{t^{\wt(\nu)}}{\nu!}\, D(h;\, x;\, v^\nu),
   \qquad \nu := (\mu, 1),
$$

exactly the multi-indices with $\nu_k = 1$. In the integral the leg
$\theta v_k$ enters each summand homogeneously, through
$\theta^{\nu_k}$, and $\int_0^1 \theta^{\nu_k}\, d\theta
= \tfrac{1}{\nu_k + 1}$ raises the last exponent:

$$
   t \int_0^1 \theta^{\nu_k}\, d\theta \;\,
   \frac{t^{\wt(\nu)}}{\nu!}\,
   D(h;\, x;\, v'^{\nu'} v_k^{\nu_k + 1})
   = \frac{t^{\wt(\tilde\nu)}}{\tilde\nu!}\,
     D(h;\, x;\, v^{\tilde\nu}),
   \qquad \tilde\nu := (\nu', \nu_k + 1),
$$

since $\nu!\, (\nu_k + 1) = \tilde\nu!$: exactly the multi-indices
with $\tilde\nu_k \geq 2$. Together the two terms produce every
$\nu \in \IN_{>0}^k$ of weight at most $k + m$ exactly once, with
total remainder $t\, o(t^{k+m-1}) = o(t^{k+m})$. The factorials are
obtained from the factors $1/(\nu_k+1)$ contributed by the
$\theta$-integrals at each induction step.

If $n < k$ the sum in the first display is empty and the claim
reads $\Delta(f;\, x;\, t v_\bullet) = o(t^n)$: reading the last
$k - n$ legs as an iterated difference of the map
$y \mapsto \Delta(f;\, y;\, t v_1, \dots, t v_n)$ expands

$$
   \Delta(f;\, x;\, t v_\bullet)
   = \sum_{T \subseteq \set{n+1, \dots, k}} (-1)^{k - n - |T|}\,
     \Delta(f;\, x + t v_T;\, t v_1, \dots, t v_n),
   \qquad v_T := \sum_{i \in T} v_i,
$$

and by joint continuity through the boundary
[#thm:boundary-extension] each summand is
$t^n\, (D(f;\, x;\, v_1 \cdots v_n) + o(1))$; the alternating signs
sum to zero and cancel the common limit.

For the second display, divide by $t^k$ and group by
$\wt(\nu) = k + m$; the inner sums are the affine higher symbols.


**Theorem (Curved collapse).** {#thm:curved-collapse}
Let $M \geq 0$ and let $f: X \to F$ be $C^{k+M}$ near $x$, with
$k \geq 1$. As $t \downarrow 0$,

$$
   \Delta(f;\, x;\, \lambda_t\, c)
   = \sum_{m=0}^{M} t^{k+m}\, D(f;\, x;\, \sigma_{k,m}(c))
   + o(t^{k+M}),
$$

uniformly for $c$ in bounded subsets of $CT_k(X, x)$.


**Proof.**
Affine reconstruction [#prop:reconstruction] applied to
$\lambda_t\, c$ writes the collapse function as the finite sum

$$
   \Delta(f;\, x;\, \lambda_t\, c)
   = \sum_{H \in \Cov(k)}
     \Delta\bigl(f;\, x;\, (t^{|A|} c_A)_{A \in H}\bigr).
$$

Fix $R$ with $\|c_A\| \leq R$ for all $A$, and fix a cover $H$ with
$r$ blocks. Each leg factors as $t^{|A|} c_A = t \cdot t^{|A|-1}
c_A$ with $\|t^{|A|-1} c_A\| \leq R$ for $t \leq 1$, so affine
collapse [#prop:affine-collapse] applies at scale $t$ to the
bounded, $t$-dependent leg vectors $(t^{|A|-1} c_A)_{A \in H}$,
uniformly. If $r > k + M$ the expansion at order $k + M$ is empty
and the difference is $o(t^{k+M})$. If $r \leq k + M$ it reads,
after collecting the powers of $t$ leg by leg,

$$
   \Delta\bigl(f;\, x;\, (t^{|A|} c_A)_{A \in H}\bigr)
   = \sum_{\substack{\nu: H \to \IN_{>0}\\ \sum_A \nu_A \leq k + M}}
     \frac{t^{\wt(\nu)}}{\nu!}\,
     D\bigl(f;\, x;\, {\textstyle\prod_A} c_A^{\nu_A}\bigr)
   + o(t^{k+M}),
$$

since the term of $\nu$ has the factor $t^{\sum_A \nu_A}$ from the scale
and $t^{\sum_A (|A|-1)\, \nu_A}$ from the legs, together
$t^{\wt(\nu)}$. The finitely many terms with
$\sum_A \nu_A \leq k + M$ but $\wt(\nu) > k + M$ are
$O(t^{k+M+1})$, uniformly on the bounded set, and join the
remainder. Summing over the covers and grouping the surviving terms
by $\wt(\nu) = k + m$ gives exactly the higher symbols
[#def:higher-symbols], with $\wt(\nu) \geq k$ throughout
[#lem:weight-bound].


The term $m=0$ recovers symbol factorization
[#prop:symbol-factorization]. Under the stronger $C^{k+M}$ hypothesis,
the boundary extension has a Taylor expansion in the deformation
parameter; its $t^{k+m}$-coefficient is $D(f;\, x;\, \sigma_{k,m}(c))$.

### Functoriality and Faà di Bruno

**Corollary (Smooth functoriality).** {#cor:smooth-functoriality}
For $\phi \in C^k$ near $x$ and $\psi \in C^k$ near $y = \phi(x)$,

$$
   D_+(\psi \circ \phi;\, x) = D_+(\psi;\, y) \circ D_+(\phi;\, x),
   \qquad
   D_+(\id_X;\, x) = \id.
$$


**Proof.**
For the identity, $D^r(\id_X; x) = 0$ for $r \geq 2$, so only the
partition into singletons contributes in [#def:symmetric-pushforward].
For the composite, both sides are linear and fix $1$; by the spanning
lemma [#lem:spanning] it suffices to compare them on $\sigma_k(c)$ for
$c \in CT_k(X, x)$, each occurrence of $\sigma_k$ taken in the space
indicated by its argument. The composite is $C^k$ near $x$, and
combining the intertwining [#thm:intertwining] with zero-fiber
functoriality [#thm:zero-fiber-functoriality]:

$$
   D_+(\psi \circ \phi;\, x)\, \sigma_k(c)
   = \sigma_k( Q^0_k(\psi \circ \phi;\, x;\, c) )
   = \sigma_k( Q^0_k(\psi;\, y;\, Q^0_k(\phi;\, x;\, c)) )
   = D_+(\psi;\, y)\, D_+(\phi;\, x)\, \sigma_k(c).
$$


**Theorem (Smooth adjunction).** {#thm:smooth-adjunction}
Let $\phi$ be $C^k$ near $x$ and let $f: Y \to F$ be an observable that
is $C^k$ near $y$. For $\xi \in ST_{\leq k}(X, x)$,

$$
   D(f \circ \phi;\, x;\, \xi) = D(f;\, y;\, D_+(\phi;\, x)\, \xi).
$$


**Proof.**
Both sides are linear in $\xi$ and agree at $\xi = 1$: the observable
reading [#def:differential] gives $(f \circ \phi)(x) = f(y)$ on the
left and, since $D_+(\phi;\, x;\, 1) = 1$, the value $f(y)$ on the
right; for $k = 0$ this is already the whole assertion. For
$\xi = \sigma_k(c)$, read $f$ as a map into the affine
space $F$. The two readings agree in positive degrees, and
$\sigma_k(c)$ has no constant component. We may therefore pass through the
zero fiber. By symbol factorization [#prop:symbol-factorization] applied to
$f \circ \phi$ and to $f$, zero-fiber functoriality
[#thm:zero-fiber-functoriality], and the intertwining
[#thm:intertwining],

$$
\begin{aligned}
   D(f \circ \phi;\, x;\, \sigma_k(c))
   &= Q^0_k(f \circ \phi;\, x;\, c)_{[k]}
    = Q^0_k(f;\, y;\, Q^0_k(\phi;\, x;\, c))_{[k]} \\
   &= D(f;\, y;\, \sigma_k(Q^0_k(\phi;\, x;\, c)))
    = D(f;\, y;\, D_+(\phi;\, x)\, \sigma_k(c)).
\end{aligned}
$$

Conclude by the spanning lemma [#lem:spanning].


**Corollary (Partition Faà di Bruno, [@Fraenkel1978] [@CS1996]).** {#cor:partition-fdb}
For $\phi$, $f$ as above and $v_1, \dots, v_k \in T_x X$,

$$
   D(f \circ \phi;\, x;\, v_1, \dots, v_k)
   = \sum_{\pi \in \Part(k)}
     D(f;\, y;\, (D(\phi;\, x;\, v^A))_{A \in \pi}).
$$


**Proof.**
Apply smooth functoriality [#cor:smooth-functoriality] to $\psi = f$,
a $C^k$ map into the Banach space $F$, evaluate at $v_1 \cdots v_k$,
and compare degree-one components. By [#def:symmetric-pushforward],
the degree-one component of $D_+(f;\, y;\, \eta)$ is
$D(f;\, y;\, \eta)$ for $\eta$ of pure positive degree: the left side
contributes $D(f \circ \phi;\, x;\, v_1 \cdots v_k)$, the right side
the partition sum.

### The cotangent space and pullback

**Definition (Symmetric cotangent space).** {#def:symmetric-cotangent}
For $r, k \geq 0$ define:

- $\mathcal L_s^r(E;\IR)$ is the Banach space of
  continuous symmetric $r$-linear forms $E^r\to\IR$. Equivalently, it is
  the continuous dual of $\SYM^r(E)$ equipped with the symmetric projective
  tensor norm.
- $ST^{\leq k}(X, x) := \Vsum_{r=0}^k \mathcal L_s^r(T_xX;\IR)$ is the
  *symmetric cotangent space* of order $k$. Symmetrized tensor product,
  truncated above degree $k$, makes it an algebra.
- $ST^*(X, x) := \prod_{r \geq 0} \mathcal L_s^r(T_xX;\IR)$ is its degree
  completion. Its product is defined degreewise, so every coefficient is a
  finite sum.
- $ST^*(X, x; F) := \prod_{r \geq 0} \mathcal L_s^r(T_xX; F)$ is the
  space of *$F$-valued forms*, for a Banach space $F$, with order-$k$
  truncation
  $ST^{\leq k}(X, x; F) := \Vsum_{r=0}^k \mathcal L_s^r(T_xX; F)$;
  $ST^*(X, x) = ST^*(X, x; \IR)$. The permanent pairing and the
  pullback below act on $F$-valued forms by the same formulas.
- The symmetric product is given on homogeneous forms by

    $$
    (a \cdot b)(v_1, \dots, v_{r+s})
    := \frac{1}{(r+s)!} \sum_{\tau \in S_{r+s}} a(v_{\tau(1)}, \dots, v_{\tau(r)})\; b(v_{\tau(r+1)}, \dots, v_{\tau(r+s)}).
    $$

- For $a\in\mathcal L_s^r(E;\IR)$ and $\xi\in\SYM^r(E)$, set
  $\langle a,\xi\rangle:=r!\,a(\xi)$, and pair distinct degrees by zero.
  This is the *permanent pairing* between $ST^{\leq k}$ and
  $ST_{\leq k}$, and between $ST^*$ and $ST_*$. On decomposables,

    $$
    \langle \ell_1 \cdots \ell_r,\; v_1 \cdots v_r \rangle
    = \sum_{\tau \in S_r} \prod_{i} \ell_i(v_{\tau(i)});
    $$

    in degree two,
    $\langle \ell_1 \ell_2,\, v_1 v_2 \rangle
    = \ell_1(v_1)\, \ell_2(v_2) + \ell_1(v_2)\, \ell_2(v_1)$.
    We write $\langle -, - \rangle_E$ when needed.


**Lemma (Separation).** {#lem:separation}
The pairing separates forms: if $\alpha\in ST^*(X,x)$ pairs to zero with
every $\xi\in ST_*(X,x)$, then $\alpha=0$.


**Proof.**
Degreewise, $\langle \alpha_r,\, v^r \rangle = r!\, \alpha_r(v, \dots, v)$
for $v \in E$, and a symmetric multilinear form vanishing on the diagonal
vanishes, by polarization.


**Lemma (Product and coproduct are adjoint).** {#lem:product-coproduct}
For $\alpha,\beta\in ST^*(X,x)$ and $\xi\in ST_*(X,x)$,

$$
   \langle \alpha\cdot\beta,\xi\rangle
   = \langle \alpha \tensor \beta,\, \Delta^{\times}(\xi) \rangle,
$$

the tensor pairing taken factorwise.


**Proof.**
Bilinearity reduces to $\alpha \in \mathcal L_s^r(E;\IR)$,
$\beta \in \mathcal L_s^s(E;\IR)$,
$\xi = v_1 \cdots v_n$ with $n = r + s$. In the defining sum of the
symmetric product, there are $r!\,s!$ permutations $\tau$ for which
$\{\tau(1),\dots,\tau(r)\}$ is a fixed $r$-set $I$. Thus, with
$J := [n]\setminus I$,
$\langle \alpha \cdot \beta, v_1 \cdots v_n \rangle
= n! \, (\alpha \cdot \beta)(v_\bullet)
= r!\, s! \sum_{|I| = r} \alpha(v_I)\, \beta(v_J)
= \sum_{I \sqcup J = [n]} \langle \alpha, v^I \rangle \langle \beta, v^J \rangle$,
which is the right side by [#def:coproduct].


The pullback of forms is the transpose of the symmetric pushforward
under the permanent pairing, as the adjunction below records; the
factorial in the defining formula is the pairing normalization.


**Definition (Pullback).** {#def:pullback}
Let $\phi:X\to Y$ be smooth near $x$, with $\phi(x)=y$, and let
$\alpha=(\alpha_r)_{r\geq0}\in ST^*(Y,y)$. Define
$D^+(\phi;x)\alpha\in ST^*(X,x)$ degreewise by

$$
   (D^+(\phi;\,x)\alpha)_r(v_1,\dots,v_r)
   :=\frac{1}{r!}\langle\alpha,D_+(\phi;\,x;\,v_1\cdots v_r)\rangle_F,
   \qquad r\geq0,
$$

where the degree-zero monomial is $1$. The right side is a continuous
symmetric $r$-linear form. Moreover, it only uses
$\alpha_0,\dots,\alpha_r$, because $D_+$ does not increase degree. Thus the
formula defines a map on the degree completion and commutes with every
truncation. Hence
$D^+(\phi;x): ST^*(Y,y)\to ST^*(X,x)$ is well defined. For $\phi$ only
$C^k$ near $x$, the same formula defines
$D^+(\phi;x): ST^{\leq k}(Y,y)\to ST^{\leq k}(X,x)$ on the truncations.


**Proposition (Pushforward-pullback adjunction).** {#thm:pushforward-pullback-adjunction}
Let $\phi: X \to Y$ be smooth near $x$. For $\alpha\in ST^*(Y,y)$ and
$\xi\in ST_*(X,x)$,

$$
   \langle D^+(\phi;\,x)\alpha,\xi\rangle_E
   =\langle\alpha,D_+(\phi;\,x)\xi\rangle_F.
$$

For $\phi \in C^k$ near $x$, the same identity holds with
$\alpha \in ST^{\leq k}(Y, y)$ and $\xi \in ST_{\leq k}(X, x)$.


**Proof.**
For $\xi=v_1\cdots v_r$, the permanent pairing and [#def:pullback] give

$$
   \langle D^+(\phi;x)\alpha,v_1\cdots v_r\rangle_E
   =r!\,(D^+(\phi;x)\alpha)_r(v_1,\dots,v_r);
$$

the factor $r!$ cancels the $1/r!$ in the definition, leaving
$\langle\alpha,D_+(\phi;x;v_1\cdots v_r)\rangle_F$. The result follows for
every $\xi\in ST_*(X,x)$ by linearity.


**Proposition (The pullback is an algebra morphism).** {#prop:pullback-algebra}
For $\phi$ smooth near $x$, $D^+(\phi;x)$ is a unital algebra morphism
on the completed symmetric cotangent algebra. For $\phi \in C^k$ near
$x$, $D^+(\phi;x): ST^{\leq k}(Y,y) \to ST^{\leq k}(X,x)$ is a unital
algebra morphism on the truncations.


**Proof.**
Pair with $\xi\in ST_*(X,x)$. By the product-coproduct adjunction
[#lem:product-coproduct], the defining adjunction
[#thm:pushforward-pullback-adjunction], and the coalgebra property
of $D_+$ [#prop:coalgebra],

$$
   \langle D^+(\alpha\beta),\xi\rangle
   =\langle\alpha\tensor\beta,\Delta^\times D_+\xi\rangle
   =\langle D^+\alpha\tensor D^+\beta,\Delta^\times\xi\rangle
   =\langle D^+\alpha\cdot D^+\beta,\xi\rangle.
$$

Separation [#lem:separation] gives multiplicativity. Unitality:
$D_+(\phi;\, x;\, 1) = 1$ and $D_+$ sends every positive-degree probe
to positive degrees, so $(D^+\mathbf 1)_0 = 1$ and
$(D^+\mathbf 1)_r = 0$ for $r \geq 1$: $D^+\mathbf 1 = \mathbf 1$. The
truncated clause is the same computation, which only uses degrees
$\leq k$.


**Corollary (Contravariant functoriality of the pullback).** {#cor:pullback-functoriality}
For $\phi$ smooth near $x$ and $\psi$ smooth near $y = \phi(x)$, on
the completed algebras,

$$
   D^+(\psi \circ \phi;\, x) = D^+(\phi;\, x) \circ D^+(\psi;\, y),
   \qquad
   D^+(\id_X;\, x) = \id.
$$

For $\phi, \psi \in C^k$, the same identities hold on the truncations
$ST^{\leq k}$.


**Proof.**
Pair with $\xi \in ST_*(X, x)$: by the adjunction
[#thm:pushforward-pullback-adjunction] and smooth functoriality
[#cor:smooth-functoriality], with base points suppressed,

$$
   \langle D^+(\psi \circ \phi)\, \alpha,\, \xi \rangle
   = \langle \alpha,\, D_+(\psi)\, D_+(\phi)\, \xi \rangle
   = \langle D^+(\phi)\, D^+(\psi)\, \alpha,\, \xi \rangle,
$$

and separation [#lem:separation] concludes. The identity clause
follows the same way from $D_+(\id_X;\, x) = \id$, and the truncated
clause is the same computation in degrees $\leq k$.


**Definition (Symbol pullback).** {#def:symbol-pullback}
The *symbol pullback* $\sigma^*: ST^*(X, x) \to CT^*(X, x)$ is given
gradewise by the permanent pairing against the symbol,

$$
   (\sigma^*\alpha)_k(c) := \langle \alpha,\; \sigma_k(c) \rangle,
   \qquad k \geq 0.
$$

Since $\sigma_k$ takes values in degrees $1, \dots, k$ and
$\sigma_0 = 1$ [#def:symbol], the grade-$k$ component uses only
$\alpha_1, \dots, \alpha_k$ for $k \geq 1$, and
$(\sigma^*\alpha)_0 = \alpha_0$: the symbol pullback is grade-triangular
and commutes with every truncation. The same formula defines the
$F$-valued symbol pullback
$\sigma^*: ST^*(X, x; F) \to CT^*(X, x; F)$, the pairing now taking
values in $F$.


**Proposition (Symbol pullback is an algebra morphism).** {#prop:symbol-pullback-algebra}
$\sigma^*: (ST^*(X, x),\, \cdot\,) \to (CT^*(X, x),\, \pstar)$ is a
unital algebra morphism.


**Proof.**
Unitality: the unit of $ST^*$ is the constant form $1$ in degree
zero, and $\sigma^* 1 = \mathbf 1$, since $\sigma_k(c)$ has no
constant component for $k \geq 1$ and $\sigma_0(0) = 1$.
Multiplicativity rests on the splitting of the symbol under the
coproduct: by the bijection of the coalgebra proof
[#prop:coalgebra], a partition of $[k]$ with a splitting of its
block set is a disjoint decomposition $I \sqcup J = [k]$ with
partitions of the parts. Hence

$$
   \Delta^{\times}(\sigma_k(c))
   = \sum_{I \sqcup J = [k]}
     \sigma_{|I|}(\del_I c) \tensor \sigma_{|J|}(\del_J c),
$$

so, by the product-coproduct adjunction [#lem:product-coproduct],

$$
   (\sigma^*(\alpha \cdot \beta))_k(c)
   = \langle \alpha \tensor \beta,\, \Delta^{\times}(\sigma_k(c)) \rangle
   = \sum_{I \sqcup J = [k]}
     \langle \alpha,\, \sigma_{|I|}(\del_I c) \rangle\,
     \langle \beta,\, \sigma_{|J|}(\del_J c) \rangle
   = (\sigma^*\alpha \pstar \sigma^*\beta)_k(c).
$$

### Distributions {#sec:distributions}

Discretely, probes are the finitely supported measures
$\delta(x;\, c)$ and $\Delta_+$ acts as their pushforward
[#thm:adjunction]. Under rescaling, these cube measures converge to the
point distributions $\delta(x;\xi)$ determined by their symbols
[#cor:distributional-collapse]. Their pushforward is represented by $D_+$
[#thm:distribution-pushforward]. This section gives that distributional
interpretation of the covariant calculus; the jet calculus below does not
depend on it.

**Definition (Smooth functions and distributions).** {#def:smooth-distributions}
Let $X$ be finite-dimensional. Define:

- $\mathcal{E}(X) := C^\infty(X, \IR)$ with its standard Fréchet topology.
- $\mathcal{E}'(X) := \mathcal{E}(X)'$ is the space of compactly supported
  distributions.
- $\mathcal{E}'(X, x)$ is the space of distributions supported at $x$.
- $\mathcal{E}'(X, x)_{\leq k}$ is its subspace of distributions of order
  at most $k$.
- $\phi^* f := f \circ \phi$ is the pullback of smooth functions.
- $\langle \phi_* u, f \rangle := \langle u, \phi^* f \rangle$ is the
  pushforward of distributions.


**Definition (Point distributions).** {#def:point-distributions}
For $\xi \in ST_{\leq k}(X, x)$, the *point distribution* $\delta(x;\, \xi)$
is the linear functional

$$
   \langle \delta(x;\, \xi),\, f \rangle := D(f;\, x;\, \xi),
   \qquad f \in \mathcal{E}(X).
$$

It is supported at $x$ and of order $\leq k$, so the same formula is
meaningful for any $f$ that is $C^k$
near $x$, scalar- or Banach-valued, the pairing then taking values in
the target. We keep the same notation in this case. In particular,
$\delta(x;\, 1) = \delta(x)$ is evaluation
at $x$.


**Lemma (Finitely supported measures are distributions).** {#lem:measures-are-distributions}
Restriction along $\mathcal{E}(X) \subseteq F(X)$ embeds the finitely
supported measures into the distributions,
$F'(X) \mono \mathcal{E}'(X)$, as the distributions of order $0$ with
finite support. In particular every cube measure $\delta(x;\, c)$ of
[#def:cube-measure] is a distribution.


**Proof.**
Evaluation at a point is continuous on $\mathcal{E}(X)$ and extends to
$C^0(X, \IR)$, so $\nu = \sum_i \lambda_i\, \delta(z_i)$ defines a
distribution of order $0$ supported in the finite set $\set{z_i}$; the
map is injective since the $\delta(z_i)$ are linearly independent as
functionals on $\mathcal{E}(X)$.


**Theorem (Structure of point-supported distributions, [@hormander1983analysis], Theorem 2.3.4).** {#thm:schwartz-structure}
On smooth scalar test functions, $\xi \mapsto \delta(x;\, \xi)$
[#def:point-distributions] is a linear isomorphism

$$
   ST_{\leq k}(X, x) \;\xrightarrow{\;\sim\;}\; \mathcal{E}'(X, x)_{\leq k}
$$

between the symmetric tangent space and the distributions of order
$\leq k$ supported in $\set{x}$.


**Remark (Sign-free basis).**
The basis $\delta(x;\, \xi)$ is sign-free [#thm:schwartz-structure]: it
represents the operator datum $\xi$ directly rather than through
$\del^\alpha \delta(x) = (-1)^{|\alpha|}\, \delta(x;\, e^\alpha)$-type
conventions; in one direction, $\del_v\, \delta(x) = -\delta(x;\, v)$.


For smooth $\phi$, the pushforward
$\langle \phi_* u,\, f \rangle := \langle u,\, \phi^* f \rangle$
[#def:smooth-distributions] is the usual operation on
$\mathcal{E}'(X)$. For $\phi$ only $C^k$ near $x$, the composite
$f \circ \phi$ is only $C^k$ and the general operation is
unavailable; on point distributions of order $\leq k$, the
finite-order pairing above still applies, and the same formula,
$\langle \phi_*\, \delta(x;\, \xi),\, f \rangle :=
\langle \delta(x;\, \xi),\, f \circ \phi \rangle$, defines the
pushforward there.


**Theorem (Distribution pushforward).** {#thm:distribution-pushforward}
For $\phi \in C^k$ near $x$ and $\xi \in ST_{\leq k}(X, x)$,

$$
   \phi_*\, \delta(x;\, \xi) \;=\; \delta(y;\, D_+(\phi;\, x)\, \xi).
$$


**Proof.**
$\langle \phi_*\, \delta(x;\, \xi),\, f \rangle
= D(f \circ \phi;\, x;\, \xi)
= D(f;\, y;\, D_+(\phi;\, x)\, \xi)
= \langle \delta(y;\, D_+(\phi;\, x)\, \xi),\, f \rangle$
by the smooth adjunction [#thm:smooth-adjunction].


**Proposition (Filtration and principal symbol).** {#prop:principal-symbol}
$D_+(\phi; x)$ preserves the degree filtration
$ST_{\leq r}(X, x) \subseteq ST_{\leq k}(X, x)$, and on the associated
graded it is the multiplicative extension of the first derivative:

$$
   \gr_r\, D_+(\phi;\, x) = \SYM^r(D^1(\phi;\, x))
   : \SYM^r(E) \lra \SYM^r(F).
$$


**Proof.**
A partition $\pi \in \Part(r)$ contributes in degree $|\pi| \leq r$,
with equality only for the partition into singletons, whose term is
$\prod_i D(\phi;\, x;\, v_i)$.


**Corollary (Distributional collapse).** {#cor:distributional-collapse}
For $c \in CT_k(X, x)$, the rescaled cube measures converge weakly in
$\mathcal{E}'(X)$, that is, pointwise on $\mathcal{E}(X)$:

$$
   \frac{1}{t^k}\, \delta(x;\, \lambda_t\, c)
   \;\xrightarrow[t \downarrow 0]{}\;
   \delta(x;\, \sigma_k(c)).
$$

The left side is a finitely supported measure; the right side is a
point distribution in $\mathcal{E}'(X, x)$.


**Proof.**
For every $f \in \mathcal{E}(X)$,

$$
   \frac{1}{t^k}\, \langle \delta(x;\, \lambda_t\, c),\, f \rangle
   = \frac{1}{t^k}\, \Delta(f;\, x;\, \lambda_t\, c)
   \;\xrightarrow[t \downarrow 0]{}\;
   D(f;\, x;\, \sigma_k(c))
   = \langle \delta(x;\, \sigma_k(c)),\, f \rangle,
$$

the limit of the top coordinate by boundary extension
[#thm:boundary-extension], applied to $f$ read as a map into $\IR$,
identified through symbol factorization [#prop:symbol-factorization].


**Remark.**
Pairing with observables gives the dual statement: Newton's exact finite
expansion converges degreewise to the corresponding Taylor jet. Under
higher regularity, [#sec:higher-symbols] expands
$\Delta(f;\,x;\,\lambda_t c)$ to every finite order. Its
$t^{k+m}$-coefficient pairs the derivatives of $f$ with the cover-indexed
higher symbol $\sigma_{k,m}(c)$; on affine cubes these are the
repeated-direction Taylor monomials.

## Jet calculus {#sec:jets}

This chapter derives the discrete, quotient, zero, and smooth jets from the
pullbacks $\Delta^+$, $Q^*$, and $D^+$. Their naturality and product laws
follow from the corresponding operator identities.

### Jets and naturality

**Definition (Jets).** {#def:jets}
For an observable $f: X \to F$ with values in a Banach space $F$ define:

- the *discrete jet* $j^\Delta(f; x) \in CT^*(X, x; F)$, the forward
  differences,

    $$
    j^\Delta_k(f; x)(c) := \Delta(f;\, x;\, c),
    \qquad k \geq 0;
    $$

- the *quotient jet* $qj(f; x;\, t) \in CT^*(X, x; F)$ for
  $t \in (0,1]$, the normalized differences at scale $t$,

    $$
    qj_k(f; x;\, t;\, c) := \frac{1}{t^k}\, \Delta(f;\, x;\, \lambda_t\, c),
    \qquad k \geq 0;
    $$

- the *smooth jet* $j(f; x) \in ST^{\leq k}(X, x; F)$ of an $f$ that is
  $C^k$ near $x$, the Taylor expansion of $f$ at $x$,

    $$
    j(f; x) := \sum_{r = 0}^{k} \frac{1}{r!}\, D^r(f; x),
    \qquad
    D^0(f; x) := f(x).
    $$

Scalar jets are the case $F = \IR$; the coefficient is suppressed there.
The order of the smooth jet is set by the regularity of $f$; for smooth
$f$ the jets of all orders are compatible and assemble into
$j(f; x) \in ST^*(X, x; F)$.


**Remark (Polynomial evaluation).** {#rem:polynomial-evaluation}
The factorial normalization makes the permanent pairing agree with
polynomial evaluation. If $\alpha = \sum_{r=0}^{k} \alpha_r \in
ST^{\leq k}(X, x)$ represents the polynomial

$$
   p_\alpha(x + v) := \sum_{r=0}^{k} \alpha_r(v, \dots, v),
$$

then, with $\exp(v) := \sum_{r \geq 0} v^r / r!$,
$p_\alpha(x + v) = \langle \alpha,\, \exp(v) \rangle$: evaluation at
$x + v$ is represented on the symmetric tangent side by the
exponential probe.


The discrete jet is not obtained from a quotient by powers of the
point-vanishing ideal. The next proposition shows why that construction has
no nontrivial discrete counterpart.


**Proposition (Prolongation, not quotient).** {#prop:no-quotient}
Let $I_x = \set{f \in F(X) : f(x) = 0}$ be the vanishing ideal of $x$
[#def:functions-measures].

1) $I_x$ is idempotent, $I_x^2 = I_x$: the filtration by powers of $I_x$ is
   constant, and $F(X)/I_x^m = \IR$ for every $m \geq 1$.

2) The discrete jet is injective: the values of $j^\Delta(f;\, x)$ on
   cubes of order $\leq 1$ already determine $f$, via
   $f(x + v) = f(x) + \Delta(f;\, x;\, v)$.

**Proof.**
1) For $f \in I_x$ let $g \in I_x$ take the value $1$ away from $x$; then
$f = fg \in I_x^2$. 2) The order-zero value is $f(x)$, and the order-one
values are the increments $f(x + v) - f(x)$.


**Lemma (Jet pairing).** {#lem:jet-pairing}
For $f \in C^k$ near $x$ and $\xi \in ST_{\leq k}(X, x)$, in the
observable reading,

$$
   \langle j(f;\, x),\, \xi \rangle = D(f;\, x;\, \xi).
$$


**Proof.**
Degreewise: the permanent pairing [#def:symmetric-cotangent]
contributes $r!$ against the coefficient $\frac{1}{r!}$ of
$D^r(f; x)$; in degree zero both sides record $f(x)$.


**Theorem (Jet naturality).** {#thm:cubical-jet-pullback}
For arbitrary maps $\phi: X \to Y$, observables $f: Y \to F$, and
$t \in (0,1]$,

$$
   j^\Delta(f \circ \phi;\, x) = \Delta^+(\phi;\, x)\, j^\Delta(f;\, y),
   \qquad
   qj(f \circ \phi;\, x;\, t) = Q^*(\phi;\, x;\, t)\, qj(f;\, y;\, t).
$$

If $\phi$ is $C^k$ near $x$, then for every $f$ that is $C^k$ near
$y = \phi(x)$ the differential jets satisfy

$$
   j(f \circ \phi;\, x) = D^+(\phi;\, x)\, j(f;\, y)
   \qquad\text{in } ST^{\leq k}(X, x; F).
$$


**Proof.**
For the discrete clause, evaluate on $c$. By the discrete adjunction
[#thm:adjunction],
$\langle \Delta^+(\phi;\, x)\, j^\Delta(f;\, y),\; c \rangle
= \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, c)
= \Delta(f \circ \phi;\, x;\, c)$. Quotient clause, in grade $k$:
$\lambda_t\, Q_k(\phi;\, x;\, t) = \Delta_+(\phi;\, x)\, \lambda_t$
[#prop:deformation], so

$$
   qj_k(f;\, y;\, t;\, Q_k(\phi;\, x;\, t;\, c))
   = \frac{1}{t^k}\, \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, \lambda_t\, c)
   = \frac{1}{t^k}\, \Delta(f \circ \phi;\, x;\, \lambda_t\, c),
$$

again by the discrete adjunction. In grade zero both sides record
$f(y)$. For the differential clause, pair with
$\xi \in ST_{\leq k}(X, x)$. The jet pairing
[#lem:jet-pairing], smooth adjunction [#thm:smooth-adjunction], and
the pushforward-pullback adjunction
[#thm:pushforward-pullback-adjunction] give

$$
   \langle j(f \circ \phi;\, x),\, \xi \rangle
   = D(f \circ \phi;\, x;\, \xi)
   = D(f;\, y;\, D_+(\phi;\, x)\, \xi)
   = \langle D^+(\phi;\, x)\, j(f;\, y),\, \xi \rangle.
$$

The permanent pairing separates $F$-valued forms degreewise, so the
differential jets agree.


The naturality property characterizes the differential pullback. Since the
jet map is surjective, the naturality square determines
$D^+(\phi;\,x)$ on every form.


**Lemma (Jet realization).** {#lem:jet-realization}
For $\alpha \in ST^{\leq k}(X, x)$, the polynomial $p_\alpha$
[#rem:polynomial-evaluation] satisfies $j(p_\alpha;\, x) = \alpha$.
In particular the jet map $j(-;\, x)$ is surjective onto
$ST^{\leq k}(X, x)$.


**Proof.**
The $r$-th derivative at $v = 0$ of the $s$-homogeneous term vanishes
for $r \neq s$ and equals $r!\, \alpha_r$ for $r = s$, by
polarization.


**Corollary (Characterization of jet pullback).** {#thm:jet-pullback}
For $\phi \in C^k$ near $x$, the pullback $D^+(\phi; x)$ is the unique
linear map $ST^{\leq k}(Y, y) \to ST^{\leq k}(X, x)$ such that

$$
   j(f \circ \phi;\, x) = D^+(\phi;\, x)\, j(f;\, y)
$$

for every scalar $f$ that is $C^k$ near $y = \phi(x)$.


**Proof.**
Existence is the differential clause of jet naturality
[#thm:cubical-jet-pullback]. For uniqueness, let $L$ be another such
map and let $\alpha \in ST^{\leq k}(Y, y)$. By jet realization
[#lem:jet-realization], $\alpha = j(p_\alpha;\, y)$, whence

$$
   L\alpha = j(p_\alpha \circ \phi;\, x)
   = D^+(\phi;\, x)\, \alpha.
$$


**Corollary (Taylor pullback on generators).** {#cor:pullback-linear-forms}
For $\ell \in F^*$, let $\ell_y(z) := \ell(z - y)$. For $\phi \in C^k$
near $x$,

$$
   D^+(\phi;\, x;\, \ell)
   = \sum_{r = 1}^{k} \frac{1}{r!}\, \ell \circ D^r(\phi;\, x)
   = j(\ell_y \circ \phi;\, x),
$$

the Taylor expansion at $x$ of the centered observable
$\ell_y \circ \phi$, and, for $1 \leq q \leq k$, with the product
taken in the truncated algebra $ST^{\leq k}(X, x)$,

$$
   D^+(\phi;\, x)(\ell_1 \cdots \ell_q)
   = \prod_{i=1}^{q}
     \Bigl( \sum_{r = 1}^{k} \frac{1}{r!}\, \ell_i \circ D^r(\phi;\, x) \Bigr):
$$

on generators, the pullback is composition of Taylor expansions.


**Proof.**
In degree $r$, pairing with $\ell$ selects the degree-one part of
$D_+(\phi;\, x;\, v_1 \cdots v_r)$, the term of the one-block
partition, giving the Taylor coefficient
$\frac{1}{r!}\, \ell \circ D^r(\phi;\, x)$; the constant term
$\ell_y(\phi(x)) = 0$ vanishes. The product formula is
multiplicativity of the pullback [#prop:pullback-algebra].


**Remark.**
Expanding the composition of Taylor expansions into partition data
recovers the coefficient calculus of Faà di Bruno; the combinatorial
development is the companion's [@FDB].


**Corollary (Jets as pullbacks of the identity).** {#prop:jets-as-pullbacks}
On the target space $F$, write $u_k(c) := c_{[k]}$ for the
*top-coordinate observable* on $CT_k(F, y)$. The cube fibers
$CT_k(F, y) = \Map(\KP_+(k), F)$ do not depend on the base point. Write
$\iota := \id_F \in \mathcal L_s^1(F; F)$ for the *identity
form*. The jets of the identity observable $\id_F$ at $y$ are the
scale-invariant *universal elements*

$$
   u_y := j^\Delta(\id_F;\, y) = qj(\id_F;\, y;\, t)
   = (y,\, u_1,\, u_2,\, \dots),
   \qquad
   \tau_y := j(\id_F;\, y) = y \cdot 1 + \iota,
$$

and every jet is a pullback of the identity's jet: for an observable
$f: X \to F$ with $y = f(x)$,

$$
   j^\Delta(f;\, x) = \Delta^+(f;\, x)\, u_y,
   \qquad
   qj(f;\, x;\, t) = Q^*(f;\, x;\, t)\, u_y,
   \qquad
   j(f;\, x) = D^+(f;\, x)\, \tau_y,
$$

the cubical clauses for arbitrary $f$ in all grades, the smooth
clause in degrees $\leq k$ for $C^k$ $f$.


**Proof.**
Jets of the identity: for $k \geq 1$, the alternating vertex sum of
$\id_F$ retains only the top Möbius coordinate,
$\Delta(\id_F;\, y;\, c)
= \sum_{T \subseteq [k]} (-1)^{k - |T|}\, \zeta_y(c)_T = c_{[k]}$,
by the Boolean sieve [#cor:sieve]: the base point cancels, and among
the coordinates only the one indexed by $A=[k]$ contributes. Hence also
$qj_k(\id_F;\, y;\, t;\, c) = t^{-k} (\lambda_t\, c)_{[k]} = c_{[k]}$
for every $t>0$, while grade zero records $\id_F(y) = y$. Thus the
quotient jets of the identity do not depend on $t$. For the smooth jet,
$D^0(\id_F;\, y) = y$, $D^1(\id_F;\, y) = \iota$, and the higher
derivatives vanish. The three pullback clauses follow from jet
naturality [#thm:cubical-jet-pullback], applied to the map $f$ and
the identity observable $\id_F$.


### The jet ladder

The jets of [#def:jets] assemble into the ladder

$$
   j^\Delta(f;\, x)
   \;\xleftarrow{\;\, t = 1 \,\;}\;
   qj(f;\, x;\, t)
   \;\xrightarrow{\;\, t \downarrow 0 \,\;}\;
   qj^0(f;\, x)
   \;\xleftarrow{\;\, \sigma^* \,\;}\;
   j(f;\, x),
$$

whose rungs are defined and compared below.

**Definition (Zero jet).** {#def:qj-extension}
The *zero jet* is the gradewise limit

$$
   qj^0_k(f; x;\, c) := \lim_{t \downarrow 0}\, qj_k(f; x;\, t;\, c),
$$

defined wherever the limit exists.


**Theorem (Zero jet on the $C^k$ locus).** {#thm:zero-jet-symbol}
Let $f: X \to F$ be $C^k$ near $x$. The grade-$k$ zero jet
exists on all cubes and, reading $f$ as a map into the affine space
$F$,

$$
   qj^0_k(f;\, x) = u_k \circ Q^0_k(f;\, x) = (\sigma^*\, j(f;\, x))_k.
$$


**Proof.**
By [#prop:jets-as-pullbacks], $qj_k(f;\, x;\, t) = u_k \circ
Q_k(f;\, x;\, t)$ for $t \in (0,1]$; boundary extension
[#thm:boundary-extension] applies to the map $f$ and gives, in the
limit, existence on all cubes and the first identification. For the
second, the jet pairing [#lem:jet-pairing] and symbol factorization
[#prop:symbol-factorization] apply because the two readings of $D$ agree on
$\sigma_k(c)$, which has no constant component. Thus, for $k \geq 1$,

$$
   (\sigma^*\, j(f;\, x))_k(c)
   = \langle j(f;\, x),\, \sigma_k(c) \rangle
   = D(f;\, x;\, \sigma_k(c))
   = Q^0_k(f;\, x;\, c)_{[k]};
$$

in grade zero both sides record $f(x)$ [#def:symbol-pullback].


**Corollary (Zero-fiber jet naturality).** {#cor:zero-fiber-jet-naturality}
For $\phi \in C^k$ near $x$ and an observable $f: Y \to F$ that is
$C^k$ near $y = \phi(x)$,

$$
   qj^0_k(f \circ \phi;\, x) = qj^0_k(f;\, y) \circ Q^0_k(\phi;\, x).
$$


**Proof.**
By [#thm:zero-jet-symbol], $qj^0_k(f \circ \phi;\, x) = u_k \circ
Q^0_k(f \circ \phi;\, x)$, the composite being $C^k$ near $x$;
zero-fiber functoriality [#thm:zero-fiber-functoriality] splits
$Q^0_k(f \circ \phi;\, x) = Q^0_k(f;\, y) \circ Q^0_k(\phi;\, x)$,
and $u_k \circ Q^0_k(f;\, y) = qj^0_k(f;\, y)$, again by
[#thm:zero-jet-symbol].


**Proposition (Symbol pullback intertwining).** {#prop:symbol-pullback-intertwining}
Let $\phi$ be $C^k$ near $x$. For $\alpha \in ST^{\leq k}(Y, y)$,

$$
   \bigl(\sigma^*\, D^+(\phi;\, x)\, \alpha\bigr)_k
   = (\sigma^*\, \alpha)_k \circ Q^0_k(\phi;\, x):
$$

the symbol pullback intertwines the smooth and zero-fiber pullbacks.


**Proof.**
Evaluate grade $k$ on $c \in CT_k(X, x)$: by the
pushforward-pullback adjunction
[#thm:pushforward-pullback-adjunction] and the symbol intertwining
[#thm:intertwining],

$$
   \langle D^+(\phi;\, x)\, \alpha,\, \sigma_k(c) \rangle
   = \langle \alpha,\, D_+(\phi;\, x)\, \sigma_k(c) \rangle
   = \langle \alpha,\, \sigma_k(Q^0_k(\phi;\, x;\, c)) \rangle,
$$

which is $(\sigma^*\, \alpha)_k(Q^0_k(\phi;\, x;\, c))$.


The scopes of the rungs differ. The left half of the ladder is exact
and total: $j^\Delta$ and $qj(\cdot;\, t)$ are defined for every
observable, with $qj(f;\, x;\, 1) = j^\Delta(f;\, x)$. The zero jet is
partial: it exists wherever the limit does, and its values need not be
linear in the cube. For $f = |\cdot|$ at $0$, the grade-one zero jet
is $|v|$ [#rem:extension-levels]. The right rung requires regularity:
for $C^k$ observables the zero jet is total in grades $\leq k$ and
equals $\sigma^*\, j(f;\, x)$ [#thm:zero-jet-symbol].

### Leibniz rules

**Theorem (Leibniz rules).** {#thm:leibniz}
For scalar functions $f, g: X \to \IR$ and $t \in (0,1]$,

$$
   j^\Delta(fg;\, x) = j^\Delta(f;\, x) \cstar j^\Delta(g;\, x),
   \qquad
   qj(fg;\, x;\, t) = qj(f;\, x;\, t) \star_t qj(g;\, x;\, t),
$$

Moreover, let $c \in CT_k(X, x)$. If the zero jets of $f$ and $g$ exist
on every face of $c$, then the zero jet of $fg$ exists at $c$ and

$$
   qj^0_k(fg;\, x;\, c)
   = \bigl( qj^0(f;\, x) \pstar qj^0(g;\, x) \bigr)_k(c),
$$

the right side evaluating $qj^0(f;\, x)$ and $qj^0(g;\, x)$ only on
faces of $c$.

If $f$ and $g$ are $C^k$ near $x$, then in the truncated symmetric
cotangent algebra,

$$
   j(fg;\, x) = j(f;\, x) \cdot j(g;\, x)
   \qquad\text{in } ST^{\leq k}(X, x).
$$


**Proof.**
The $\cstar$ clause in grade $k$ is the discrete product rule

$$
   \Delta(fg;\, x;\, c)
   = \sum_{I \cup J = [k]} \Delta(f;\, x;\, \del_I c)\,
     \Delta(g;\, x;\, \del_J c):
$$

by Taylor duality [#prop:taylor-duality],
$f(\zeta_x(c)_T) = \sum_{I \subseteq T} \Delta(f; x; \del_I c)$ and
similarly for $g$; multiply, insert into the alternating sum defining
$\Delta(fg; x; c)$, and exchange sums: the pair $(I, J)$ occurs for the
vertices $T \supseteq I \cup J$, with total coefficient
$\sum_{I \cup J \subseteq T \subseteq [k]} (-1)^{k - |T|} = [I \cup J = [k]]$
by the Boolean sieve [#cor:sieve]. The $\star_t$ clause follows by
transport: $qj_k(fg;\, x;\, t;\, c) = \frac{1}{t^k}\, \Delta(fg;\, x;\,
\lambda_t\, c)$; apply the $\cstar$ clause at $\lambda_t c$, use
$\del_I \lambda_t c = \lambda_t \del_I c$ [#def:rescaling], and collect
the powers of $t$: the pair $(I, J)$ contributes
$t^{|I|}\, t^{|J|}\, t^{-k} = t^{|I \cap J|}$. For the zero-jet clause,
let $t \downarrow 0$ in the $\star_t$ clause at $c$: each factor
converges by hypothesis, and $t^{|I \cap J|} \to [I \cap J = \emptyset]$,
so only the disjoint pairs remain. Their sum is the grade-$k$ $\pstar$ component
[#def:deformed-product]. Now suppose that $f$ and $g$ are
$C^k$ near $x$. Their product is $C^k$ near $x$. In degree zero the
claim is $(fg)(x) = f(x)g(x)$. For $1 \leq n \leq k$, evaluate the
zero-jet clause at the affine cube $\Aff(v_1, \dots, v_n)$: faces of
affine cubes are affine, $\del_I \Aff(v_1, \dots, v_n) = \Aff(v_I)$,
and for a $C^k$ function the zero jet exists there with value the
derivative, $qj^0_{|I|}(f;\, x;\, \Aff(v_I)) = D(f;\, x;\, v^I)$ by
part 1 of [#cor:asymptotics], the grade-zero jet recording $f(x)$.
The clause becomes

$$
   D(fg;\, x;\, v_1 \cdots v_n)
   = \sum_{I \sqcup J = [n]} D(f;\, x;\, v^I)\, D(g;\, x;\, v^J),
$$

with the ordered disjoint decompositions matching, term by term, the
normalized symmetric product: its degree-$n$ component satisfies

$$
   \bigl(j(f;\, x) \cdot j(g;\, x)\bigr)_n(v_1, \dots, v_n)
   = \frac{1}{n!} \sum_{I \sqcup J = [n]}
     D(f;\, x;\, v^I)\, D(g;\, x;\, v^J)
   = \frac{1}{n!}\, D^n(fg;\, x;\, v_1, \dots, v_n).
$$

This is the degree-$n$ component of $j(fg;\, x)$.


**Remark (Algebra-valued coefficients).**
For observables $f, g: X \to A$ with values in a Banach algebra, the
pointwise product $fg$ obeys the same clauses with the same proofs,
including the differential-jet clause when $f$ and $g$ are $C^k$.
The order of the factors is kept as written. When $A$ is
noncommutative, the products $\star_t$ on $A$-valued cochains are no
longer commutative, and $f g \neq g f$ propagates through every rung.


**Corollary (Smooth product rule).** {#thm:smooth-product-rule}
For scalar functions $f, g: X \to \IR$ that are $C^k$ near $x$ and
$v_1, \dots, v_k \in T_x X$,

$$
   D(fg;\, x;\, v_1 \cdots v_k)
   = \sum_{I \sqcup J = [k]} D(f;\, x;\, v^I)\; D(g;\, x;\, v^J),
$$

the sum over ordered disjoint decompositions with possibly empty parts.


**Proof.**
This is the degree-$k$ identity obtained in the proof of
[#thm:leibniz].

### The classical completion {#sec:completion}

Classically, the $k$-jet of a smooth function is its class modulo the
$(k{+}1)$-st power of the maximal ideal, and jet pullback is
ideal-theoretic. This section realizes the quotients on symmetric
cotangent spaces and identifies the formal pullback with $D^+$. It is
the contravariant counterpart of [#sec:distributions]: there, probes
were realized as point-supported distributions; here, function classes
are realized as symmetric forms. Throughout, $X$ is finite-dimensional
and functions are smooth [#def:smooth-distributions]; apart from the
globalization [#sec:globalization], nothing below depends on this
section.


**Definition (Maximal ideal, classical jets, completion).** {#def:classical-jets}
Define:

- $\mathfrak m_x := \set{f \in \mathcal E(X) : f(x) = 0}$, the
  *maximal ideal* of $x$;
- $\mathcal E_k(X, x) := \mathcal E(X) / \mathfrak m_x^{k+1}$, the
  *classical $k$-jet space* at $x$; the class $[f]_k$ of $f$ is its
  *classical $k$-jet*, traditionally written $j^k_x f$;
- $\hat{\mathcal E}(X, x) := \varprojlim_k\, \mathcal E_k(X, x)$, the
  *completion* of the functions at $x$, with the hat map
  $f \mapsto \hat f := ([f]_k)_{k \geq 0}$ and the projective limit
  topology.


**Remark.**
Over arbitrary functions the vanishing ideal is idempotent and the
quotient construction collapses [#prop:no-quotient]. Over smooth
functions the powers $\mathfrak m_x^{k+1}$ filter strictly, and the
classical construction proceeds: the discrete jet is a prolongation,
the classical jet a quotient, and the realization theorem below is the
bridge on the smooth column.


**Proposition (Formal functoriality).** {#prop:formal-functoriality}
For smooth $\phi: X \to Y$ with $\phi(x) = y$, the pullback
$\phi^* f = f \circ \phi$ satisfies
$\phi^*\, \mathfrak m_y \subseteq \mathfrak m_x$ and
$\phi^*\, \mathfrak m_y^{k+1} \subseteq \mathfrak m_x^{k+1}$: it
descends to algebra morphisms
$\mathcal E_k(Y, y) \to \mathcal E_k(X, x)$ and
$\hat\phi^*: \hat{\mathcal E}(Y, y) \to \hat{\mathcal E}(X, x)$, with,
for smooth $\psi: Y \to Z$,

$$
   \widehat{f \circ \phi} = \hat\phi^*\, \hat f,
   \qquad
   \widehat{(\psi \circ \phi)}^{\,*} = \hat\phi^* \circ \hat\psi^*.
$$


**Proof.**
$f(y) = 0$ implies $f(\phi(x)) = 0$, and $\phi^*$ is multiplicative,
so the ideal containments hold and the quotient maps exist;
functoriality is that of $\phi^*$.


**Theorem (Taylor realization).** {#thm:taylor-realization}
For each $k$, the jet map
$j(-;\, x): \mathcal E(X) \to ST^{\leq k}(X, x)$ [#def:jets] is an
algebra morphism onto $ST^{\leq k}(X, x)$ with kernel
$\mathfrak m_x^{k+1}$; it descends to an isomorphism of algebras

$$
   \mathcal E_k(X, x) \;\xrightarrow{\;\sim\;}\; ST^{\leq k}(X, x),
   \qquad
   [f]_k \longmapsto j(f;\, x).
$$


**Proof.**
Multiplicativity is the smooth clause of the Leibniz theorem
[#thm:leibniz], and surjectivity is the jet realization
[#lem:jet-realization] on the smooth polynomials $p_\alpha$. The
kernel consists of the functions flat to order $k$ at $x$: all
derivatives of order $\leq k$ vanish. Flatness is a differential
condition, membership in $\mathfrak m_x^{k+1}$ an algebraic one; the
two inclusions need separate arguments.
$\mathfrak m_x^{k+1} \subseteq \ker j(-;\, x)$: a derivative of order
$\leq k$ of a product of $k+1$ functions vanishing at $x$ leaves, in
each Leibniz term, at least one factor undifferentiated.
$\ker j(-;\, x) \subseteq \mathfrak m_x^{k+1}$ is Hadamard's lemma
iterated: by Taylor's formula with integral remainder, a smooth
function flat to order $k$ at $x$ is a sum of products of $k+1$
coordinate functions centered at $x$ with smooth coefficients, hence
lies in $\mathfrak m_x^{k+1}$ [@nestruev2020smooth]. This step uses
smoothness and the finite dimension of $X$.


**Corollary (Realization of the completion).** {#cor:completion-realization}
The stagewise isomorphisms assemble to an isomorphism of algebras

$$
   \mathcal J_x:\hat{\mathcal E}(X, x)
   \;\xrightarrow{\;\sim\;}\; ST^*(X, x),
   \qquad
   a = (a_k)_{k \geq 0}
   \longmapsto \bigl(j_k(a_k)\bigr)_{k \geq 0},
$$

where $j_k$ is the stage-$k$ Taylor realization
[#thm:taylor-realization]. Under this isomorphism the formal pullback
becomes the operator: for smooth $\phi$,

$$
   \mathcal J_x \circ \hat\phi^* \circ \mathcal J_y^{-1}
   = D^+(\phi;\, x)
   \;:\; ST^*(Y, y) \lra ST^*(X, x).
$$


**Proof.**
The isomorphisms [#thm:taylor-realization] commute with the quotient
maps $\mathcal E_{k+1}(X, x) \to \mathcal E_k(X, x)$ and the degree
truncations, so they induce an isomorphism of the limits
[#def:symmetric-cotangent]. The pullback identity is the differential
clause of jet naturality at every finite stage: if $a_k=[f]_k$, then
$j_k(\phi_k^*a_k)=j(f\circ\phi;\,x)
=D^+(\phi;\,x)j(f;\,y)$, truncated in degree $k$
[#thm:cubical-jet-pullback]. These identities are compatible with
truncation, so they pass to the inverse limit. No single smooth lift
of an arbitrary element $a\in\hat{\mathcal E}(Y,y)$ is used.


**Proposition (Duality with point distributions).** {#prop:completion-duality}
Let $a=(a_k)_{k\geq0}\in\hat{\mathcal E}(X,x)$. If
$u\in\mathcal E'(X,x)$ has order at most $k$, choose any representative
$f_k$ of $a_k$ and set $\langle a,u\rangle:=u(f_k)$. This is
independent of $k$, of the representative, and of any choice of a
global smooth lift, and it induces an isomorphism
$\mathcal E'(X, x) \xrightarrow{\sim} \hat{\mathcal E}(X, x)'$. Under
the realizations [#cor:completion-realization],
[#thm:schwartz-structure], it is the permanent pairing:

$$
   \langle a,\, \delta(x;\, \xi) \rangle
   = \langle \mathcal J_x(a),\, \xi \rangle,
   \qquad \xi \in ST_{\leq k}(X, x).
$$

In particular, if $a=\hat f$ for a smooth function $f$, this value is
$D(f;\,x;\,\xi)=\langle j(f;\,x),\xi\rangle$.


**Proof.**
Well-definedness: a point-supported distribution has finite order, and
if $u$ has order $\leq k$ it vanishes on $\mathfrak m_x^{k+1}$: such
functions are flat to order $k$ at $x$ [#thm:taylor-realization], and
flat functions are $C^k$-approximable by functions vanishing near $x$
[@hormander1983analysis], Theorem 2.3.3; so $u$ factors through
$\mathcal E_k(X, x)$. Compatibility of the stages makes the value
independent of every larger $k$. Injectivity: if $u \neq 0$ then
$u(f) \neq 0$
for some $f$. Surjectivity: a continuous functional on the projective
limit factors through a finite stage; composing with the quotient map
gives a distribution that vanishes on $\mathfrak m_x^{k+1}$, hence is
supported in $\set{x}$, since a function vanishing near $x$ lies in
every power of $\mathfrak m_x$, and has order $\leq k$. The pairing
identity is the definition of the point distribution
[#def:point-distributions] together with the jet pairing
[#lem:jet-pairing].


**Remark (The two interpretations).**

$$
   ST_{\leq k}(X, x) \isom \mathcal E'(X, x)_{\leq k},
   \qquad
   \mathcal E_k(X, x) \isom ST^{\leq k}(X, x):
$$

the covariant calculus is realized on point-supported distributions,
with $D_+$ their pushforward [#thm:distribution-pushforward]; the
contravariant calculus is realized on classes of smooth functions,
with $D^+$ the formal pullback [#cor:completion-realization]. The
permanent pairing between $ST_*$ and $ST^*$ realizes the evaluation
$u(f)$ on both sides [#prop:completion-duality].

### Globalization {#sec:globalization}

The classical spaces globalize. On a smooth finite-dimensional
manifold both fibers have chart-free definitions, so the bundles can
be named before any gluing: the function classes form the jet bundle,
the point distributions its dual, the operators are pullback of
functions and pushforward of distributions, and the cocycle condition
for the chart trivializations is smooth functoriality itself
[#cor:smooth-functoriality]. The one point requiring care is what the
bundles are not: chartwise every fiber is $\SYM_{\leq k}$ of a
tangent space, but the gluing is the full pushforward of the
transitions, not the symmetric power of their differentials, and the
glued bundle is not the symmetric algebra of the tangent bundle
[#rem:not-symmetric-algebra]. Throughout this section, $M$, $N$ are
smooth finite-dimensional manifolds.


**Definition (Manifold jets and point probes).** {#def:manifold-probes}
For $p \in M$ set

$$
   ST^{\leq k}(M, p) := \mathcal E_k(M, p)
   = \mathcal E(M)/\mathfrak m_p^{k+1},
   \qquad
   ST_{\leq k}(M, p) := \mathcal E'(M, p)_{\leq k},
$$

with $\mathfrak m_p$ and $\mathcal E_k(M, p)$ as in
[#def:classical-jets] and $\mathcal E'(M, p)_{\leq k}$ the continuous
functionals on $\mathcal E(M)$ supported in $\set{p}$ of order
$\leq k$. Write $ST^{\leq k} M$ and $ST_{\leq k} M$ for the disjoint
unions fibered over $M$, and $j(f;\, p) := [f]_k$ for the jet of an
observable.


**Proposition (Globalization).** {#prop:globalization}

1.  Every chart $\varphi: U \to \IR^n$ at $p$ identifies the fibers
    with the affine models,

    $$
    ST^{\leq k}(M, p) \isom ST^{\leq k}(\IR^n,\, \varphi(p)),
    \qquad
    ST_{\leq k}(M, p) \isom ST_{\leq k}(\IR^n,\, \varphi(p)),
    $$

    by transfer of germs along $\varphi$ followed by the realizations
    [#thm:taylor-realization], [#thm:schwartz-structure]. Two charts
    differ by $D^+(\tau;\, x)$ and $D_+(\tau;\, x)$ of the transition
    $\tau$, whose components are the derivatives of $\tau$; the
    identifications therefore make $ST^{\leq k} M$ and $ST_{\leq k} M$
    smooth vector bundles. The multiplication of classes, the
    coproduct, and the pairing $\langle [f]_k,\, u \rangle = u(f)$
    are chart-free, and the identifications carry them to the model
    structures.

2.  For smooth $\Phi: M \to N$ and $q := \Phi(p)$, pullback of
    functions and pushforward of distributions,

    $$
    D^+(\Phi;\, p)\, [f]_k := [f \circ \Phi]_k,
    \qquad
    D_+(\Phi;\, p)\, u := \Phi_* u = u(\,\cdot \circ \Phi),
    $$

    are bundle morphisms, mutually adjoint under the pairing, and
    functorial by composition:
    $D_+(\Psi \circ \Phi) = D_+(\Psi) \circ D_+(\Phi)$,
    $D_+(\id_M) = \id$. In charts they are $D^+$ and $D_+$ of the
    chart representative of $\Phi$ [#cor:completion-realization],
    [#thm:distribution-pushforward].

3.  For smooth $f: M \to \IR$, the jet $p \mapsto j(f;\, p)$ is a
    smooth section of $ST^{\leq k} M$, and naturality is tautological:
    $j(f \circ \Phi;\, p) = D^+(\Phi;\, p)\, j(f;\, q)$.


**Proof.**
1) A function vanishing near the base point lies in every power of
the maximal ideal, so both quotients depend only on germs; with a
cutoff, every germ transfers along $\varphi$, and composition with
$\varphi$ descends to an isomorphism of the quotients. Point-supported
functionals transfer by $\varphi_*$ for the same reason. On an
overlap the composite identification is precomposition with the
transition $\tau$, respectively $\tau_*$, which the realizations
convert to $D^+(\tau;\, x)$ [#cor:completion-realization] and
$D_+(\tau;\, x)$ [#thm:distribution-pushforward]; the components are
the derivatives $D(\tau;\, x;\, v^A)$, $|A| \leq k$
[#def:symmetric-pushforward], smooth in $x$, and the cocycle
condition is smooth functoriality [#cor:smooth-functoriality].
2) Well-definedness: $\mathfrak m_q \circ \Phi \subseteq
\mathfrak m_p$ gives $f \circ \Phi \in \mathfrak m_p^{k+1}$ for
$f \in \mathfrak m_q^{k+1}$, so the pullback descends; dually,
$\Phi_* u$ is supported in $\set{q}$ and kills
$\mathfrak m_q^{k+1}$, hence has order $\leq k$
[#prop:completion-duality]. Adjointness is
$\langle [f]_k,\, \Phi_* u \rangle = u(f \circ \Phi) =
\langle [f \circ \Phi]_k,\, u \rangle$, and functoriality is
associativity of composition. In charts, the pullback is the formal
pullback of the representative and the pushforward its adjoint, which
are $D^+$ and $D_+$ by the citations. 3) In a chart the section has
components the derivatives of $f \circ \varphi^{-1}$, smooth in the
base point; naturality is the definition of the pullback in clause 2.


**Remark (The classical bundles).** {#rem:jet-bundle}
$ST^{\leq k} M$ is the classical bundle of $k$-jets of functions
[@Ehresmann1951] [@Saunders1989], with $D^+(\Phi)$ its jet pullback.
Its full (augmented) dual is $ST_{\leq k}M$: a smooth field
$p\mapsto u_p$ of point distributions is a linear differential operator
of order $\leq k$ on $M$,
$(Lf)(p)=\langle j(f;\,p),u_p\rangle$. Evaluation on constants defines
the counit $\epsilon(u_p):=u_p(1)$. The higher-order tangent bundle of
Pohl [@Pohl1962] [@kolar1993natural] is the subbundle

$$
   T^{(k)}M := \ker\bigl(\epsilon:ST_{\leq k}M\to M\times\IR\bigr),
$$

whose sections are precisely the differential operators of order
$\leq k$ that annihilate constants. At $k=2$ this is the second-order
tangent bundle of stochastic analysis, and $D_+(\Phi)$ preserves the
counit and restricts to the Schwartz morphism transporting second-order
tangent vectors [@Emery1989].


**Remark (Not the symmetric algebra of the tangent bundle).** {#rem:not-symmetric-algebra}
The symmetric algebra bundle $\SYM_{\leq k}(TM)$, glued by the
symmetric powers $\SYM(D(\tau;\, x))$ of the transition
differentials, is a different vector bundle. The transition of
$ST_{\leq k} M$ is the full pushforward $D_+(\tau;\, x)$: its
degree-preserving component is $\SYM(D(\tau;\, x))$, the
all-singletons term of the partition sum, while its degree-lowering
components carry the higher derivatives of $\tau$
[#def:symmetric-pushforward]. Since the partition sum only lowers
degree, $D_+(\tau)$ preserves the degree filtration but not the
grading: $ST_{\leq k} M$ is a filtered bundle with associated graded
$\SYM_{\leq k}(TM)$, and dually the jet bundle is filtered by order,
with graded pieces $\mathfrak m_p^r/\mathfrak m_p^{r+1} \isom$ the
symmetric powers of the cotangent space. The grading does not glue;
choosing a connection splits the filtration, which is the mechanism
by which covariant derivatives assemble higher jets. The top
filtration quotient is natural, and for a field of point
distributions it is the principal symbol of the corresponding
differential operator: tensoriality of the classical symbol is
naturality of the top graded piece.


**Remark (The Banach case and the affine layer).** {#rem:banach-globalization}
On general Banach manifolds the quotient-by-powers and
point-distribution realizations above are not available without
additional hypotheses. The symmetric spaces nevertheless glue
directly by their transition operators: chart pairs $(\varphi, \xi)$
modulo
$(\varphi,\, \xi) \sim (\psi,\, D_+(\tau;\, \varphi(p))\, \xi)$, and
dually for forms, define the bundles directly, with smooth
functoriality [#cor:smooth-functoriality] as the cocycle condition
and $D_+$ natural by the same conjugation. The exact discrete layer
does not globalize even there: cubes take their legs in the model
space and $\lambda_t$ uses its linear structure, so $\Delta_+$ and
the family $Q_*(t)$ are chart objects. Their boundary is intrinsic:
tangent cubes glue along $Q^0_k(\tau)$ of the transitions, by
zero-fiber functoriality [#thm:zero-fiber-functoriality], into the
fibers of the iterated tangent bundle $T^k M$
[#prop:iterated-tangent], and the symbol intertwining transports this
gluing to the symmetric layer [#thm:intertwining]. The deformation is
a chart construction whose $t = 0$ fiber is intrinsic, the situation
familiar from deformation to the normal cone [#rem:tangent-groupoid].

### The ladder, assembled {#sec:ladder}

The discrete, quotient, zero, and smooth jets each have a pullback and a
product. Three comparison maps relate adjacent rungs. The following
panorama collects these identities; every statement has been proved above.

$$
   j^\Delta(f;\, x)
   \;\xleftarrow{\;\, t = 1 \,\;}\;
   qj(f;\, x;\, t)
   \;\xrightarrow{\;\, t \downarrow 0 \,\;}\;
   qj^0(f;\, x)
   \;\xleftarrow{\;\, \sigma^* \,\;}\;
   j(f;\, x).
$$

- *Evaluations.* At $t = 1$ the quotient rung is the discrete rung,
  $qj(f;\, x;\, 1) = j^\Delta(f;\, x)$ and
  $Q_*(\phi;\, x;\, 1) = \Delta_+(\phi;\, x)$ [#prop:deformation].
  As $t \downarrow 0$ it converges gradewise to the zero fiber,
  $qj_k \to (\sigma^*\, j(f;\, x))_k$ and
  $Q_k \to Q^0_k(\phi;\, x) = T^k\phi\,|_x$
  [#thm:boundary-extension], [#thm:zero-jet-symbol],
  [#prop:iterated-tangent]; for $C^{k+M}$ observables the approach
  is a Taylor expansion in $t$, its coefficients the higher-symbol
  pairings [#thm:curved-collapse].
- *Naturality.* Each rung is natural for its own pullback:
  $\Delta^+$, $Q^*(\cdot;\, t)$, precomposition with $Q^0_*$, and
  $D^+$ [#thm:cubical-jet-pullback],
  [#cor:zero-fiber-jet-naturality].
- *Multiplicativity.* Each rung is multiplicative for its product:
  $\cstar$, $\star_t$, $\pstar$, and the truncated symmetric product
  [#thm:leibniz]; the pointwise product on $CT^*$ [#def:cocubes]
  remains distinct from these convolution products.
- *Comparisons.* The symbol pullback is a unital algebra morphism
  [#prop:symbol-pullback-algebra] and intertwines the smooth and
  zero-fiber pullbacks [#prop:symbol-pullback-intertwining]. The
  evaluations restrict the quotient squares and product rules to the
  discrete ones at $t = 1$ and, by the uniform convergence of
  [#thm:boundary-extension], give the zero-fiber identities as
  $t \downarrow 0$. The $\sigma^*$ identities identify the smooth
  pullback and product with their zero-fiber counterparts.


**Remark (Per-leg jet).** {#def:per-leg-jet}
The ladder has an anisotropic variant. For
$\mathbf t = (t_1, \dots, t_k) \in (0,1]^k$, the *per-leg jet*
(overloaded, selected by argument type) is

$$
   qj_k(f; x;\, \mathbf t;\, c)
   := \frac{1}{t_1 \cdots t_k}\, \Delta(f;\, x;\, \lambda_{\mathbf t}\, c),
   \qquad
   \text{on affine cubes: }\;
   \frac{1}{t_1 \cdots t_k}\, \Delta(f;\, x;\, t_1 v_1, \dots, t_k v_k).
$$

It refines the family off the diagonal. As with the anisotropic
rescaling [#def:rescaling], this is recorded as an export for the
quantitative companion and receives no theory in this paper.

## Exhibits {#sec:exhibits}

Each exhibit follows a concrete
object through the deformation, from the exact finite fiber through
the family to the zero fiber and its symbol; we call such a path an
*orbit*. The propositions proved along the way are chapter-local
tools; the body does not depend on them.

### An order-two cube through the deformation {#ex:cube-journey}

Fix an arbitrary map $\phi: X \to Y$ with $y = \phi(x)$ and
directions $v_1, v_2 \in E$. At order two, the deformation, its
collapse, and the symbol can all be written out on the single orbit

$$
   c(t) := Q_2(\phi;\, x;\, t;\, \Aff(v_1, v_2)),
   \qquad t \in (0, 1],
$$

with coordinates [#def:q-family]

$$
   c_1(t) = \frac{1}{t}\, \Delta(\phi;\, x;\, t v_1),
   \qquad
   c_2(t) = \frac{1}{t}\, \Delta(\phi;\, x;\, t v_2),
   \qquad
   c_{12}(t) = \frac{1}{t^2}\, \Delta(\phi;\, x;\, t v_1, t v_2).
$$

*The exact fiber.* At $t = 1$ the orbit is the cubical pushforward,
$c(1) = \Delta_+(\phi;\, x)\, \Aff(v_1, v_2)$: the vertexwise image
of the parallelogram with vertices $x$, $x + v_1$, $x + v_2$,
$x + v_1 + v_2$, re-read in Möbius coordinates [#lem:coordinates].
The legs are the image increments, and the defect
$c_{12}(1) = \phi(x + v_1 + v_2) - \phi(x + v_1) - \phi(x + v_2)
+ \phi(x)$ measures the failure of the four image points to close a
parallelogram: an arbitrary map does not preserve affinity, and the
pushforward records this failure without any regularity assumption.
For every $t>0$, conjugation by $\lambda_t$ identifies this fiber with
the fiber at $t=1$ [#prop:deformation]. The new fiber is therefore the
boundary value at $t=0$.

*The five covers.* Pair an observable $f: Y \to \IR$ against the
orbit. Jet naturality [#thm:cubical-jet-pullback] and affine
reconstruction [#prop:reconstruction] expand the composite quotient
over the five covers of $[2]$:

$$
   \frac{1}{t^2}\, \Delta(f \circ \phi;\, x;\, t v_1, t v_2)
   = \frac{1}{t^2}\, \Delta(f;\, y;\, \lambda_t\, c(t))
   = \frac{1}{t^2} \sum_{H \in \Cov(2)}
     \Delta\bigl(f;\, y;\, (t^{|A|}\, c_A(t))_{A \in H}\bigr),
$$

five cover terms at finite scale, against two partition terms in the
smooth formula. For $\phi$ that is $C^2$ near $x$, the orbit $c(t)$ is
bounded as $t \downarrow 0$ [#thm:boundary-extension]. If $f$ is $C^3$
near $y$, the iterated fundamental theorem [#lem:ftc] bounds each cover
term by $O(t^{\wt(H)})$:

| cover | $\wt(H)$ | bound | role |
|---|---|---|---|
| $\set{\set{1}, \set{2}}$ | 2 | $O(t^2)$ | principal partition term |
| $\set{\set{1,2}}$ | 2 | $O(t^2)$ | principal partition term |
| $\set{\set{1}, \set{1,2}}$ | 3 | $O(t^3)$ | first correction |
| $\set{\set{2}, \set{1,2}}$ | 3 | $O(t^3)$ | first correction |
| $\set{\set{1}, \set{2}, \set{1,2}}$ | 4 | $O(t^4)$ | higher error |

After division by $t^2$, the two partitions are exactly the covers
of weight two [#lem:weight-bound], and every other cover has
positive excess weight.

*The boundary.* Now let $\phi$ be $C^2$ near $x$. Boundary extension
[#thm:boundary-extension] closes the orbit at $t = 0$:

$$
   c_1(t) \to D(\phi;\, x;\, v_1),
   \qquad
   c_2(t) \to D(\phi;\, x;\, v_2),
   \qquad
   c_{12}(t) \to D(\phi;\, x;\, v_1, v_2),
$$

so $c(t) \to c^0 := Q^0_2(\phi;\, x;\, \Aff(v_1, v_2))$, the cube
with the first derivatives as legs and the second derivative as
defect. For $f$ that is $C^2$ near $y$, the three excess covers
are $O(t^3)$: part 1 of [#cor:asymptotics] gives this bound for the
two-block covers; for the three-block cover, part 2 gives it by choosing
the leg $t^2 c_{12}(t)$ and one of the legs $t c_i(t)$. Thus all three
terms vanish after division by $t^2$, and the expansion collapses onto
the partitions. This boundary conclusion requires only $C^2$ regularity
of $f$, although the table's $O(t^4)$ bound requires $C^3$:

$$
   \lim_{t \downarrow 0}\, \frac{1}{t^2}\,
   \Delta(f \circ \phi;\, x;\, t v_1, t v_2)
   = D(f;\, y;\, c^0_1\, c^0_2) + D(f;\, y;\, c^0_{12}).
$$

*The symbol.* The two partition terms assemble in the symmetric algebra:
with $\sigma_2(c^0) = c^0_1\, c^0_2 + c^0_{12}$ [#def:symbol],

$$
   \sigma_2(c^0)
   = D(\phi;\, x;\, v_1) \cdot D(\phi;\, x;\, v_2)
   + D(\phi;\, x;\, v_1 v_2)
   = D_+(\phi;\, x;\, v_1 v_2)
$$

[#def:symmetric-pushforward]: the intertwining [#thm:intertwining]
at order two. The limit identity above is the partition Faà di Bruno
formula [#cor:partition-fdb],

$$
   D(f \circ \phi;\, x;\, v_1 v_2)
   = D(f;\, y;\, D(\phi;\, x;\, v_1) \cdot D(\phi;\, x;\, v_2))
   + D(f;\, y;\, D(\phi;\, x;\, v_1 v_2)).
$$

*The lower-degree correction.* The Möbius defect begins as the
failure of the image parallelogram to close and ends as
$D(\phi;\, x;\, v_1, v_2)$, the degree-one summand of
$D_+(\phi;\, x;\, v_1 v_2)$; paired with $D(f;\, y)$, it is the
lower-degree term of the second-order chain rule. The Laplace
exhibit shows how the inverse pushforward turns exactly these
lower-degree terms into the Christoffel correction of a coordinate
formula [#ex:laplace].

### Inverse pushforward {#ex:inverse}

Pushing point operators through coordinate changes, as in the Laplace
exhibit below, calls for the inverse of a pushforward.
Individually, the formulas for inverse derivatives form a recursive
hierarchy. The operator $D_+(\phi;x)$ packages them into one triangular
linear map. After its degree-preserving part is split off, inversion is a
finite Neumann sum whose coefficients depend on the inverse first
derivative and the higher derivatives of $\phi$. For a linear map $B:E\to F$,
$\SYM^r(B): \SYM^r(E) \to \SYM^r(F)$ denotes the induced map on
symmetric powers, $v_1 \cdots v_r \mapsto (B v_1) \cdots (B v_r)$,
and $\SYM(B) := \Vsum_r \SYM^r(B)$.


**Proposition (Inverse pushforward).** {#prop:inverse-pushforward}
Let $\phi$ be $C^k$ near $x$ with invertible differential
$D(\phi;\, x): E \to F$. Split the pushforward by partition type,

$$
   D_+(\phi;\, x) = S + N,
   \qquad
   S := \Vsum_{r=0}^{k} \SYM^r(D(\phi;\, x)),
$$

where $S$ collects the singleton partitions and $N$ the partitions
containing a block of size at least two. Then $S^{-1} N$ is
nilpotent, $D_+(\phi;\, x)$ is invertible on
$ST_{\leq k}(X, x)$, and

$$
   D_+(\phi;\, x)^{-1}
   = \Big( \sum_{m=0}^{k-1} (-\, S^{-1} N)^m \Big)\, S^{-1},
   \qquad
   S^{-1} = \Vsum_{r=0}^{k} \SYM^r(D(\phi;\, x)^{-1}).
$$

By the Banach inverse function theorem, $\phi$ has a $C^k$ local inverse
$\psi$ near $y=\phi(x)$, and
$D_+(\psi;\, y) = D_+(\phi;\, x)^{-1}$.


**Proof.**
A partition of $[r]$ with a block of size at least two has at most
$r - 1$ blocks, so its term in [#def:symmetric-pushforward] lands in
degree $\leq r - 1$: $N$ strictly lowers the degree and vanishes in
degrees $\leq 1$, while $S$ is degreewise invertible with the stated
inverse. Hence $S^{-1} N$ strictly lowers the degree,
$(S^{-1} N)^k = 0$ on $ST_{\leq k}(X, x)$, and the finite geometric
sum inverts $1 + S^{-1} N$; then
$D_+(\phi;\, x) = S\, (1 + S^{-1} N)$ is invertible with the stated
sum. No smallness enters. For the last claim, apply functoriality
[#cor:smooth-functoriality] to $\psi \circ \phi = \id$ and
$\phi \circ \psi = \id$.


In degree two, the degree-one component of the inverse formula gives
$D(\phi^{-1};\, y;\, w_1, w_2) = -A\, D(\phi;\, x;\, A w_1, A w_2)$,
where $A := D(\phi;\, x)^{-1}$.


**Remark (Inverse differencing).** {#rem:inverse-differencing}
For comparison, let $k \geq 1$. The cubical pushforward
$\Delta_+(\phi;\, x): CT_k(X, x) \to CT_k(Y, y)$ is bijective if and
only if $\phi$ is bijective. In that case

$$
   \Delta_+(\phi;\, x)^{-1}
   = \Delta_+(\phi^{-1};\, y)
   = \mu_x \circ (\phi^{-1})_* \circ \zeta_y.
$$

This follows directly from the conjugation in [#def:pushforward]. If
$d = \Delta_+(\phi;\, x)\, c$, the source vertices are recovered by
$\zeta_x(c)_T = \phi^{-1}(\zeta_y(d)_T)$.


**Remark.**
Expanded, the Neumann sum is the tree expansion of the classical
inverse Faà di Bruno formula; in the Hopf-algebraic setting this
unipotent inversion is performed by the antipode [@FM2014].


*Through the deformation.* The Neumann-sum derivation uses only the
invertibility of the differential and does not require constructing the
local inverse $\psi$ supplied by the Banach inverse function theorem.
Exact functoriality [#prop:deformation] applied to
$\psi\circ\phi=\id$ and $\phi\circ\psi=\id$ gives, for $t\in(0,1]$
and wherever the operators are defined,

$$
   Q_k(\psi;\, y;\, t) = Q_k(\phi;\, x;\, t)^{-1},
$$

zero-fiber functoriality [#thm:zero-fiber-functoriality] gives the boundary
identity

$$
   Q^0_k(\psi;\, y) = Q^0_k(\phi;\, x)^{-1},
$$

and under the symbol this is
$D_+(\psi;\, y) = D_+(\phi;\, x)^{-1}$. Thus finite-scale inversion,
zero-fiber inversion, and the Neumann formula give the same operator. The
Neumann formula can therefore be evaluated without constructing or
invoking the local inverse map.

### Finite stencils and the Laplace--Beltrami boundary {#ex:laplace}

The finite difference stencil and the coordinate expression of the
Laplace--Beltrami operator are the two ends of one orbit of the
deformation: the stencil transports exactly through a chart at
every mesh width, and the differential operator is its boundary
value under the symbol.

*The finite object.* The mesh-$t$ Laplace stencil at $y \in \IR^n$,

$$
   L_t(f) := \sum_{a=1}^{n}
   \bigl( f(y + t e_a) - 2 f(y) + f(y - t e_a) \bigr)
   = -\sum_{a=1}^{n} \Delta(f;\, y;\, t e_a,\, -t e_a),
$$

is the pairing of $f$ against $n$ affine cubes of order two; for
$n = 2$ it is the classical five-point stencil. Its differential
counterpart is the Laplace probe
$L := \sum_a e_a e_a \in ST_2(\IR^n, y)$, representing
$\sum_a \del_a^2$.

*Transport at finite scale.* Let $\phi: U \to \IR^n$ be a chart
near $x$: a $C^2$ diffeomorphism onto an open set
$V \subseteq \IR^n$, with inverse $\psi := \phi^{-1}$ and
$y := \phi(x)$. Transport the stencil cubes through the deformed
pushforward of $\psi$,

$$
   c^a(t) := Q_2(\psi;\, y;\, t;\, \Aff(e_a,\, -e_a))
   \;\in\; CT_2(U, x).
$$

The legs of $\lambda_t\, c^a(t)$ are the chart coordinates of the
stencil points, $\psi(y \pm t e_a) - x$, and its Möbius defect is
the negative of their sum, since the geometric top vertex returns
to $\psi(y) = x$. The transported stencil is exact for every $t$
with $y \pm t e_a \in V$: by the discrete adjunction
[#thm:adjunction] and exact functoriality [#thm:functoriality]
applied to $\phi \circ \psi = \id$,

$$
   -\sum_{a=1}^{n} \Delta(\phi^* f;\, x;\, \lambda_t\, c^a(t))
   = L_t(f).
$$

*The boundary.* Boundary extension [#thm:boundary-extension]
applies to $\psi$: the transported cubes converge,
$c^a(t) \to c^{a,0} := Q^0_2(\psi;\, y;\, \Aff(e_a, -e_a))$, with
legs $\pm A e_a$ for $A := D(\psi;\, y) = D(\phi;\, x)^{-1}$ and
defect $-D(\psi;\, y;\, e_a, e_a)$. The normalized stencil is a
quotient jet along the moving cubes,
$t^{-2} L_t(f) = -\sum_a qj_2(\phi^* f;\, x;\, t;\, c^a(t))$, and
for $f$ that is $C^2$ near $y$ the uniform convergence on bounded
cube sets [#thm:boundary-extension], with the zero jet identified
in [#thm:zero-jet-symbol], gives the boundary value

$$
   t^{-2}\, L_t(f)
   \;\xrightarrow[t \downarrow 0]{}\;
   -\sum_{a=1}^{n} D(\phi^* f;\, x;\, \sigma_2(c^{a,0}))
   = D(\phi^* f;\, x;\, \hat L).
$$

By the symbol intertwining [#thm:intertwining], with
$\sigma_2(\Aff(e_a, -e_a)) = -\, e_a e_a$,

$$
   \hat L
   := -\sum_{a=1}^{n} \sigma_2(c^{a,0})
   = -\sum_{a=1}^{n} D_+(\psi;\, y;\, -\, e_a e_a)
   = D_+(\psi;\, y)\, L
   = D_+(\phi;\, x)^{-1} L,
$$

the last equality by [#prop:inverse-pushforward]: the exact curved
stencil collapses onto the pairing with the inverse-pushforward
image of the Laplace probe.

*The chart expression.* The probe $\hat L = D_+(\phi;\, x)^{-1} L$
can be computed directly from the derivatives of $\phi$ whenever the
differential is invertible, without constructing the local inverse.
Write $D := D(\phi;\, x)$ and
$A := D^{-1}$; indices $i, j, l$ refer to the chart basis and $a$
to the Cartesian basis. With $D_+(\phi;\, x) = S + N$ as in
[#prop:inverse-pushforward] and $S^{-1} = \SYM(A)$, the Neumann
sum stops after one correction on the degree-two probe:

$$
   \hat L = \SYM(A)\, L - \SYM(A)\, N\, \SYM(A)\, L.
$$

For the quadratic term, $\SYM(A)$ is the algebra map induced by
$A$, so it takes the Cartesian sum of squares to

$$
   \SYM(A)\, L = \sum_a (A e_a)(A e_a)
   =: \sum_{i,j} g^{ij}\, e_i e_j,
$$

the coefficients forming the inverse metric. For the linear
correction, $N$ retains the one-block partition on a quadratic
monomial, $N(e_i e_j) = D(\phi;\, x;\, e_i, e_j)$; with
$\Gamma^l_{ij}$ defined by the first identity,

$$
   A\, D(\phi;\, x;\, e_i, e_j) =: \sum_l \Gamma^l_{ij}\, e_l,
   \qquad
   \SYM(A)\, N\, \SYM(A)\, L
   = \sum_{i,j,l} g^{ij}\, \Gamma^l_{ij}\, e_l.
$$


**Proposition (Laplace pushforward).** {#prop:laplace-pushforward}
Let $\phi: U \to \IR^n$ be $C^2$ near $x$ with invertible
differential $D(\phi;\, x)$. With $g^{ij}$ and $\Gamma^l_{ij}$
defined above, let $F$ be $C^2$ near $y = \phi(x)$ and
$G := F \circ \phi$. Then

$$
   \sum_a \del_a^2\, F(y)
   = \sum_{i,j} g^{ij}
     \Bigl( \del_i \del_j - \sum_l \Gamma^l_{ij}\, \del_l \Bigr)
     G(x).
$$


**Proof.**
The two displayed terms give
$\hat L = \sum_{i,j} g^{ij} e_i e_j
- \sum_{i,j,l} g^{ij} \Gamma^l_{ij} e_l$ with
$D_+(\phi;\, x)\, \hat L = L$. By the smooth adjunction
[#thm:smooth-adjunction],
$D(G;\, x;\, \hat L) = D(F;\, y;\, D_+(\phi;\, x)\, \hat L)
= D(F;\, y;\, L)$, which is the display written out in
coordinates.


**Remark (Classical identification).**
With the notation above,
$(g^{ij}) = A A^{\mathsf T} = (D^{\mathsf T} D)^{-1}$: the inverse
of the pullback metric. The coefficients $\Gamma^l_{ij}$ are its
Christoffel symbols, and the proposition is the coordinate
expression of the Laplace--Beltrami operator
[@KobayashiNomizu1963].


**Corollary (Polar coordinates).** {#ex:polar-laplacian}
Let $I \subset \IR$ be an open interval of length less than $2\pi$
and set $U := (0, \infty) \times I$. For
$\phi(r, \theta) = (r \cos\theta,\, r \sin\theta)$ and $f$ that is
$C^2$ near $y$,

$$
   \hat L = e_r e_r + \frac1r\, e_r + \frac1{r^2}\, e_\theta e_\theta,
   \qquad
   \Bigl(\del_r^2 + \frac1r\, \del_r + \frac1{r^2}\, \del_\theta^2\Bigr)
   (f \circ \phi)(x) = (\del_1^2 + \del_2^2) f(y).
$$


**Proof.**
Direct differentiation gives

$$
   D(\phi;\, x) =
   \begin{pmatrix}
      \cos\theta & -r \sin\theta\\
      \sin\theta & r \cos\theta
   \end{pmatrix},
   \qquad
   A =
   \begin{pmatrix}
      \cos\theta & \sin\theta\\
      -\sin\theta/r & \cos\theta/r
   \end{pmatrix}.
$$

The two terms required by the general calculation are

$$
   \sum_a (A e_a)(A e_a) = e_r e_r + \frac1{r^2}\, e_\theta e_\theta,
   \qquad
   A\, D(\phi;\, x;\, e_\theta, e_\theta) = -r\, e_r.
$$

The mixed entry
$D(\phi;\, x;\, e_r, e_\theta) = (-\sin\theta, \cos\theta)$ is
nonzero, but $g^{r\theta} = 0$, so it does not enter the
contraction. The remaining diagonal term
$D(\phi;\, x;\, e_r, e_r)$ vanishes. Hence $g^{rr} = 1$,
$g^{\theta\theta} = r^{-2}$, and $\Gamma^r_{\theta\theta} = -r$.
The inverse-pushforward formula gives the stated probe.


*The exact polar stencil.* For the polar chart, the transport
identity above is an exact polar five-point stencil at every mesh
width, and the collapse identifies its parts: the rescaled Möbius
defects converge to $-D(\psi;\, y;\, e_a, e_a)$ and supply, through
the sign of the stencil, the Christoffel term $\tfrac1r\, e_r$ of
the polar Laplacian. In numerical practice the vertex equations
$\phi(q) = y \pm t e_a$ are solved by Newton iteration, whose
linearized first step is the term $S^{-1}$ of the Neumann sum
[#prop:inverse-pushforward].

### Polynomials as algebraic sections {#ex:polynomials}

For polynomial observables the deformation needs no limits: the
section $t \mapsto qj_k(p;\, x;\, t;\, c)$ of the family is
polynomial in $t$, and the boundary is reached algebraically. A map
$p: X \to \IR$ is a *continuous polynomial of degree $\leq d$* if,
for some (equivalently, every) point $x \in X$,
$p(x + w) = \sum_{s=0}^{d} A_s(w, \dots, w)$ with continuous
symmetric $s$-linear forms $A_s: E^s \to \IR$; such a $p$ is
smooth, and its Taylor expansion at every point is exact and
terminates at degree $d$.

If $d=0$, then $p$ is constant and every positive-order difference
vanishes, so $qj_k(p;\,x;\,t;\,c)=0$ for $k\geq1$. Thus the nonconstant
case below may be stated with $d\geq1$.

The coefficients of the expansion below are the higher symbols
$\sigma_{k,m}$ of [#def:higher-symbols].


**Proposition (Polynomial sections).** {#prop:polynomial-sections}
Let $p: X \to \IR$ be a continuous polynomial of degree $\leq d$
for an integer $d\geq1$, and let $k \geq 1$.

1.  For $c \in CT_k(X, x)$ and $t \in (0,1]$,

    $$
    qj_k(p;\, x;\, t;\, c)
    = \sum_{m=0}^{k(d-1)} t^m\, D(p;\, x;\, \sigma_{k,m}(c)).
    $$

    The quotient jet is polynomial in the deformation parameter and
    extends algebraically through $t = 0$, with
    $qj^0_k(p;\, x;\, c) = D(p;\, x;\, \sigma_k(c))$.

2.  If $d \leq k$, the section is constant on affine cubes: for all
    $t \in (0,1]$,

    $$
    qj_k(p;\, x;\, t;\, \Aff(v_1, \dots, v_k))
    = \Delta(p;\, x;\, v_1, \dots, v_k)
    = D(p;\, x;\, v_1, \dots, v_k).
    $$


**Proof.**
1) Every vertex of the rescaled cube is polynomial in $t$,
$\zeta_x(\lambda_t\, c)_T = x + \sum_{A \in \KP_+(T)} t^{|A|} c_A$,
so $\Delta(p;\, x;\, \lambda_t\, c)$, an alternating sum of values
of $p$ at the vertices, is a polynomial in $t$ of degree at most
$k d$. Curved collapse [#thm:curved-collapse] with $M := k(d - 1)$
gives

$$
   \Delta(p;\, x;\, \lambda_t\, c)
   = \sum_{m=0}^{k(d-1)} t^{k+m}\, D(p;\, x;\, \sigma_{k,m}(c))
   + o(t^{k d}),
$$

and a polynomial in $t$ of degree at most $k d$ that is
$o(t^{k d})$ vanishes identically: the identity is exact for
all $t$. Dividing by $t^k$ gives the display; the value
at $t = 0$ is the $m = 0$ term, and $\sigma_{k,0} = \sigma_k$.

2) On affine cubes the higher symbols are homogeneous of symmetric
degree $k + m$ [#def:higher-symbols], and $D(p;\, x;\, \cdot)$
vanishes above degree $d \leq k$, so only the $m = 0$ term
$\sigma_{k,0}(\Aff(v_\bullet)) = v_1 \cdots v_k$ remains: by 1) the
section is the constant $D(p;\, x;\, v_1 \cdots v_k)$. Its value at
$t = 1$ is the discrete pairing
$\Delta(p;\, x;\, v_1, \dots, v_k)$.

### Newton to Taylor {#ex:newton-taylor}

Newton's formula writes vertex values as zeta transforms of face
differences, exactly, for every observable at every scale
[#prop:taylor-duality]. Under the deformation each face difference
has its affine collapse expansion [#prop:affine-collapse], and
Möbius inversion reassembles the expansions into the multivariate
Taylor formula: Taylor's theorem is the boundary value of Newton's.


**Proposition (Newton to Taylor).** {#prop:newton-taylor}
Let $f: X \to F$ be $C^n$ near $x$ and $v_1, \dots, v_k \in E$ with
$k \geq 1$. As $t \to 0$,

$$
   f(x + t v_1 + \dots + t v_k)
   = \sum_{\substack{\nu \in \IN_0^k\\ \wt(\nu) \leq n}}
     \frac{t^{\wt(\nu)}}{\nu!}\, D(f;\, x;\, v^\nu)
   + o(t^n).
$$


**Proof.**
Newton's formula [#prop:taylor-duality] at the rescaled legs reads

$$
   f(x + t v_1 + \dots + t v_k)
   = \sum_{T \subseteq [k]} \Delta(f;\, x;\, (t v_i)_{i \in T}).
$$

Expand each face by affine collapse [#prop:affine-collapse]: the
face $T$ contributes exactly the Taylor monomials of full support
on $T$, so a pair of a face and a full-support multi-index on it is
one multi-index $\nu \in \IN_0^k$ with
$\set{i : \nu_i > 0} = T$, and the $2^k$ remainders collect into
$o(t^n)$.


Newton's formula is exact at every $t > 0$; Taylor's formula is its
termwise boundary.

### Order conditions and Richardson extrapolation {#ex:order-conditions}

A finite-difference scheme approximates a differential by weighted
observable values at scale $t$. The plain difference quotient
converges at first order. Numerical differentiation raises this order by
choosing weights that cancel successive error coefficients. Here a scheme
is a weighted family of affine probes. By affine collapse
[#prop:affine-collapse], its deviation from the target differential is a
power series in $t$ whose $t^m$-coefficient pairs the derivatives of $f$
against a fixed probe built from $\sigma_{k,m}$. The order conditions are
therefore linear equations on these coefficient probes. Combining the
same scheme at different scales gives Richardson's deferred approach to
the limit [@Richardson1911] [@RichardsonGaunt1927].

Fix a grade $k$, weights
$a_\alpha \in \IR$, and legs
$v_\alpha = (v_{\alpha,1}, \dots, v_{\alpha,k})$ in $E$, over a
finite index set, and call

$$
   S_t(f) := \sum_\alpha a_\alpha\,
   qj_k(f;\, x;\, t;\, \Aff(v_\alpha))
$$

the associated *scheme*. For $f$ that is $C^{k+M}$ near $x$,
[#prop:affine-collapse] gives

$$
   S_t(f) = \sum_{m=0}^{M} t^m\, D(f;\, x;\, \xi_m) + o(t^M),
   \qquad
   \xi_m := \sum_\alpha a_\alpha\,
   \sigma_{k,m}(\Aff(v_\alpha)),
$$

with *coefficient probes* $\xi_m \in ST_{k+m}(X, x)$.


**Proposition (Order conditions).** {#prop:order-conditions}
Let $\xi \in ST_k(X, x)$ and $p \geq 1$. The following are
equivalent:

1.  $S_t(f) = D(f;\, x;\, \xi) + O(t^p)$ as $t \downarrow 0$, for
    every $f$ that is $C^{k+p}$ near $x$;

2.  $\xi_0 = \xi$ and $\xi_m = 0$ for $1 \leq m \leq p - 1$.


**Proof.**
If 2 holds, the expansion with $M = p$ gives
$S_t(f) = D(f;\, x;\, \xi) + t^p D(f;\, x;\, \xi_p) + o(t^p)$.
Conversely, evaluate on continuous polynomials $q$: by
[#prop:polynomial-sections], $S_t(q) = \sum_m t^m D(q;\, x;\, \xi_m)$
is a polynomial in $t$, exactly, and a polynomial in $t$ that is
$O(t^p)$ has no terms below $t^p$; hence
$D(q;\, x;\, \xi_0 - \xi) = 0$ and $D(q;\, x;\, \xi_m) = 0$ for
$m < p$, for every $q$. By jet realization [#lem:jet-realization]
and the jet pairing [#lem:jet-pairing], every form
$\alpha \in ST^{\leq N}(X, x)$, $N$ large, pairs to zero with
$\eta \in \set{\xi_0 - \xi,\, \xi_1, \dots, \xi_{p-1}}$. To show that
such an $\eta$ vanishes, choose a finite-dimensional subspace
$E_0\subseteq E$ containing all vector factors occurring in $\eta$. By
Hahn--Banach, a dual basis of $E_0$ extends to continuous functionals on
$E$. Hence every symmetric form on $E_0$ is the restriction of a
continuous symmetric form on $E$. The permanent pairing is nondegenerate
on the finite-dimensional space $\SYM_{\leq N}(E_0)$, so $\eta=0$.


The classical moment conditions for difference schemes are thus the
vanishing of the weighted higher-symbol coefficient probes. Parity eliminates half of the conditions: the
probe
$\sigma_{k,m}(\Aff(v_\bullet))$ is homogeneous of degree $k + m$,
so a *central* scheme, one whose weighted family of legs is
invariant under $v \mapsto -v$, has
$\xi_m = (-1)^{k+m}\, \xi_m$: every coefficient with $k + m$ odd
vanishes identically, and the order conditions skip every other
step.

For the central second difference, $k = 2$, one cube with weight
$-1$ and legs $(e, -e)$,

$$
   S_t(f) = -\, qj_2(f;\, x;\, t;\, \Aff(e, -e))
   = \frac{f(x + te) - 2 f(x) + f(x - te)}{t^2},
$$

the coefficient probes are $\xi_0 = -\, e \cdot (-e) = e^2$, the
odd $\xi_m = 0$ by centrality, and

$$
   \xi_2 = -\, \sigma_{2,2}(\Aff(e, -e))
   = -\Bigl( -\frac{e^4}{6} - \frac{e^4}{6} + \frac{e^4}{4} \Bigr)
   = \frac{e^4}{12},
$$

the three terms being $\nu = (3,1), (1,3), (2,2)$: for $f \in C^6$,

$$
   S_t(f) = D(f;\, x;\, e^2)
   + \frac{t^2}{12}\, D(f;\, x;\, e^4) + o(t^3),
$$

the classical second-order consistency with the
$\tfrac{1}{12}$-law for the leading error.

*Extrapolation.* If the scheme has order $p$ with first surviving
coefficient $\xi_p$, combining the scales $t$ and $t/2$ eliminates
it: for $f$ that is $C^{k+p+1}$ near $x$,

$$
   \frac{2^p\, S_{t/2}(f) - S_t(f)}{2^p - 1}
   = D(f;\, x;\, \xi) + O(t^{p+1}),
$$

since the $t^p$-coefficients cancel while the constant term
has coefficient $2^p - 1$. Richardson extrapolation is
coefficient elimination in the deformation parameter, and the
eliminated coefficients are higher symbols. For the central second
difference, parity removes the $t^3$-term as well: for $f \in C^6$,

$$
   \frac{4\, S_{t/2}(f) - S_t(f)}{3}
   = D(f;\, x;\, e^2) + O(t^4),
$$

the classical fourth-order compact scheme.

### Structural dictionary: $D_+$ as $L_\infty$-morphism {#ex:linfty}

Throughout this exhibit, $\phi$ is smooth near $x$ and all orders are
taken: $D_+(\phi; x): ST_*(X, x) \to ST_*(Y, y)$. The pushforward is
always a coalgebra morphism [#prop:coalgebra]; it is an algebra
morphism if and only if the Taylor expansion of $\phi$ at $x$ is
affine, i.e. the higher derivatives at $x$ vanish
[#prop:algebra-behavior]. In general, the
$D^r(\phi; x)$ assemble into an $L_\infty$-morphism: smooth maps
between affine spaces form a geometric family of
$L_\infty$-morphisms in which the Taylor coefficients are the
classical higher derivatives. The coderivations vanish, so the
intertwining condition is automatic, and composition is the Faà di Bruno
formula. The references used below describe the general formalism; we have
not found this affine example stated explicitly in them.


**Proposition (Algebra behavior of the pushforward).** {#prop:algebra-behavior}
Let $\phi$ be smooth near $x$. $D_+(\phi; x)$ is an algebra morphism
for the symmetric product if and only if $D^r(\phi; x) = 0$ for all
$r \geq 2$; in that case

$$
   D_+(\phi;\, x) = \SYM(D^1(\phi;\, x)).
$$


**Proof.**
If $D^r(\phi; x) = 0$ for $r \geq 2$, only the partition into
singletons contributes in [#def:symmetric-pushforward], and
$D_+(\phi;\, x;\, v_1 \cdots v_r) = \prod_i D(\phi;\, x;\, v_i)$ is
multiplicative on monomials. Conversely, suppose $D_+(\phi; x)$ is
multiplicative and induct on $r$: comparing

$$
   D_+(\phi;\, x;\, v_1 v_2)
   = D(\phi;\, x;\, v_1)\, D(\phi;\, x;\, v_2) + D(\phi;\, x;\, v_1 v_2)
$$

with $D_+(\phi;\, x;\, v_1)\, D_+(\phi;\, x;\, v_2)$ forces
$D^2(\phi; x) = 0$ by comparing degrees; for the step, all partitions
with a block of size $2, \dots, r-1$ drop out by the induction
hypothesis, and comparing with
$D_+(\phi;\, x;\, v_1) \cdots D_+(\phi;\, x;\, v_r)$ leaves
$D(\phi;\, x;\, v_1 \cdots v_r) = 0$.


For a general map, the higher derivatives $D^r(\phi; x)$, $r \geq 2$,
are the correction terms by which $D_+$ fails to be
$\SYM(D^1)$, the pushforward of the affine approximation of $\phi$
at $x$. We use the $L_\infty$ conventions of [@Kontsevich2003],
§4.1--4.3, and [@LodayVallette2012], §10.1--10.2: an
$L_\infty$-morphism is a morphism of Chevalley--Eilenberg coalgebras
intertwining the coderivations ([@ChevalleyEilenberg1948]
classically; [@LodayVallette2012], Proposition 10.1.20 and §10.2.2),
determined by its *Taylor coefficients* ([@Kontsevich2003],
§4.1--4.2) through the cofree property [#prop:cofree]
([@LodayVallette2012], Proposition 10.2.3). The deformation functor
of an $L_\infty$-algebra $\mathfrak g$ is defined over
finite-dimensional nilpotent commutative algebras $A$, non-unital:
$A$ plays the role of the maximal ideal, $A = \mathfrak m_{A'}$ for
the local Artinian algebra $A' := \IR \oplus A$. It takes
Maurer--Cartan solutions modulo gauge equivalence, defined
homotopically for general $\mathfrak g$ ([@Kontsevich2003], §4.5.2);
for a differential graded Lie algebra, the case used below, gauge
equivalence is the exponential action of the degree-zero part,

$$
   \operatorname{Def}_{\mathfrak g}(A)
   := \operatorname{MC}(\mathfrak g \tensor A)\,/\,
      \exp(\mathfrak g^0 \tensor A)
$$

([@Kontsevich2003], §3.2). The references work without
counit; the counital form used here has the same morphisms.


Degrees follow the shift convention: $E[-1]$ is $E$ placed in
degree $1$, so $\mathfrak g^1 = E$ is the only nonzero component,
and the shifted space $\mathfrak g[1]$ entering
$CE_\bullet(\mathfrak g) = \SYM(\mathfrak g[1])$ is an ungraded
copy of $E$. In the standard ledger, $\mathfrak g^0$ acts by gauge
transformations and $\mathfrak g^2$ contains obstruction classes; both
vanish for $E[-1]$, so the deformation problem below has trivial
gauge action and no obstructions.


**Proposition (Affine spaces in the $L_\infty$ dictionary).** {#prop:linfty-dictionary}
Let $X$ and $Y$ be affine spaces over $E$ and $F$, with base points
$x$ and $y$, and let $\mathfrak g := E[-1]$ and
$\mathfrak h := F[-1]$ be the abelian $L_\infty$-algebras: all
brackets vanish.

1.  The Chevalley--Eilenberg coalgebra is the symmetric bialgebra
    [#def:symmetric-bialgebra],

    $$
    CE_\bullet(\mathfrak g) = \SYM(E) = ST_*(X, x),
    \qquad Q = 0.
    $$

2.  The exponential $\xi \mapsto \exp(\xi)$ identifies
    $\operatorname{Def}_{\mathfrak g}(A) = E \tensor A$ with the
    group-like elements of $CE_\bullet(\mathfrak g) \tensor A'$
    congruent to $1$ modulo $A$: $\mathfrak g$ controls the
    deformations of the point $x$ inside $X$, the $A$-points
    $x + \xi$ of its formal neighborhood.

Let $\phi$ be smooth near $x$ with $\phi(x) = y$. Then:

3.  Both coderivations vanish, so the intertwining conditions are
    empty, and $D_+(\phi;\, x) = \exp_\star(D(\phi;\, x))$, the
    convolution exponential [#def:convolution] of the coalgebra
    lift [#prop:coalgebra-lift], is the $L_\infty$-morphism
    $\mathfrak g \rightsquigarrow \mathfrak h$ whose Taylor
    coefficients are the higher derivatives,

    $$
    \SYM^r(E) \lra F,
    \qquad
    v_1 \cdots v_r \longmapsto D(\phi;\, x;\, v_1, \dots, v_r).
    $$

4.  The induced map on deformations is the Taylor expansion of
    $\phi$ at $x$,

    $$
    \operatorname{Def}_{\mathfrak g}(A)
    \lra \operatorname{Def}_{\mathfrak h}(A),
    \qquad
    \xi \longmapsto \sum_{r \geq 1} \frac{1}{r!}\,
    D^r(\phi;\, x)(\xi, \dots, \xi).
    $$

5.  The assignment is functorial: for $\psi$ smooth near $y$,

    $$
    D_+(\psi \circ \phi;\, x)
    = D_+(\psi;\, y) \circ D_+(\phi;\, x),
    \qquad
    D_+(\id_X;\, x) = \id,
    $$

    and the induced composition rule for Taylor coefficients is the
    partition Faà di Bruno formula.


**Proof.**
1) With all operations zero, the Chevalley--Eilenberg coalgebra is
the cofree conilpotent cocommutative coalgebra on
$\mathfrak g[1] = E$ with zero coderivation. This is the symmetric
bialgebra of the appendix.

2) The Maurer--Cartan equation is vacuous and the gauge group
$\exp(\mathfrak g^0 \tensor A)$ is trivial, so
$\operatorname{Def}_{\mathfrak g}(A) = \mathfrak g^1 \tensor A
= E \tensor A$. The exponential lives in the unitalization: for
$\xi \in E \tensor A$,
$\exp(\xi) = \sum_r \xi^r / r!
\in CE_\bullet(\mathfrak g) \tensor A'$
is a finite sum with constant term $1$, as $A$ is nilpotent, and is
group-like:
$\Delta^{\times}(\xi) = \xi \tensor 1 + 1 \tensor \xi$ with commuting
summands, so
$\Delta^{\times} \exp(\xi) = \exp(\xi) \tensor \exp(\xi)$ by the
binomial formula [#def:symmetric-bialgebra]. Conversely, a
group-like element $g \equiv 1 \pmod{A}$ has the finite-sum
logarithm $\log g$, and $\Delta^{\times} \log g = \log(g \tensor g)
= \log g \tensor 1 + 1 \tensor \log g$ shows that $\log g$ is
primitive, an element of $E \tensor A$; so $\exp$ is a bijection
onto these group-likes.

3) Both coderivations vanish, so the intertwining conditions are
empty and an $L_\infty$-morphism is exactly a counital coalgebra
morphism $\SYM(E) \to \SYM(F)$. The coalgebra lift
[#prop:coalgebra-lift] is the unique one with degree-one component
$D(\phi;\, x)$, and its components against the cofree structure
[#prop:cofree] are the higher derivatives.

4) A counital coalgebra morphism preserves group-like elements, so
$D_+(\phi;\, x)\, \exp(\xi) = \exp(\eta)$ for a unique
$\eta \in F \tensor A$, by 2) applied to $\mathfrak h$. Compare
degree-one components: $\exp(\eta)$ has component $\eta$, and
$D_+(\phi;\, x;\, \xi^r)$ has the one-block component
$D(\phi;\, x;\, \xi^r) = D^r(\phi;\, x)(\xi, \dots, \xi)$
[#def:symmetric-pushforward]; hence
$\eta = \sum_{r \geq 1} \tfrac{1}{r!}\,
D^r(\phi;\, x)(\xi, \dots, \xi)$.

5) is smooth functoriality [#cor:smooth-functoriality] and the
partition Faà di Bruno formula [#cor:partition-fdb].


Kontsevich's gloss for the coalgebra morphism of a map of formal
pointed manifolds, "the pushforward on distributions supported at
zero" ([@Kontsevich2003], §4.1), is realized analytically by
[#thm:distribution-pushforward].

## Appendix: The symmetric bialgebra {#sec:appendix-b}

This appendix collects the coalgebra background behind the coalgebra
lift [#prop:coalgebra-lift]. Throughout, $V$ is a real vector space.
The permanent pairing lives in [#def:symmetric-cotangent], the
product-coproduct adjunction in [#lem:product-coproduct].


**Definition (Symmetric bialgebra).** {#def:symmetric-bialgebra}
Let $\SYM(V) = \Vsum_{r \geq 0} \SYM^r(V)$ be the symmetric algebra
with its degree filtration $F_k := \Vsum_{r \leq k} \SYM^r(V)$.

- The *coproduct* $\Delta^{\times}: \SYM(V) \to \SYM(V) \tensor
  \SYM(V)$ is the unique algebra morphism with
  $\Delta^{\times}(v) = v \tensor 1 + 1 \tensor v$ for $v \in V$; the
  *counit* $\varepsilon$ is the degree-zero projection. On monomials,
  $\Delta^{\times}(v_1 \cdots v_r) = \sum_{I \sqcup J = [r]} v^I \tensor v^J$
  with $v^\emptyset := 1$, matching [#def:coproduct].
- The *reduced coproduct* of an element $a$ of positive degree is
  $\uDelta(a) := \Delta^{\times}(a) - a \tensor 1 - 1 \tensor a$.
- A counital coalgebra $C$ with coaugmentation $1_C$ is *conilpotent*
  if for every $c \in \ker \varepsilon_C$ there is an $m$ with
  $\uDelta^{(m)}(c) = 0$.


**Lemma (Conilpotence).** {#lem:conilpotence}
The coproduct preserves the degree filtration, so each
$\SYM_{\leq k}(V)$ is a subcoalgebra; the reduced coproduct is
strictly degree-decreasing,
$\uDelta(F_k) \subseteq F_{k-1} \tensor F_{k-1}$, so $\SYM(V)$ and
every $\SYM_{\leq k}(V)$ are conilpotent.


**Proof.**
In the monomial formula both tensor factors have degree $\leq r$, and
in the reduced part both are proper sub-monomials, of degree
$\leq r - 1$.


**Definition (Convolution).** {#def:convolution}
For a counital cocommutative coalgebra $C$ and a commutative unital
algebra $A$, the *convolution product* on $\Hom(C, A)$ is

$$
   f \star g := \mu_A \circ (f \tensor g) \circ \Delta_C,
$$

associative and commutative with unit
$1_\star := \eta_A \circ \varepsilon_C$.


**Proposition (Cofree property; unique coalgebra lift).** {#prop:cofree}
Let $C$ be a coaugmented, counital, conilpotent cocommutative
coalgebra and $f: C \to V$ linear with $f(1_C) = 0$, viewed as a map
into $\SYM(V)$ of pure degree one. Then the convolution exponential

$$
   \exp_\star(f) := \sum_{m \geq 0} \frac{1}{m!}\, f^{\star m}
   \;:\; C \lra \SYM(V)
$$

is a finite sum on every element of $C$, and it is the unique
counital coalgebra morphism $C \to \SYM(V)$ with degree-one component
$f$, that is, with $\pi_1 \circ \exp_\star(f) = f$.


**Proof.**
*Finiteness.* Decompose each term of the iterated coproduct
$\Delta_C^{(m-1)}(c)$ by which tensor factors are the coaugmentation
$1_C$: since $f(1_C) = 0$, only the terms with all $m$ factors in
$\ker \varepsilon_C$ remain after applying $f^{\tensor m}$, and they
constitute exactly the iterated reduced coproduct
$\uDelta^{(m-1)}(c)$. For $c \in \ker \varepsilon_C$, conilpotence
makes $\uDelta^{(m-1)}(c)$ vanish for $m$ large; hence
$f^{\star m}(c) = 0$, and
$f^{\star m}(1_C) = f(1_C)^m = 0$ for $m \geq 1$.

*Morphism.* The value $f(c) \in V$ is primitive, so
$\Delta^{\times} \circ f = (L + R)(f)$ with
$L(f)(c) := f(c) \tensor 1$ and $R(f)(c) := 1 \tensor f(c)$, and
$L(f)$, $R(f)$ commute under the convolution of
$\Hom(C, \SYM(V) \tensor \SYM(V))$. Exponentiating,
$\Delta^{\times} \circ \exp_\star(f)
= \exp_\star(L(f)) \star \exp_\star(R(f))
= (\exp_\star(f) \tensor \exp_\star(f)) \circ \Delta_C$; counitality
holds since all positive-degree terms have $\varepsilon = 0$.

*Uniqueness.* Let $g, h$ be counital coalgebra morphisms with the
same degree-one component. Counitality gives
$\pi_0 g = \varepsilon_C = \pi_0 h$. For $r \geq 2$, taking the
components of
$\Delta^{\times} \circ g = (g \tensor g) \circ \Delta_C$ in
$\SYM^i \tensor \SYM^j$ with $i + j = r$, $i, j \geq 1$,

$$
   \uDelta\, (\pi_r\, g(c)) = \sum_{\substack{i + j = r \\ i, j \geq 1}}
   (\pi_i\, g \tensor \pi_j\, g)\, \Delta_C(c)
$$

depends only on the components of degree $< r$, and $\uDelta$ is
injective on $\SYM^r(V)$ for $r \geq 2$: on a monomial, the
multiplication returns
$\mu\, \Delta^{\times}(v_1 \cdots v_r)
= \sum_{I \sqcup J = [r]} v^I\, v^J = 2^r\, v_1 \cdots v_r$, and
removing the two extreme terms $I = [r]$ and $J = [r]$ leaves
$\mu \circ \uDelta = (2^r - 2)\, \id$, invertible for $r \geq 2$.
Induct on $r$.


**Corollary (Coalgebra lift, truncated form).** {#cor:coalgebra-lift}
Let $f: ST_{\leq k}(X, x) \to F$ be linear with $f(1) = 0$. There is a
unique counital coalgebra morphism
$f^+: ST_{\leq k}(X, x) \to \SYM(F)$ with degree-one component $f$,
$\pi_1 \circ f^+ = f$; it preserves the degree filtration, hence
corestricts to $\SYM_{\leq k}(F)$, and on monomials it is the
partition sum

$$
   f^+(v_1 \cdots v_r) = \sum_{\pi \in \Part(r)} \prod_{A \in \pi} f(v^A).
$$

If $Y$ is an affine space modeled on $F$ and $y \in Y$, the
identification $\SYM_{\leq k}(F) = ST_{\leq k}(Y, y)$ reads $f^+$ as
a map of symmetric tangent spaces; in particular the symmetric
pushforward [#def:symmetric-pushforward] is the unique coalgebra
morphism with degree-one component the differential $D(\phi; x)$.


**Proof.**
$ST_{\leq k}(X, x) = \SYM_{\leq k}(T_x X)$ is a conilpotent
subcoalgebra [#lem:conilpotence], so [#prop:cofree] applies with
$f^+ = \exp_\star(f)$. On a monomial, the iterated coproduct is the
sum over ordered decompositions $[r] = I_1 \sqcup \dots \sqcup I_m$
into possibly empty blocks; $f$ kills the empty blocks, and
$\frac{1}{m!}$ converts ordered partitions into unordered ones,
giving the partition sum. Each term has degree $|\pi| \leq r$, whence
the filtration bound.


**Remark (Literature).** {#rem:cofree-literature}
Over an algebraically closed field of characteristic zero, the cofree
cocommutative coalgebra over $V$ decomposes as
$\bigoplus_{P \in V} \SYM_P(V)$, and the partition formula for the
unique lift of a linear map is Theorem 2.22 of [@murfet2015sweedler];
Clift and Murfet use it in differential linear logic [@CliftMurfet2020].
The convolution-exponential proof above works in the truncated,
single-basepoint coalgebra over $\IR$.
