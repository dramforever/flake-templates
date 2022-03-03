{
  description = "Development shell minimal starter";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      selectedSystems = with lib.systems.supported; tier1 ++ tier2;
    in {
      devShell = lib.genAttrs selectedSystems (system:
        nixpkgs.legacyPackages.${system}.callPackage ./env.nix {});
    };
}
