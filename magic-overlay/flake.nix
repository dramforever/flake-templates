{
  description = "An example package set using a magic overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    let
      packageNames = with builtins; attrNames (readDir ./pkgs);
      inherit (nixpkgs) lib;

    in flake-utils.lib.eachDefaultSystem (system: {
      packages =
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlay ];
          };
        in lib.genAttrs packageNames (name: pkgs."${name}");
    }) // {
      overlay = final: prev:
        lib.genAttrs packageNames (name:
          final.callPackage (./pkgs + "/${name}") {});
    };

}
