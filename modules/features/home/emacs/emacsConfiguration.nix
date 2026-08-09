{ self, inputs, ... }: {
  flake.homeModules.emacsConfiguration = { config, pkgs, ... }: {
    home.packages = with pkgs; [
      emacs-pgtk
      enchant
      hunspell
      hunspellDicts.en-us
      poppler
      texliveFull
    ];
    xdg.configFile."emacs".source = config.lib.file.mkOutOfStoreSymlink
      "${./configuration}";
  };
}
