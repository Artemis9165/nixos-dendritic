{ self, inputs, ... }: {
  flake.nixosModules.commonSystemPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim
      git
      kitty
      imagemagick
      keepassxc
      fetch
      kdePackages.breeze
      kdePackages.breeze-icons
      mpv
    ];
  };
}
