{ self, inputs, ... }: {
  flake.homeModules.niriConfiguration = { pkgs, ... }: {
    xdg.configFile."niri" = {
      source = ./configuration;
      recursive = true;
    };
  };
}
