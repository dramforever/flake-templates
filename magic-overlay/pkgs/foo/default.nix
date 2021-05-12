{ writeShellScriptBin }:

writeShellScriptBin "foo" ''
  echo "Hi I'm foo" >&2
''
