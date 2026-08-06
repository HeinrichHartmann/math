---
outline_enabled: false
id: E0021
title: Iterated differentials
kind: definition
status: established
visibility: public
notation: E0020
depends_on: [E0007]
checked: [ai]
published_at: [DFDB]
---

# E0021 — Iterated differentials

The smooth counterpart of the iterated increment $\Delta^K$
[E0009]: the iterated differential $D^\kappa$ applies the
Fréchet derivative recursively, indexed by higher multi-indices
$\KM_+^m$ [E0007].

**Definition.** Let $f_1, \dots, f_m$ be $C^n$ maps between
Banach spaces with $f_r: X_{r-1} \to X_r$, $x \in X_0$,
$v_1, \dots, v_k \in X_0$, and
$x_r = (f_r \circ \cdots \circ f_1)(x)$.

- The *iterated differential* for $\alpha \in \KM_+(k)$ and
  $m = 1$ is
  $D^\alpha(f_1;\, x;\, v_\bullet) =
  D^{|\alpha|}(f_1;\, x;\, v_\bullet^{\times \alpha})$
  ([E0020]).
  For $m \geq 2$ and $\kappa \in \KM_+^m(k)$, define
  recursively:

    $$
    D^\kappa(f_1, \dots, f_m;\, x;\, v_\bullet)
    := D(f_m;\, x_{m-1};\,
    (D^\lambda(f_1, \dots, f_{m-1};\, x;\, v_\bullet)
    ^{\times \kappa(\lambda)})_{\lambda \in \supp(\kappa)}).
    $$

- The *Boolean iterated differential* for
  $H \in \Part_m(k)$ with $m \geq 2$ is

    $$
    D^H(f_1, \dots, f_m;\, x;\, v_\bullet)
    := D(f_m;\, x_{m-1};\,
    (D^L(f_1, \dots, f_{m-1};\, x;\, v_\bullet))_{L \in H}).
    $$

    The Boolean case is the partition restriction of the
    multi-index case, analogous to $\Delta^K$ vs
    $\Delta^\kappa$ in [E0009].

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Recursion typing and well-foundedness; set-indexed families
justified by symmetry of $D^{|H|}$ [E0020]; partition
restriction verified against the embedding
($D^{\nu_{\mathrm{id}}(H)} = D^H$ at $m = 2$). Added the $C^n$
hypothesis (differentials do not exist for bare maps) and
aligned the $m = 1$ case with $D^{|\alpha|}$ [E0020]. No other
issues found.
