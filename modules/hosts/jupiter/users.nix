{ self, inputs, ... }: {
  flake.nixosModules.jupiterUsers = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
      self.nixosModules.generalInit
    ];
    users.users.general.packages = with pkgs; [
      prismlauncher
      steam
    ];
    home-manager.users = {
      general = self.homeModules.generalConfiguration;
    };
  };
}
