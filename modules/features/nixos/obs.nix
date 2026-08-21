{ self, inputs, ... }: {
  flake.nixosModules.obsStudio = { config, pkgs, ... }: {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
      config.niri = {
        default = [ "gnome" "gtk" ];
      };
    };
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
        obs-pipewire-audio-capture
        obs-vkcapture
      ];
    };
  };
}
