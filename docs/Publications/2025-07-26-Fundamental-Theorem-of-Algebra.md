---
type: math-article
title: "Fundamental Theorem of Algebra"
tagline: "A short deformation argument."
author: "Heinrich Hartmann"
orcid: "0000-0002-3929-2421"
affiliation: "Hartmann IT GmbH"
email: "Heinrich@HeinrichHartmann.com"
doi: "10.5281/zenodo.18009904"
slug: "2025-Fundamental-Theorem-of-Algebra"
date: "2025-07-26"
status: "900 Published"
target: blog
publications:
  Zenodo: "https://doi.org/10.5281/zenodo.18009904"
abstract: |
  We give a very short proof of the Fundamental Theorem of Algebra using a one-parameter deformation and a discriminant-locus argument.
math:
  proof_style: expanded
  preamble: |
    \newcommand{\Res}{\operatorname{Res}}
hide:
  - outline
  - navigation
zenodo:
  doi: "10.5281/zenodo.18009904"
  license: "cc-by-4.0"
  upload_type: "publication"
  publication_type: "article"
---

## Introduction

The *Fundamental Theorem of Algebra* has a long and contested history, with early attempts by
d'Alembert, Euler, and Laplace, and more substantial proofs by Gauss (1799, 1816, 1849) and Argand (1806/1813).
For surveys and historical accounts, see Remmert's exposition [@remmert1991], the monograph of
Fine–Rosenberger [@fine1997], and Gilain's historical study [@gilain1991].

Since then, the theorem has continued to attract new proofs, ranging from analytic (Liouville, Rouché)
to topological (winding numbers, degree arguments), constructive (Kneser [@kneser1939], Richman [@richman2000]),
and elementary (Rio Branco de Oliveira [@riobrancodeoliveira2012], Basu [@basu2021]).
This ongoing stream of contributions underscores both the theorem's centrality and its pedagogical appeal.

The proof given here exploits a discriminant complement argument: one shows that, away from parameters where
the discriminant vanishes, roots continue locally by the implicit function theorem, while global existence
follows from connectedness and a compactness/closedness input (here provided by Cauchy's root bound).
The same strategy has been independently used earlier by Pukhlikov–Pushkar (see [@conrad]) and 2016
in a blog post by Litt [@litt2016].

The approach taken here is particularly compact and elementary,
working with a single one-parameter family $p_t = (1-t)q + tp$,
and using only the implicit function theorem and basic resultants as ingredients.

## Main Theorem

**Theorem (Fundamental Theorem of Algebra).**
Every polynomial of degree $n$ with complex coefficients has exactly $n$ complex roots, counted with multiplicity.


**Proof.**
For a given polynomial $p(x) = x^n + p_{n-1} x^{n-1} + \cdots + p_0$,
we consider the family of polynomials $p_t = t p + (1-t) q$ for $t \in \IC$.
Where $p_0 = q$ is a polynomial with $n$ distinct roots, e.g. $q = x^n - 1$.

Let $X \subset \IC$ be the set of parameters $t$ where $p_t$ has at least one root.
By construction $0 \in X$.
We will show that $1 \in X$, by deforming the roots of $q$ along $p_t$ using Resultant techniques
and the Implicit Function theorem, and leveraging the Cauchy bound on root location
to show stability of roots under limits with bounded coefficients.
This shows that $p$ has a single root $r$.
By splitting off a linear factor $x-r$ and induction on the degree of $p$, we conclude that $p$ has $n$ roots.

The set $X \subset \IC$ is closed:

Let $t_k$ be a sequence in $X$ converging to a point $t \in \IC$. We need to show that $t \in X$.
As $t_k$ is bounded, we know that the coefficients of $p_{t_k}$ are bounded by a constant $M$.
By the Cauchy bound, all roots of $p_{t_k}$ lie within the disk of radius $1 + \max_i |p_{t_k,i}| \leq M + 1$.
Let $r_k$ be a convergent sequence of roots of $p_{t_k}$, and let $r = \lim_{k \to \infty} r_k$.
Then $\lim_{k \to \infty} p_{t_k}(r_k) = p_t(r)$ by continuity of $p_t$, but $p_{t_k}(r_k) = 0$, so $p_t(r) = 0$.

Now consider $\Delta(t) = \Res(p_t, p_t')$ the discriminant of the polynomial $p_t$.

Recall that the Resultant $\Res(p,q)$ is a polynomial in the coefficients of the polynomials $p$ and $q$
and that $\Res(p,q) = 0$ if and only if the polynomials $p$ and $q$ have a common factor ($\gcd(p,q) \neq 1$).
In particular $\Delta(t)$ is a polynomial in $t$, with $\Delta(0) \neq 0$ as $q$ has $n$ distinct roots.

Let $D = \{ t \in \IC \mid \Delta(t) = 0 \}$, and let $U = \IC \setminus D$.
As complement of a finite set, $U$ is connected open and dense in $\IC$.

The set $X \cap U \subset \IC$ is open:

Let $t \in X \cap U$, we need to show that there is a neighborhood $N$ of $t$ such that $N \subset X$.

Since $t \in X$ we know that $p_t$ has at least one root $r$.
As $t \in U$ we know that $p_t'(r) \neq 0$, since otherwise $p_t$ and $p_t'$ would have a common factor.
By the implicit function theorem applied to $F(x,t) = p_t(x)$, there exists a neighborhood $N$ of $t$
and a function $r(\tau)$ defined on $N$, with $r(t) = r$ and $p_\tau(r(\tau)) = 0$ for all $\tau \in N$.
This shows that $N \subset X$.

We conclude that $X \cap U$ is open and closed in $U$. As $U$ is connected, it follows that $X \cap U = U$.
Thus, $X$ contains the open dense set $U$, which implies that $X$ is all of $\IC$, and in particular $1 \in X$.
