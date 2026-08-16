{ self, inputs, ... }: {
  flake.nixosModules.closeLaptopLid = { ... }: {
    services.logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
