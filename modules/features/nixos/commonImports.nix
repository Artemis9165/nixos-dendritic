{ self, inputs, ... }: {
  flake.nixosModules.commonImports = { ... }: {
    imports = [
      self.nixosModules.homeManager
      self.nixosModules.niri
      self.nixosModules.garbageCollection
      self.nixosModules.keyd
      self.nixosModules.audio
      self.nixosModules.bluetooth
      self.nixosModules.localsend
      self.nixosModules.commonSystemPackages
      self.nixosModules.fonts
      self.nixosModules.stylix
      self.nixosModules.qt
    ];
  };
}
