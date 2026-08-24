{ self, inputs, ... }: {
  flake.nixosModules.whisper-dictation = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.whisper-dictation.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    systemd.user.services.whisper-dictation = {
      description = "Whisper Dictation User Service";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${inputs.whisper-dictation.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/whisper-dictation";
        Restart = "on-failure";
      };
    };
  };
}
