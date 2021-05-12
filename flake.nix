{
  description = "Flake templates from dramforever";

  outputs = { self }: {
    templates = {
      single-package = {
        path = ./single-package;
        description = "A package flake with a single package";
      };
    };
  };
}
