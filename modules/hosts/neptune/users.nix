{ self, inputs, ... }: {
  flake.nixosModules.neptuneUsers = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.codingInit
      self.nixosModules.generalInit
      self.nixosModules.schoolInit
    ];
    home-manager.users = {
      coding = self.homeModules.codingConfiguration;
      general = self.homeModules.generalConfiguration;
      school = self.homeModules.schoolConfiguration;
    };
  };
}
