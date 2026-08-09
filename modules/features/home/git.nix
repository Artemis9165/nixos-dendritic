{ self, inputs, ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "Stylinx";
          email = "Artemis25265@gmail.com";
        };
        url = {
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
        };
        credential = {
          "https://github.com" = {
            helper = "!gh auth git-credential";
          };
        };
      };
    };

  };
}
