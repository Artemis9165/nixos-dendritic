{ self, inputs, ... }: {
  flake.homeModules.vdirsyncer = { ... }: {
    programs.vdirsyncer = {
      enable = false;
    };
  };
}
