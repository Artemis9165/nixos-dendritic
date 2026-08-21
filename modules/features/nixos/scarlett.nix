{ self, inputs, ... }: {
  flake.nixosModules.scarlett = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      alsa-scarlett-gui
      scarlett2
    ];
  };
}
