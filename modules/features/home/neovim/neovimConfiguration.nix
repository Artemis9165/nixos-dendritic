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
      rust-analyzer
    ];
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      sideloadInitLua = true;
    };
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-dendritic/modules/features/home/neovim/configuration";
  };
}
