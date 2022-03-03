{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./env.nix {}
