---
outline_enabled: false
id: E0014
title: Discrete product rule
kind: theorem
status: established
visibility: public
notation: E0001
depends_on: [E0004, E0005]
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0014.lean
    theorems: [product_rule_general]
    note: "r = 2 case separately in ProductRule.lean (product_rule, parked module)"
published_at: [DFDB]
---

# E0014 — Discrete product rule

The forward difference $\Delta$ [E0004] of a product expands
over ordered coverings of the direction set, by the same
Möbius mechanism as the composition formula [E0006].

**Theorem.** Let $X$ be an abelian group, $A$ an associative
algebra, and $f_1,\dots,f_r: X \to A$. For $x \in X$ and
$u_1,\dots,u_n \in X$:

- *Boolean product rule:*

    $$
    \Delta(f_1 \cdots f_r; x; u_1,\dots,u_n)
    =
    \sum_{\substack{J_1,\dots,J_r \subseteq [n] \\
    J_1 \cup \cdots \cup J_r = [n]}}
    \Delta(f_1; x; u_{J_1}) \cdots \Delta(f_r; x; u_{J_r}).
    $$

- *Boolean Taylor product rule:*

    $$
    (f_1 \cdots f_r)(x + {\textstyle\sum_{i=1}^n} u_i)
    =
    \sum_{J_1, \dots, J_r \subseteq [n]}
    \Delta(f_1; x; u_{J_1}) \cdots \Delta(f_r; x; u_{J_r}).
    $$

    The sum in the first part runs over all *ordered coverings*
    $(J_1,\dots,J_r)$: the $J_a$ may overlap and empty $J_a$
    are allowed. The second part is the product of Taylor
    expansions. Binomial versions follow by applying to
    $S(\gamma)$.

**Proof.**
By Taylor duality [E0005],
$f_a(x + \sum_{i \in S} u_i) =
\sum_{J_a \subseteq S} \Delta(f_a; x; u_{J_a})$.
Multiplying $r$ such expansions and substituting into the
alternating sum for $\Delta(f_1 \cdots f_r)$:

$$
\Delta(f_1 \cdots f_r; x; u_\bullet)
=
\sum_{\substack{J_1, \dots, J_r \subseteq [n] \\
S \supseteq J_1 \cup \cdots \cup J_r}}
(-1)^{n-|S|}\,
\Delta(f_1; x; u_{J_1}) \cdots \Delta(f_r; x; u_{J_r}).
$$

For a fixed tuple $(J_1, \dots, J_r)$, set
$M = [n] \setminus (J_1 \cup \cdots \cup J_r)$. The sign sum
is $\sum_{R \subseteq M} (-1)^{|M|-|R|} = (1-1)^{|M|}$: this
is $1$ if $J_1 \cup \cdots \cup J_r = [n]$ and $0$ otherwise.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
Both parts; sign collapse via $S = U \cup R$, $R \subseteq M$;
edge cases $n = 0$ (holds, no nonempty hypothesis needed),
$r = 1$, numeric check $n = 1$, $r = 2$; commutativity of $A$
correctly not assumed. Trimmed `depends_on` (E0002 was only a
thematic mention) and linked the existing Lean proofs. No
issues found.
