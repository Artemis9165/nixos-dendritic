{ self, inputs, ... }: {
  flake.nixosModules.whisper-dictation = { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      whisperPkg = inputs.whisper-dictation.packages.${system}.default;
    in
    {
      environment.systemPackages = [ whisperPkg ];

      systemd.user.services.whisper-dictation = {
        description = "Whisper Dictation User Service";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        environment = {
          GI_TYPELIB_PATH = "${pkgs.glib.out}/lib/girepository-1.0:${pkgs.gtk3}/lib/girepository-1.0:${pkgs.gobject-introspection}/lib/girepository-1.0:${pkgs.libappindicator-gtk3}/lib/girepository-1.0";
          LD_LIBRARY_PATH = "${pkgs.glib.out}/lib:${pkgs.gtk3}/lib:${pkgs.libappindicator-gtk3}/lib";
        };

        serviceConfig = {
          ExecStart = "${whisperPkg}/bin/whisper-dictation";
          Restart = "on-failure";
        };
      };
    };
}
