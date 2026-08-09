{ self, inputs, ... }: {
  flake.homeModules.starship = { pkgs, ... }: {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
