{ self, inputs, ... }: {
  flake.nixosModules.laptopFanControl = { config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [ nbfc-linux lm_sensors ];
    systemd.services.nbfc_service = {
      enable = true;
      description = "NoteBook FanControl service";
      serviceConfig.Type = "simple";
      path = [ pkgs.kmod ];
      script = "${pkgs.nbfc-linux}/bin/nbfc_service --config-file /etc/nbfc/nbfc.json";
      wantedBy = [ "multi-user.target" ];
    };
  };
}
