---
outline_enabled: false
id: E0008
title: Weight bound
kind: lemma
status: established
visibility: public
notation: E0001
depends_on: [E0007]
checked: [ai, formal]
validation:
  formal:
    file: validation/lean/Elements/E0008.lean
    theorems: [weight_bound, cover_size_bound]
published_at: [DFDB]
---

# E0008 — Weight bound

Among the higher coverings $\Cov_r(S)$ [E0007], the partitions $\Part_r(S)$ are precisely those of minimal weight, with weight equal to $|S|$.

**Lemma.** For any covering $H \in \Cov_r(S)$ with $r \geq 1$,
$\mathrm{wt}(H) \geq |S|$, with equality if and only if
$H \in \Part_r(S)$.

**Proof.**
Ad $r = 1$) $\Cov_1(S) = \Part_1(S) = \set{S}$ and
$\mathrm{wt}(S) = |S|$.

Ad $r = 2$) $\mathrm{wt}(H) = \sum_{T \in H} |T| \geq
|\bigcup H| = |S|$, with equality iff the blocks are pairwise
disjoint.

Ad $r \geq 3$) Each $K \in H$ lies in $\Cov_{r-1}(\lf(K))$,
since $K \in \KP_+^{r-1}(\lf(K))$ by recursion on levels.
By induction,
$\mathrm{wt}(H) = \sum_{K \in H} \mathrm{wt}(K) \geq
\sum_{K \in H} |\lf(K)| \geq |S|$, with equality iff each
$K \in \Part_{r-1}(\lf(K))$ and the leaf supports partition $S$.
In the equality case $K \mapsto \lf(K)$ is injective (the
$\lf(K)$ are nonempty and disjoint), so $H$ matches the
recursion defining $\Part_r$ [E0007]; conversely each
$H_B \in \Part_{r-1}(B)$ has $\lf(H_B) = B$.

---

**Validation (AI review, 2026-07-19, claude-fable-5, pass).**
All three cases, both directions of the equality criterion,
edge cases ($S = \emptyset$ vacuous, singletons, repeated leaf
supports, $r \geq 1$ necessary). No issues found.
