{ self, inputs, ... }: {
  flake.nixosModules.jupiterConfiguration = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.commonImports
      self.nixosModules.jupiterHardwareConfiguration
      self.nixosModules.jupiterUsers
      self.nixosModules.closeLaptopLid
      self.nixosModules.batteryControl
      self.nixosModules.obsStudio
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Jupiter";
      networkmanager.enable = true;
    };
    environment.systemPackages = with pkgs; [
      kdePackages.kdenlive
      alsa-scarlett-gui
      scarlett2
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
