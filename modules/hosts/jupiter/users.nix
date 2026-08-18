{ self, inputs, ... }: {
  flake.nixosModules.jupiterUsers = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.generalInit
      self.nixosModules.codingInit
    ];
    home-manager.users = {
      general = self.homeModules.generalConfiguration;
      coding = self.homeModules.codingConfiguration;
    };
  };
}
