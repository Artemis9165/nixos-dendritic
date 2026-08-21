{ self, inputs, ... }: {
  flake.nixosModules.libreOffice = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.en_US
    ];
  };
}
