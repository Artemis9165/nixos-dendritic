{ self, inputs, ... }: {
  flake.nixosModules.dms = { pkgs, ... }: {
    programs.dms-shell = {
      enable = true;
      systemd.enable = true;
    };
    services.displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/coding";
    };
  };
}
