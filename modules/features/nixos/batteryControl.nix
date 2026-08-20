{ self, inputs, ... }: {
  flake.nixosModules.batteryControl = { ... }: {
    services = {
      power-profiles-daemon.enable = false;
      upower.enable = true;
      tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "performance";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

          RUNTIME_PM_ON_AC = "on";
          RUNTIME_PM_ON_BAT = "on";

          PCIE_ASPM_ON_AC = "default";
          PCIE_ASPM_ON_BAT = "default";

          STOP_CHARGE_THRESH_BAT0 = 75;
          STOP_CHARGE_THRESH_BAT1 = 75;

          USB_AUTOSUSPEND = 0;
        };
      };
    };
  };
}
