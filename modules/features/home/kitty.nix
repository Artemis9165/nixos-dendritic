{ self, inputs, ... }: {
  flake.homeModules.kittyConfiguration = { ... }: {
    programs.kitty = {
      enable = true;
      themeFile = "OneDark";
      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };
      settings = {
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        confirm_os_window_close = 0;
      };
    };
  };
}
