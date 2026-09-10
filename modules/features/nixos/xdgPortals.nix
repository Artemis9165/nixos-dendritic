{ self, inputs, ... }: {
  flake.nixosModules.xdgPortals = { config, pkgs, ... }: {
    xdg.portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
      config.niri = {
        default = [ "gnome" "gtk" ];
      };
    };
  };
}
