{ self, inputs, ... }: {
  flake.homeModules.schoolConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.emacsConfiguration
      self.homeModules.starship
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
