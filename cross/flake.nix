{
  description = "Nix Flake cross-compilation development shell minimal starter template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      selectedSystems = with lib.systems.supported; tier1 ++ tier2;
    in {
      devShell = lib.genAttrs selectedSystems (system:
        (import nixpkgs {
          inherit system;
          crossSystem.config = "riscv64-unknown-linux-gnu";
        }).callPackage ./env.nix {});
    };
}
