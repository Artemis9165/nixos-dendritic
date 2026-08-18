{ self, inputs, ... }: {
  flake.nixosModules.limine = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      sbctl
    ];
    boot.loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        efiSupport = true;
      };
    };
  };
}
