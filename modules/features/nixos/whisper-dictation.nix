{ self, inputs, ... }: {
  flake.nixosModules.whisper-dictation = { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      whisperPkg = inputs.whisper-dictation.packages.${system}.default;
    in
    {
      environment.systemPackages = [ whisperPkg ];
      systemd.user.services.whisper-dictation = {
        enable = true;
        description = "Whisper Dictation Service";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${whisperPkg}/bin/whisper-dictation";
          Restart = "on-failure";
        };
      };
    };
}
