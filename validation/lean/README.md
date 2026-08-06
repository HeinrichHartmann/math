# Discrete Faà di Bruno — Lean formalisation

Machine-checkable formalisation of results from
*Discrete Faà di Bruno via Möbius Inversion* (Hartmann, 2026).

## Status

**Layer 1 — Möbius inversion and Taylor duality** (`Prop:moebius-inversion`, `Prop:multi-index-moebius`, `Prop:taylor-duality`).

All files are **machine-checked** (`lake build` succeeds on Lean 4.32.0-rc1 / Mathlib master).

| File | Content |
|---|---|
| `Elements/Moebius.lean` | Boolean Möbius inversion: `zeta`/`mu` on `Finset α → G`, both directions (`mu_zeta`, `zeta_mu`), packaged as `zetaEquiv`. |
| `Elements/MoebiusBinomial.lean` | Binomial (multi-index) Möbius inversion: multivariate cancellation `binom_cancellation` (proved in full generality) and inversion `muB_zetaB`. |
| `Elements/Taylor.lean` | Boolean Taylor duality: forward differences (`fwdDiff`) and translations (`tr`) as Möbius duals, Taylor formula (`taylor_formula`), separated form (`taylor_separated`). |
| `verify/moebius_check.py` | Exhaustive/randomised numerical check over ℤ of every statement formalised here. |

Everything is stated over an arbitrary abelian group `G` (`AddCommGroup`): no
denominators, any characteristic — matching the paper. Signs are the ℤ-action
`(-1)^n • g`.

## The mathematics (Layer 1)

For a cube `a : 𝒫(k) → G`,

    ζ(a; S) = ∑_{T ⊆ S} a T,     μ(a; S) = ∑_{T ⊆ S} (-1)^{|S|-|T|} a T

are inverse bijections. The entire proof reduces to the one-line cancellation

    ∑_{R ⊆ P} (-1)^{|P|-|R|} = [P = ∅]      ( = "(1-1)^{|P|}" )

(`alternating_sum_powerset`), wrapped in a double-sum interchange and a
`T ↦ T \ U` reindexing. The binomial version replaces subsets by multi-indices
`β ≤ α` and `[P=∅]` by the coordinatewise product `∏_i (1-1)^{α_i}`.

## Building locally

Needs normal network access (GitHub + Mathlib's olean cache).

**With Nix** (provides `elan`/`lake`; `flake.nix` mirrors the repo's top-level flake):

```bash
cd lean
nix develop          # elan + lake + python3 on PATH
make build           # = lake update (first run) + lake exe cache get + lake build
```

**Without Nix** — install [`elan`](https://github.com/leanprover/elan) (it reads
`./lean-toolchain` and fetches the matching Lean), then:

```bash
cd lean
make build           # or: lake update && lake exe cache get && lake build
```

Numerical cross-check of the formalised statements (**no Lean needed**):

```bash
make verify          # = python3 verify/moebius_check.py
```

## Roadmap

Layer 1 is the foundation for the paper's core result, the discrete covering
Faà di Bruno formula (`Thm:dfdb`) — the natural next target for formalisation.
