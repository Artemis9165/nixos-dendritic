{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    imports = [ self.nixosModules.dms ];
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
    programs.niri = {
      enable = true;
    };
  };
}
