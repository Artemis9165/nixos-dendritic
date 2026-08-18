{ self, inputs, ... }: {
  flake.nixosModules.limine = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      sbctl
    ];
    boot.loader.limine.enable = true;
  };
}
