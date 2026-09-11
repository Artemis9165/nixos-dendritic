{ pkgs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      prismlauncher
      supertuxkart
    ];
    programs.steam = {
      enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
