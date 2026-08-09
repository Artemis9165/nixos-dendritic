{ self, inputs, ... }: {
  flake.homeModules.khal = { ... }: {
    programs.khal = {
      enable = true;
      locale = {
        dateformat = "%Y-%m-%d";
        longdateformat = "%Y-%m-%d";
        timeformat = "%H:%M";
        datetimeformat = "%Y-%m-%d %H:%M";
        longdatetimeformat = "%Y-%m-%d %H:%M";
        firstweekday = 0;
        weeknumbers = "left";
        local_timezone = "America/New_York";
        default_timezone = "America/New_York";
        unicode_symbols = true;
      };
      settings = {
        default = {
          default_calendar = "General Calendar";
          timedelta = "5d";
        };
        view = {
          agenda_event_format =
            "{calendar-color}{cancelled}{start-end-time-style} {title}{repeat-symbol}{reset}";
        };
      };
    };
  };
}
