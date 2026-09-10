{ self, inputs, ... }: {
  flake.nixosModules.qt = { lib, ... }: {
    environment.variables = {
      QT_QPA_PLATFORM = lib.mkForce "wayland;xcb";
      QT_QPA_PLATFORMTHEME = lib.mkForce "xdgdesktopportal";
    };
  };
}
