{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    imports = [ self.nixosModules.dms ];
    programs.niri = {
      enable = true;
    };
  };
}
