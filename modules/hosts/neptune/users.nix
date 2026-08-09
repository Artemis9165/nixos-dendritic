{ self, inputs, ... }: {
  flake.nixosModules.neptuneUsers = { ... }: {
    imports = [ inputs.home-manager.nixosModules.default ];
    users.users = {
      coding = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
      };
      general = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
      };
      school = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" ];
      };
    };
    home-manager.users = {
      coding = self.homeModules.codingConfiguration;
      general = self.homeModules.generalConfiguration;
      school = self.homeModules.schoolConfiguration;
    };
  };
}
