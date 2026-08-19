{ self, inputs, ... }: {
  flake.nixosModules.neptuneConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.commonImports
      self.nixosModules.neptuneHardwareConfiguration
      self.nixosModules.neptuneUsers
      self.nixosModules.obsStudio
      self.nixosModules.closeLaptopLid
      self.nixosModules.batteryControl
      self.nixosModules.radicale # TEMPORARY FIX, MOVE LATER
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Neptune";
      networkmanager.enable = true;
    };
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
