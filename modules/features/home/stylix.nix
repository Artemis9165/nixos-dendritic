{ self, inputs, ... }: {
  flake.homeModules.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.homeModules.stylix ];
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    };
  };
}
