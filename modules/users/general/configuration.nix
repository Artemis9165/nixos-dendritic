{ self, inputs, ... }: {
  flake.homeModules.generalConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.commonImports
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
