---
outline_enabled: false
id: E0002
title: Boolean Möbius inversion
kind: proposition
status: established
visibility: public
notation: E0001
depends_on: []
checked: [numeric, ai, formal]
validation:
  numeric:
    file: validation/python/E0002_boolean_moebius.py
  formal:
    file: validation/lean/Elements/E0002.lean
    theorems: [mu_zeta, zeta_mu, zetaEquiv]
published_at: [DFDB]
---

# E0002 — Boolean Möbius inversion

**Proposition.** Let $G$ be an abelian group. For a cube
$a: \KP(k) \to G$, set

$$
\zeta(a; S) := \sum_{T \subseteq S} a(T),
\qquad
\mu(a; S) := \sum_{T \subseteq S} (-1)^{|S|-|T|}\, a(T).
$$

Then $\zeta$ and $\mu$ define inverse bijections on
$\mathrm{Map}(\KP(k), G)$.

**Proof.**
Exchange summation order and use
$(1-1)^{|S|} = \sum_{T \subseteq S} (-1)^{|S|-|T|} = \delta_{S,\emptyset}$:

$$
\mu(\zeta a; S)
= \sum_{T \subseteq S} (-1)^{|S|-|T|} \sum_{R \subseteq T} a(R)
= \sum_{R \subseteq S} a(R) \sum_{R \subseteq T \subseteq S} (-1)^{|S|-|T|}
= \sum_{R \subseteq S} a(R)\, \delta_{S \setminus R, \emptyset}
= a(S),
$$

and symmetrically $\zeta(\mu a; S) = a(S)$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Summation exchange and $\delta$-collapse verified via
$T = R \cup U$, $U \subseteq S \setminus R$; symmetric direction
checked separately; edge cases $k = 0$, $S = \emptyset$
(identity maps), signs as $\IZ$-action on $G$. No issues found.
