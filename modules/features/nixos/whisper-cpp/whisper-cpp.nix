{ self, inputs, ... }: {
  flake.nixosModules.whisper-cpp = { pkgs, ... }: {
    environment.systemPackages = [
      (pkgs.whisper-cpp.override { cudaSupport = true; })
      pkgs.wtype
      pkgs.sox
    ];
  };
}
