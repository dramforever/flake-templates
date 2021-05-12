{ writeShellScriptBin }:

writeShellScriptBin "hello-flake" ''
  echo Hello, flake world! >&2
''
