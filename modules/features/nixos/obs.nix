{ self, inputs, ... }: {
  flake.nixosModules.obsStudio = { config, pkgs, ... }: {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
      ];
    };
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
      ];
    };
  };
}
