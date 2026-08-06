---
outline_enabled: false
id: E0055
title: Cofree coalgebra lift
kind: proposition
status: established
visibility: public
depends_on: [E0052, E0054]
published_at: [DDC]
---

# E0055 — Cofree coalgebra lift

The symmetric coalgebra $(\SS_+(V), \bar{\Delta})$ [E0052] is
the cofree conilpotent cocommutative coalgebra on $V$: every
linear map into $V$ lifts uniquely to a coalgebra morphism.

**Proposition.** Let $(C, \Delta_C)$ be a conilpotent
coalgebra and $f: C \to V$ a linear map. There is a unique
coalgebra morphism $f^+: C \to \SS(V)$ with
$\pi_1 \circ f^+ = f$, given by the convolution exponential:

$$
f^+ = \exp_*(f) = \sum_{k \geq 0} \frac{1}{k!} f^{*k}.
$$

The sum terminates on each element of $C$ by conilpotence.

**Proof.**
$f: C \to V = \SS^1(V)$ is primitive in $\Hom(C, \SS(V))$
with the convolution product $f * g = \mu \circ (f \otimes g)
\circ \Delta_C$. By the exp/log correspondence [E0054] for
convolution algebras, $\exp_*(f)$ is group-like in
$\Hom(C, \SS(V))$, i.e. a coalgebra morphism. Conversely,
any coalgebra morphism $g$ has
$\log_*(g) = \pi_1 \circ g = f$, giving uniqueness.

**Corollary.** The symmetric pushforward $D_+(\phi; x)$
[E0027] is the unique coalgebra morphism
$ST_k(X; x) \to ST_k(Y; y)$ whose degree-one component is the
differential $D(\phi; x)$. Its partition formula is the
convolution exponential of the differential.

**Proof.**
$ST_k(X; x)$ with the reduced shuffle coproduct [E0052] is
conilpotent (truncated at degree $k$). The differential
$D(\phi; x): ST_k(X; x) \to T_y Y \subseteq ST_k(Y; y)$ is a
linear map into the degree-one part. By the proposition above,
$D(\phi; x)^+ = \exp_*(D(\phi; x))$ is the unique coalgebra
morphism extending it. Expanding the convolution exponential:
$\exp_*(D(\phi; x))(v_1 \cdots v_r) =
\sum_{m=1}^r \frac{1}{m!}
(D(\phi; x))^{*m}(v_1 \cdots v_r) =
\sum_{\pi \in \Part(r)} \prod_{A \in \pi} D(\phi; x; v_A)$,
which is the partition formula defining $D_+$ [E0027].
