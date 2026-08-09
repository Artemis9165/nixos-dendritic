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

    xdg.configFile."emacs/early-init.el".source = ./configuration/early-init.el;
    xdg.configFile."emacs/init.el".source = ./configuration/init.el;
    xdg.configFile."emacs/org" = {
      source = ./configuration/org;
      recursive = true;
    };
    #    xdg.configFile."emacs/org/config" = {
    #      source = ./configuration/org/config;
    #      recursive = true;
    #    };
    #    xdg.configFile."emacs/org/packages" = {
    #      source = ./configuration/org/packages;
    #      recursive = true;
    #    };
  };
}
