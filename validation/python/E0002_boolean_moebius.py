"""
Numeric validation for E0002 — Boolean Möbius inversion.

Checks: ζ and μ are inverse bijections on Map(P(k), G).
For random cubes a: P(k) → Z/p, verifies μ(ζ(a)) = a and ζ(μ(a)) = a.
"""

import random
from itertools import combinations


def powerset(S):
    """All subsets of S as frozensets."""
    S = list(S)
    result = []
    for r in range(len(S) + 1):
        for c in combinations(S, r):
            result.append(frozenset(c))
    return result


def zeta(a, S, k_set):
    """ζ(a; S) = Σ_{T ⊆ S} a(T)"""
    return sum(a[T] for T in powerset(S) if T <= S)


def mu(a, S, k_set):
    """μ(a; S) = Σ_{T ⊆ S} (-1)^{|S|-|T|} a(T)"""
    return sum((-1) ** (len(S) - len(T)) * a[T]
               for T in powerset(S) if T <= S)


def random_cube(k, p):
    """Random cube a: P([k]) → Z/p."""
    k_set = frozenset(range(1, k + 1))
    return {T: random.randint(0, p - 1) for T in powerset(k_set)}


def apply_transform(transform, a, k):
    """Apply ζ or μ to every subset."""
    k_set = frozenset(range(1, k + 1))
    return {S: transform(a, S, k_set) % p for S in powerset(k_set)}


def validate(k, p, trials=100):
    """Validate μ∘ζ = id and ζ∘μ = id on random cubes."""
    for _ in range(trials):
        a = random_cube(k, p)
        za = apply_transform(zeta, a, k)
        mza = apply_transform(mu, za, k)
        # Check μ(ζ(a)) = a mod p
        for S in a:
            assert mza[S] % p == a[S] % p, (
                f"μ(ζ(a)) ≠ a at S={S}, k={k}, p={p}")

        ma = apply_transform(mu, a, k)
        zma = apply_transform(zeta, ma, k)
        # Check ζ(μ(a)) = a mod p
        for S in a:
            assert zma[S] % p == a[S] % p, (
                f"ζ(μ(a)) ≠ a at S={S}, k={k}, p={p}")


if __name__ == "__main__":
    primes = [2, 3, 5, 7, 11]
    cases = 0
    for k in range(0, 7):
        for p in primes:
            validate(k, p, trials=50)
            cases += 50
    print(f"E0002 validated: {cases} random cubes, "
          f"k ∈ {{0,...,6}}, p ∈ {primes}. All pass.")
