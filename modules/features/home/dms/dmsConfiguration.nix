{ self, inputs, ... }: {
  flake.homeModules.dmsConfiguration = { config, ... }: {
    xdg.configFile."DankMaterialShell/settings.json".text =
      builtins.replaceStrings
        [ "@DMS_CONFIG@" ]
        [ "${config.xdg.configHome}/DankMaterialShell" ]
        (builtins.readFile ./configuration/settings.json);

    xdg.configFile."DankMaterialShell/themes" = {
      source = ./configuration/themes;
      recursive = true;
    };
  };
}
