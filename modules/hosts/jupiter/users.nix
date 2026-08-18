{ self, inputs, ... }: {
  flake.nixosModules.jupiterUsers = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.generalInit
    ];
    home-manager.users = {
      general = self.homeModules.generalConfiguration;
    };
  };
}
