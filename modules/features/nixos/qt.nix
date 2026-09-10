{ self, inputs, ... }: {
  flake.nixosModules.qt = { ... }: {
    environment.sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
    };
  };
}
