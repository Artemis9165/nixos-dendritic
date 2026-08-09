{ self, inputs, ... }: {
  flake.homeModules.dmsConfiguration = { config, ... }: {
    xdg.configFile."DankMaterialShell" = {
      source = ./configuration;
      recursive = true;
    };
  };
}
