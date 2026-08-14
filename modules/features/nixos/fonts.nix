{ self, inputs, ... }: {
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      liberation_ttf
      roboto
    ];
  };
}
