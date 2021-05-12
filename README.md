# Flake templates from dram

## Nix Flake

This repository contains a Nix Flake. To use it, use the following Flake URL:

```plain
github:dramforever/flake-templates
```

To initialize your projects using the provided templates, for example using the
`single-package` template, use this command:

```console
$ nix flake init -t github:dramforever/flake-templates#single-package
```

## What does this do?

Nix Flake users distribute derivations, NixOS modules, overlays, etc. with
Flakes in a decentralized way. There are flakes like [devos], which are
full-fledged Flakes that configure entire systems. But there should also be
'small Flakes' which are things like single packages or small package sets,
individual or several closely-related NixOS modules, and tiny development
environments

[devos]: https://github.com/divnix/devos

This repository is a showcase of a few Flake-related patterns I've gathered when
writing small Flakes.

## The templates

### `single-package` [(link)](single-package)

An example of a single-package flake. From a single package 'definition' file
`hello-flake/default.nix`, which is suited for `callPackage`, we derive the
following outputs:

- `overlay`: An overlay that just adds. Makes it easy to integrate your flake
  into other configurations.
- `packages.${system}.hello-flake` and `defaultPackage.${system}`: A package
  that you can refer to, based on a pinned version of `nixpkgs`.
- `apps.${system}.hello-flake` and `defaultApp.${system}`: An application
  that just points to `hello-flake`. Suitable for `nix run`.
- `checks.${system}.hello-flake`: A simple check that just verifies that
  `hello-flake` actually builds. Suitable for `nix flake check`.

We use [flake-utils] to generate these outputs for all the default systems.

[flake-utils]: https://github.com/numtide/flake-utils

This might be considered a bit excessive, but these are largely one-time jobs.
With this template, you don't even have to figure out how to write it. You just
need to do a find and replace.

Technically, if the package name identifies the name of the executable, the
`apps` and `defaultApp` outputs are not needed, but I think explicit is better.

This could be easily extended to multiple small packages, or a 'main' package
with several dependencies.
