{ self, inputs, ... }: {
  flake.nixosModules.handy = { pkgs, lib, ... }: {
    programs.ydotool.enable = true;
    systemd.services.ydotoold = {
      serviceConfig = {
        RuntimeDirectoryGroup = lib.mkforce "ydotool";
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
