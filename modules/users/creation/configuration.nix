{ self, inputs, ... }: {
  flake.nixosModules.creationInit = { pkgs, ... }: {
    imports = [
      self.nixosModules.obsStudio
      self.nixosModules.scarlett
      self.nixosModules.libreOffice
      self.nixosModules.gaming
      self.nixosModules.handy
    ];
    users.users.creation = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "video" "render" "input" "ydotool" ];
      packages = with pkgs; [
        kdePackages.kdenlive
        glaxnimate
        ffmpeg-full
        gimp
        tenacity
        easyeffects
      ];
    };
  };
  flake.homeModules.creationConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.commonImports
      self.homeModules.emacsConfiguration
    ];
    home.sessionVariables = {
      YDOTOOL_SOCKET = "/run/ydotoold/socket";
    };
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
