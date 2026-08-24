{ self, inputs, ... }: {
  flake.nixosModules.handy = { pkgs, lib, ... }: {
    programs.ydotool.enable = true;
    hardware.uinput.enable = true;
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
    '';
    systemd.services.ydotoold = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        RuntimeDirectoryGroup = lib.mkForce "ydotool";
        RuntimeDirectoryMode = lib.mkForce "0750";
        ExecStart = lib.mkForce
          "${pkgs.ydotool}/bin/ydotoold --socket-path=/run/ydotoold/socket --socket-perm=0660";
      };
    };
    environment.systemPackages = with pkgs; [
      handy
      ydotool
    ];
  };
}
