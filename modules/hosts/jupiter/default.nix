{ self, inputs, ... }: {
  flake.nixosConfigurations.jupiter = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.jupiterConfiguration
    ];
  };
}
