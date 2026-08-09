{ self, inputs, ... }: {
  flake.nixosConfigurations.neptune = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.neptuneConfiguration
    ];
  };
}
