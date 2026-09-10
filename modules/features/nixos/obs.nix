{ self, inputs, ... }: {
  flake.nixosModules.obsStudio = { config, pkgs, ... }: {
    imports = [
      self.nixosModules.xdgPortals
    ];
    programs.obs-studio = {
      enable = true;
      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-multi-rtmp
      ];
    };
  };
}
