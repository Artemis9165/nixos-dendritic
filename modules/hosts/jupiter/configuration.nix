{ self, inputs, ... }: {
  flake.nixosModules.jupiterConfiguration = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.jupiterHardwareConfiguration
      self.nixosModules.jupiterUsers
      self.nixosModules.limine
      self.nixosModules.homeManager
      self.nixosModules.niri
      self.nixosModules.garbageCollection
      self.nixosModules.keyd
      self.nixosModules.audio
      self.nixosModules.bluetooth
      self.nixosModules.commonSystemPackages
      self.nixosModules.fonts
      self.nixosModules.localsend
      self.nixosModules.closeLaptopLid
      self.nixosModules.batteryControl
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Jupiter";
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
    nixpkgs.config.allowUnfree = true;
    boot.loader.limine.extraEntries = ''
      /Windows
      protocol: efi
      path: uuid(fdda432a-f6f1-43fc-a046-60de5207e8f7):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    services.xserver.videoDrivers = [
      "amdgpu"
      "nvidia"
    ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      nvidia = {
        open = true;
        modesetting.enable = true;
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          amdgpuBusId = "PCI:5@0:0:0";
          nvidiaBusId = "PCI:1@0:0:0";
        };
      };
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
