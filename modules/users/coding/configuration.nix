{ self, inputs, ... }: {
  flake.homeModules.codingConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.niriConfiguration
      self.homeModules.kittyConfiguration
      self.homeModules.neovimConfiguration
      self.homeModules.tmuxConfiguration
      self.homeModules.starship
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
