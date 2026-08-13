{ self, inputs, ... }: {
  flake.homeModules.codingConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.commonImports
      self.homeModules.neovimConfiguration
      self.homeModules.emacsConfiguration
      self.homeModules.tmuxConfiguration
      self.homeModules.git
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "bracketed-segments" ];
    home.packages = with pkgs; [
      gh
      tmux
    ];
    home.stateVersion = "26.05";
  };
}
