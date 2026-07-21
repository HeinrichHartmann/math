---
type: math-article
title: The Cayley-Hamilton Theorem
tagline: A short rigidity argument.
date: 2025-07-21
author: Heinrich Hartmann
orcid: 0000-0002-3929-2421
affiliation: Hartmann IT GmbH
email: Heinrich@HeinrichHartmann.com
doi: 10.5281/zenodo.18016109
slug: "2025-Cayley-Hamilton"
status: "900 Published"
target: blog
publications:
  GitHub: "https://github.com/HeinrichHartmann/math/releases/tag/2025-07-21-Cayley-Hamilton"
  Zenodo: "https://doi.org/10.5281/zenodo.18016109"
hide:
- outline
- navigation
abstract: 'We give a short real-variable proof of the Cayley--Hamilton theorem using
  a local-to-global rigidity argument: prove the identity on a neighbourhood of a
  diagonal matrix with simple spectrum and extend to all matrices using polynomiality.

  '
math:
  proof_style: expanded
zenodo:
  doi: 10.5281/zenodo.18016109
  license: cc-by-4.0
  upload_type: publication
  publication_type: article
---

## Introduction

The Cayley--Hamilton theorem states that every square matrix satisfies its own characteristic polynomial:
For $A \in \IR^{n \times n}$ the characteristic polynomial is defined as:

$$
   \chi_A(t) := \det(tI - A) \in \IR[t],
$$

Inserting the matrix $A$ for $t$ one finds $\chi_A(A)=0$.
Historically, a quaternionic special case was obtained by Hamilton [@hamilton1853] in 1853,
Cayley gave the matrix formulation [@cayley1858] in 1858;
a fully general proof was given by Frobenius [@frobenius1878] in 1878.

There are many standard proofs.
Over $\IC$, one often reduces to Jordan normal form, or proves the statement first for diagonalizable matrices
and then extends by continuity; see for example [@hornjohnson2013].
Textbook treatments also give adjugate-matrix proofs, but these require some care:
the theorem asserts a matrix identity $\chi_A(A)=0$, and it is not legitimate
to argue by the bogus substitution $\chi_A(A)=\det(AI-A)=0$; see [@higham2020cayley].

In this note we give a short proof that stays entirely over $\IR$
and avoids complex canonical forms and density arguments.
The core idea is local-to-global rigidity.
We fix a diagonal matrix $D_0=\diag(1,\dots,n)$ with simple real spectrum.
By an implicit-function-theorem argument, matrices in a neighbourhood of $D_0$
continue to have $n$ distinct real eigenvalues and are therefore diagonalizable.
On this open neighbourhood the identity $\chi_A(A)=0$ follows immediately by conjugating to a diagonal matrix.
Finally, we observe that the entries of the map $A \mapsto \chi_A(A)$ are polynomial functions of the entries of $A$;
hence vanishing on a nonempty open set forces vanishing everywhere on $\IR^{n \times n}$.

This framing as rigidity argument has the benefit of keeping the proof "low-tech'':
beyond a basic perturbation lemma for simple eigenvalues and an elementary polynomial identity principle,
no structure theory for linear maps is required.
The result is a proof that is short, intuitive, and pedagogically robust.

## Main Theorem

**Theorem (Cayley-Hamilton).**
Let $A \in \IR^{n \times n}$ and let $\chi_A(\lambda) = \det(\lambda I - A)$ be its characteristic polynomial. Then

$$
   \chi_A(A) = 0,
$$

where $\chi_A(A)$ denotes the matrix polynomial obtained by evaluating $\chi_A$ at $A$.

**Proof.**
The characteristic polynomial $\chi_A(t)$ is a degree–$n$ polynomial in $t$ whose coefficients are polynomials in the entries $A_{i,j}$ of $A$.
The evaluation $\chi_A(A)$ is an $n \times n$ matrix, whose entries $F(A)_{i,j}$ are again polynomials in the $A_{i,j}$.
We regard this construction as a polynomial map $F: \IR^{n \times n} \to \IR^{n \times n},\ A \mapsto \chi_A(A)$.
We want to show that this polynomial map is identically zero: $F \equiv 0$.

To do so it is sufficient to show that there is an open subset in the Euclidean topology where $F$ vanishes identically.

Let $D_0 = \diag(1,2,\ldots,n)$ be the diagonal matrix with $n$ distinct eigenvalues $1,\dots,n$.
There exists a neighborhood $U$ of $D_0$ where all matrices $A \in U$ have $n$ distinct real eigenvalues,
by Lemma [#lem:eigenvalue-perturbation] below.
Any matrix $A \in U$ with $n$ distinct real eigenvalues is diagonalizable and therefore $F(A) = \chi_A(A) = 0$,
by Lemma [#lem:diagonal-ch] below.

Thus $F(A) = \chi_A(A) = 0$ for all $A \in U$, hence by rigidity the polynomial map $F$ vanishes on the whole space $\IR^{n \times n}$, proving $\chi_A(A) = 0$ for every $A$.


**Lemma.** {#lem:eigenvalue-perturbation}
Let $D_0 \in \IR^{n \times n}$ be a matrix with $n$ distinct real eigenvalues.
Then there is a neighborhood $U$ of $D_0$ where all matrices $D \in U$ have $n$ distinct real eigenvalues.

**Proof.**
Consider the function $G(D,t) = \chi_D(t)$ as a differentiable map $\IR^{n \times n} \times \IR \to \IR$.
The condition $G(D,\lambda) = 0$ is equivalent to $\lambda$ being an eigenvalue of $D$.

We use the implicit function theorem to show that each real eigenvalue $\lambda_i$ of $D_0$ can be continued to
a real function $\lambda_i(D)$ in a neighborhood of $D_0$.
For each eigenvalue $\lambda_i$ of $D_0$ we have $G(D_0,\lambda_i) = 0$ and

$$
   \frac{\partial G}{\partial t}(D_0,\lambda_i)
   = \chi'_{D_0}(\lambda_i)
   = \prod_{j \neq i} (\lambda_i - \lambda_j) \neq 0,
$$

since all eigenvalues of $D_0$ are distinct.

By the implicit function theorem, there exists a neighborhood $U_i$ of $D_0$
and a smooth function $\lambda_i : U_i \to \IR$ such that $G(D,\lambda_i(D)) = 0$ for all $D \in U_i$,
with $\lambda_i(D_0) = \lambda_i$.
Taking $U = \bigcap_{i=1}^n U_i$, we obtain a neighborhood where all $n$ eigenvalues $\lambda_1(D),\dots,\lambda_n(D)$
exist as real-valued functions.
Since the $\lambda_i$ are continuous and the values $\lambda_i(D_0)$ are distinct,
they remain distinct in a sufficiently small neighborhood.


**Lemma.** {#lem:diagonal-ch}
Let $A \in \IR^{n \times n}$ have $n$ distinct real eigenvalues.
Then $\chi_A(A) = 0$.

**Proof.**
If $A$ has $n$ distinct real eigenvalues $\lambda_1,\dots,\lambda_n$ and corresponding eigenvectors $q_1,\dots,q_n$,
then $Q = [q_1,\dots,q_n]$ is invertible and $Q^{-1} A Q = D$, where $D = \diag(\lambda_1,\dots,\lambda_n)$.
The characteristic polynomial satisfies $\chi_A(\lambda) = \chi_D(\lambda) = \prod_{i=1}^n (\lambda - \lambda_i)$,
and hence

$$
   \chi_A(A)
   = Q \,\chi_D(D)\, Q^{-1}
   = Q \cdot 0 \cdot Q^{-1}
   = 0.
$$

**Remark (Why rigidity is needed over $\IR$).**
Over $\IC$ the analogous argument is usually run with a density step:
matrices with $n$ distinct eigenvalues are dense in $\IC^{n \times n}$,
and $\chi_A(A) = 0$ extends from this dense set by continuity.
Over $\IR$ this density fails for $n \geq 2$: a matrix with a pair of non-real eigenvalues (e.g. a rotation)
keeps non-real eigenvalues under small perturbations, so such matrices form a nonempty open set
on which no real-diagonalizable approximation exists.
The rigidity argument repairs exactly this: a polynomial map is already determined by its values
on a *single* nonempty open set, so the neighbourhood $U$ of $D_0$ suffices, and no density is required.


**Remark (Arbitrary commutative rings).**
The proof yields more than the real case.
Each entry of $F(A) = \chi_A(A)$ is a polynomial in the entries $A_{i,j}$ with *integer* coefficients.
Vanishing of $F$ on all of $\IR^{n \times n}$ forces these polynomials to vanish identically
as elements of $\IZ[a_{1,1},\dots,a_{n,n}]$.
Specializing the variables $a_{i,j}$ to the entries of an arbitrary matrix therefore proves
the Cayley--Hamilton theorem for matrices over every commutative ring,
recovering the general form of the theorem due to Frobenius.

