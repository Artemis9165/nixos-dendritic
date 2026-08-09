{ self, inputs, ... }: {
  flake.nixosModules.radicale = { ... }: {
    services = {
      httpd.enable = true;
      radicale = {
        enable = true;
        settings = {
          server.hosts = [ "0.0.0.0:5232" ];
          auth = {
            type = "htpasswd";
            htpasswd_filename = "/var/lib/radicale/users/htpasswd";
            htpasswd_encryption = "bcrypt";
          };
        };
      };
    };
    networking.firewall.allowedTCPPorts = [ 5232 ];
  };
}
