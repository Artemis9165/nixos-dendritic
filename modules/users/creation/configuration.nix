{ self, inputs, ... }: {
  flake.nixosModules.creationInit = { pkgs, ... }: {
    imports = [
      self.nixosModules.obsStudio
      self.nixosModules.scarlett
      self.nixosModules.libreOffice
      self.nixosModules.gaming
    ];
    programs.ydotool.enable = true;
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
        handy
        ydotool
      ];
    };
  };
  flake.homeModules.creationConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.commonImports
      self.homeModules.emacsConfiguration
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
