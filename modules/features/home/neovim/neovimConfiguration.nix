{ self, inputs, ... }: {
  flake.homeModules.neovimConfiguration = { config, pkgs, ... }: {
    home.packages = with pkgs; [
      ripgrep
      fd
      fzf
      nodejs
      gcc
      unzip
      curl
      wget
      rustc
      cargo
      python3
      lua55Packages.luarocks-nix
      lua55Packages.tree-sitter-cli
      clang-tools
      lua-language-server
      rust-analyzer
      nil
      nixfmt
      nixpkgs-fmt
      (rWrapper.override {
        packages = with rPackages; [
          languageserver
          styler
        ];
      })
    ];
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      sideloadInitLua = true;
    };
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${./configuration}";
  };
}
