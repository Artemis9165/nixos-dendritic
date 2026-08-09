{ self, inputs, ... }: {
  flake.nixosModules.neptuneConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.neptuneHardwareConfiguration
      self.nixosModules.neptuneUsers
      self.nixosModules.homeManager
      self.nixosModules.niri
      self.nixosModules.keyd
    ];
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Neptune";
      networkmanager.enable = true;
    };
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
    environment.systemPackages = with pkgs; [
      neovim
      git
      kitty
      librewolf
      ungoogled-chromium
      brightnessctl
      grim
      slurp
      wl-clipboard
      imagemagick
      keepassxc
      fetch
      thunderbird
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
