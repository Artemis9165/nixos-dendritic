{ self, inputs, ... }: {
  flake.nixosModules.whisper-cpp = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      whisper-cpp.override
      { cudaSupport = true; }
      wtype
      sox
    ];
  };
}
