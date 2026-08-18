{ self, inputs, ... }: {
  flake.nixosModules.neptuneHardwareConfiguration = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];
    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/43daecf0-e73c-4224-ad67-888b2fb7e95f";
      fsType = "ext4";
    };
    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/0264-FA01";
      fsType = "vfat";
      options = [ "fmask=0007" "dmask=0007" ];
    };
    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/9e221aa7-58ec-4d26-b8ca-559523f87d7a";
      fsType = "ext4";
    };
    swapDevices = [
      { device = "/dev/disk/by-uuid/9abe351d-c40f-4ccb-8bbd-1f345322dd8f"; }
    ];
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
