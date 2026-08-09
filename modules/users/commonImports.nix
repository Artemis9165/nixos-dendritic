{ self, inputs, ... }: {
  flake.homeModules.commonImports = { pkgs, ... }: {
    imports = [
      self.homeModules.niriConfiguration
      self.homeModules.kittyConfiguration
      self.homeModules.starship
    ];
  };
}
