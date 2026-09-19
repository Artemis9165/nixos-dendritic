{ self, inputs, ... }: {
  flake.nixosModules.grub = { config, ... }: {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        gfxpayloadEfi = "keep";
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
