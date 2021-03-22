{
  description = "Flake templates from dramforever";

  outputs = { self }: {
    templates = {
      minimal-package = {
        path = ./minimal-package;
        description = "A minimal package flake";
      };
    };
  };
}
