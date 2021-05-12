{ writeShellScriptBin }:

writeShellScriptBin "bar" ''
  echo "Hi I'm bar" >&2
''
