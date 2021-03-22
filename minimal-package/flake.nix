{
  description = "A minimal example flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages =
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlay ];
          };
        in {
          inherit (pkgs) hello-flake;
        };

        apps = {
          hello-flake = {
            type = "app";
            description = "hello-flake";
            program = "${self.packages.${system}.hello-flake}/bin/hello-flake";
          };
        };

        defaultPackage = self.packages.${system}.hello-flake;
        defaultApp = self.apps.${system}.hello-flake;
    }) // {
      checks = self.packages;

      overlay = final: prev: {
        hello-flake = final.callPackage ./hello-flake {};
      };
    };
}
