{ self, inputs, ... }: {
  flake.nixosModules.neptuneUndervolt = { ... }: {
    services.throttled = {
      enable = true;
      extraConfig = ''
        [GENERAL]
        Enabled: True
        Autoreload: True

        [UNDERVOLTAGE]
        CORE: -110
        CACHE: -110
        GPU: -60
        UNCORE: -60
        ANALOGIO: 0

        [AC]
        Update_Rate_s: 5
        PL1_Tdp_W: 29
        PL1_Duration_s: 28
        PL2_Tdp_W: 44
        PL2_Duration_s: 28
        Trip_Temp_C: 90

        [BATTERY]
        Update_Rate_s: 30
        PL1_Tdp_W: 15
        PL1_Duration_s: 28
        PL2_Tdp_W: 22
        PL2_Duration_s: 28
        Trip_Temp_C: 85
      '';
    };
  };
}
