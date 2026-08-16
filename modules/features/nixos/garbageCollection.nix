{ self, inputs, ... }: {
  flake.nixosModules.garbageCollection = { ... }: {
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 5d";
    };
    nix.settings.auto-optimise-store = true;
  };
}
