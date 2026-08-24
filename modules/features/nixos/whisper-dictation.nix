{ self, inputs, ... }: {
  flake.nixosModules.whisper-dictation = { pkgs, lib, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      whisperPkgUnwrapped = inputs.whisper-dictation.packages.${system}.default;

      giLibs = with pkgs; [
        glib
        gtk4
        gdk-pixbuf
        pango
        graphene
        gobject-introspection
      ];

      whisperPkg = pkgs.symlinkJoin {
        name = "whisper-dictation-wrapped";
        paths = [ whisperPkgUnwrapped ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/whisper-dictation \
            --prefix GI_TYPELIB_PATH : "${lib.makeSearchPath "lib/girepository-1.0" giLibs}" \
            --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath giLibs}"
        '';
      };
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
