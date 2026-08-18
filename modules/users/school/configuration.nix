{ self, inputs, ... }: {
  flake.nixosModules.schoolInit = { pkgs, ... }: {
    users.users.school = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "video" "render" ];
      packages = with pkgs; [
        libreoffice-qt
        hunspell
        hunspellDicts.en_US
      ];
    };
  };
  flake.homeModules.schoolConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.commonImports
      self.homeModules.emacsConfiguration
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
