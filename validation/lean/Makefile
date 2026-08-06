# Discrete Faà di Bruno — Lean formalisation
#
# Quickest path (needs Nix): `nix develop` then `make build`.
# Without Nix: install elan (https://github.com/leanprover/elan), then `make build`.

.PHONY: build update cache verify clean

## build: fetch deps (first run) and compile the Lean library
build:
	@command -v lake >/dev/null 2>&1 || { echo "lake not found — run 'nix develop' or install elan"; exit 1; }
	@test -d .lake/packages/mathlib || $(MAKE) update
	lake exe cache get || true
	lake build

## update: fetch Mathlib and pin the matching lean-toolchain
update:
	lake update

## cache: download prebuilt Mathlib oleans (avoids a source build)
cache:
	lake exe cache get

## verify: run the numerical cross-check of the formalised statements (no Lean needed)
verify:
	python3 verify/moebius_check.py

## clean: remove build artifacts
clean:
	rm -rf .lake build
