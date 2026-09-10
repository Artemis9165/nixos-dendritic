{ self, inputs, ... }: {
  flake.nixosModules.qt = { lib, ... }: {
    environment.sessionVariables = {
      QT_QPA_PLATFORM = lib.mkForce "wayland;xcb";
      QT_QPA_PLATFORMTHEME = lib.mkForce "xdgdesktopportal";
    };
  };
}
