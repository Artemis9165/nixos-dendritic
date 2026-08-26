{ self, inputs, ... }: {
  flake.nixosModules.schoolInit = { pkgs, ... }: {
    imports = [
      self.nixosModules.libreOffice
      self.nixosModules.rStudio
    ];
    users.users.school = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" ];
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
