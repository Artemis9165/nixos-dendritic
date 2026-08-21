{ pkgs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      prismlaucher
    ];
    programs.steam = {
      enable = true;
    };
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
