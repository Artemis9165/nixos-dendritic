{ self, inputs, ... }: {
  flake.nixosModules.creationInit = { pkgs, ... }: {
    imports = [
      self.nixosModules.obsStudio
      self.nixosModules.scarlett
      self.nixosModules.libreOffice
    ];
    users.users.school = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "video" "render" ];
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
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
