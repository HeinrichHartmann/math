---
type: "math-article"
title: "Discrete and Differential Calculus"
tagline: "The four functors of higher-order calculus: $D^+, D_+, \\Delta^+, \\Delta_+$"
author: "Heinrich Hartmann"
date: "2026-07-18"
status: "900 Published"
target: paper
slug: "DDC"
license:
  name: "CC-BY 4.0"
  url: "https://creativecommons.org/licenses/by/4.0/"
  full_name: "Creative Commons Attribution 4.0 International License"
abstract: |
  We develop a functorial calculus for higher finite differences and
  derivatives on affine Banach spaces. Cubical probes in Möbius coordinates
  carry exact covariant and contravariant operators $\Delta_+$ and $\Delta^+$
  for arbitrary maps; symmetric tangent and cotangent probes carry their
  smooth counterparts $D_+$ and $D^+$. Composition becomes functoriality:
  the coordinate formulas for $\Delta_+$ and $D_+$ are the cover- and
  partition-indexed Faà di Bruno formulas. The pullbacks $\Delta^+$ and
  $D^+$ are algebra morphisms and are adjoint to their respective
  pushforwards. In the smooth sector, $D_+$ is the corresponding coalgebra
  morphism, uniquely determined by the total differential. These
  algebra-coalgebra adjunctions encode the higher product rules.

  The central construction is a weighted collapse of cubical probes. Under
  this collapse, covers of excess weight vanish and partitions remain. The
  resulting symbol map

  $$
  \sigma_k(c)
  =
  \sum_{\pi\in\operatorname{Part}(k)}
  \prod_{A\in\pi}c(A)
  $$

  intertwines the collapsed cubical pushforward with $D_+$. In finite
  dimensions, rescaled cube measures converge weakly to point-supported
  distributions; contravariantly, the collapse extracts Taylor coefficients
  from cubical jets. The smooth higher chain and product rules follow from
  the corresponding exact discrete identities.

  Applications include vertexwise inversion of cubical pushforward, a finite
  Neumann formula for inverse differential pushforward and the derivatives of
  local inverses, higher-symbol expansions for collapsing stencils, and the
  transport of point differential operators through arbitrary coordinates.
  The latter recovers the Laplace--Beltrami and polar biharmonic operators and
  produces an exact polar form of the five-point stencil. We give
  self-contained proofs of the four-functor calculus and symbol map.
  
bibliography: "../meta/refs.bib"
orcid: "0000-0002-3929-2421"
affiliation: "Hartmann IT GmbH"
email: "Heinrich@HeinrichHartmann.com"
hide:
  - outline
  - navigation
math:
  proof_style: expanded
doi: "10.5281/zenodo.21433565"
publications:
  pdf: "https://github.com/HeinrichHartmann/math/releases/download/2026-07-10-Discrete-and-Differential-Calculus/2026-07-10-Discrete-and-Differential-Calculus.pdf"
  GitHub: "https://github.com/HeinrichHartmann/math/releases/tag/2026-07-10-Discrete-and-Differential-Calculus"
  Zenodo: "https://doi.org/10.5281/zenodo.21433565"
zenodo:
  doi: 10.5281/zenodo.21433565
---

## Introduction

### Short history of calculus

The origins of differential calculus lie in Newton's *Method of Fluxions*
(1736) and Leibniz's *Nova methodus pro maximis et minimis* (1684). Both
works already gave rules for products and composites. In
modern operator notation, the first-order chain rule is the functorial identity

$$
   D(\psi \circ \phi; x) = D(\psi; y) \circ D(\phi; x)
$$

which replaces composition of nonlinear maps by composition of linear maps.
At higher orders this simplicity breaks: repeated differentiation applies the
product rule to the products of derivatives created by the chain rule. The
result acquires lower-order correction terms and rapidly growing symbolic
combinatorics. These terms were worked out degree by degree for a long time,
until Faà di Bruno's papers of 1855 and 1857 settled the scalar combinatorics
in general order [@FaaDiBruno1855] [@FaaDiBruno1857] [@Johnson2002].

General formulas for higher-dimensional maps appeared remarkably late in the
literature. Fraenkel gave an arbitrary-order formula for maps between Banach
spaces in 1978 [@Fraenkel1978]. He noted that Cartan and Dieudonné had
described how to construct such formulas without displaying the result, and
called the full finite-dimensional coordinate formula "monstrous." In modern
notation, the compact coordinate-free form is the partition chain rule

$$
   D(\psi\circ\phi;x;v_1,\dots,v_k)
   =\sum_{\pi\in\Part(k)}
     D(\psi;y;(D(\phi;x;v_A))_{A\in\pi}),
   \qquad v_A:=(v_i)_{i\in A}.
$$

In this formula, the combinatorics have been compressed into the partitions of
$[k]$. It has one summand for every partition. Expanding it in
partial-derivative coordinates introduces a further layer of multi-indices,
multiplicities, and factorials; Constantine and Savits gave a systematic
formula for that expansion only in 1996 [@CS1996]. Our companion paper
[@FDB] derives both forms from one operation, Taylor composition.

Several schools of calculus had fully developed their theories before these
formulas became available and had to cope with higher derivatives in different
ways:

Classical differential geometry [@KobayashiNomizu1963] handles higher order by
choosing a connection. Raw second derivatives acquire lower-degree correction
terms under changes of coordinates; the Christoffel symbols absorb these
corrections, and covariant differentiation can then be iterated. This makes
the connection, its coordinate coefficients, and the curvature produced by
commutators explicit. Because the connection is additional, non-canonical
data, the resulting theory does not express raw higher differentials as
canonical functorial morphisms.

Jet theory handles higher order contravariantly, by retaining a function germ
only up to a prescribed order. Two functions have the same $k$-jet at $x$
when their difference lies in $\mathfrak m_x^{k+1}$, so the algebra of
$k$-jets is the quotient $\mathcal O_x/\mathfrak m_x^{k+1}$
[@Ehresmann1951] [@Saunders1989] [@kolar1993natural] [@Cartan1971]. This makes
finite-order dependence and functorial composition explicit: pullback
preserves powers of the maximal ideal and therefore descends to the quotients,
while prolongations carry higher-order differential equations and operators.
The combinatorics of the higher chain rule remains implicit in the algebra of
jet composition.

Distribution theory handles higher order on the covariant dual side
[@Schwartz1966] [@hormander1983analysis]. In finite dimensions, distributions
supported at a point are precisely finite-order differential operators
evaluated at that point. They push forward by
$(\phi_*u)(f):=u(f\circ\phi)$, and pushforward preserves point support. This
makes duality with function germs, support, order, and functorial transport
explicit. The coordinate expansion of that transport is not normally singled
out from its definition by duality.

Discrete calculus handles higher order through repeated operations on values
at separated points. Forward differences [@Norlund1924] [@Jordan1965] and
divided differences [@FL2007] make finite-step identities and interpolation
explicit; difference quotients [@BGN2004] provide an analytic calculus, while
umbral operator calculus [@RomanRota1978] organizes shift-invariant operators
algebraically. Duarte and Torres [@DT2008] derive recursive formulas for
cubical differences indexed by partitions, with shifts of the basepoint.
Because of these shifts, their formulas do not define functorial transport
between fixed-basepoint cube spaces.

### The four-operator calculus

The preceding schools fit into one picture with two independent directions.
In one direction, observables pull back while probes and differential
operators push forward. In the other, cubical probes record exact finite
displacements while symmetric probes record infinitesimal data at one point.
Crossing these directions gives the four operators $\Delta^+$, $\Delta_+$,
$D^+$, and $D_+$.

The two ladders below show where these operators sit. Their outer maps are the
usual pullback of functions and pushforward of measures or distributions;
their middle spaces give concrete coordinates for local probes. The smooth
ladder uses Taylor coefficients and point-supported distributions, while the
discrete ladder uses Möbius coordinates and signed cube measures. In each
ladder, the covariant and contravariant operators are paired. The weighted
collapse developed in the body runs between the ladders.

This arrangement is the roadmap for the paper. After displaying both ladders,
the body constructs the exact discrete pair, passes from cubes to symmetric
probes by weighted collapse, and then develops the smooth pair. The body works
in affine spaces. Functoriality also lets the smooth operators glue over
manifolds; the globalization exhibit [#ex:globalization] records that extension
and its relation to Pohl's higher-order tangent bundles.

### The smooth ladder

Let $X$ and $Y$ be affine spaces modeled on finite-dimensional real vector
spaces $E$ and $F$. A $C^\infty$ map $\phi:X\to Y$ with $y=\phi(x)$ induces
the diagram

$$
\begin{array}{ccccccccccc}
\mathcal{E}'(X)
& \hookleftarrow
& \mathcal{E}'(X; x)
& \xleftarrow{\;\delta(x;\, -)\;}
& ST_*(X; x)
& \langle -, - \rangle
& \STH^*(X; x)
& \xleftarrow{\;t(x;\, -)\;}
& \hat{\mathcal{E}}(X; x)
& \leftarrow
& \mathcal{E}(X)
\\[4pt]
\downarrow \phi_*
&& \downarrow \phi_*
&& \downarrow D_+(\phi;\, x)
&& \uparrow D^+(\phi;\, x)
&& \uparrow \phi^*
&& \uparrow \phi^*
\\[4pt]
\mathcal{E}'(Y)
& \hookleftarrow
& \mathcal{E}'(Y; y)
& \xleftarrow{\;\delta(y;\, -)\;}
& ST_*(Y; y)
& \langle -, - \rangle
& \STH^*(Y; y)
& \xleftarrow{\;t(y;\, -)\;}
& \hat{\mathcal{E}}(Y; y)
& \leftarrow
& \mathcal{E}(Y),
\end{array}
$$

Here $\mathcal{E}(X)$ is the space of smooth functions, $\mathcal{E}'(X)$ the
distributions, and $\mathcal{E}'(X;x)$ those supported at $x$. The completion
$\hat{\mathcal{E}}(X;x)$ is the formal jet space at $x$. The unlabeled arrows
are the natural inclusion and completion maps.

The symmetric tangent space through order $k$ is
$ST_k(X;x):=\SYM_{\leq k}(T_xX)$, and $ST_*(X;x)=\SYM(T_xX)$ contains all
orders. Its cotangent counterpart $\STH^*(X;x)$ is the completed symmetric
algebra of $T_x^*X$; the two are related by the permanent pairing. The map
$\delta(x;-)$ realizes symmetric tangent probes as point-supported
distributions, while $t(x;-)$ is full Taylor expansion.

The outer vertical maps are the usual pushforward of distributions and
pullback of functions and jets. These outer columns require finite dimension;
the two middle operators make sense for affine Banach spaces. Full definitions
appear in [#def:symmetric-spaces], [#sec:covariant-differentials], and
[#sec:jets].

In degree zero, $D^+$ is unital and $D_+$ is counital; this records
$y=\phi(x)$. The degree-one component of each operator is induced by
$D(\phi;x)$, and its functoriality is the ordinary chain rule. The
higher-degree terms give the Faà di Bruno corrections.

Covariantly, $D_+(\phi;x):ST_*(X;x)\to ST_*(Y;y)$ is the unique coalgebra
lift of the total differential. On symmetric monomials,

$$
   D_+(\phi;x;v_1\cdots v_k)
   :=\sum_{\pi\in\Part(k)}\prod_{A\in\pi}D(\phi;x;v_A).
$$

For a second map $\psi:Y\to Z$, we obtain the following "higher chain rule"
identity:

$$
   D_+(\psi\circ\phi; x)
   = D_+(\psi; y)\circ D_+(\phi; x).
$$

Evaluating this identity on a monomial recovers Fraenkel's partition form of
the Faà di Bruno formula [@Fraenkel1978]. Since a partition of $k$ elements
has at most $k$ blocks, $D_+$ maps degree $k$ to degrees at most $k$ and
therefore acts on $ST_*$ without completion. Its degree filtration has
associated graded $\gr_rD_+(\phi;x)=\SYM^r(D(\phi;x))$.

In finite dimensions, $D_+$ is also realized as the pushforward of
point-supported distributions:
$\phi_*\delta(x;\xi)=\delta(y;D_+(\phi;x;\xi))$. This is the $\delta$-square
in the ladder. Thus coordinate change for a point-supported differential
operator of arbitrary order is computed by one application of $D_+$.

Contravariantly, $D^+$ is the transpose of $D_+$ under the permanent pairing.
For $\ell_1,\dots,\ell_k\in F^*$, write
$\phi^{(i)}:=\ell_i\circ(\phi-y)$. On symmetric monomials,

$$
   D^+(\phi;x;\ell_1\cdots\ell_k)
   :=\prod_{i=1}^k t(x;\phi^{(i)})
   =\sum_{\nu\in\IN_0^k}\frac{1}{\nu!}
      \prod_{i=1}^k D^{\nu_i}(\phi^{(i)};x),
$$

where $\nu!:=\prod_i\nu_i!$. Since $\phi^{(i)}(x)=0$, any term with some
$\nu_i=0$ vanishes, and substitution is defined on every truncation and hence
on the completion. Thus $D^+$ is an algebra morphism given by Taylor
composition [@JR1979] [@FM2014]. This is the middle adjunction square in the
ladder, while the $t$-square identifies $D^+$ with jet pullback.

### The discrete ladder

The discrete operators have analogous covariant and contravariant diagrams
and require no regularity assumptions. An arbitrary map $\phi$ induces

$$
\begin{array}{ccccccc}
F'(X)
& \xleftarrow{\;\delta(x;\, -)\;}
& CT_*(X; x)
& \langle -, - \rangle
& \CTH^*(X; x)
& \xleftarrow{\;\Delta(-;\, x)\;}
& F(X)
\\[4pt]
\downarrow \phi_*
&& \downarrow \Delta_+(\phi;\, x)
&& \uparrow \Delta^+(\phi;\, x)
&& \uparrow \phi^*
\\[4pt]
F'(Y)
& \xleftarrow{\;\delta(y;\, -)\;}
& CT_*(Y; y)
& \langle -, - \rangle
& \CTH^*(Y; y)
& \xleftarrow{\;\Delta(-;\, y)\;}
& F(Y),
\end{array}
$$

Here $F(X):=\Map(X,\IR)$ is the space of functions on $X$, and $F'(X)$ is
the space of finitely supported signed measures. The tangent cubes of order
$k$ are $CT_k(X;x):=\Map(\KP_+(k),E)$, where $\KP_+(k)$ consists of the
nonempty subsets of $[k]$; these are Möbius coordinates, and $CT_*(X;x)$
collects all orders. The co-cubes
$CT^k(X;x):=\Map(CT_k(X;x),\IR)$ and their product $\CTH^*(X;x)$ are paired
with cubes by evaluation.

The map $\delta(x;-)$ realizes a tangent cube as its signed vertex measure,
while $\Delta(-;x)$ sends a function to its cubical jet. The outer maps are
the usual pushforward of measures and pullback of functions.
$\Delta_+(\phi;x)$ transports the vertices through $\phi$ and returns the
result to Möbius coordinates; $\Delta^+(\phi;x)$ is precomposition with this
map. Full definitions appear in [#sec:discrete] and
[#sec:contravariant-differences].

There is no discrete analogue of the two point-local columns in the smooth
diagram. On the function side there is no completion:
the vanishing ideal of a point is idempotent, $I_x^2 = I_x$, so the jet
quotients $F(X)/I_x^m$ collapse to $\IR$ and nothing sits between the
functions and the co-cubes. On the measure side the point-supported
measures are the scalar multiples of $\delta(x)$ and add no nontrivial local
data. A cube measure is supported on its vertices rather than concentrated
at $x$. The discrete ladder thus carries no
point-local layer, and the discrete jet is a prolongation of a function to
cubical probes, not a quotient of it. The remaining three squares commute
for arbitrary maps: the $\delta$-square is
the pushforward of cube measures, the pairing square is the discrete
adjunction, and the jet square is the cubical jet pullback. The
pushforward $\Delta_+(\phi; x)$ is the Möbius conjugate of the vertexwise
pushforward, functorial with no regularity assumptions, and its
coordinate expansion is the covering form of the Faà di Bruno formula
[@DFDB],

$$
   \Delta(f \circ \phi; x; v_1, \dots, v_k)
   = \sum_{\KC \in \Cov(k)} \Delta(f; y; (\Delta(\phi; x; v_A))_{A \in \KC}),
$$

with covers in place of partitions; the order-two case is computed in
the exhibit [#ex:cube-journey]. The cubical pullback $\Delta^+(\phi;x)$ is
contravariantly functorial, an algebra morphism for the pointwise product of
co-cubes, and compatible with the cubical jet,
$\Delta(f \circ \phi;\, x) = \Delta^+(\phi;\, x)\, \Delta(f;\, y)$. The
interface $\Delta(-;\, x)$ itself is not multiplicative, and its defect is
precisely the discrete product rule, indexed by 2-covers: where the
Taylor expansion turns products of functions into products of series,
the finite difference of a product mixes the faces of the cube.

### The collapse

The smooth and discrete diagrams are connected column by column. On the
function side the smooth functions embed in all functions,
$\mathcal{E}(X) \mono F(X)$; on the measure side the finitely supported
measures embed in the distributions, $F'(X) \mono \mathcal{E}'(X)$; and in
the middle the symbol map $\sigma_k: CT_k(X; x) \to ST_*(X; x)$ sends a
cube to a symmetric tensor. Its contravariant companion identifies Taylor
coefficients with leading coefficients of co-cubes. Both maps arise from the
same weighted collapse. The rescaling
$(\lambda_t c)(A) = t^{|A|} c(A)$ collapses a cube onto its
basepoint. For $C^k$ maps, terms indexed by covers of excess weight converge
to zero, leaving the partition terms. At the same time, cube measures
converge to point-supported distributions:

$$
   t^{-k}\, \delta(x; \lambda_t c)
   \;\xrightarrow[t \to 0]{}\;
   \delta(x; \sigma_k(c)),
   \qquad
   \sigma_k(c) = \sum_{\pi \in \Part(k)} \prod_{A \in \pi} c(A),
$$

through the symbol map $\sigma_k$, whose partition sum has the same form as
$D_+$. Pairing the rescaled cube with an observable $f$ that is $C^k$ near
$x$ gives

$$
   \frac{1}{t^k}\, \Delta(f; x; \lambda_t c)
   \;\xrightarrow[t \to 0]{}\;
   D(f; x; \sigma_k(c))
   = \sum_{\pi \in \Part(k)} D(f; x; (c(A))_{A \in \pi}).
$$

The left side is a finite difference and the right side is the action of a
point-supported differential operator. Contravariantly, the same collapse
extracts Taylor coefficients from cubical jets. It therefore intertwines the
discrete operators $\Delta_+,\Delta^+$ with the smooth operators $D_+,D^+$.

Both pushforwards admit closed inverse formulas. The inverse of $D_+(\phi;x)$
is a finite Neumann sum involving the inverse of the first derivative, while
$\Delta_+(\phi;x)$ is inverted vertexwise. These formulas reduce coordinate
changes of point operators to one evaluation [#sec:applications].

### Related work {#sec:related}

The ingredients of the calculus occur in several established theories.
Kolář, Michor, and Slovák [@kolar1993natural] treat natural operations, jets,
and Weil functors, including the spaces underlying the smooth diagram.
Johnson [@Johnson2002] surveys the classical Faà di Bruno formula, while
Frabetti and Manchon [@FM2014] treat its Hopf-algebraic formulation
[@JR1979] [@FGB2005]. These accounts describe composition abstractly or on
formal power series. Here the same composition is represented by adjoint
operators on symmetric tangent and cotangent spaces. Synthetic differential
geometry [@kock2006synthetic] also uses infinitesimal probes, but takes
nilpotent extensions as primitive rather than obtaining them from collapsing
finite probes. McCullagh's tensor calculus of moments and cumulants
[@McCullagh1987] contains the same partition transform as the symbol map
[@LS1959] [@Speed1983].

The difference-quotient calculus of Bertram, Glöckner, and Neeb [@BGN2004]
[@Bertram2013] is likewise functorial and relates discrete quotients to
derivatives. Our cubical model instead retains all faces of a probe, producing
the covering formula and the covariant--contravariant adjunction. Difference
forms and their de Rham limit use the alternating part of cubical data; this
article uses the symmetric part.

Automatic differentiation [@GriewankWalther2008] gives an algorithmic
counterpart. Higher-order forward-mode AD transports truncated Taylor coefficients
through composites, the covariant direction, and higher-order
reverse-mode transports covector coefficient arrays, the contravariant
direction [@Betancourt2018] [@Sangha2025]. In differential linear logic,
Clift and Murfet [@CliftMurfet2020] construct the cofree-coalgebra lift of
Kleisli morphisms with the closed partition formula, using
[@murfet2015sweedler], Thm. 2.22. Their coalgebra lift is the formal-algebraic
construction underlying $D_+$. Our treatment identifies it with pushforward
of point-supported distributions and places it beside its contravariant
adjoint and the two exact cubical operators.

The references above provide the individual algebraic, distributional,
combinatorial, and computational components, each establishing part of the
picture. We believe the following contributions are new. First, the exact
discrete calculus: the cubical pushforward and pullback in Möbius
coordinates, functorial and adjoint for arbitrary maps, with the covering
Faà di Bruno formula as coordinate expansion. Second, the weighted
collapse: the cover-weight filtration under which the exact calculus
converges to the smooth one, cube measures converging to point-supported
distributions through the symbol map. Third, the closed partition formula
for the pushforward of point-supported distributions in symmetric tangent
coordinates, established analytically and adjoint to Taylor pullback; the
higher chain and product rules are obtained as collapse limits of the
corresponding exact identities rather than by induction on the order.
Fourth, the finite Neumann formula for the inverse pushforward, which
transports point operators through arbitrary coordinates in closed form.
The four-functor calculus, its adjunctions, and the collapse connecting
the two sectors combine these elements into one functorial picture.

## Setting {#sec:conventions}

Throughout, $X, Y, Z$ are affine spaces over real Banach spaces $E, F, G$;
points are denoted $x \in X$, $y \in Y$, $z \in Z$. Maps of affine spaces are
$\phi: X \to Y$ and $\psi: Y \to Z$ with $\phi(x) = y$, $\psi(y) = z$.
We say $\phi$ is $C^k$ near $x$ if it is $k$ times Fréchet differentiable
with continuous derivatives on a neighborhood of $x$ [@LangRFA].
The derivative $D^r(\phi; x; u_1, \dots, u_r)$ is evaluated on the directions
$u_i$ and is symmetric and continuous multilinear.

**Notation**.
We prefer explicit arguments over subscript and bracket notation, writing
$\Delta(f; x; c)$ instead of $\Delta_c f(x)$ and $D(f; x; v_1, \dots, v_k)$
instead of $D^k f(x)[v_1, \dots, v_k]$. Semicolons and commas are both
argument separators; we use semicolons as a visual hint when arguments are
of different kinds. Three conventions keep the formulas light. Tail
currying: dropping trailing arguments denotes the resulting map, as in
$D_+(\phi; x) = D_+(\phi; x; -)$. Slot currying: a dash in an argument
slot denotes the map in that slot, as in $\Delta(-; x):f\mapsto
\Delta(f; x)$. Overloading: one symbol may carry several definitions,
selected by the type of its argument. The direction slot of $D$ accepts a
tuple or a symmetric tensor, so $D(f; x; v_1,v_2)$ and
$D(f; x; v_1v_2)$ denote the same value. The argument determines the order
of differentiation, so no order superscripts appear.

For $k \geq 1$ write $[k] = \set{1, \dots, k}$. For a finite set $S$,
$\KP(S)$ is its power set and
$\KP_+(S) = \KP(S) \setminus \set{\emptyset}$ is the set of nonempty
subsets. The set $\Part(S)$ consists of the unordered partitions of $S$ into
nonempty blocks; for example,
$\set{\set{1,3}, \set{2}} \in \Part([3])$.
We abbreviate $\KP(k):=\KP([k])$, $\KP_+(k):=\KP_+([k])$, and
$\Part(k):=\Part([k])$.


## Covariant differences {#sec:discrete}

We first construct the discrete covariant calculus. Cubes are represented in
Möbius coordinates, maps act vertexwise, and Möbius inversion gives the
cubical pushforward. We establish functoriality, adjunction, the product rule,
and the covering formula for arbitrary maps.

**Definition (Functions and measures).** {#def:functions-measures}
We use the following spaces, maps, and pairing.

- $F(X) := \Map(X, \IR)$ is the space of functions on $X$, with the
  topology of pointwise convergence.
- $F'(X) := \mathcal{L}(F(X), \IR) \isom \Map_{\mathrm{fin}}(X, \IR)$
  is its continuous dual, the finitely supported signed measures
  $\mu = \sum_i \lambda_i \delta(z_i)$.
- A map $\phi: X \to Y$ acts by pullback $\phi^* f := f \circ \phi$ on
  functions and by pushforward
  $\langle \phi_* \mu, f \rangle := \langle \mu, \phi^* f \rangle$ on
  measures.
- $\langle \mu, f \rangle := \sum_i \lambda_i f(z_i)$ is the duality
  pairing between $F'(X)$ and $F(X)$.


**Definition (Cubes and co-cubes).** {#def:cubes-cocubes}
For $k \geq 1$ define:

- $CT_k(X; x) := \Map(\KP_+(k), E)$, the *tangent cubes* of order $k$;
  its coordinates are indexed by the nonempty subsets of $[k]$.
- $CT^k(X; x) := \Map(CT_k(X; x), \IR)$ is the space of *co-cubes* of
  order $k$.
- $CT_*(X; x) := \bigsqcup_{k \geq 0} CT_k(X; x)$, where
  $CT_0(X; x) := \set{0}$.
- $CT^0(X; x) := \Map(CT_0(X; x), \IR) \isom \IR$.
- $\CTH^*(X; x) := \Map(CT_*(X; x), \IR) = \prod_{k \geq 0} CT^k(X; x)$.
- $\Cube_k(X; x) := \set{q: \KP(k) \to X,\; q(\emptyset) = x}$ is the
  space of *geometric cubes* of order $k$ based at $x$.
- The values $c(\set{i})$ are the *legs* of $c \in CT_k(X; x)$; the values
  $c(A)$ with $|A| \geq 2$ are its *Möbius defects*.
- The affine cube $c = \Aff(v_1, \dots, v_k)$ is defined by
  $c(\set{i}) = v_i$ and $c(A) = 0$ for $|A| \geq 2$; a cube is *curved*
  if it is not affine.
- For $T \subseteq [k]$, the restriction $\del_T c := c|_{\KP_+(T)}$ is
  the *face* on $T$, regarded as a cube of order $|T|$ by increasing
  relabeling.
- $\langle \omega, c \rangle := \omega(c)$ is the evaluation pairing of
  $CT^k(X; x)$ with $CT_k(X; x)$, and of $\CTH^*(X; x)$ with $CT_*(X; x)$.

**Remark (Iterated tangent spaces).** The tangent cubes are literally the
fibers of iterated tangent spaces. If $X$ is open in an affine Banach space
with model space $E$, then $TX\isom X\times E$, and iteration gives
$T^kX\isom X\times\Map(\KP_+(k),E)$. Thus $T(TX)$ has coordinates
$(x,v_{\set{1}},v_{\set{2}},v_{\set{1,2}})$, and each further tangent step
adds a direction for every existing coordinate. The original basepoint
remains in $X$, while all other coordinates range over $E$; fixing that
basepoint at $x$ leaves precisely $CT_k(X;x)$. This viewpoint is presumably
classical; we learned it from Duarte and Torres [@DT2008].


### Cubes and forward differences


**Proposition (Boolean Möbius inversion).** {#prop:moebius}
Let $S$ be a finite set, $G$ an abelian group, and $a:\KP(S)\to G$. Define

$$
   (\zeta a)(T):=\sum_{R\subseteq T}a(R),
   \qquad
   (\mu a)(T):=\sum_{R\subseteq T}(-1)^{|T|-|R|}a(R).
$$

Then $\mu\circ\zeta=\zeta\circ\mu=\id$ on $\Map(\KP(S),G)$.

**Proof.**
The coefficient of $a(R)$ in $(\mu\zeta a)(T)$ is
$\sum_{R\subseteq U\subseteq T}(-1)^{|T|-|U|}
=(1-1)^{|T\setminus R|}=[R=T]$. The computation for $\zeta\mu$ is the
same.


**Corollary (Boolean sieve).** {#cor:sieve}
For $R\subseteq S$,
$\sum_{R\subseteq U\subseteq S}(-1)^{|S|-|U|}=[R=S]$.


**Definition (Zeta and Möbius transforms).** {#def:exp-log}
The *geometric realization* and the *tangent logarithm*

$$
   \zeta_x(c)(T) := x + \sum_{\emptyset \neq R \subseteq T} c(R),
   \qquad
   \mu_x(q)(T) := \sum_{R \subseteq T} (-1)^{|T| - |R|}\, (q(R) - x)
$$

are maps $\zeta_x: CT_k(X; x) \to \Cube_k(X; x)$ and
$\mu_x: \Cube_k(X; x) \to CT_k(X; x)$.


**Lemma (Zeta-Möbius inversion).** {#lem:exp-log}
$\zeta_x$ and $\mu_x$ are inverse bijections.


**Proof.**
Apply Boolean Möbius inversion [#prop:moebius] to the function
$T \mapsto q(T) - x$ on $\KP(k)$, which vanishes at $T = \emptyset$ for based
cubes.


**Definition (Forward difference).** {#def:pairing}
For $k \geq 1$ define:

- $\Delta(f; x; c) := \sum_{T \subseteq [k]} (-1)^{k - |T|}\,
  f(x+\sum_{\emptyset\neq R\subseteq T}c(R)) \in G$ is the *forward
  difference* of $f:X\to G$ along $c\in CT_k(X;x)$.
- For a finite family $(w_j)_{j\in J}$,
  $\Delta(f;x;(w_j)_{j\in J}):=
  \sum_{L\subseteq J}(-1)^{|J|-|L|}f(x+\sum_{j\in L}w_j)$.
- $\Delta(f; x; w_1, \dots, w_k)
  := \Delta(f; x; \Aff(w_1, \dots, w_k))$ is the difference along the
  affine cube with legs $w_1,\dots,w_k$.
- On the unique order-zero cube $0 \in CT_0(X; x)$, set
  $\Delta(f; x; 0) := f(x)$.
- $\Delta(\phi; x; c) \in F$ for $\phi: X \to Y$ and $k \geq 1$
  is defined by the same alternating sum in the translation space of $Y$.


**Remark.**
On affine cubes, $\Delta(f; x; v_1, \dots, v_r) = (\Delta_{v_1} \circ \cdots
\circ \Delta_{v_r} f)(x)$ is the classical iterated forward difference, where
$\Delta_v f := f(\cdot + v) - f(\cdot)$; the operators $\Delta_v$ commute.


**Proposition (Discrete Taylor duality).** {#prop:taylor-duality}
For $f: X \to G$ and $c \in CT_k(X; x)$, the functions
$T \mapsto \Delta(f; x; \del_T c)$ and $T \mapsto f(\zeta_x(c)(T))$ on $\KP(k)$
are Möbius and zeta transforms of each other:

$$
   f(\zeta_x(c)(T)) = \sum_{R \subseteq T} \Delta(f;\, x;\, \del_R c).
$$

For affine cubes this is Newton's formula
$f(x + \sum_{i \in T} v_i) = \sum_{R \subseteq T} \Delta(f; x; v_R)$.


**Proof.**
$\Delta(f; x; \del_T c)$ is by definition the Möbius transform of the vertex
function; invert with [#prop:moebius].


### Cubical pushforward


**Definition (Cubical pushforward, cf. [@DT2008] Sec. 3).** {#def:pushforward}
For a map $\phi: X \to Y$ define:

- $(\phi_* q)(T) := \phi(q(T))$ is the *geometric pushforward*
  $\phi_*: \Cube_k(X; x) \to \Cube_k(Y; y)$.
- $\Delta_+(\phi; x) := \mu_y \circ \phi_* \circ \zeta_x$ is the
  *cubical pushforward*
  $\Delta_+(\phi; x): CT_k(X; x) \to CT_k(Y; y)$.


**Lemma (Coordinates of the pushforward).** {#lem:coordinates}
For $\emptyset \neq T \subseteq [k]$,

$$
   \Delta_+(\phi;\, x;\, c)(T) = \Delta(\phi;\, x;\, \del_T c),
$$

and on affine cubes $\Delta_+(\phi;\, x;\, \Aff(v_1, \dots, v_k))(T) = \Delta(\phi;\, x;\, v_T)$,
where $v_T = (v_i)_{i \in T}$.


**Proof.**
$\mu_y(\phi_* \zeta_x c)(T) = \sum_{R \subseteq T} (-1)^{|T| - |R|}
(\phi(\zeta_x(c)(R)) - y)$; the terms $-y$ cancel since the coefficients sum to
zero, and $\zeta_x(c)(R)$ for $R \subseteq T$ depends only on $\del_T c$.


**Theorem (Exact functoriality).** {#thm:functoriality}
For arbitrary maps $\phi: X \to Y$, $\psi: Y \to Z$ and every $k \geq 1$,

$$
   \Delta_+(\psi \circ \phi;\, x) = \Delta_+(\psi;\, y) \circ \Delta_+(\phi;\, x),
   \qquad
   \Delta_+(\id_X;\, x) = \id.
$$


**Proof.**
$(\psi \circ \phi)_* = \psi_* \circ \phi_*$ holds vertexwise. Insert
$\zeta_y \circ \mu_y = \id$ [#lem:exp-log] between the two factors in
$\mu_z \circ \psi_* \circ \phi_* \circ \zeta_x$.


### Adjunctions

The cube measure records the forward difference as a pairing in
$F'(X)$ [#def:functions-measures].


**Definition (Cube measure).** {#def:cube-measure}
The *cube measure* of $c \in CT_k(X; x)$ is

$$
   \delta(x;\, c)
   := \sum_{T \subseteq [k]} (-1)^{k - |T|}\,
      \delta(x + {\textstyle\sum_{\emptyset \neq R \subseteq T}} c(R))
   \;\in\; F'(X).
$$

The forward difference is the pairing of a cube measure against an
observable:

$$
   \langle \delta(x;\, c),\, f \rangle = \Delta(f;\, x;\, c).
$$


**Theorem (Discrete adjunction).** {#thm:adjunction}
For arbitrary $\phi: X \to Y$, $f: Y \to G$, and $c \in CT_k(X; x)$,

$$
   \phi_*\, \delta(x;\, c) = \delta(y;\, \Delta_+(\phi;\, x)\, c),
   \qquad
   \Delta(\phi^* f;\, x;\, c) = \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, c).
$$


**Proof.**
By [#lem:exp-log], $\zeta_y(\Delta_+(\phi; x)c) = \phi_*(\zeta_x c)$;
the first identity follows vertexwise, the second by pairing against $f$.


Let $A$ be a Banach algebra and $f, g: X \to A$. The pointwise product $fg$
is again a function $X \to A$.


**Theorem (Discrete product rule).** {#thm:discrete-product-rule}
For arbitrary $f, g: X \to A$ and $c \in CT_k(X; x)$,

$$
   \Delta(fg;\, x;\, c)
   = \sum_{I \cup J = [k]} \Delta(f;\, x;\, \del_I c) \cdot \Delta(g;\, x;\, \del_J c),
$$

the sum over all ordered pairs $(I, J)$ of subsets with $I \cup J = [k]$, not
necessarily disjoint.


**Proof.**
By Taylor duality [#prop:taylor-duality],
$f(\zeta_x(c)(T)) = \sum_{I \subseteq T} \Delta(f; x; \del_I c)$ and similarly
for $g$. Multiply, insert into the alternating sum defining
$\Delta(fg; x; c)$, and exchange sums: the pair $(I, J)$ occurs for the
vertices $T \supseteq I \cup J$, with total coefficient
$\sum_{I \cup J \subseteq T \subseteq [k]} (-1)^{k - |T|} = [I \cup J = [k]]$
by the Boolean sieve [#cor:sieve].


### Affine reconstruction and Faà di Bruno


Let
$\Cov(k) := \set{\KC \subseteq \KP_+(k) : \bigcup \KC = [k]}$ be the set
of covers of $[k]$, and set
$\mathrm{wt}(\KC) := \sum_{A \in \KC} |A|$.

With respect to the difference pairing, a curved cube expands as a sum of
affine cubes indexed by covers.


**Proposition (Affine reconstruction).** {#prop:reconstruction}
For $f: X \to G$ and $c \in CT_k(X; x)$,

$$
   \Delta(f;\, x;\, c) = \sum_{\KC \in \Cov(k)} \Delta(f;\, x;\, (c(A))_{A \in \KC}).
$$


**Proof.**
Each vertex is a vertex of the affine cube on the index set $\KP_+(k)$ with
legs $(c(R))_{R \in \KP_+(k)}$: by Newton's formula [#prop:taylor-duality],

$$
   f(\zeta_x(c)(T)) = f(x + \sum_{R \in \KP_+(T)} c(R))
   = \sum_{\KH \subseteq \KP_+(T)} \Delta(f;\, x;\, (c(R))_{R \in \KH}).
$$

Insert this into the definition of $\Delta(f; x; c)$ and exchange sums: a
family $\KH \subseteq \KP_+(k)$ occurs in the term of $T$ exactly when
$\bigcup \KH \subseteq T$, so its total coefficient is
$\sum_{\bigcup \KH \subseteq T \subseteq [k]} (-1)^{k - |T|} = [\bigcup \KH = [k]]$
by the Boolean sieve [#cor:sieve]. Only covers survive.


**Corollary (Discrete Faà di Bruno, [@DFDB]).** {#cor:discrete-fdb}
For arbitrary maps $X \xrightarrow{\phi} Y \xrightarrow{f} G$ and
$v_1, \dots, v_k \in E$,

$$
   \Delta(f \circ \phi;\, x;\, v_1, \dots, v_k)
   = \sum_{\KC \in \Cov(k)} \Delta(f;\, y;\, (\Delta(\phi;\, x;\, v_A))_{A \in \KC}).
$$


**Proof.**
Let $c = \Aff(v_1, \dots, v_k)$. Combine the adjunction [#thm:adjunction], the
coordinate formula [#lem:coordinates], and affine reconstruction
[#prop:reconstruction]:
$\Delta(f \circ \phi; x; c) = \Delta(f; y; \Delta_+(\phi; x)c)
= \sum_{\KC} \Delta(f; y; (\Delta(\phi; x; v_A))_{A \in \KC})$.


**Remark.**
The coefficient systems and iterated covering formulas are developed in
[@DFDB]. The order-two formula is computed in
[#ex:cube-journey].


## Contravariant differences {#sec:contravariant-differences}

The cubical pushforward induces a pullback on co-cubes. Applied to cubical
jets, this gives the contravariant chain rule.

**Definition (Cubical jet).** {#def:cubical-jet}
For $f: X \to G$ define:

- $\Delta(f; x) := \Delta(f; x; -)$ is the *cubical jet* of $f$ at $x$.
- $\langle \Delta(f; x), c \rangle := \Delta(f; x; c)$ for
  $c \in CT_k(X; x)$; on $CT_0(X; x)$ its value is $f(x)$.


**Remark (Prolongation).**
By Taylor duality [#prop:taylor-duality], the cubical jet and the vertex
values of $f$ determine each other by Möbius inversion.


**Proposition (Prolongation, not quotient).** {#prop:no-quotient}
Let $F(X) = \Map(X, \IR)$ and let $I_x = \set{f : f(x) = 0}$ be the vanishing
ideal of $x$.

1) $I_x$ is idempotent, $I_x^2 = I_x$: the filtration by powers of $I_x$ is
   constant, and $F(X)/I_x^m = \IR$ for every $m \geq 1$.

2) The cubical jet is injective: the values of $\Delta(f;\, x)$ on cubes of
   order $\leq 1$ already determine $f$, via
   $f(x + v) = f(x) + \Delta(f;\, x;\, v)$.

**Proof.**
1) For $f \in I_x$ let $g \in I_x$ take the value $1$ away from $x$; then
$f = fg \in I_x^2$. 2) The order-zero value is $f(x)$, and the order-one
values are the increments $f(x + v) - f(x)$.


**Definition (Cubical pullback).** {#def:cubical-pullback}
For an arbitrary map $\phi: X \to Y$, the *cubical pullback* is precomposition
with the cubical pushforward,

$$
   \Delta^+(\phi;\, x): CT^k(Y; y) \lra CT^k(X; x),
   \qquad
   \Delta^+(\phi;\, x)\, \omega := \omega \circ \Delta_+(\phi;\, x).
$$

By construction, pushforward and pullback are adjoint under the evaluation
pairing,

$$
   \langle \Delta^+(\phi;\, x)\, \omega,\; c \rangle
   = \langle \omega,\; \Delta_+(\phi;\, x)\, c \rangle.
$$


**Theorem (Cubical jet pullback).** {#thm:cubical-jet-pullback}
For arbitrary maps $\phi: X \to Y$ and observables $f: Y \to G$,

$$
   \Delta(f \circ \phi;\, x) = \Delta^+(\phi;\, x)\, \Delta(f;\, y).
$$


**Proof.**
Evaluate on $c$: by the discrete adjunction [#thm:adjunction],
$\langle \Delta^+(\phi;\, x)\, \Delta(f;\, y),\; c \rangle
= \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, c) = \Delta(f \circ \phi;\, x;\, c)$.


**Theorem (Contravariant functoriality).** {#thm:cubical-functoriality}
For arbitrary maps $\phi: X \to Y$ and $\psi: Y \to Z$,

$$
   \Delta^+(\psi \circ \phi;\, x) = \Delta^+(\phi;\, x) \circ \Delta^+(\psi;\, y).
$$


**Proof.**
Precomposition reverses composition; apply exact functoriality
[#thm:functoriality].


**Proposition (The pullback is multiplicative).** {#prop:pullback-multiplicative}
$\Delta^+(\phi;\, x)$ is an algebra morphism for the pointwise product of
co-cubes.


**Proof.**
Precomposition with any map is multiplicative for pointwise products:
$(\omega \eta) \circ \Delta_+(\phi; x) = (\omega \circ \Delta_+(\phi; x))\,(\eta \circ \Delta_+(\phi; x))$.


## From differences to differentials {#sec:bridge}

Weighted collapse sends cubical probes to symmetric probes. It intertwines
the cubical and differential pushforwards and identifies collapsing cube
measures with point-supported distributions. We first introduce the smooth
row's spaces. The product, coproduct, and their adjunction are developed
where they are used, in
[#sec:covariant-differentials], [#sec:jets], and the appendix
[#sec:appendix-b].


**Definition (Symmetric tangent and cotangent spaces).** {#def:symmetric-spaces}
For $r, k \geq 0$ define:

- $\SYM^r(E)$ is the $r$-th algebraic symmetric power of $E$, with
  $\SYM^0(E) := \IR \cdot 1$.
- $ST_k(X; x) := \SYM_{\leq k}(T_x X)
  = \Vsum_{r=0}^{k} \SYM^r(T_x X)$ is the *symmetric tangent space* of
  order $k$.
- $ST_*(X; x) := \SYM(T_x X)$ is the symmetric tangent space of all orders.
- On the cotangent side, $\mathcal L_s^r(E;\IR)$ is the Banach space of
  continuous symmetric $r$-linear forms $E^r\to\IR$. Equivalently, it is
  the continuous dual of $\SYM^r(E)$ equipped with the symmetric projective
  tensor norm.
- $ST^k(X; x) := \Vsum_{r=0}^k \mathcal L_s^r(T_xX;\IR)$ is the *symmetric
  cotangent space* of order $k$. Symmetrized tensor product, truncated above
  degree $k$, makes it an algebra.
- $\STH^*(X; x) := \prod_{r \geq 0} \mathcal L_s^r(T_xX;\IR)$ is its degree
  completion. Its product is defined degreewise, so every coefficient is a
  finite sum.
- For $a\in\mathcal L_s^r(E;\IR)$ and $\xi\in\SYM^r(E)$, set
  $\langle a,\xi\rangle:=r!\,a(\xi)$, and pair distinct degrees by zero.
  This is the *permanent pairing* between $ST^k$ and $ST_k$, and between
  $\STH^*$ and $ST_*$. On decomposables,
  $\langle \ell_1 \cdots \ell_r, v_1 \cdots v_r \rangle
  = \sum_{\tau \in S_r} \prod_i \ell_i(v_{\tau(i)})$.
  We write $\langle -, - \rangle_E$ when needed.

Elements of $ST_k$ are called *probes*; monomials are written
$v_1 \cdots v_r$.


**Definition (Smooth functions and distributions).** {#def:smooth-distributions}
Let $X$ be finite-dimensional. Define:

- $\mathcal{E}(X) := C^\infty(X, \IR)$ with its standard Fréchet topology.
- $\mathcal{E}'(X) := \mathcal{E}(X)'$ is the space of compactly supported
  distributions.
- $\mathcal{E}'(X; x)$ is the space of distributions supported at $x$.
- $\mathcal{E}'(X; x)_{\leq k}$ is its subspace of distributions of order
  at most $k$.
- $\phi^* f := f \circ \phi$ is the pullback of smooth functions.
- $\langle \phi_* u, f \rangle := \langle u, \phi^* f \rangle$ is the
  pushforward of distributions.


**Lemma (Finitely supported measures are distributions).**
{#lem:measures-are-distributions}
Let $X$ be finite-dimensional. Restriction along
$\mathcal{E}(X) \subseteq F(X)$ embeds the finitely supported measures
into the distributions,
$F'(X) \mono \mathcal{E}'(X)$, as the distributions of order
$0$ with finite support. In particular every cube measure
$\delta(x;\, c)$ of [#def:cube-measure] is a distribution.


**Proof.**
Evaluation at a point is continuous on $\mathcal{E}(X)$ and extends to
$C^0(X, \IR)$, so $\mu = \sum_i \lambda_i\, \delta(z_i)$ defines a
distribution of order $0$ supported in the finite set $\set{z_i}$; the
map is injective since the $\delta(z_i)$ are linearly independent as
functionals on $\mathcal{E}(X)$.


### Weighted collapse {#sec:differential}


The passage to differential calculus stays inside the cubical world: the cube
is collapsed onto its basepoint with the weight $t^{|A|}$ on the coordinate
$c(A)$. This section provides the analytic lemma governing the collapse and
the resulting partition formula.


**Lemma (Weight bound).** {#lem:weight-bound}
For $k\geq1$, every $\KC \in \Cov(k)$ satisfies
$\mathrm{wt}(\KC) \geq k$, with equality
if and only if $\KC \in \Part(k)$.


**Proof.**
$\sum_{A \in \KC} |A| \geq |\bigcup \KC| = k$, with equality iff the blocks
are pairwise disjoint.


**Lemma (Iterated fundamental theorem).** {#lem:ftc}
Let $\phi$ be $C^r$ on an open set $U \subseteq X$, and let $x \in U$ and
$u_1, \dots, u_r \in E$ be such that the parallelotope
$x + [0,1] u_1 + \dots + [0,1] u_r$ lies in $U$. Then

$$
   \Delta(\phi;\, x;\, u_1, \dots, u_r)
   = \int_{[0,1]^r} D(\phi;\, x + {\textstyle\sum_i} \theta_i u_i;\, u_1, \dots, u_r) \; d\theta.
$$


**Proof.**
Set $g(\theta) := \phi(x + \sum_i \theta_i u_i)$ on $[0,1]^r$. Since the
parametrization is affine, $g$ is $C^r$ with
$\del_{\theta_1} \cdots \del_{\theta_r} g(\theta) = D(\phi; x + \sum_i \theta_i u_i; u_1, \dots, u_r)$.
For a continuous Banach-space-valued function, the fundamental theorem of
calculus in one variable and Fubini give, one variable at a time,
$\int_{[0,1]^r} \del_1 \cdots \del_r g \, d\theta
= \sum_{T \subseteq [r]} (-1)^{r - |T|} g(1_T)$, the alternating sum over the
corners of the cube, which is $\Delta(\phi; x; u_\bullet)$.


**Corollary (Difference asymptotics).** {#cor:asymptotics}
Let $\phi$ be $C^k$ near $x$ and $R > 0$.

1) For $1 \leq r \leq k$, $t_1, \dots, t_r \in \IR$, and
   $\|u_j\| \leq R$,

$$
   \Delta(\phi;\, x;\, t_1 u_1, \dots, t_r u_r)
   = t_1 \cdots t_r ( D(\phi; x; u_1, \dots, u_r) + \eta(t, u) ),
$$

   where $\sup_{\|u_j\| \leq R} \|\eta(t, u)\| \to 0$ as $\max_j |t_j| \to 0$.

2) For $r > k$ there are $\rho > 0$ and $K < \infty$ such that for all
   $w_1, \dots, w_r \in E$ with $\|w_j\| \leq \rho$ and every $k$-element
   subset $M \subseteq [r]$,

$$
   \|\Delta(\phi;\, x;\, w_1, \dots, w_r)\| \;\leq\; K \prod_{j \in M} \|w_j\|.
$$


**Proof.**
1) By [#lem:ftc] with directions $t_j u_j$ and multilinearity of the
$r$-th derivative, the difference equals
$t_1 \cdots t_r \int D(\phi; x + \sum_j \theta_j t_j u_j; u_\bullet)\, d\theta$,
and $\|\eta\| \leq R^r \sup_{\xi} \|D^r(\phi; \xi) - D^r(\phi; x)\|$, the supremum
over $\xi$ in a ball that shrinks to $x$; conclude by continuity of $D^r(\phi; \cdot)$
at $x$.

2) Since $\Delta$ is symmetric in its directions we may take $M = [k]$. The
commuting operator factorization
$\Delta_{w_1} \cdots \Delta_{w_r} = (\prod_{j > k} \Delta_{w_j}) (\prod_{j \leq k} \Delta_{w_j})$
expands into

$$
   \Delta(\phi;\, x;\, w_1, \dots, w_r)
   = \sum_{T \subseteq \set{k+1, \dots, r}} (-1)^{r - k - |T|}\,
     \Delta(\phi;\, x + w_T;\, w_1, \dots, w_k),
   \qquad w_T := \sum_{j \in T} w_j.
$$

For $\rho$ small enough, all basepoints $x + w_T$ and their attached
parallelotopes lie in a fixed ball $B$ on which $\phi$ is $C^k$ with
$\sup_B \|D^k\phi\| =: M_k < \infty$; by [#lem:ftc], each summand is bounded
by $M_k \prod_{j \leq k} \|w_j\|$, and there are $2^{r - k}$ summands. Take
$K = 2^{r-k} M_k$.


**Definition (Weighted rescaling).** {#def:rescaling}
For $t \in \IR$ and $c \in CT_k(X; x)$, set $(\lambda_t c)(A) := t^{|A|} c(A)$.
Then $\lambda_t \Aff(v_1, \dots, v_k) = \Aff(t v_1, \dots, t v_k)$ and
$\del_T \lambda_t = \lambda_t \del_T$.


**Theorem (Collapse and partition formula).** {#thm:collapse}
Let $k\geq1$ and let $\phi$ be $C^k$ near $x$. For every
$c\in CT_k(X;x)$, the limit

$$
   D^\square(\phi;\,x;\,c)
   :=\lim_{t\to0}t^{-k}\Delta(\phi;\,x;\,\lambda_t c)
$$

exists uniformly as $c$ ranges over bounded subsets of $CT_k(X;x)$, and

$$
   D^\square(\phi;\,x;\,c)
   =\sum_{\pi\in\Part(k)}D(\phi;\,x;\,(c(A))_{A\in\pi}).
$$

The right side is a continuous function of $c$, and on affine cubes
$D^\square(\phi;x;\Aff(v_1,\dots,v_k))=D(\phi;x;v_1,\dots,v_k)$.


**Proof.**
Fix $R$ with $\|c\| \leq R$. For small $t$ all vertices of $\lambda_t c$ lie
in the domain of $\phi$. By [#lem:coordinates] and affine reconstruction
[#prop:reconstruction],

$$
   t^{-k}\Delta(\phi;\,x;\,\lambda_t c)
   =t^{-k}\sum_{\KC\in\Cov(k)}
     \Delta(\phi;\,x;\,(t^{|A|}c(A))_{A\in\KC}).
$$

Consider a cover $\KC$ with $r := |\KC|$ blocks. If $r \leq k$, part 1 of
[#cor:asymptotics] with $t_A := t^{|A|}$, $u_A := c(A)$ gives

$$
   \Delta(\phi;\, x;\, (t^{|A|} c(A))_{A \in \KC})
   = t^{\mathrm{wt}(\KC)} ( D(\phi; x; (c(A))_{A \in \KC}) + \eta_\KC(t) ),
$$

with $\eta_\KC(t) \to 0$ uniformly for $\|c\| \leq R$. If $r > k$, then
$\KC$ contains a block of size $\geq 2$: the blocks are distinct nonempty
subsets of $[k]$ and there are only $k<r$ singletons. Choose a
$k$-element subset $M \subseteq \KC$ containing such a block; then
$\sum_{A \in M} |A| \geq k + 1$, and part 2 of [#cor:asymptotics] bounds
the term by $K R^k t^{k+1}$.

Divide by $t^k$. Covers with $r > k$ are $O(t)$. Covers with $r \leq k$
carry $t^{\mathrm{wt}(\KC)-k}$ with $\mathrm{wt}(\KC) \geq k$
[#lem:weight-bound]; those of weight $>k$ vanish in the limit with bounded
cofactor, and the partitions, exactly the covers of weight $k$
[#lem:weight-bound], converge to their leading term. All estimates are
uniform for $\|c\| \leq R$. Each summand is a bounded multilinear
expression in $c$, whence continuity. For affine cubes only the partition
into singletons contributes.


**Definition (Cubical differential).** {#def:cubical-differential}
For $\phi \in C^k$ near $x$, the *cubical differential pushforward* is the
map $D^\square_+(\phi;x):CT_k(X;x)\to CT_k(Y;y)$ defined by

$$
   D^\square_+(\phi;\,x;\,c)(T)
   :=D^\square(\phi;\,x;\,\del_Tc),
   \qquad \emptyset\neq T\subseteq[k].
$$

Its top coordinate is the cubical differential of [#thm:collapse]. For
observables, set $D^\square(f;x;\del_\emptyset c):=f(x)$.


**Theorem (Differential functoriality).** {#thm:differential-functoriality}
For $\phi$ $C^k$ near $x$ and $\psi$ $C^k$ near $y$,

$$
   D^\square_+(\psi \circ \phi;\, x) = D^\square_+(\psi;\, y) \circ D^\square_+(\phi;\, x).
$$


**Proof.**
It suffices to prove the top coordinate; applying it to each face gives the
remaining coordinates. Fix $c\in CT_k(X;x)$ and set
$c_t(A):=t^{-|A|}\Delta_+(\phi;x;\lambda_t c)(A)$. Then
$\Delta_+(\phi;x;\lambda_t c)=\lambda_t c_t$, and [#thm:collapse] applied
to each face gives $c_t\to c':=D^\square_+(\phi;x)c$. In particular,
$(c_t)$ is bounded. Exact functoriality [#thm:functoriality] gives

$$
   t^{-k}\Delta(\psi\circ\phi;\,x;\,\lambda_t c)
   =t^{-k}\Delta(\psi;\,y;\,\lambda_t c_t).
$$

By the uniformity in [#thm:collapse] applied to $\psi$ at $y$, the right side
differs from $\sum_{\pi \in \Part(k)} D(\psi;y;(c_t(A))_{A\in\pi})$
by a quantity tending to $0$, and by continuity of the partition expression
this sum converges to $D^\square(\psi;y;c')$.


### The symbol map {#sec:symbol}


The cubical differential depends on the cube only through a symmetric-algebra
element. The symbol map makes this exact and transfers the calculus to
$\SYM_{\leq k}$.


**Definition (Symbol map).** {#def:symbol}
The *symbol map* is

$$
   \sigma_k: CT_k(X; x) \to ST_k(X; x),
   \qquad
   \sigma_k(c) := \sum_{\pi \in \Part(k)} \prod_{A \in \pi} c(A),
$$

where the products are taken in the symmetric algebra. On affine cubes,
$\sigma_k(\Aff(v_1,\dots,v_k))=v_1\cdots v_k$.


**Lemma (Spanning).** {#lem:spanning}
For every $1 \leq r \leq k$ and $v_1, \dots, v_r \in E$, the product
$v_1 \cdots v_r$ lies in the image of $\sigma_k$. Consequently the image of
$\sigma_k$, together with $1$, spans $ST_k(X; x)$.


**Proof.**
Choose a partition $[k] = B_1 \sqcup \dots \sqcup B_r$ into nonempty blocks
and let $c(B_j) := v_j$ and $c(A) := 0$ for all other $A$. A partition
$\pi \in \Part(k)$ contributes to $\sigma_k(c)$ only if all its blocks lie
in $\set{B_1, \dots, B_r}$, which forces $\pi = \set{B_1, \dots, B_r}$; hence
$\sigma_k(c) = v_1 \cdots v_r$.


**Proposition (Symbol factorization).** {#prop:symbol-factorization}
For $f \in C^k(X, G)$ near $x$ and $c \in CT_k(X; x)$,

$$
   D^\square(f;\, x;\, c) = D(f;\, x;\, \sigma_k(c)).
$$


**Proof.**
The top-coordinate partition formula [#thm:collapse] reads
$D^\square(f; x; c) = \sum_\pi D(f; x; (c(A))_{A \in \pi})$, which is the
extended pairing evaluated at $\sigma_k(c)$.


**Theorem (Symbol intertwining).** {#thm:intertwining}
For $\phi$ $C^k$ near $x$,

$$
   \sigma_k \circ D^\square_+(\phi;\, x) \;=\; D_+(\phi;\, x) \circ \sigma_k
   \;:\; CT_k(X; x) \lra ST_k(Y; y).
$$


**Proof.**
By the partition formula [#thm:collapse],

$$
   \sigma_k(D^\square_+(\phi; x)\, c)
   = \sum_{\pi \in \Part(k)} \prod_{A \in \pi} \;
     \sum_{\rho_A \in \Part(A)} D(\phi; x; (c(B))_{B \in \rho_A}).
$$

Expanding the product, the index data is a pair $(\pi, (\rho_A)_{A \in \pi})$
with $\rho_A \in \Part(A)$. Such pairs correspond bijectively to pairs
$(\rho, \KQ)$ of a partition $\rho \in \Part(k)$ and a partition $\KQ$ of
the block set of $\rho$: put $\rho := \bigsqcup_{A \in \pi} \rho_A$ and
$\KQ := \set{\rho_A : A \in \pi}$; conversely $\pi = \set{\bigcup Q : Q \in \KQ}$.
Under this bijection the term of $(\pi, (\rho_A))$ equals
$\prod_{Q \in \KQ} D(\phi; x; (c(B))_{B \in Q})$. On the other side, by
[#def:symmetric-pushforward] applied to the product of the $|\rho|$ vectors
$(c(B))_{B \in \rho}$,

$$
   D_+(\phi;\, x;\, \sigma_k(c))
   = \sum_{\rho \in \Part(k)} \; \sum_{\KQ \in \Part(\rho)} \;
     \prod_{Q \in \KQ} D(\phi; x; (c(B))_{B \in Q}).
$$

The two sums agree term by term.


**Proposition (Contravariant collapse).** {#prop:contravariant-collapse}
Let $f$ be $C^k$ near $x$ and $c \in CT_k(X; x)$. Then

$$
   \lim_{t \to 0}t^{-k}\langle\Delta(f;\,x),\lambda_t c\rangle
   =D(f;\,x;\,\sigma_k(c)):
$$

the top Möbius coordinate of the cubical jet converges to its differential
pairing.


**Proof.**
Apply the collapse theorem [#thm:collapse] and symbol factorization
[#prop:symbol-factorization].


**Remark.**
In the language of the smooth jets of [#sec:jets], the right side is the
pairing $\langle t(x;\, f),\, \sigma_k(c) \rangle$ [#lem:jet-pairing]:
the Taylor coefficients of $f$ are the leading asymptotics of its cubical
jet.


### Higher symbols {#sec:higher-symbols}

For a fixed cube $c\in CT_k(X;x)$ and observable $f$, consider the collapse
function

$$
   t\longmapsto \Delta(f;x;\lambda_t c).
$$

The symbol $\sigma_k(c)$ gives its leading Taylor coefficient: by
[#thm:collapse] and [#prop:symbol-factorization], the function vanishes to
order $k$ and begins with $t^kD(f;x;\sigma_k(c))$. The same cover calculus
computes every Taylor coefficient before pairing with $f$.

**Definition (Higher symbols).** {#def:higher-symbols}
For a cover $\KC$ and multiplicities $\nu:\KC\to\IN_{>0}$, set
$\mathrm{wt}(\nu):=\sum_{A\in\KC}|A|\nu_A$ and $\nu!:=\prod_{A\in\KC}\nu_A!$.
For $m\geq0$, define

$$
   \sigma_{k,m}(c)
   := \sum_{\KC\in\Cov(k)}
      \sum_{\substack{\nu:\KC\to\IN_{>0}\\
                       \mathrm{wt}(\nu)=k+m}}
      \frac{1}{\nu!}\prod_{A\in\KC}c(A)^{\nu_A}
   \in ST_{k+m}(X;x).
$$

Thus $\nu_A$ records how many times the direction $c(A)$ occurs, and the
weight $\mathrm{wt}(\nu)$ records its power of $t$. Minimal weight forces
$\sigma_{k,0}=\sigma_k$: only partitions with every multiplicity equal to
one contribute.

**Theorem (Curved collapse).** {#thm:higher-symbol-expansion}
Let $M\geq0$ and let $f$ be $C^{k+M}$ near $x$. There is a residual
$R_{k,M}(f;x;c,t)$ such that

$$
   \Delta(f;x;\lambda_t c)
   = \sum_{m=0}^{M}t^{k+m}D(f;x;\sigma_{k,m}(c))
   + t^{k+M}R_{k,M}(f;x;c,t).
$$

For every bounded $B\subseteq CT_k(X;x)$, the residual satisfies
$\sup_{c\in B}\|R_{k,M}(f;x;c,t)\|\to0$ as $t\to0$.

**Proof.**
Affine reconstruction [#prop:reconstruction] writes
$\Delta(f;x;\lambda_t c)$ exactly as the sum, over
$\KC\in\Cov(k)$, of the affine differences
$\Delta(f;x;(t^{|A|}c(A))_{A\in\KC})$. For a fixed cover $\KC$, expand
this difference as its alternating sum over $J\subseteq\KC$ and apply
Taylor's formula at $x$, with Peano remainder, to
$f(x+\sum_{A\in J}t^{|A|}c(A))$.

In the Taylor polynomial, the multinomial indexed by
$\nu:\KC\to\IN_0$ has coefficient $1/\nu!$ and contributes
$t^{\mathrm{wt}(\nu)}D(f;x;\prod_{A\in\KC}c(A)^{\nu_A})$. Its coefficient
in the alternating sum is
$\sum_{\operatorname{supp}\nu\subseteq J\subseteq\KC}
(-1)^{|\KC|-|J|}=[\operatorname{supp}\nu=\KC]$ by the Boolean sieve
[#cor:sieve]. Hence precisely the multiplicities $\nu_A>0$ survive.

Since $\KC$ covers $[k]$, the weight $\mathrm{wt}(\nu)$ is at least $k$.
Grouping the surviving terms of weights $k,k+1,\dots,k+M$ gives
$\sigma_{k,0},\dots,\sigma_{k,M}$. The remaining terms in the finite
Taylor polynomial are $O(t^{k+M+1})$, and the Peano remainders are
$o(t^{k+M})$, uniformly for $c$ in bounded sets. Dividing their sum by
$t^{k+M}$ defines $R_{k,M}$ and proves the claim.


**Corollary (Affine collapse).** {#cor:affine-collapse}
Let $n\geq k$, let $f$ be $C^n$ near $x$, and $v_1,\dots,v_k\in E$. With the
multi-index notation $v^\nu:=v_1^{\nu_1}\cdots v_k^{\nu_k}$,
$\nu!:=\nu_1!\cdots \nu_k!$, and $\mathrm{wt}(\nu)=\nu_1+\dots+\nu_k$,
the higher symbols of the affine cube specialize to

$$
   \sigma_{k,m}(\Aff(v_1,\dots,v_k))
   =\sum_{\substack{\nu\in\IN_0^k,\ \nu_i>0\\ \mathrm{wt}(\nu)=k+m}}
      \frac{1}{\nu!}\, v^\nu,
$$

and the collapse expansion reads

$$
   \Delta(f;x;tv_1,\dots,tv_k)
   =\sum_{\substack{\nu\in\IN_0^k,\ \nu_i>0\\ \mathrm{wt}(\nu)\leq n}}
      \frac{t^{\mathrm{wt}(\nu)}}{\nu!}\, D(f;x;v^\nu)
   \;+\; t^{n}R(t),
   \qquad R(t)\to0.
$$

For $k=1$ this is the Taylor formula. In general, the
constraint $\nu_i>0$ keeps exactly the Taylor monomials that depend on
all $k$ directions: the iterated difference annihilates every other term.

**Proof.**
All nonsingleton coordinates of $\Aff(v_1,\dots,v_k)$ vanish, so in
[#def:higher-symbols] only the cover by singletons contributes, and the
multiplicity function becomes a multi-index $\nu\in\IN_0^k$ with
$\nu_i>0$ and weight $\mathrm{wt}(\nu)=\nu_1+\dots+\nu_k$. Substitute
into [#thm:higher-symbol-expansion] with $M=n-k$ and group by
$\mathrm{wt}(\nu)=k+m$.


**Remark (Möbius inversion and the Taylor formula).**
The affine collapse is the Möbius transform of the multivariate Taylor
formula: vertex values are the sums of the face differences
[#prop:moebius]. Applying this once to [#cor:affine-collapse] merges a
face $T$ and a multi-index $\nu\in\IN_{>0}^T$ into an arbitrary
$\nu\in\IN_0^S$ with $T=\operatorname{supp}\nu$, and gives

$$
   f(x+t\,{\textstyle\sum_{i\in S}}v_i)
   =\sum_{\substack{\nu\in\IN_0^S\\ \mathrm{wt}(\nu)\leq n}}
      \frac{t^{\mathrm{wt}(\nu)}}{\nu!}\, D(f;x;v^\nu)
   \;+\; o(t^{n}),
$$

the multivariate Taylor formula with Peano remainder.


### Distributional collapse

Recall the distributions $\mathcal{E}'(X)$ and the point-supported
distributions $\mathcal{E}'(X; x)$ with their order filtration from
[#def:smooth-distributions]. By
[#lem:measures-are-distributions], every cube measure is a distribution.


**Theorem (Structure of point-supported distributions, [@hormander1983analysis], Theorem 2.3.4).** {#thm:schwartz-structure}
The map $\xi \mapsto \delta(x; \xi)$ defined by

$$
   \langle \delta(x; \xi),\, f \rangle := D(f;\, x;\, \xi),
   \qquad f \in \mathcal{E}(X),
$$

is a linear isomorphism $ST_k(X; x) \xrightarrow{\;\sim\;} \mathcal{E}'(X; x)_{\leq k}$
between the symmetric tangent space and the distributions of order
$\leq k$ supported in $\set{x}$. In particular
$\delta(x; 1) = \delta(x)$ is evaluation at $x$.


The convergence in the collapse theorem can now be stated distributionally.


**Corollary (Distributional collapse).** {#cor:distributional-collapse}
For $c \in CT_k(X; x)$, the rescaled cube measures converge weakly in
$\mathcal{E}'(X)$, that is, pointwise on $\mathcal{E}(X)$:

$$
   \frac{1}{t^k}\, \delta(x;\, \lambda_t c) \;\xrightarrow[t \to 0]{}\; \delta(x;\, \sigma_k(c)).
$$

The left side is a finitely supported measure; the right side is a point
distribution in $\mathcal{E}'(X; x)$.


**Proof.**
For every $f \in \mathcal{E}(X)$,
$t^{-k} \langle \delta(x; \lambda_t c), f \rangle = t^{-k} \Delta(f; x; \lambda_t c)
\to D(f; x; \sigma_k(c)) = \langle \delta(x; \sigma_k(c)), f \rangle$ by
[#thm:collapse] and [#prop:symbol-factorization].


**Remark.**
Discretely, probes are the finitely supported measures $\delta(x; c)$ and
$\Delta_+$ is their pushforward [#thm:adjunction]; after collapse,
probes are the point distributions $\delta(x; \xi)$ and $D_+$ is their
pushforward [#thm:distribution-pushforward]. The symbol map records the
collapse of the former onto the latter. Pairing with observables gives the
dual statement: Newton's exact finite expansion converges degreewise to the
corresponding Taylor jet. For affine cubes, the higher symbols identify the
repeated-direction Taylor coefficients [#cor:affine-collapse].


## Covariant differentials {#sec:covariant-differentials}

The differential $D(\phi; x)$ extends uniquely to a coalgebra morphism
$D_+(\phi; x)$ on symmetric probes. We establish its functoriality,
adjunction, product rule, and realization as pushforward of point-supported
distributions.

### Symmetric probes and pushforward

The symmetric tangent space $ST_k(X; x)$ [#def:symmetric-spaces] carries,
besides the truncated symmetric product
$\xi \cdot \eta := \pi_{\leq k}(\xi \eta)$, a coproduct.


**Definition (Coproduct).** {#def:coproduct}
The *coproduct* on $ST_k(X; x)$ is the linear map
$\Delta^{\times}: ST_k(X; x) \to ST_k(X; x) \tensor ST_k(X; x)$ with
$\Delta^{\times}(1) = 1 \tensor 1$ and

$$
   \Delta^{\times}(v_1 \cdots v_r) := \sum_{I \sqcup J = [r]} v_I \tensor v_J,
   \qquad v_\emptyset := 1,
$$

where $v_I := \prod_{i \in I} v_i$; the right side is symmetric and
multilinear, so $\Delta^{\times}$ is well defined.


The truncated product and the coproduct are paired structures on
$ST_k(X; x)$: truncation makes it an algebra quotient and the degree
filtration makes it a subcoalgebra. We do not regard the truncated space as
a bialgebra. The untruncated bialgebra and the coalgebra facts used below are
collected in the appendix [#sec:appendix-b].


**Definition (Differential).** {#def:differential}
Let $\phi: X \to Y$ be $C^k$ near $x$.

- The *differential* of $\phi$ at $x$ is the linear map
  $D(\phi; x): ST_k(X; x) \to T_y Y$ defined on monomials by the Fréchet
  derivatives,

$$
   D(\phi;\, x;\, v_1 \cdots v_r) := D^r(\phi; x; v_1, \dots, v_r),
   \qquad 1 \leq r \leq k,
$$

  and $D(\phi; x; 1) := 0$. It collects the derivatives of all orders
  into a single linear map, landing in degree one on the target.
- For an observable $f: X \to G$ the same formula defines the
  *differential pairing* $D(f; x): ST_k(X; x) \to G$, with the
  degree-zero convention $D(f; x; s \cdot 1) := s\, f(x)$.


**Definition (Symmetric pushforward).** {#def:symmetric-pushforward}
For $\phi$ $C^k$ near $x$, the *symmetric pushforward*
$D_+(\phi; x): ST_k(X; x) \to ST_k(Y; y)$ is the linear map with
$D_+(\phi; x; 1) := 1$ and

$$
   D_+(\phi;\, x;\, v_1 \cdots v_r) := \sum_{\pi \in \Part(r)} \prod_{A \in \pi} D(\phi;\, x;\, v_A),
   \qquad 1 \leq r \leq k.
$$

The right side is symmetric and multilinear in $(v_1, \dots, v_r)$, so it
defines a linear map on $\SYM^r(E)$.


**Proposition (Coalgebra property).** {#prop:coalgebra}
$D_+(\phi; x)$ is a coalgebra morphism:

$$
   \Delta^{\times} \circ D_+(\phi; x)
   = (D_+(\phi; x) \tensor D_+(\phi; x)) \circ \Delta^{\times}.
$$


**Proof.**
Evaluate on $v_1\cdots v_r$ and set $w_A:=D(\phi;x;v_A)$. Applying
$\Delta^{\times}$ to each partition term splits its block set:

$$
   \Delta^{\times}(D_+(v_1\cdots v_r))
   =\sum_{\pi\in\Part(r)}\ \sum_{\pi=\pi_1\sqcup\pi_2}
     \prod_{A\in\pi_1}w_A\tensor\prod_{A\in\pi_2}w_A.
$$

The data $(\pi,\pi_1,\pi_2)$ correspond bijectively to
$(I\sqcup J=[r],\pi_1\in\Part(I),\pi_2\in\Part(J))$, with
$I=\bigcup\pi_1$ and $J=\bigcup\pi_2$. The resulting sum is
$\sum_{I\sqcup J}D_+(v_I)\tensor D_+(v_J)
=(D_+\tensor D_+)\Delta^{\times}(v_1\cdots v_r)$.


**Corollary (Coalgebra lift).** {#prop:coalgebra-lift}
$D_+(\phi;x)$ is the unique coalgebra morphism
$ST_k(X;x)\to ST_k(Y;y)$ whose degree-one component is the differential
$D(\phi;x)$.


**Proof.**
The coalgebra property is [#prop:coalgebra]. Uniqueness follows from the
truncated coalgebra-lift corollary [#cor:coalgebra-lift], applied to
$D(\phi;x)$; its partition expansion is [#def:symmetric-pushforward].


### Functoriality, adjunction, and Faà di Bruno


**Corollary (Smooth functoriality).** {#cor:smooth-functoriality}
For $\phi$ $C^k$ near $x$ and $\psi$ $C^k$ near $y$,

$$
   D_+(\psi \circ \phi;\, x) = D_+(\psi;\, y) \circ D_+(\phi;\, x).
$$


**Proof.**
The identity is transported across the bridge, where the cubical differential
$D^\square_+$ carries the functoriality. On $\sigma_k(c)$, combine
[#thm:intertwining] with [#thm:differential-functoriality]:
$D_+(\psi \circ \phi; x)\,\sigma_k(c) = \sigma_k(D^\square_+(\psi \circ \phi; x)c)
= \sigma_k(D^\square_+(\psi; y)\, D^\square_+(\phi; x)c)
= D_+(\psi; y)\, D_+(\phi; x)\, \sigma_k(c)$. Both sides are linear, fix $1$,
and the image of $\sigma_k$ together with $1$ spans [#lem:spanning].


**Theorem (Smooth adjunction).** {#thm:smooth-adjunction}
For $\phi$ $C^k$ near $x$, $f \in C^k(Y, G)$ near $y$, and
$\xi \in ST_k(X; x)$,

$$
   D(\phi^* f;\, x;\, \xi) = D(f;\, y;\, D_+(\phi;\, x)\, \xi).
$$


**Proof.**
Both sides are linear in $\xi$ and agree at $\xi = 1$. For $\xi = \sigma_k(c)$
the computation crosses back to the bridge, routing through the cubical
differential $D^\square$: apply symbol factorization to $f \circ \phi$,
differential functoriality with $\psi = f$ (a $C^k$ map into the Banach
space $G$), symbol factorization for $f$ at $y$, and the intertwining:

$$
   D(\phi^* f; x; \sigma_k(c)) = D^\square(f \circ \phi;\, x;\, c)
   = D^\square(f;\, y;\, D^\square_+(\phi; x)c)
   = D(f;\, y;\, \sigma_k(D^\square_+(\phi; x)c))
   = D(f;\, y;\, D_+(\phi; x)\,\sigma_k(c)).
$$

Conclude by [#lem:spanning].


**Corollary (Partition Faà di Bruno, [@Fraenkel1978] [@CS1996]).** {#cor:partition-fdb}
For $\phi$, $f$ as above and $v_1, \dots, v_k \in E$,

$$
   D(f \circ \phi;\, x;\, v_1, \dots, v_k)
   = \sum_{\pi \in \Part(k)} D(f;\, y;\, (D(\phi;\, x;\, v_A))_{A \in \pi}).
$$


**Proof.**
Apply smooth functoriality [#cor:smooth-functoriality] to $\psi = f$, a $C^k$
map into the Banach space $G$, evaluate at $v_1 \cdots v_k$, and compare
degree-one components. By [#def:symmetric-pushforward], the degree-one
component of $D_+(f;\, y;\, \eta)$ is $D(f;\, y;\, \eta)$ for $\eta$ of pure
positive degree: the left side contributes $D(f \circ \phi;\, x;\, v_1 \cdots v_k)$,
the right side the partition sum.


**Remark (Proof dependencies).**
The proof of the partition formula uses the discrete Faà di Bruno identity
[#cor:discrete-fdb], the iterated fundamental theorem [#lem:ftc], and the
continuity statement in the collapse theorem [#thm:collapse]. It does not
invoke a prior higher chain rule. Alternatively, the smooth pushforward and
its functoriality follow from the coalgebra-lift uniqueness
[#cor:coalgebra-lift] together with the classical Faà di Bruno formula.


### Product rule {#sec:products}


**Proposition (Algebra behavior of the pushforward).** {#prop:algebra-behavior}
Let $\phi$ be $C^k$ near $x$.
$D_+(\phi; x)$ is an algebra morphism for the truncated symmetric product
if and only if $D^r(\phi; x)=0$ for $2\leq r\leq k$; in that case
$D_+(\phi; x)=\SYM_{\leq k}(D(\phi; x))$.


**Proof.**
If $D^r(\phi; x) = 0$ for $2 \leq r \leq k$, only the partition into
singletons survives in [#def:symmetric-pushforward], and
$D_+(v_1 \cdots v_r) = \prod_i D(\phi; x; v_i)$ is multiplicative. Conversely,
suppose $D_+$ is multiplicative and induct on $r$: comparing
$D_+(v_1 v_2) = D(\phi; x; v_1) \cdot D(\phi; x; v_2) + D(\phi; x; v_1, v_2)$ with
$D_+(v_1)D_+(v_2)$ forces $D^2(\phi; x) = 0$ by polarization; for the step,
all partitions with a block of size $2, \dots, r-1$ drop out by the induction
hypothesis, and comparing with $D_+(v_1) \cdots D_+(v_r)$ leaves
$D(\phi; x; v_1, \dots, v_r) = 0$.


**Theorem (Smooth product rule).** {#thm:smooth-product-rule}
For $f, g \in C^k(X, A)$ near $x$ and $v_1, \dots, v_k \in E$, the higher
Leibniz rule holds:

$$
   D(fg;\, x;\, v_1 \cdots v_k)
   = \sum_{I \sqcup J = [k]} D(f;\, x;\, v_I) \cdot D(g;\, x;\, v_J).
$$


**Proof.**
Apply the discrete product rule [#thm:discrete-product-rule] to the affine
cube $\Aff(t v_1, \dots, t v_k)$ and divide by $t^k$. By the difference
asymptotics [#cor:asymptotics], $\Delta(f;\, x;\, t v_I) = t^{|I|}(D(f;\, x;\, v_I) + o(1))$
and likewise for $g$, including the cases $I = \emptyset$ with value $f(x)$;
the left side is $t^{-k}\, \Delta(fg;\, x;\, t v_1, \dots, t v_k) \to
D(fg;\, x;\, v_1 \cdots v_k)$. A pair with $I \cap J \neq \emptyset$ carries
$t^{|I| + |J|} = t^{k + |I \cap J|}$ and vanishes after division; the disjoint
pairs converge to the product of the limits, multiplication being continuous
on $A$.


### Distributions {#sec:distributions}

**Definition (Point distributions).** {#def:point-distributions}
For $\xi \in ST_k(X; x)$, the *point distribution* $\delta(x; \xi)$ is the
linear functional

$$
   \langle \delta(x; \xi),\, f \rangle := D(f;\, x;\, \xi),
   \qquad f \in C^k(X, \IR),
$$

so $\delta(x; 1) = \delta(x)$ is evaluation at $x$. For $\phi$ $C^k$ near $x$,
the *pushforward* of such a functional is defined by
$\langle \phi_* u, f \rangle := \langle u, \phi^* f \rangle$; this is well
defined since $\phi^* f$ is again $C^k$ near $x$ [@FDB]. The same
formulas apply to vector-valued test functions $f \in C^k(X, G)$.


**Remark (Sign-free basis).**
The basis $\delta(x; \xi)$ is sign-free [#thm:schwartz-structure]: it
represents the operator datum $\xi$ directly rather than through
$\del^\alpha \delta(x) = (-1)^{|\alpha|} \delta(x; e^\alpha)$-type
conventions; in one direction, $\del_v \delta(x) = -\delta(x; v)$.


**Theorem (Distribution pushforward).** {#thm:distribution-pushforward}
For $\phi$ $C^k$ near $x$ and $\xi \in ST_k(X; x)$,

$$
   \phi_*\, \delta(x; \xi) \;=\; \delta(y;\, D_+(\phi;\, x)\, \xi).
$$


**Proof.**
$\langle \phi_* \delta(x; \xi), f \rangle = D(\phi^* f; x; \xi)
= D(f; y; D_+(\phi; x)\xi) = \langle \delta(y; D_+(\phi; x)\xi), f \rangle$
by the smooth adjunction [#thm:smooth-adjunction].


**Proposition (Filtration and principal symbol).** {#prop:principal-symbol}
$D_+(\phi; x)$ preserves the degree filtration
$ST_r(X; x) \subseteq ST_k(X; x)$, and on the associated graded it
is the multiplicative extension of the first derivative:

$$
   \gr_r\, D_+(\phi;\, x) = \SYM^r(D(\phi; x)) : \SYM^r(E) \lra \SYM^r(F).
$$


**Proof.**
A partition $\pi \in \Part(r)$ contributes in degree $|\pi| \leq r$, with
equality only for the partition into singletons, whose term is
$\prod_i D(\phi; x; v_i)$.


## Contravariant differentials {#sec:jets}

The differential pullback acts on completed symmetric cotangent spaces. We
define it degreewise as the adjoint of $D_+$, then identify its action on
linear forms with Taylor expansion and prove the multiplicative extension.

### The symmetric cotangent space and its pairing

The completed symmetric cotangent space
$\STH^*(X;x)=\prod_{r\geq0}\mathcal L_s^r(E;\IR)$ and the permanent pairing
$\langle a,\xi\rangle=r!\,a(\xi)$ are defined in
[#def:symmetric-spaces]. Its symmetric product is given on homogeneous forms
by

$$
   (a \cdot b)(v_1, \dots, v_{r+s})
   := \frac{1}{(r+s)!} \sum_{\tau \in S_{r+s}} a(v_{\tau(1)}, \dots, v_{\tau(r)})\; b(v_{\tau(r+1)}, \dots, v_{\tau(r+s)}).
$$


**Remark (Polynomial evaluation).**
The factorial normalization makes the permanent pairing agree with ordinary
polynomial evaluation. If $a=\sum_{r=0}^k a_r$ represents
$p_a(x+v):=\sum_{r=0}^k a_r(v,\dots,v)$, then, with
$\exp(v):=\sum_{r\geq0}v^r/r!$,
$p_a(x+v)=\langle a,\exp(v)\rangle$. Thus evaluation at $x+v$ is represented
on the symmetric tangent side by the exponential probe $\exp(v)$.


Products of linear forms span $\mathcal L_s^r(E;\IR)$ in finite dimensions.
In infinite dimensions they form the finite-type subspace, which may be
proper. The definitions below therefore use continuous symmetric forms
directly.


**Lemma (Separation).** {#lem:separation}
The pairing separates forms: if $\alpha\in\STH^*(X;x)$ pairs to zero with
every $\xi\in ST_*(X;x)$, then $\alpha=0$.


**Proof.**
Degreewise, $\langle \alpha_r,\, v^r \rangle = r!\, \alpha_r(v, \dots, v)$
for $v \in E$, and a symmetric multilinear form vanishing on the diagonal
vanishes, by polarization.


**Lemma (Product and coproduct are adjoint).** {#lem:product-coproduct}
For $\alpha,\beta\in\STH^*(X;x)$ and $\xi\in ST_*(X;x)$,

$$
   \langle \alpha\cdot\beta,\xi\rangle
   = \langle \alpha \tensor \beta,\, \Delta^{\times}(\xi) \rangle.
$$


**Proof.**
Bilinearity reduces to $\alpha \in \mathcal L_s^r(E;\IR)$,
$\beta \in \mathcal L_s^s(E;\IR)$,
$\xi = v_1 \cdots v_n$ with $n = r + s$. In the defining sum of the
symmetric product, the permutations $\tau$ carrying $\{\tau(1), \dots, \tau(r)\}$
to a fixed $r$-set $I$ number $r!\, s!$, so
$\langle \alpha \cdot \beta, v_1 \cdots v_n \rangle
= n! \, (\alpha \cdot \beta)(v_\bullet)
= r!\, s! \sum_{|I| = r} \alpha(v_I)\, \beta(v_J)
= \sum_{I \sqcup J = [n]} \langle \alpha, v_I \rangle \langle \beta, v_J \rangle$,
which is the right side by [#def:coproduct].


### Differential pullback

**Definition (Pullback).** {#def:pullback}
Let $\phi:X\to Y$ be smooth near $x$, with $\phi(x)=y$, and let
$\alpha=(\alpha_q)_{q\geq0}\in\STH^*(Y;y)$. Define
$D^+(\phi;x)\alpha\in\STH^*(X;x)$ degreewise by

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
$D^+(\phi;x):\STH^*(Y;y)\to\STH^*(X;x)$ is well defined.


**Proposition (Pushforward-pullback adjunction).** {#thm:pushforward-pullback-adjunction}
For $\alpha\in\STH^*(Y;y)$ and $\xi\in ST_*(X;x)$,

$$
   \langle D^+(\phi;\,x)\alpha,\xi\rangle_E
   =\langle\alpha,D_+(\phi;\,x)\xi\rangle_F.
$$


**Proof.**
For $\xi=v_1\cdots v_r$, the permanent pairing and [#def:pullback] give
$\langle D^+(\phi;x)\alpha,v_1\cdots v_r\rangle_E
=r!\,(D^+(\phi;x)\alpha)_r(v_1,\dots,v_r)$; the factor $r!$ cancels the
$1/r!$ in the definition, leaving
$\langle\alpha,D_+(\phi;x;v_1\cdots v_r)\rangle_F$. The result follows for
every $\xi\in ST_*(X;x)$ by linearity.


**Proposition (The pullback is an algebra morphism).** {#prop:pullback-algebra}
$D^+(\phi;x)$ is a unital algebra morphism on the completed symmetric
cotangent algebra.


**Proof.**
Pair with $\xi\in ST_*(X;x)$. By the product-coproduct adjunction
[#lem:product-coproduct], the defining adjunction, and the coalgebra property
of $D_+$ [#prop:coalgebra],

$$
   \langle D^+(\alpha\beta),\xi\rangle
   =\langle\alpha\tensor\beta,\Delta^\times D_+\xi\rangle
   =\langle D^+\alpha\tensor D^+\beta,\Delta^\times\xi\rangle
   =\langle D^+\alpha\cdot D^+\beta,\xi\rangle.
$$

Separation [#lem:separation] gives multiplicativity. The same argument with
$1$ gives unitality.


**Corollary (Taylor pullback on generators).** {#cor:pullback-linear-forms}
For $\ell\in F^*$, let $\ell_y(z):=\ell(z-y)$. Then

$$
   D^+(\phi;\,x;\,\ell)
   =\sum_{r\geq1}\frac{1}{r!}\,\ell\circ D^r(\phi;x),
$$

the full Taylor expansion at $x$ of the centered observable
$\ell_y\circ\phi$. Consequently,

$$
   D^+(\phi;\,x)(\ell_1\cdots\ell_q)
   =\prod_{i=1}^q\left(
      \sum_{r\geq1}\frac{1}{r!}\,\ell_i\circ D^r(\phi;x)
     \right).
$$


**Proof.**
In degree $r$, pairing with $\ell$ selects the degree-one part of
$D_+(\phi;x;v_1\cdots v_r)$, namely the term indexed by the one-block
partition. This gives the Taylor coefficient
$\frac1{r!}\ell\circ D^r(\phi;x)$. The product formula follows from
[#prop:pullback-algebra].


**Remark (Completion).**
In finite dimensions, $\STH^*(Y;y)$ is the degree completion of the free
symmetric algebra on $F^*$. Each $D^+(\phi;x;\ell)$ has zero constant term,
so a product of $q$ generators begins in degree $q$. The generator formula
therefore induces compatible maps on every degree truncation and extends
uniquely to a degree-continuous algebra morphism on $\STH^*(Y;y)$. In
infinite dimensions, products of linear forms need not exhaust the
continuous symmetric forms; the degreewise definition [#def:pullback]
defines $D^+$ on the full completion.


### Functoriality


**Theorem (Contravariant functoriality).** {#thm:contravariant-functoriality}

$$
   D^+(\psi \circ \phi;\, x) = D^+(\phi;\, x) \circ D^+(\psi;\, y).
$$


**Proof.**
For every $\xi$, by the adjunction [#thm:pushforward-pullback-adjunction]
and smooth functoriality [#cor:smooth-functoriality],

$$
   \langle D^+(\psi \circ \phi;\, x)\, \alpha,\, \xi \rangle
   = \langle \alpha,\, D_+(\psi;\, y;\, D_+(\phi;\, x;\, \xi)) \rangle
   = \langle D^+(\phi;\, x)\, D^+(\psi;\, y)\, \alpha,\, \xi \rangle;
$$

conclude by separation [#lem:separation].


**Remark (Bialgebra structure).**
The pullback $D^+$ is an algebra morphism and the pushforward $D_+$ is a
coalgebra morphism. The failure of the opposite compatibilities is measured
by the higher derivatives of $\phi$.


### Jets and the Taylor realization

Jet pullback is defined formally on quotients by powers of the maximal ideal.
The Taylor map realizes these quotients on symmetric cotangent spaces and
identifies the formal pullback with $D^+$. Throughout this subsection $X$ is
finite-dimensional.


**Definition (Maximal ideal, jets, completion).** {#def:smooth-jet}

- $\mathfrak{m}_x := \set{f \in \mathcal{E}(X) : f(x) = 0}$ is the
  *maximal ideal* of $x$.
- The *$k$-jet space* at $x$ is the quotient algebra
  $\mathcal{E}_k(X; x) := \mathcal{E}(X) / \mathfrak{m}_x^{k+1}$;
  the *$k$-jet* of $f \in \mathcal{E}(X)$ is its class
  $\hat{f} \in \mathcal{E}_k(X; x)$, classically written $j^k_x f$.
  The stage is carried by the space and inferred from context.
- $\hat{\mathcal{E}}(X; x) := \varprojlim_k\, \mathcal{E}_k(X; x)$
  is the *completion of the functions at $x$*, with the hat map
  $f \mapsto \hat{f}$ and the projective limit topology.
- $\langle \hat{f}, u \rangle := u(f)$, where $f \in \mathcal{E}(X)$ is
  any lift of $\hat{f}$, defines a bilinear pairing between
  $\hat{\mathcal{E}}(X; x)$ and $\mathcal{E}'(X; x)$
  [#def:smooth-distributions].


**Proposition (Duality of completed functions and point distributions).** {#prop:jet-distribution-duality}
The pairing $\langle \hat{f}, u \rangle = u(f)$ is well-defined and
induces an isomorphism
$\mathcal{E}'(X; x) \xrightarrow{\sim} \hat{\mathcal{E}}(X; x)'$.


**Proof.**
Well-definedness: a point-supported distribution has finite order, and if
$u$ has order $\leq k$ it vanishes on $\mathfrak{m}_x^{k+1}$: such
functions are flat to order $k$ at $x$ by the Leibniz rule, and flat
functions are $C^k$-approximable by functions vanishing near $x$
[@hormander1983analysis], Theorem 2.3.3; so $u$ factors through the
quotient $\mathcal{E}(X) / \mathfrak{m}_x^{k+1}$.
Injectivity: if $u \neq 0$ then $u(f) \neq 0$ for some $f$.
Surjectivity: a continuous functional on
$\hat{\mathcal{E}}(X; x) = \varprojlim_k \mathcal{E}(X) / \mathfrak{m}_x^{k+1}$
factors through some finite stage; composing with the quotient map gives
a distribution on $\mathcal{E}(X)$ that vanishes on $\mathfrak{m}_x^{k+1}$,
hence is supported in $\set{x}$, since a function vanishing near $x$ lies
in every power of $\mathfrak{m}_x$, and has order $\leq k$.


**Proposition (Formal functoriality).** {#prop:formal-functoriality}
For every smooth $\phi: X \to Y$ with $\phi(x) = y$, the pullback
$\phi^*$ satisfies $\phi^*\, \mathfrak{m}_y \subseteq \mathfrak{m}_x$ and
hence $\phi^*\, \mathfrak{m}_y^{k+1} \subseteq \mathfrak{m}_x^{k+1}$: it
descends to algebra morphisms $\mathcal{E}_k(Y; y) \to \mathcal{E}_k(X; x)$
and $\hat{\phi}^*: \hat{\mathcal{E}}(Y; y) \to \hat{\mathcal{E}}(X; x)$ with

$$
   \widehat{f \circ \phi} = \hat{\phi}^*\, \hat{f},
   \qquad
   \widehat{(\psi \circ \phi)}^{\,*} = \hat{\phi}^* \circ \hat{\psi}^*.
$$


**Proof.**
$f(y) = 0$ implies $f(\phi(x)) = 0$, and $\phi^*$ is multiplicative, so
the ideal containments hold and the quotient maps exist; functoriality is
that of $\phi^*$.


**Definition (Taylor map).** {#def:taylor-map}
For $f\in C^\infty(X,\IR)$, its Taylor expansion at $x$ is

$$
   t(x;\,f):=\sum_{r\geq0}\frac{1}{r!}\,D^r(f;x)\in\STH^*(X;x).
$$

Its order-$k$ Taylor polynomial is the truncation $\pi_{\leq k}t(x;f)$.


**Lemma (Jet pairing).** {#lem:jet-pairing}
$\langle t(x;\, f),\, \xi \rangle = D(f;\, x;\, \xi)$ for $f \in C^k(X, \IR)$
and $\xi \in ST_k(X; x)$.


**Proof.**
Degreewise, $r! \cdot \frac{1}{r!} D(f; x; \xi_r) = D(f; x; \xi_r)$.


**Lemma (Jet realization).** {#lem:jet-realization}
For $\alpha = \sum_r \alpha_r \in ST^k(X; x)$, the polynomial
$p_\alpha(x+v):=\sum_{r=0}^k\alpha_r(v,\dots,v)$ satisfies
$t(x;\, p_\alpha) = \alpha$. In particular the Taylor map $t(x;\, -)$
is surjective.


**Proof.**
The $r$-th derivative at $v = 0$ of the $s$-homogeneous term vanishes for
$r \neq s$ and equals $r!\, \alpha_r$ for $r = s$, by polarization.


**Proposition (Jets are multiplicative).** {#prop:jet-morphism}
$t(x;\, fg) = \pi_{\leq k}(t(x;\, f) \cdot t(x;\, g))$ for
$f, g \in C^k(X, \IR)$.


**Proof.**
In degree $n \leq k$, as in the proof of [#lem:product-coproduct],

$$
   \sum_{r+s=n} (\frac{1}{r!} D^r(f; x) \cdot \frac{1}{s!} D^s(g; x))(v_1, \dots, v_n)
   = \frac{1}{n!} \sum_{I \sqcup J = [n]} D(f; x; v_I)\, D(g; x; v_J),
$$

which equals $\frac{1}{n!} D(fg; x; v_1, \dots, v_n)$ by the Leibniz rule
[#thm:smooth-product-rule].


**Proposition (Taylor realization).** {#thm:taylor-realization}
On $\mathcal{E}(X)$ the Taylor map $t(x;\, -)$ is an algebra morphism
onto $ST^k(X; x)$ with kernel $\mathfrak{m}_x^{k+1}$; it descends to an
isomorphism of algebras

$$
   \mathcal{E}_k(X; x) \;\xrightarrow{\;\sim\;}\; ST^k(X; x),
   \qquad
   \hat{f} \longmapsto t(x;\, f).
$$


**Proof.**
Multiplicativity is [#prop:jet-morphism], and surjectivity is the jet
realization [#lem:jet-realization] on the smooth polynomials $p_\alpha$.
The kernel consists of the functions flat to order $k$ at $x$: all
derivatives of order $\leq k$ vanish. Flatness is a differential
condition, membership in $\mathfrak{m}_x^{k+1}$ an algebraic one; the
two inclusions need separate arguments.
$\mathfrak{m}_x^{k+1} \subseteq \ker t(x;\, -)$: a derivative of order
$\leq k$ of a product of $k + 1$ functions vanishing at $x$ leaves, in
each Leibniz term, at least one factor undifferentiated.
$\ker t(x;\, -) \subseteq \mathfrak{m}_x^{k+1}$ is Hadamard's lemma
iterated: writing $f$ by Taylor's formula with integral remainder, a
smooth function flat to order $k$ at $x$ is a sum of products of $k + 1$
coordinate functions centered at $x$ with smooth coefficients, hence
lies in $\mathfrak{m}_x^{k+1}$ [@nestruev2020smooth]. This step uses
smoothness and the finite dimension of $X$.


**Corollary (Realization of the completion and its dual).** {#cor:completion-realization}
The stagewise isomorphisms assemble to an isomorphism of algebras

$$
   \hat{\mathcal{E}}(X; x) = \varprojlim_k\, \mathcal{E}_k(X; x)
   \;\xrightarrow{\;\sim\;}\;
   \varprojlim_k\, ST^k(X; x) = \STH^*(X; x),
   \qquad
   \hat{f} \longmapsto t(x;\, f),
$$

the interface of the smooth ladder in the introduction. Under it and the
structure isomorphism $ST_k(X; x) \isom \mathcal{E}'(X; x)_{\leq k}$
[#thm:schwartz-structure], the formal duality of
[#prop:jet-distribution-duality] becomes the permanent pairing:

$$
   \langle \hat{f},\, \delta(x;\, \xi) \rangle
   = D(f;\, x;\, \xi)
   = \langle t(x;\, f),\, \xi \rangle,
   \qquad \xi \in ST_k(X; x).
$$


**Proof.**
The isomorphisms [#thm:taylor-realization] commute with the quotient maps
$\mathcal{E}_{k+1}(X; x) \to \mathcal{E}_k(X; x)$ and the truncations
$\pi_{\leq k}$, so they induce an isomorphism of the limits. The pairing
identity is the definition of the point distribution
[#def:point-distributions] together with the jet pairing
[#lem:jet-pairing].


**Theorem (Jet pullback).** {#prop:jet-pullback}
For $\phi$ $C^k$ near $x$ and $f \in C^k(Y, \IR)$,

$$
   t(x;\, f \circ \phi) = D^+(\phi;\, x)\; t(y;\, f),
$$

and $D^+(\phi; x)$ is the unique linear map with this property: under
the Taylor realization [#thm:taylor-realization], the formal pullback
$\mathcal{E}_k(Y; y) \to \mathcal{E}_k(X; x)$ of
[#prop:formal-functoriality] becomes the operator
$D^+(\phi;\, x)$.


**Proof.**
Pair with $\xi \in ST_k(X; x)$: by the jet pairing [#lem:jet-pairing], the
smooth adjunction [#thm:smooth-adjunction], and the pushforward-pullback
adjunction [#thm:pushforward-pullback-adjunction],
$\langle t(x;\, f \circ \phi),\, \xi \rangle = D(\phi^* f;\, x;\, \xi)
= D(f;\, y;\, D_+(\phi;\, x)\, \xi) = \langle t(y;\, f),\, D_+(\phi;\, x)\, \xi \rangle
= \langle D^+(\phi;\, x)\, t(y;\, f),\, \xi \rangle$; conclude by separation
[#lem:separation]. Uniqueness follows from surjectivity of the Taylor map
at $y$ [#lem:jet-realization].


**Remark (Formal and explicit pullback).**
Formal jet pullback is ideal-theoretic and classical. The Taylor realization
identifies it with the explicit operator $D^+$ on the symmetric cotangent
algebra.


## Exhibits {#sec:exhibits}


### Gallery {#sec:appendix-summary}

Throughout, $X, Y, Z$ are affine spaces over real Banach spaces $E, F, G$,
with maps and basepoints

$$
   X \xrightarrow{\;\phi\;} Y \xrightarrow{\;\psi\;} Z,
   \qquad
   y = \phi(x),
   \qquad
   z = \psi(y);
$$

observables $f, g$ take values in a Banach space, or in a Banach algebra
where they are multiplied, and the order $k \geq 1$ is fixed. Smooth
formulas assume maps and observables $C^k$ near the basepoints at which
they are evaluated; discrete formulas assume no regularity. For a
tuple $v_1, \dots, v_k$ and $A \subseteq [k]$ we write
$v_A := \prod_{i \in A} v_i$; differentials and differences are
overloaded by the type of their argument, so no order superscripts
appear. The spaces and the two ladder diagrams are introduced in the
introduction; the interface maps and operators are constructed in the body.
Here we collect the formulas and adjunctions proved there.

The four sectors, with their model spaces, operators, and pairings, and
the formal and total spaces they realize:

<!--web-->

| |**Discrete covariant** $\Delta_+$|**Discrete contravariant** $\Delta^+$|**Differential covariant** $D_+$|**Differential contravariant** $D^+$|
|---|---|---|---|---|
| **Model spaces** | $CT_*(X; x)$ | $\CTH^*(X; x)$ | $ST_*(X; x)$ | $\STH^*(X; x)$ |
| **Operators** | $\Delta_+(\phi; x)$ | $\Delta^+(\phi; x)$ | $D_+(\phi; x)$ | $D^+(\phi; x)$ |
| **Pairing** | $\langle \omega, c \rangle = \omega(c)$ | | $\langle a, \xi \rangle = r!\, a(\xi)$ | |
| | | | | |
| **Formal spaces** | | | $\mathcal{E}'(X; x)$ | $\hat{\mathcal{E}}(X; x)$ |
| **Operators** | | | $\phi_*$ | $\hat{\phi}^*$ |
| **Pairing** | | | $\langle \hat{f}, u \rangle = u(f)$ | |
| | | | | |
| **Total spaces** | $F'(X)$ | $F(X)$ | $\mathcal{E}'(X)$ | $\mathcal{E}(X)$ |
| **Operators** | $\phi_*$ | $\phi^*$ | $\phi_*$ | $\phi^*$ |
| **Pairing** | $\langle \mu, f \rangle = \sum \lambda_i f(z_i)$ | | $\langle u, f \rangle$ | |

<!--/web-->

<!--print-->

$$
\small
\begin{array}{l|ll|ll}
 & \multicolumn{2}{c|}{\textbf{Discrete}} & \multicolumn{2}{c}{\textbf{Differential}} \\
 & \textrm{covariant} & \textrm{contravariant} & \textrm{covariant} & \textrm{contravariant} \\
\hline
\textrm{Model spaces} & CT_*(X; x) & \CTH^*(X; x) & ST_*(X; x) & \STH^*(X; x) \\
\textrm{Operators} & \Delta_+(\phi; x) & \Delta^+(\phi; x) & D_+(\phi; x) & D^+(\phi; x) \\
\textrm{Pairing} & \langle \omega, c \rangle = \omega(c) & & \langle a, \xi \rangle = r!\, a(\xi) & \\[8pt]
\textrm{Formal spaces} & & & \mathcal{E}'(X; x) & \hat{\mathcal{E}}(X; x) \\
\textrm{Operators} & & & \phi_* & \hat{\phi}^* \\
\textrm{Pairing} & & & \langle \hat{f}, u \rangle = u(f) & \\[8pt]
\textrm{Total spaces} & F'(X) & F(X) & \mathcal{E}'(X) & \mathcal{E}(X) \\
\textrm{Operators} & \phi_* & \phi^* & \phi_* & \phi^* \\
\textrm{Pairing} & \langle \mu, f \rangle = \textstyle\sum \lambda_i f(z_i) & & \langle u, f \rangle &
\end{array}
$$

<!--/print-->

**The four operators**. The cubical pushforward is given coordinatewise by
face differences, the cubical pullback by precomposition:

$$
   \Delta_+(\phi;\, x;\, c)(T) = \Delta(\phi;\, x;\, \del_T c),
   \qquad
   \Delta^+(\phi;\, x)\, \omega = \omega \circ \Delta_+(\phi;\, x).
$$

The smooth operators are determined by their values on monomials:

$$
   D_+(\phi;\, x)(v_1 \cdots v_k)
   = \sum_{\pi \in \Part(k)} \prod_{A \in \pi} D(\phi;\, x;\, v_A),
$$

$$
   D^+(\phi;\, x)(\ell_1 \cdots \ell_q)
   = \sum_{\substack{r \in \IN_{>0}^q \\ |r| \leq k}} \frac{1}{r!}
     \prod_{i=1}^{q} \ell_i \circ D^{r_i}(\phi;\, x),
   \qquad r! := \prod_i r_i!.
$$

**Structure morphisms**. The pullbacks preserve products, while the smooth
pushforward preserves the coproduct:

$$
   \Delta^+(\phi;\, x)(\omega\eta)
   = \Delta^+(\phi;\, x)(\omega) \cdot \Delta^+(\phi;\, x)(\eta),
$$

$$
   D^+(\phi;\, x)(a \cdot b) = D^+(\phi;\, x)(a) \cdot D^+(\phi;\, x)(b),
   \qquad
   \Delta^{\times} \circ D_+(\phi;\, x) = (D_+(\phi;\, x) \tensor D_+(\phi;\, x)) \circ \Delta^{\times}.
$$

**Functoriality**. Pushforwards preserve composition and pullbacks reverse it:

$$
   \Delta_+(\psi \circ \phi;\, x) = \Delta_+(\psi;\, y) \circ \Delta_+(\phi;\, x),
   \qquad
   \Delta^+(\psi \circ \phi;\, x) = \Delta^+(\phi;\, x) \circ \Delta^+(\psi;\, y),
$$

$$
   D_+(\psi \circ \phi;\, x) = D_+(\psi;\, y) \circ D_+(\phi;\, x),
   \qquad
   D^+(\psi \circ \phi;\, x) = D^+(\phi;\, x) \circ D^+(\psi;\, y).
$$

**Adjunctions**. Pullback is adjoint to pushforward in both sectors:

$$
   \langle \Delta^+(\phi;\, x)\, \omega,\; c \rangle
   = \langle \omega,\; \Delta_+(\phi;\, x)\, c \rangle,
   \qquad
   \Delta(f \circ \phi;\, x;\, c) = \Delta(f;\, y;\, \Delta_+(\phi;\, x)\, c),
$$

$$
   \langle D^+(\phi;\, x)\, \alpha,\; \xi \rangle
   = \langle \alpha,\; D_+(\phi;\, x)\, \xi \rangle,
   \qquad
   D(f \circ \phi;\, x;\, \xi) = D(f;\, y;\, D_+(\phi;\, x)\, \xi).
$$

**Realizations**. Cube measures and cubical jets realize the discrete
operators; point-supported distributions and Taylor series realize the
smooth operators:

$$
   \phi_*\, \delta(x;\, c) = \delta(y;\, \Delta_+(\phi;\, x)\, c),
   \qquad
   \Delta(f \circ \phi;\, x) = \Delta^+(\phi;\, x)\, \Delta(f;\, y),
$$

$$
   \phi_*\, \delta(x;\, \xi) = \delta(y;\, D_+(\phi;\, x)\, \xi),
   \qquad
   t(x;\, f \circ \phi) = D^+(\phi;\, x)\; t(y;\, f).
$$

**Product rules**. On affine probes:

$$
   \Delta(fg;\, x;\, v_1, \dots, v_k)
   = \sum_{I \cup J = [k]} \Delta(f;\, x;\, v_I) \cdot \Delta(g;\, x;\, v_J),
$$

$$
   D(fg;\, x;\, v_1 \cdots v_k)
   = \sum_{I \sqcup J = [k]} D(f;\, x;\, v_I) \cdot D(g;\, x;\, v_J).
$$

**Faà di Bruno formulas**. On affine probes:

$$
   \Delta(f \circ \phi;\, x;\, v_1, \dots, v_k)
   = \sum_{\KC \in \Cov(k)} \Delta(f;\, y;\, (\Delta(\phi;\, x;\, v_A))_{A \in \KC}),
$$

$$
   D(f \circ \phi;\, x;\, v_1 \cdots v_k)
   = \sum_{\pi \in \Part(k)} D(f;\, y;\, {\textstyle\prod_{A \in \pi}}\, D(\phi;\, x;\, v_A)).
$$

**Collapse junction**. Let $\phi$ and $f$ be $C^k$ near $x$. The symbol map
is the junction between the discrete and smooth calculi: paired against an
observable, the rescaled difference converges to the corresponding
differential [#thm:collapse], [#prop:symbol-factorization],

$$
   \lim_{t \to 0}\; t^{-k}\, \Delta(f;\, x;\, \lambda_t c)
   = D(f;\, x;\, \sigma_k(c)).
$$


### An Order-Two Cube under Pushforward and Collapse {#ex:cube-journey}

Fix an arbitrary map $\phi:X\to Y$ with $y=\phi(x)$ and directions
$v_1,v_2\in E$. At order two, the pushforward, affine reconstruction,
weighted collapse, and symbol map can all be written explicitly.

*The image of a parallelogram.* The affine probe
$\Aff(v_1, v_2)$ at $x$ has vertices $x$, $x + v_1$, $x + v_2$,
$x + v_1 + v_2$ and vanishing defect. Its pushforward
$c := \Delta_+(\phi;\, x)\, \Aff(v_1, v_2)$ [#def:pushforward] is
the vertexwise image, re-read in Möbius coordinates
[#lem:coordinates]:

$$
   c_1 = \Delta(\phi;\, x;\, v_1),
   \qquad
   c_2 = \Delta(\phi;\, x;\, v_2),
   \qquad
   c_{12} = \Delta(\phi;\, x;\, v_1, v_2).
$$

The legs are the image increments, and the defect
$c_{12} = \phi(x + v_1 + v_2) - \phi(x + v_1) - \phi(x + v_2) + \phi(x)$
measures the failure of the four image points to close a
parallelogram: an arbitrary map does not preserve affinity, and the
pushforward records this failure without any regularity assumption.

*Affine reconstruction.* Pair an observable $f: Y \to \IR$ against
the curved image. Affine reconstruction [#prop:reconstruction]
expands the curved pairing over the five covers of $[2]$:

$$
   \Delta(f;\, y;\, c)
   = \Delta(f;\, y;\, c_1, c_2)
   + \Delta(f;\, y;\, c_{12})
   + \Delta(f;\, y;\, c_1, c_{12})
   + \Delta(f;\, y;\, c_2, c_{12})
   + \Delta(f;\, y;\, c_1, c_2, c_{12}).
$$

Together with the adjunction
$\Delta(f \circ \phi;\, x;\, v_1, v_2) = \Delta(f;\, y;\, c)$
[#thm:adjunction], this is the covering Faà di Bruno formula
[#cor:discrete-fdb] at order two. It has five cover terms at finite
scale; after collapse, the smooth formula has two partition terms.

*Collapse.* Now let $\phi$ be $C^2$ near $x$ and $f$ be $C^2$
near $y$, and rescale the source probe, $v_i \mapsto t v_i$. The
image coordinates have the scales given by [#cor:asymptotics]: the
legs are first differences and the defect is a second difference.

$$
   \Delta(\phi;\, x;\, t v_i) = t\, ( D(\phi;\, x;\, v_i) + o(1) ),
   \qquad
   \Delta(\phi;\, x;\, t v_1, t v_2)
   = t^2 ( D(\phi;\, x;\, v_1, v_2) + o(1) ),
$$

so after weighted rescaling the image cube converges to the cube
$c'$ with legs $D(\phi;\, x;\, v_i)$ and defect
$D(\phi;\, x;\, v_1, v_2)$. Each cover term of the reconstruction
scales with its weight:

| cover | weight | order | role |
|---|---|---|---|
| $\set{\set{1}, \set{2}}$ | 2 | $t^2$ | principal partition term |
| $\set{\set{1,2}}$ | 2 | $t^2$ | principal partition term |
| $\set{\set{1}, \set{1,2}}$ | 3 | $t^3$ | first correction |
| $\set{\set{2}, \set{1,2}}$ | 3 | $t^3$ | first correction |
| $\set{\set{1}, \set{2}, \set{1,2}}$ | 4 | $t^4$ | higher error |

By [#lem:weight-bound], the covers of weight two are exactly the
partitions. After division by $t^2$, these terms remain and the three
terms of higher weight converge to zero. The weight-three pair gives
the first correction [#thm:higher-symbol-expansion].

*The symbol.* The two survivors assemble into the symmetric
algebra: by the collapse theorem [#thm:collapse],

$$
   \lim_{t \to 0}\; t^{-2}\, \Delta(f \circ \phi;\, x;\, t v_1, t v_2)
   = D(f;\, y;\, c'_1 c'_2) + D(f;\, y;\, c'_{12})
   = D(f;\, y;\, \sigma_2(c')),
$$

with $\sigma_2(c') = c'_1 c'_2 + c'_{12}$ [#def:symbol].
Substituting the limits,

$$
   \sigma_2(c')
   = D(\phi;\, x;\, v_1) \cdot D(\phi;\, x;\, v_2)
   + D(\phi;\, x;\, v_1 v_2)
   = D_+(\phi;\, x;\, v_1 v_2)
$$

[#def:symmetric-pushforward]. This is the intertwining
[#thm:intertwining] at order two: the collapsed cubical pushforward is
the symmetric pushforward. The limit identity is the partition Faà di
Bruno formula [#cor:partition-fdb],

$$
   D(f \circ \phi;\, x;\, v_1 v_2)
   = D(f;\, y;\, D(\phi;\, x;\, v_1) \cdot D(\phi;\, x;\, v_2))
   + D(f;\, y;\, D(\phi;\, x;\, v_1 v_2)).
$$

*The lower-degree correction.* The Möbius defect measures the failure of the
image vertices to form an affine parallelogram. Under collapse it converges
to $D(\phi;x;v_1,v_2)$, the degree-one summand of
$D_+(\phi;x;v_1v_2)$. Pairing this summand with $D(f;y)$ gives the
lower-degree term $D(f;y;D(\phi;x;v_1,v_2))$ in the second-order chain rule.
The Laplace and stencil exhibits below show how inverse pushforward turns
these lower-degree terms into the Christoffel correction in a coordinate
formula.


### Inverse Differences and Differentiation

Pushing point operators through coordinate changes, in the examples
below, requires the pushforward along a local inverse. Functoriality
reduces this to inverting $D_+(\phi; x)$, and splitting off the diagonal
makes the inversion a finite Neumann sum. This separates the inverse of
the first derivative from the higher-order correction terms.


**Proposition (Inverse pushforward).** {#prop:inverse-pushforward}
Let $\phi$ be $C^k$ near $x$ with invertible differential
$D(\phi; x) \in L(E, F)$. Split the pushforward by partition type,

$$
   D_+(\phi;\, x) = S + N,
   \qquad
   S := \Vsum_{r=0}^{k} \SYM^r(D(\phi;\, x)),
$$

where $S$ collects the singleton partitions and $N$ the partitions
containing a block of size at least two. Then $S^{-1} N$ is nilpotent,
$D_+(\phi; x)$ is invertible, and

$$
   D_+(\phi;\, x)^{-1}
   = \Big( \sum_{m=0}^{k-1} (-\, S^{-1} N)^m \Big)\, S^{-1},
   \qquad
   S^{-1} = \Vsum_{r=0}^{k} \SYM^r(D(\phi;\, x)^{-1}).
$$

If $\phi$ has a $C^k$ local inverse at $x$, then
$D_+(\phi^{-1};\, y) = D_+(\phi;\, x)^{-1}$.


**Proof.**
A partition of $[r]$ with a block of size at least two has at most
$r - 1$ blocks, so its term in [#def:symmetric-pushforward] lands in
degree $\leq r - 1$: $N$ strictly lowers the degree and vanishes in
degrees $\leq 1$, while $S$ is degreewise invertible with the stated
inverse. Hence $S^{-1} N$ strictly lowers the degree,
$(S^{-1} N)^k = 0$ on $ST_k(X; x)$, and the finite geometric sum inverts
$1 + S^{-1} N$; then $D_+(\phi; x) = S\,(1 + S^{-1} N)$ is invertible
with the stated sum. No smallness enters. For the last claim, apply
functoriality [#cor:smooth-functoriality] to $\phi^{-1} \circ \phi = \id$
and $\phi \circ \phi^{-1} = \id$.


In degree two, the degree-one component of the inverse formula gives
$D(\phi^{-1};y;w_1,w_2)=-A\,D(\phi;x;Aw_1,Aw_2)$, where
$A:=D(\phi;x)^{-1}$.


**Remark (Inverse differencing).** {#rem:inverse-differencing}
For comparison, let $k\geq1$. The cubical pushforward
$\Delta_+(\phi;x):CT_k(X;x)\to CT_k(Y;y)$ is bijective if and only if
$\phi$ is bijective. In that case

$$
   \Delta_+(\phi;x)^{-1}
   =\Delta_+(\phi^{-1};y)
   =\mu_x\circ(\phi^{-1})_*\circ\zeta_y.
$$

This follows directly from the conjugation in [#def:pushforward]. If
$d=\Delta_+(\phi;x)c$, the source vertices are recovered by
$\zeta_x(c)(T)=\phi^{-1}(\zeta_y(d)(T))$.


**Remark.**
Expanded, the Neumann sum is the tree expansion of the classical inverse
Faà di Bruno formula; in the Hopf-algebraic setting this unipotent
inversion is performed by the antipode [@FM2014].


**Remark (Comparison under collapse).**
The stencil example [#ex:polar-stencil] rescales the vertexwise inversions
of a collapsing cube family. Its collapse gives the inverse of the
linearization and the finite correction terms of
[#prop:inverse-pushforward]. In numerical practice the vertexwise equations
$\phi(q) = v$ are solved by Newton iteration, whose linearized first step is
the diagonal term of the Neumann sum.


### Laplace Operator in an Arbitrary Chart {#sec:applications}

The polar-coordinate Laplacian is a classical textbook exercise whose direct
chain- and product-rule derivation typically takes about two pages. The
formula in an arbitrary chart is its classical Christoffel-symbol
generalization [@KobayashiNomizu1963]. Inverse differential pushforward
separates the calculation into a quadratic term and one linear correction.

Let $\phi:U\to\IR^n$ be a $C^2$ chart near $x$ with invertible differential
$D^1(\phi;x)$. Set $y:=\phi(x)$ and write
$D:=D^1(\phi;x)$, $E:=D^{-1}$, $D^*:=\SYM(D)$, and
$E^*:=\SYM(E)=(D^*)^{-1}$.
Indices $i,j,k$ refer to the chart basis and
$a$ to the Cartesian basis. The Cartesian Laplacian is represented by the
probe $L:=\sum_a e_a e_a\in ST_2(\IR^n;y)$. We compute its inverse
pushforward $\hat L:=D_+(\phi;x)^{-1}L$.

**Invert the pushforward**. Write $D_+(\phi;x)=D^*+N$, where $N$ lowers
degree. The finite inversion formula
[#prop:inverse-pushforward] stops after one correction on $L$:

$$
   \hat L=E^*L-E^*NE^*L.
$$

**Compute the quadratic term**. Since $E^*$ is the algebra map induced
by $E$, it maps the Cartesian sum of squares to

$$
   E^*L=\sum_a(Ee_a)(Ee_a)
   =:\sum_{i,j}g^{ij}e_i e_j.
$$

These coefficients form the inverse metric.

**Compute the linear correction**. On a quadratic monomial, $N$ retains
the one-block partition, so $N(e_i e_j)=D(\phi;x;e_i,e_j)$. Define
$\Gamma^k_{ij}$ by the second identity below. Then

$$
   E\,D(\phi;x;e_i,e_j)=:\sum_k\Gamma^k_{ij}e_k,
   \qquad
   E^*NE^*L=\sum_{i,j,k}g^{ij}\Gamma^k_{ij}e_k.
$$

**Read off the operator**. Substitution in the inverse formula gives the
probe and its associated point operator. Thus we have established the
following proposition.


**Proposition (Laplace pushforward).** {#prop:laplace-pushforward}
Let $\phi:U\to\IR^n$ be a $C^2$ chart near $x$ with invertible differential
$D^1(\phi;x)$. With $g^{ij}$ and $\Gamma^k_{ij}$ defined above, let $F$ be
of class $C^2$ near $y=\phi(x)$ and set $G:=F\circ\phi$. Then

$$
   \sum_a\del_a^2F(y)
   =\sum_{i,j}g^{ij}
   (\del_i\del_j-\sum_k\Gamma^k_{ij}\del_k)G(x).
$$


**Remark (Classical identification).**
With the notation above, $(g^{ij})=EE^{\mathsf T}
=(D^{\mathsf T}D)^{-1}$. Thus $g^{ij}$ is the inverse of the pullback
metric. The coefficients $\Gamma^k_{ij}$ are its Christoffel symbols, and
the proposition is the coordinate expression of the Laplace--Beltrami
operator [@KobayashiNomizu1963].


**Corollary (Polar coordinates).** {#ex:polar-laplacian}
Let $I\subset\IR$ be an open interval of length less than $2\pi$ and set
$U:=(0,\infty)\times I$. For
$\phi(r,\theta)=(r\cos\theta,r\sin\theta)$,

$$
   \hat L=e_r e_r+\frac1r e_r+\frac1{r^2}e_\theta e_\theta,
   \qquad
   (\del_r^2+\frac1r\del_r+\frac1{r^2}\del_\theta^2)
   (f\circ\phi)(x)=(\del_1^2+\del_2^2)f(y).
$$


**Proof.**
Direct differentiation gives

$$
   D(\phi;x)=
   \begin{pmatrix}
      \cos\theta&-r\sin\theta\\
      \sin\theta&r\cos\theta
   \end{pmatrix},
   \qquad
   E=
   \begin{pmatrix}
      \cos\theta&\sin\theta\\
      -\sin\theta/r&\cos\theta/r
   \end{pmatrix}.
$$

The two terms required by the general calculation are

$$
   \sum_a(Ee_a)(Ee_a)=e_r e_r+\frac1{r^2}e_\theta e_\theta,
   \qquad
   E\,D(\phi;x;e_\theta,e_\theta)=-r e_r.
$$

The mixed entry $D(\phi;x;e_r,e_\theta)=(-\sin\theta,\cos\theta)$ is
nonzero, but $g^{r\theta}=0$, so it does not enter the contraction. The
remaining diagonal term $D(\phi;x;e_r,e_r)$ vanishes. Hence
$g^{rr}=1$, $g^{\theta\theta}=r^{-2}$, and
$\Gamma^r_{\theta\theta}=-r$. The inverse-pushforward formula gives the
stated probe.


### Higher Laplace Operators {#ex:polar-biharmonic}

The first higher power of the Laplacian is
$\nabla^4=(\del_1^2+\del_2^2)^2$, called the *biharmonic operator*.
Powers of constant-coefficient operators are represented by powers of their
probes, so the biharmonic operator is represented by
$L^2\in ST_4(\IR^2;y)$. In polar coordinates, direct expansion squares the
polar Laplacian and differentiates its variable coefficients by the product
rule. Instead, apply the inverse-pushforward formula
[#prop:inverse-pushforward] in degree four. For the polar chart data of
[#ex:polar-laplacian], set
$\widehat{L^2}:=D_+(\phi;x)^{-1}L^2$ and write
$\widehat{L^2}=\sum_{q=1}^4\widehat L_q$ by symmetric degree. With
$D_+(\phi;x)=D^*+N$ as above, solve
$(D^*+N)\widehat{L^2}=L^2$ from the top degree downward. If $\pi_q$ denotes
projection onto symmetric degree $q$, then

$$
   \widehat L_4=E^*L^2,
   \qquad
   \widehat L_q=-E^*\pi_qN
      (\widehat L_{q+1}+\cdots+\widehat L_4),
   \quad 1\leq q<4.
$$

Substituting the derivatives of the polar chart and collecting by degree gives

$$
\begin{aligned}
   \widehat L_4
   &=e_r^4+\frac{2}{r^2}e_r^2e_\theta^2+\frac{1}{r^4}e_\theta^4,\\
   \widehat L_3
   &=\frac{2}{r}e_r^3-\frac{2}{r^3}e_re_\theta^2,\\
   \widehat L_2
   &=-\frac{1}{r^2}e_r^2+\frac{4}{r^4}e_\theta^2,\\
   \widehat L_1
   &=\frac{1}{r^3}e_r.
\end{aligned}
$$

Their sum is the polar biharmonic probe. The degree-four line is the inverse
linear image of $L^2$; each lower line is the correction forced by the
higher derivatives of the chart. Putting these components together gives:


**Proposition (Polar biharmonic operator).** {#prop:polar-biharmonic}
Let $I\subset\IR$ be an open interval of length less than $2\pi$, set
$U:=(0,\infty)\times I$, and let
$\phi(r,\theta)=(r\cos\theta,r\sin\theta)$. For $x=(r,\theta)\in U$, set
$y:=\phi(x)$. If $F$ is of class $C^4$ near $y$ and $G:=F\circ\phi$, then

$$
   (\del_1^2+\del_2^2)^2F(y)
   =\left(\del_r^4+\frac{2}{r^2}\del_r^2\del_\theta^2
      +\frac{1}{r^4}\del_\theta^4
      +\frac{2}{r}\del_r^3-\frac{2}{r^3}\del_r\del_\theta^2
      -\frac{1}{r^2}\del_r^2+\frac{4}{r^4}\del_\theta^2
      +\frac{1}{r^3}\del_r\right)G(x).
$$

More generally, the same downward recursion applied to
$D_+(\phi;x)^{-1}L^m$ gives the coordinate expression of $\nabla^{2m}$.


### The Exact Polar Five-Point Stencil {#ex:polar-stencil}

The discrete adjunction gives the corresponding identity at finite mesh
width, before taking a collapse limit.
The five-point Laplacian at $y \in \IR^2$ with mesh width $t$,

$$
   L_t(f) := \sum_{i = 1, 2} ( f(y + t e_i) - 2 f(y) + f(y - t e_i) )
   = -\sum_{i = 1, 2} \Delta(f;\, y;\, t e_i,\, -t e_i),
$$

is the pairing of $f$ with the cube measures of two affine cubes at $y$.
With the polar chart $\phi$, $x$, and $y$ of [#ex:polar-laplacian], set
$V:=\phi(U)$ and take $t$ small enough that $y\pm te_i\in V$. Vertexwise
inversion, the argument of [#rem:inverse-differencing] restricted to these
cubes, transports the stencil to polar coordinates:
the cubes

$$
   c^i := \Delta_+(\phi^{-1};\, y)\, \Aff(t e_i,\, -t e_i) \in CT_2(X; x)
$$

have legs $c^i_1 = \phi^{-1}(y + t e_i) - x$ and
$c^i_2 = \phi^{-1}(y - t e_i) - x$, the polar coordinates of the stencil
points, and Möbius defect $c^i(\set{1,2}) = -(c^i_1 + c^i_2)$, since the
top vertex returns to $y$. The curved polar stencil is exact at every
mesh width: by the discrete adjunction [#thm:adjunction],

$$
   -\sum_{i = 1, 2} \Delta(\phi^* f;\, x;\, c^i) = L_t(f).
$$

Under collapse the rescaled legs converge, $t^{-1} c^i_j \to \pm A e_i$,
and the rescaled defects converge to second derivatives of the inverse,
$t^{-2}\, c^i(\set{1,2}) \to -\, D(\phi^{-1};\, y;\, e_i, e_i)$, supplied
from forward data by inverse differentiation
[#prop:inverse-pushforward]. By the uniformity and continuity in
[#thm:collapse], as in the proof of [#thm:differential-functoriality],

$$
   t^{-2}\, L_t(f) \;\xrightarrow[t \to 0]{}\; D(\phi^* f;\, x;\, \hat L),
   \qquad
   \hat L = \sum_{i = 1, 2} ( (A e_i)^2 + D(\phi^{-1};\, y;\, e_i, e_i) ),
$$

the polar Laplacian probe of [#ex:polar-laplacian]: the legs contribute
the diagonal terms, while the Möbius defects converge to the linear
correction $\tfrac{1}{r}\,e_r$.


### Polynomials {#ex:polynomials}

On polynomials the collapse requires no limit: the expansion of
[#thm:higher-symbol-expansion] terminates and holds with vanishing
residual. A map $p:X\to\IR$ is a *continuous polynomial of degree
$\leq d$* if $p(x+w)=\sum_{s=0}^d A_s(w,\dots,w)$ for continuous
symmetric $s$-linear maps $A_s:E^s\to\IR$.


**Proposition (Polynomial collapse).** {#prop:geometric-pairing}
Let $p:X\to\IR$ be a continuous polynomial of degree $\leq d$.

1) If $d\leq k$, the discrete pairing on affine cubes equals the
   differential pairing:

$$
   \Delta(p;x;v_1,\dots,v_k)=D(p;x;v_1,\dots,v_k).
$$

2) For $c\in CT_k(X;x)$ and $t\in\IR$, the collapse expansion is
   finite and exact:

$$
   \Delta(p;x;\lambda_t c)
   =\sum_{m=0}^{k(d-1)}t^{k+m}D(p;x;\sigma_{k,m}(c)).
$$

   In particular $\Delta(p;x;\lambda_t c)$ is a polynomial in $t$ that
   vanishes below degree $k$, with $t^k$-coefficient $D(p;x;\sigma_k(c))$.


**Proof.**
1) Write $p(x+w)=\sum_{s\leq k}\frac1{s!}D(p;x;w,\dots,w)$. For the
$s$-homogeneous part, expand
$D(p;x;(\sum_{i\in T}v_i)^{\times s})$ multilinearly and sum with signs.
The Boolean sieve kills every term that misses an index $i\in[k]$. For
$s<k$ no term remains; for $s=k$ the $k!$ orderings of
$(v_1,\dots,v_k)$ cancel the factor $1/k!$.

2) Run the proof of [#thm:higher-symbol-expansion] with the Taylor
expansion of $p$ at $x$, which represents $p$ without remainder: every
Peano term vanishes, and a multinomial of tensor degree $\sum_A\nu_A>d$
pairs to zero against the derivatives of $p$. The surviving weights
satisfy
$k\leq\mathrm{wt}(\nu)\leq k\sum_A\nu_A\leq kd$, so the expansion
terminates at $m=k(d-1)$.


### Globalization: Bundles over Manifolds {#ex:globalization}

Smooth functoriality gives the cocycle identity required to glue the local
model spaces over a manifold.

Let $M$ be a smooth $n$-manifold with atlas $\kappa_i: U_i \to \IR^n$
and chart transitions $\varphi_{ji} := \kappa_j \circ \kappa_i^{-1}$,
and fix $k \geq 1$. Over each chart domain take the constant bundle
with fiber $ST_k(\IR^n)$, and glue over an overlap by the pushforward
of the transition,

$$
   D_+(\varphi_{ji};\, \kappa_i(x)):
   ST_k(\IR^n;\, \kappa_i(x)) \lra ST_k(\IR^n;\, \kappa_j(x)).
$$

The entries of these matrices are polynomials in the derivatives of
$\varphi_{ji}$, so they depend smoothly on $x$. The cocycle condition
asks that gluing from chart $i$ to chart $l$ through an intermediate
chart $j$ agrees with gluing directly, and this is smooth functoriality
[#cor:smooth-functoriality] applied to
$\varphi_{li} = \varphi_{lj} \circ \varphi_{ji}$.
The result is a vector bundle $ST_k(M)$, and a smooth map
$\phi: M \to N$ induces a bundle map
$D_+(\phi): ST_k(M) \to \phi^*\, ST_k(N)$, given in charts by
$D_+(\kappa' \circ \phi \circ \kappa^{-1})$ and well defined across
charts by functoriality. The same construction with $D^+$
glues the contravariant bundle $ST^k(M)$ with its pullback
$D^+(\phi)$, and the permanent pairing and the adjunction glue along.

The transitions preserve the degree filtration, whose graded pieces are
the symmetric powers $\SYM^r(TM)$ [#prop:principal-symbol]. The
constants split off canonically, since the transitions are counital,
but the rest of the filtration does not: a grading of $ST_2(M)$,
equivalently a splitting of

$$
   0 \lra TM \lra ST_2(M)/\IR \lra \SYM^2(TM) \lra 0,
$$

is the same datum as a torsion-free connection, and the Christoffel
transformation law is the change of splitting. On affine spaces the
translations provide the splitting, which is why the affine theory acts
on the direct sum.

These bundles are classical. $ST_k(M)$ is Pohl's higher-order tangent
bundle [@Pohl1962], with the Weil-functor account in
[@kolar1993natural], §35. Its sections are the differential operators
of order $\leq k$ on $M$, acting through the pairing, so the cocycle
above is the transformation law of the coefficient tensors of a
differential operator. Contravariantly, $ST^k(M)$ is the bundle of
$k$-jets of functions [@Ehresmann1951], and its sheaf of sections is
the $k$-jet truncation of the structure sheaf; the covariant sections
form the dual sheaf of point-supported distribution fields.

### $D_+$ as $L_\infty$-Morphism {#ex:linfty}

The calculus of this article is the most elementary case of the
$L_\infty$ machinery of deformation theory, in the coalgebra
conventions of [@Kontsevich2003], §4.1--4.3, and [@LodayVallette2012],
§10.2: the deformation problem is the deformation of a point inside an
affine space, and the Lie algebra controlling it is abelian. Throughout,
$\phi: X \to Y$ is $C^\infty$ near $x$ and all orders are taken.

*The dictionary.* Write $E=T_xX$ and $F=T_yY$ for the translation spaces
and set $\mathfrak g := E[-1]$ and $\mathfrak h := F[-1]$, regarded as
abelian $L_\infty$-algebras: all higher brackets vanish, $\ell_k = 0$ for
$k \geq 1$. The Chevalley--Eilenberg coalgebra of $\mathfrak g$ is the
cofree conilpotent cocommutative coalgebra on $\mathfrak g[1] = E$,
which is the covariant model space with its coproduct [#def:coproduct]
and zero coderivation:

$$
   CE_\bullet(\mathfrak g)
   \;=\; \SYM(\mathfrak g[1])
   \;=\; \SYM(E)
   \;=\; ST_*(X;\, x),
   \qquad
   Q = 0.
$$

Geometrically, deformations of the point $x$ inside $X$ are translations
by $E$; the vanishing differential and brackets record that these
deformations are unobstructed and unconstrained.

*Taylor coefficients.* In the coalgebra formulation, an
$L_\infty$-morphism $\mathcal F: \mathfrak g \rightsquigarrow \mathfrak h$
is a morphism of Chevalley--Eilenberg coalgebras intertwining the
coderivations. For abelian source and target the intertwining condition
is empty: an $L_\infty$-morphism $\mathfrak g \rightsquigarrow \mathfrak h$
is exactly a counital coalgebra morphism $\SYM(E) \to \SYM(F)$, and by
the cofree property [#prop:cofree] it is freely determined by its
*Taylor coefficients* ([@Kontsevich2003], §4.2), the components
$\mathcal F_r: \SYM^r(\mathfrak g[1]) \to \mathfrak h[1]$. For the
coalgebra morphism $D_+(\phi;\, x)$ [#prop:coalgebra] the name is
literal: the Taylor coefficients are the higher derivatives,

$$
   \mathcal F_r: \SYM^r(E) \lra F,
   \qquad
   \mathcal F_r(v_1 \cdots v_r) = D(\phi;\, x;\, v_1, \dots, v_r).
$$

*The lift.* Conversely, an $L_\infty$-morphism is assembled from its
Taylor coefficients by cofreeness: $CE_\bullet(\mathfrak h)$ is the
cofree conilpotent coalgebra on $\mathfrak h[1] = F$, so a linear map
$\SYM(E) \to F$ extends uniquely to a counital coalgebra morphism. The
appendix proves this couniversal property for the symmetric coalgebra
[#prop:cofree]: the extension is the convolution exponential of the
coefficient map, and its expansion on monomials is the partition sum.
The Taylor coefficients above assemble into the differential
$D(\phi;\, x)$ of [#def:differential], and the exponential is the
pushforward:

$$
   \mathcal F
   \;=\; \exp_\star(D(\phi;\, x))
   \;=\; D_+(\phi;\, x),
   \qquad
   D_+(\phi;\, x;\, v_1 \cdots v_r)
   = \sum_{\pi \in \Part(r)} \prod_{A \in \pi} D(\phi;\, x;\, v_A).
$$

*Composition.* Smooth functoriality [#cor:smooth-functoriality] is
composition of $L_\infty$-morphisms, and the partition Faà di Bruno
formula [#cor:partition-fdb] is the resulting composition rule for
Taylor coefficients. Kontsevich's gloss for the coalgebra morphism of a
map of formal pointed manifolds, "the pushforward on distributions
supported at zero" ([@Kontsevich2003], §4.1), is realized analytically
by [#thm:distribution-pushforward].

Smooth maps between affine spaces thus form a geometric family of
$L_\infty$-morphisms in which the Taylor coefficients are the classical
higher derivatives, every intertwining condition is empty, and
composition is the Faà di Bruno formula. Despite its striking
simplicity, we have not found this example stated in the $L_\infty$
literature.

### Further connections

**Remark (Operator propagation through composites).**
By [#thm:distribution-pushforward] and functoriality, a point operator on a
composite is evaluated by applying the pushforwards successively:
$(\psi_m \circ \cdots \circ \psi_1)_*\delta(x;\xi)=
\delta(z;D_+(\psi_m;x_{m-1})\cdots D_+(\psi_1;x_0)\xi)$. The test function
is applied after the final pushforward. For $\deg \xi = 2$ this is the
forward-Laplacian scheme of [@ForwardLaplacian2023]; forward- and Taylor-mode
automatic differentiation [@GriewankWalther2008] [@Bettencourt2019]
[@Betancourt2018] [@Sangha2025] are the jet reading of the same
functoriality. Cube probes compose through arbitrary maps by
[#thm:functoriality]. A single collapse after composition extracts the
derivative; the resulting discrete jet calculus is developed in
[@DFDB].


**Remark (Moments and cumulants).**
The symbol formula $\sigma_k(c) = \sum_\pi \prod_{A \in \pi} c(A)$ is the
multivariate cumulant-to-moment transform, with cube coordinates in the role
of joint cumulants and symbol components in that of moment tensors; the
pushforward $D_+$ is the transformation law of moment tensors under nonlinear
maps. See [@McCullagh1987], Chapters 2 and 3, where these transformation laws
are developed. The cubical formula gives the corresponding finite-increment
identity with covering-indexed correction terms.


**Remark (Interaction effects).**
For functions on the Boolean cube, the Möbius coordinates of a cube are the
main effects and interactions of a $2^k$ factorial design: Yates's algorithm
[@Yates1937] is the fast Möbius transform, and the interaction indices of
set functions are the same transform [@Grabisch2016]. The pushforward
$\Delta_+$ is the exact transformation law of interaction effects under a
nonlinear response map, with the covering formula [#cor:discrete-fdb] as its
coordinate expansion.


## Appendix: The symmetric bialgebra {#sec:appendix-b}

This appendix collects the coalgebra background behind the coalgebra lift
[#prop:coalgebra-lift]. Throughout, $V$ is a real vector space. The permanent
pairing lives in the Setting [#def:symmetric-spaces], the product-coproduct
adjunction in the body [#lem:product-coproduct].


**Definition (Symmetric bialgebra).** {#def:symmetric-bialgebra}
Let $\SYM(V) = \Vsum_{r \geq 0} \SYM^r(V)$ be the symmetric algebra with
its degree filtration $F_k := \Vsum_{r \leq k} \SYM^r(V)$.

- The *coproduct* $\Delta^{\times}: \SYM(V) \to \SYM(V) \tensor \SYM(V)$ is the
  unique algebra morphism with $\Delta^{\times}(v) = v \tensor 1 + 1 \tensor v$
  for $v \in V$; the *counit* $\eps$ is the degree-zero projection. On
  monomials, $\Delta^{\times}(v_1 \cdots v_r) = \sum_{I \sqcup J = [r]} v_I \tensor v_J$
  with $v_\emptyset := 1$, matching [#def:coproduct].
- The *reduced coproduct* of an element $a$ of positive degree is
  $\uDelta(a) := \Delta^{\times}(a) - a \tensor 1 - 1 \tensor a$.
- A counital coalgebra $C$ with coaugmentation $1_C$ is *conilpotent* if for
  every $c \in \ker \eps_C$ there is an $m$ with $\uDelta^{(m)}(c) = 0$.


**Lemma (Conilpotence).** {#lem:conilpotence}
The coproduct preserves the degree filtration, so each $\SYM_{\leq k}(V)$ is a
subcoalgebra; the reduced coproduct is strictly degree-decreasing,
$\uDelta(F_k) \subseteq F_{k-1} \tensor F_{k-1}$, so $\SYM(V)$ and every
$\SYM_{\leq k}(V)$ are conilpotent.


**Proof.**
In the monomial formula both tensor factors have degree $\leq r$, and in the
reduced part both are proper sub-monomials, of degree $\leq r - 1$.


**Definition (Convolution).** {#def:convolution}
For a counital cocommutative coalgebra $C$ and a commutative unital algebra $A$, the
*convolution product* on $\Hom(C, A)$ is

$$
   f \star g := \mu_A \circ (f \tensor g) \circ \Delta_C,
$$

associative and commutative with unit $1_\star := \eta_A \circ \eps_C$.


**Proposition (Cofree property; unique coalgebra lift).** {#prop:cofree}
Let $C$ be a conilpotent cocommutative coalgebra and $f: C \to V$ linear with
$f(1_C) = 0$, viewed as a map into $\SYM(V)$ of pure degree one. Then the
convolution exponential

$$
   \exp_\star(f) := \sum_{m \geq 0} \frac{1}{m!}\, f^{\star m} \;:\; C \lra \SYM(V)
$$

is a finite sum on every element of $C$, and it is the unique counital
coalgebra morphism $C \to \SYM(V)$ with degree-one component $f$.


**Proof.**
*Finiteness.* For $c \in \ker \eps_C$ and $m$ large, conilpotence makes
every term of $\Delta_C^{(m-1)}(c)$ carry a tensor factor $1_C$, which $f$
kills; hence $f^{\star m}(c) = 0$, and $f^{\star m}(1_C) = f(1_C)^m = 0$ for
$m \geq 1$.

*Morphism.* The value $f(c) \in V$ is primitive, so
$\Delta^{\times} \circ f = (L + R)(f)$ with $L(f)(c) := f(c) \tensor 1$ and
$R(f)(c) := 1 \tensor f(c)$, and $L(f)$, $R(f)$ commute under the convolution
of $\Hom(C, \SYM(V) \tensor \SYM(V))$. Exponentiating,
$\Delta^{\times} \circ \exp_\star(f) = \exp_\star(L(f)) \star \exp_\star(R(f))
= (\exp_\star(f) \tensor \exp_\star(f)) \circ \Delta_C$; counitality holds
since all positive-degree terms have $\eps = 0$.

*Uniqueness.* Let $g, h$ be counital coalgebra morphisms with the same
degree-one component. Counitality gives $\pi_0 g = \eps_C = \pi_0 h$. For
$r \geq 2$, taking the components of $\Delta^{\times} \circ g = (g \tensor g) \circ \Delta_C$
in $\SYM^i \tensor \SYM^j$ with $i + j = r$, $i, j \geq 1$,

$$
   \uDelta\, (\pi_r\, g(c)) = \sum_{\substack{i + j = r \\ i, j \geq 1}}
   (\pi_i\, g \tensor \pi_j\, g)\, \Delta_C(c)
$$

depends only on the components of degree $< r$, and $\uDelta$ is injective
on $\SYM^r(V)$ for $r \geq 2$ since $\mu \circ \uDelta = (2^r - 2)\, \id$.
Induct on $r$.


**Corollary (Coalgebra lift, truncated form).** {#cor:coalgebra-lift}
Let $f: ST_k(X; x) \to F$ be linear with $f(1) = 0$. There is a unique
counital coalgebra morphism $f^+: ST_k(X; x) \to \SYM(F)$ with degree-one
component $f$; it preserves the degree filtration, hence takes values in
$ST_k(Y; y)$, and on monomials it is the partition sum

$$
   f^+(v_1 \cdots v_r) = \sum_{\pi \in \Part(r)} \prod_{A \in \pi} f(v_A).
$$

In particular the symmetric pushforward [#def:symmetric-pushforward] is the
unique coalgebra morphism with degree-one component the differential
$D(\phi; x)$.


**Proof.**
$ST_k(X; x) = \SYM_{\leq k}(T_x X)$ is a conilpotent subcoalgebra
[#lem:conilpotence], so [#prop:cofree] applies with $f^+ = \exp_\star(f)$. On
a monomial, the iterated coproduct is the sum over ordered decompositions
$[r] = I_1 \sqcup \dots \sqcup I_m$ into possibly empty blocks; $f$ kills the
empty blocks, and $\frac{1}{m!}$ converts ordered partitions into unordered
ones, giving the partition sum. Each term has degree $|\pi| \leq r$, whence
the filtration bound.


<!-- end of article -->
