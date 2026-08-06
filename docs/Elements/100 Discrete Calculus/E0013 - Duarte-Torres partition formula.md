---
outline_enabled: false
id: E0013
title: Duarte–Torres partition formula
kind: theorem
status: established
visibility: public
notation: E0001
depends_on: [E0004, E0006, E0015]
checked: [numeric]
validation:
  numeric:
    repo: https://github.com/HeinrichHartmann/Discrete-Faa-di-Bruno
    tests: [tests/test_asets.py, tests/test_duarte_torres.py]
published_at: [DFDB]
---

# E0013 — Duarte–Torres partition formula

The covering Faà di Bruno formula [E0006] regroups into a
partition-indexed sum with shifted basepoints and directions,
recovering the discrete formula of Duarte–Torres
(arXiv:0811.4343). The combinatorial engine is a fibration of
the coverings $\Cov(k)$ over the partitions $\Part(k)$: in the
fiber over $\xi$, every candidate set $S \in \KP_+([k])$ plays
exactly one of three roles:

- *witness* of a block $B \in \xi$ ($S \in \KA^\xi_B$): may
  appear, and each block must be witnessed at least once;
- *free* ($S \in \KA^\xi_{0,+}$): appears or not, at will;
- *excluded*: all remaining sets.

Under the shift identities [E0015], "at least one of" assembles
into a direction sum and "free" into a basepoint shift, one
$\Delta$-term per fiber.

**Definition (Correction sets).** Every partition
$\xi \in \Part(k)$, $k \geq 1$, arises from its restriction
$\tau = \xi|_{[k-1]} \in \Part(k-1)$ either by adjoining the
singleton block $\set{k}$, or by inserting $k$ into a block
$B_i \in \tau$. Order blocks by *birth* ($B <_b B'$ iff
$\min B < \min B'$) and write
$\KA \uplus k := \set{S \cup \set{k} : S \in \KA}$. Define
$\KA^\xi_\beta \subseteq \KP([k])$ for $\beta = 0$ (*free sets*,
with $\KA^\xi_{0,+} := \KA^\xi_0 \setminus \set{\emptyset}$)
and $\beta = B \in \xi$ (*witnesses of $B$*) by recursion on
$k$:

- *Base.* $\KA^\emptyset_0 = \set{\emptyset}$ for the empty
  partition of $[0]$.

- *New block* ($\xi = \tau \cup \set{\set{k}}$): the witnesses
  of $\set{k}$ are the free sets with $k$ adjoined; nothing
  else changes.

    $$
    \KA^\xi_0 = \KA^\tau_0,
    \qquad
    \KA^\xi_B = \KA^\tau_B \ (B \in \tau),
    \qquad
    \KA^\xi_{\set{k}} = \KA^\tau_0 \uplus k.
    $$

- *Extend block* ($k$ joins $B_i \in \tau$, giving
  $B'_i = B_i \cup \set{k}$): witnesses of the extended block
  must now cover $k$; the old $k$-free witnesses of $B_i$ are
  set free; blocks born before $B_i$ additionally admit the
  $k$-variants of their witnesses; blocks born after do not.

    $$
    \begin{aligned}
    \KA^\xi_{B'_i} &= \KA^\tau_{B_i} \uplus k, \\
    \KA^\xi_0 &= \KA^\tau_0 \cup (\KA^\tau_0 \uplus k)
                 \cup \KA^\tau_{B_i}, \\
    \KA^\xi_B &= \KA^\tau_B \cup (\KA^\tau_B \uplus k)
      && (B <_b B_i), \\
    \KA^\xi_B &= \KA^\tau_B
      && (B >_b B_i).
    \end{aligned}
    $$

The asymmetry between older and younger blocks is a tie-break.
The partition lemma below assigns $k$ to the *youngest* block
pointed at by a witness containing $k$: a $k$-variant pointing
at an older block is an admissible extra witness of that block,
while one pointing at a younger block would change the
classification and is therefore excluded.

**Lemma (Structure).** For every $\xi \in \Part(k)$:

1. *(Disjointness)* The sets $\KA^\xi_0$ and $\KA^\xi_B$,
   $B \in \xi$, are pairwise disjoint.
2. *(Anchors)* $\emptyset \in \KA^\xi_0$ and $B \in \KA^\xi_B$.
3. *(Sandwich)* $B \subseteq S$ for every $S \in \KA^\xi_B$;
   and $S \subsetneq [k]$ for every
   $S \in \KA^\xi_0 \cup \bigcup_B (\KA^\xi_B \setminus \set{B})$.

**Proof.** Induction along the recursion. *New block:* the new
witnesses $\KA^\tau_0 \uplus k$ all contain $k$ while all
inherited sets lie in $\KP([k-1])$, so disjointness is
preserved; $\set{k} = \emptyset \cup \set{k}$ is an anchor
witness, and $S \cup \set{k} \supseteq \set{k}$ with
$S \cup \set{k} \subsetneq [k]$ for $S \neq \emptyset$, since
$S \subsetneq [k-1]$ by induction. *Extend block:* split every
correction set by membership of $k$. The $k$-free strata
$\KA^\tau_0$, $\KA^\tau_{B_i}$, $(\KA^\tau_B)_{B \neq B_i}$ are
pairwise disjoint by induction, and so are the $k$-strata
$\KA^\tau_0 \uplus k$, $\KA^\tau_{B_i} \uplus k$,
$(\KA^\tau_B \uplus k)_{B <_b B_i}$, since $\uplus k$ is
injective. Anchors: $B'_i = B_i \cup \set{k} \in
\KA^\tau_{B_i} \uplus k$. Sandwich: $S \supseteq B_i$ gives
$S \cup \set{k} \supseteq B'_i$; strict upper bounds propagate
since $k$-free sets miss $k$, and lifted sets $S \cup \set{k}$
with $S \subsetneq [k-1]$ stay proper ($S = [k-1]$ occurs only
for the anchor of the full block). $\square$

**Definition (Fibers).** For $\xi \in \Part(k)$ set

$$
\Cov(\xi)
:= \set{E_0 \sqcup \textstyle\bigsqcup_{B \in \xi} E_B
   \;:\; E_0 \subseteq \KA^\xi_{0,+},
   \ \emptyset \neq E_B \subseteq \KA^\xi_B}.
$$

**Lemma (Fibers).** For every $\xi \in \Part(k)$:

1. The parts of $H \in \Cov(\xi)$ are recovered from the union
   as $E_0 = H \cap \KA^\xi_{0,+}$ and $E_B = H \cap \KA^\xi_B$;
   hence

    $$
    \Cov(\xi)
    \simeq \KP(\KA^\xi_{0,+})
    \times \prod_{B \in \xi} \KP_+(\KA^\xi_B).
    $$

2. $\Cov(\xi) \subseteq \Cov(k)$.

**Proof.** Ad 1) Immediate from disjointness. Ad 2) Every
$H \in \Cov(\xi)$ is a covering: each block is covered by any
of its witnesses (sandwich), and the blocks partition $[k]$.
$\square$

**Lemma (Partition).** The fibers partition the coverings:

$$
\Cov(k) = \bigsqcup_{\xi \in \Part(k)} \Cov(\xi).
$$

**Proof.** Induction on $k$; for $k = 0$ both sides are
$\set{\emptyset}$. Let $k \geq 1$ and $H \in \Cov(k)$. Write
$H = H_0 \sqcup H_1$ for the members without and with $k$.
Stripping $k$ yields the covering
$\pi(H) := \set{S \setminus \set{k} : S \in H}
\setminus \set{\emptyset} \in \Cov(k-1)$ and the *pointers*
$F := \set{S \setminus \set{k} : S \in H_1}$; note
$H_1 \neq \emptyset$ since $H$ covers $k$, and
$\pi(H) = H_0 \cup (F \setminus \set{\emptyset})$.
By induction $\pi(H)$ lies in a unique fiber $\Cov(\tau)$,
$\tau \in \Part(k-1)$; in particular every member of $\pi(H)$,
and hence every pointer, lies in exactly one correction set of
$\tau$ (disjointness; the pointer $\emptyset$ lies in
$\KA^\tau_0$). Call $B \in \tau$ *touched* if
$F \cap \KA^\tau_B \neq \emptyset$, and classify:

$$
\xi(H) :=
\begin{cases}
\tau \cup \set{\set{k}}
  & \text{no block touched}, \\
\tau \text{ with } k \text{ inserted into } B_i
  & B_i \text{ the youngest touched block}.
\end{cases}
$$

It suffices to prove that (1) $H \in \Cov(\xi)$ implies
$\xi = \xi(H)$, and (2) $H \in \Cov(\xi(H))$ for every
$H \in \Cov(k)$: the fibers are then pairwise disjoint by (1)
and exhaustive by (2).

Ad 1) Let $H = E_0 \sqcup \bigsqcup E_B \in \Cov(\xi)$ and
$\tau' := \xi|_{[k-1]}$. In the new-block case, the only
correction set of $\xi$ containing $k$-sets is
$\KA^\xi_{\set{k}} = \KA^{\tau'}_0 \uplus k$, so
$H_1 = E_{\set{k}}$ and $F \subseteq \KA^{\tau'}_0$. Thus
$\pi(H) = (E_0 \cup F_+) \sqcup \bigsqcup_{B} E_B
\in \Cov(\tau')$, forcing $\tau = \tau'$, and no block is
touched: $\xi(H) = \tau \cup \set{\set{k}} = \xi$. In the
extend case ($k$ inserted into $B_i$), stripping $k$ maps
$E_{B'_i}$ into $\KA^{\tau'}_{B_i}$ (nonempty), each $E_B$
into $\KA^{\tau'}_B$ (nonempty), and $E_0$ into
$\KA^{\tau'}_0 \cup \KA^{\tau'}_{B_i}$; hence
$\pi(H) \in \Cov(\tau')$ and $\tau = \tau'$. The pointers lie
in $\KA^{\tau}_0 \cup \KA^{\tau}_{B_i} \cup
\bigcup_{B <_b B_i} \KA^{\tau}_B$, and
$E_{B'_i} \neq \emptyset$ contributes one in
$\KA^{\tau}_{B_i}$: the touched blocks include $B_i$ and are
otherwise older, so $\xi(H) = \xi$.

Ad 2) Let $\tau$ be the fiber of $\pi(H)$ and $\xi := \xi(H)$;
we sort the members of $H$ by role. If no block is touched,
all pointers are free, $F \subseteq \KA^\tau_0$, and
$H_1 = F \uplus k \subseteq \KA^\xi_{\set{k}}$ is a nonempty
witness choice for the new block. Since
$F_+ \subseteq \KA^\tau_{0,+}$ is disjoint from the block
sets, the block parts of $\pi(H)$ are $k$-free, so
$E_B := H_0 \cap \KA^\tau_B = \pi(H) \cap \KA^\tau_B \neq
\emptyset$; the remaining members lie in $\KA^\tau_{0,+}$ and
are free. Hence $H \in \Cov(\xi)$. If $B_i$ is the youngest
touched block, assign
$E_{B'_i} := (F \cap \KA^\tau_{B_i}) \uplus k
\subseteq \KA^\xi_{B'_i}$, nonempty since $B_i$ is touched.
For $B >_b B_i$ no pointer touches $B$ (it would be a younger
touched block), so the $B$-part of $\pi(H)$ is $k$-free and
$E_B := H_0 \cap \KA^\tau_B = \pi(H) \cap \KA^\tau_B
\neq \emptyset$. For $B <_b B_i$ set
$E_B := H \cap (\KA^\tau_B \cup \KA^\tau_B \uplus k)
\subseteq \KA^\xi_B$; every member of the nonempty $B$-part
of $\pi(H)$ lifts to a member of $H$ in one of the two
strata, so $E_B \neq \emptyset$. All remaining members are
free: $k$-free members in $\KA^\tau_0$ or $\KA^\tau_{B_i}$,
and $k$-members with pointer in $\KA^\tau_0$, lie in
$\KA^\xi_0$. This exhausts $H$: a $k$-free member lies in
$\pi(H)$, hence in exactly one correction set of $\tau$; a
$k$-member has its pointer in $\KA^\tau_0$, in
$\KA^\tau_{B_i}$, or in the witness set of a touched, hence
older, block. So $H \in \Cov(\xi)$. $\square$

**Theorem (Duarte–Torres).** Let $X, Y, Z$ be abelian groups,
$g: X \to Y$ and $f: Y \to Z$ arbitrary maps, $x \in X$,
$u_1, \dots, u_k \in X$, $k \geq 1$. Write $y = g(x)$ and
$v_S := \Delta(g; x; u_S)$ for $S \subseteq [k]$. Then

$$
\Delta(f \circ g; x; u_\bullet)
= \sum_{\xi \in \Part(k)}
  \Delta(f;\, y^\xi;\, (v^\xi_B)_{B \in \xi}),
$$

where

$$
y^\xi = y + \sum_{S \in \KA^\xi_{0,+}} v_S,
\qquad
v^\xi_B = \sum_{S \in \KA^\xi_B} v_S.
$$

By the anchor and sandwich properties,
$v^\xi_B = v_B + (\text{corrections})$ with each correction
indexed by a strict superset of $B$.

**Proof.** Fix $\xi$ and expand its summand at the unshifted
basepoint $y$: the direction shift [E0015] applied to each slot
$v^\xi_B = \sum_{S \in \KA^\xi_B} v_S$ gives a sum over
nonempty $E_B \subseteq \KA^\xi_B$, and the basepoint shift
applied to $y^\xi$ a sum over $E_0 \subseteq \KA^\xi_{0,+}$:

$$
\Delta(f;\, y^\xi;\, (v^\xi_B)_{B \in \xi})
= \sum_{E_0,\, (E_B)}
  \Delta(f;\, y;\, (v_S)_{S \in E_0 \sqcup \bigsqcup_B E_B})
= \sum_{H \in \Cov(\xi)}
  \Delta(f;\, y;\, (v_T)_{T \in H}),
$$

using the fiber parametrization
$\Cov(\xi) \simeq \KP(\KA^\xi_{0,+}) \times
\prod_B \KP_+(\KA^\xi_B)$. Summing over $\xi$, the partition
lemma turns the right side into the sum over all of $\Cov(k)$,
which equals $\Delta(f \circ g; x; u_\bullet)$ by the covering
Faà di Bruno formula [E0006]. $\square$

**Remark (Relation to Duarte–Torres).** Theorem 1 of
Duarte–Torres (arXiv:0811.4343) proves this formula with
recursively defined sets $A^\xi_\beta$, by an analytic
induction in place of the fibration of $\Cov(k)$. Two caveats:
(1) our correction sets are the mirror image of the ones
printed in their examples, whose tie-break attaches
$k$-variants to *younger* blocks and inserts $k$ into the
*oldest* touched block; both conventions are valid. (2) Their
order bounds ($|S| < \mathrm{maxord}(\xi)$ for free sets,
$\leq$ for witnesses) fail from $k = 4$ on, e.g. for
$\xi = \set{\set{2,3}, \set{1,4}}$; the correct general bound
is the sandwich of the structure lemma.

---

**Validation (numeric).** The recursion, structure lemma, and
formula are implemented in
[Discrete-Faa-di-Bruno](https://github.com/HeinrichHartmann/Discrete-Faa-di-Bruno):
structural properties verified through degree $6$, the formula
through degree $5$ (`tests/test_asets.py`), cross-validated
against an independent top-down recursion
(`tests/test_duarte_torres.py`). The failure of the
Duarte–Torres order bounds at degree $4$ is documented there.
