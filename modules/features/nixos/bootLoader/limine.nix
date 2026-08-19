{ self, inputs, ... }: {
  flake.nixosModules.limine = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      sbctl
    ];
    boot.loader = {
      efi.canTouchEfiVariables = false;
      limine = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };
  };
}
