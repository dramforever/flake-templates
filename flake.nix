{
  description = "Flake templates from dramforever";

  outputs = { self }: {
    templates = {
      single-package = {
        path = ./single-package;
        description = "An example single-package flake";
      };

      magic-overlay = {
        path = ./magic-overlay;
        description = "An example package set using a magic overlay";
      };
    };
  };
}
