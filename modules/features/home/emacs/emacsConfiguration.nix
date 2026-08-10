{ self, inputs, ... }: {
  flake.homeModules.emacsConfiguration = { config, pkgs, ... }: {
    home.packages = with pkgs; [
      enchant_2
      hunspell
      hunspellDicts.en-us
      poppler
      texliveFull
      gcc
      ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [ epkgs.jinx ]))
    ];

    home.sessionVariables = {
      PKG_CONFIG_PATH = "${pkgs.enchant}/lib/pkgconfig";
    };

    xdg.configFile."emacs/early-init.el".source = ./configuration/early-init.el;
    xdg.configFile."emacs/init.el".source = ./configuration/init.el;
    xdg.configFile."emacs/org" = {
      source = ./configuration/org;
      recursive = true;
    };
  };
}
