{ self, inputs, ... }: {
  flake.nixosModules.neptuneConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.neptuneHardwareConfiguration
      self.nixosModules.grub
      self.nixosModules.neptuneUsers
      self.nixosModules.homeManager
      self.nixosModules.niri
      self.nixosModules.keyd
      self.nixosModules.audio
      self.nixosModules.bluetooth
      self.nixosModules.commonSystemPackages
      self.nixosModules.fonts
      self.nixosModules.grub
      self.nixosModules.batteryControl
      self.nixosModules.radicale # TEMPORARY FIX, MOVE LATER
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Neptune";
      networkmanager.enable = true;
    };
    environment.systemPackages = with pkgs; [
      librewolf
      ungoogled-chromium
      brightnessctl
      grim
      slurp
      wl-clipboard
      thunderbird
      localsend
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
