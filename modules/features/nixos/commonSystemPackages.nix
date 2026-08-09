{ self, inputs, ... }: {
  flake.nixosModules.commonSystemPackages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim
      git
      kitty
      librewolf
      ungoogled-chromium
      brightnessctl
      grim
      slurp
      wl-clipboard
      imagemagick
      keepassxc
      fetch
      thunderbird
    ];
  };
}
