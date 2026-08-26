{ self, inputs, ... }: {
  flake.nixosModules.rStudio = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      (rstudioWrapper.override {
        packages = with rPackages; [
          ggplot2
          tidyverse
        ];
      })
    ];
  };
}
