{ self, inputs, ... }: {
  flake.nixosModules.whisper-cpp = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      whisper-cpp
      wtype
    ];
  };
}
