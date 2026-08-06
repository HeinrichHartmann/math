{
  description = "Discrete Faà di Bruno — Lean 4 / Mathlib formalisation";
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # `nix develop` drops you into a shell with `elan`/`lake` on PATH.
      # elan reads ./lean-toolchain and fetches the matching Lean automatically.
      #
      #   nix develop
      #   lake update          # fetch Mathlib, pin the matching toolchain
      #   lake exe cache get    # download prebuilt Mathlib oleans (skip source build)
      #   lake build            # build DiscreteFDB
      #
      # Numerical cross-check (no Lean needed):
      #   python3 verify/moebius_check.py
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          elan          # Lean version manager -> provides lake + lean
          git
          python3       # for verify/moebius_check.py
        ];
        shellHook = ''
          echo "Lean dev shell (elan $(elan --version 2>/dev/null | head -n1))."
          echo "Run: lake update && lake exe cache get && lake build"
        '';
      };
    }
  );
}
