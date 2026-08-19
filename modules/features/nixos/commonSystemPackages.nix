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
      librewolf
      ungoogled-chromium
      brightnessctl
      grim
      slurp
      wl-clipboard
      thunderbird
    ];
  };
}
