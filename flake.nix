{
  description = "Flake templates from dramforever";

  outputs = { self }: {
    templates =
      with builtins;
      let
        dirContents = readDir ./.;
        names = filter (name: dirContents.${name} == "directory") (attrNames dirContents);
        gen = name:
          {
            inherit name;
            value = {
              path = ./${name};
              description = (import ./${name}/flake.nix).description;
            };
          };
      in
        listToAttrs (map gen names);
  };
}
