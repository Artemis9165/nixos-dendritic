{ self, inputs, ... }: {
  flake.homeModules.commonImports = { pkgs, ... }: {
    imports = [
      self.homeModules.niriConfiguration
      self.homeModules.kittyConfiguration
      self.homeModules.dmsConfiguration
      self.homeModules.starship
      self.homeModules.khal
      self.homeModules.btop
    ];
  };
}
