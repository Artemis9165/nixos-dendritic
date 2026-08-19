{ self, inputs, ... }: {
flake.nixosModules.neptuneHardwareConfiguration = { config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/d11bcf4d-3bde-4ac7-9585-fa33eb22decb";

  fileSystems."/home" =
    { device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/swap" =
    { device = "/dev/mapper/cryptroot";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CB4D-5CB9";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [{
    device  = "/swap/swapfile";
    size = 10 * 1024;
  }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
};
}
