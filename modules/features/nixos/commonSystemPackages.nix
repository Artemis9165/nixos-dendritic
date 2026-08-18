{ self, inputs, ... }: {
  flake.nixosModules.commonSystemPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim
      sbctl
      git
      kitty
      imagemagick
      keepassxc
      fetch
      kdePackages.breeze
      kdePackages.breeze-icons
      mpv
      pcmanfm
    ];
  };
}
