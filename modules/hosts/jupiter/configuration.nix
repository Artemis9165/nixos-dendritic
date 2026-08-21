{ self, inputs, ... }: {
  flake.nixosModules.jupiterConfiguration = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.commonImports
      self.nixosModules.jupiterHardwareConfiguration
      self.nixosModules.jupiterUsers
      self.nixosModules.closeLaptopLid
      self.nixosModules.batteryControl
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Jupiter";
      networkmanager.enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    boot.loader.limine.extraEntries = ''
      /Windows
      protocol: efi
      path: uuid(fdda432a-f6f1-43fc-a046-60de5207e8f7):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    boot.kernelParams = [
      "amdgpu.dcdebugmask=0x10"
      "amdgpu.abmlevel=0"
      "nvidia-drm.fbdev=1"
    ];
    services.xserver.videoDrivers = [
      "amdgpu"
      "nvidia"
    ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          libva
          libva-utils
          mesa
          vulkan-validation-layers
        ];
      };
      nvidia = {
        open = false;
        modesetting.enable = true;
        powerManagement = {
          enable = true;
          finegrained = false;
        };
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          amdgpuBusId = "PCI:5:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
