{ self, inputs, ... }: {
  flake.nixosModules.jupiterUsers = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.generalInit
      self.nixosModules.creationInit
    ];
    users.users.creation.packages = with pkgs; [
      prismlauncher
      steam
    ];
    home-manager.users = {
      general = self.homeModules.generalConfiguration;
      creation = self.homeModules.creationConfiguration;
    };
  };
}
