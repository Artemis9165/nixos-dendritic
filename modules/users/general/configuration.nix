{ self, inputs, ... }: {
  flake.homeModules.generalConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.starship
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
