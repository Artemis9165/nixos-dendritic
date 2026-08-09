{ self, inputs, ... }: {
  flake.nixosModules.grub = { config, ... }: {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "2560x1440";
        gfxpayloadEfi = "keep";
        theme = "${config.home.homeDirectory}/nixos-dendritic/modules/features/nixos/bootLoader/themes/darkmatter";
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
