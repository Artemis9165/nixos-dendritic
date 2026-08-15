{ self, inputs, ... }: {
  flake.nixosModules.neptuneUsers = { pkgs, ... }: {
    imports = [ inputs.home-manager.nixosModules.default ];
    users.users = {
      coding = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
        packages = with pkgs; [
        ];
      };
      general = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
      };
      school = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" ];
        packages = with pkgs; [
          libreoffice-qt
          hunspell
          hunspellDicts.en_US
        ];
      };
    };
    home-manager.users = {
      coding = self.homeModules.codingConfiguration;
      general = self.homeModules.generalConfiguration;
      school = self.homeModules.schoolConfiguration;
    };
  };
}
