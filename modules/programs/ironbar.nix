{pkgs, ...}: {
  programs.ironbar = {
    enable = true;
    package = pkgs.ironbar;
    config = {
      position = "top";
      height = 30;
      anchor_to_edges = true;
      start = [
        {
          type = "focused";
          icon_size = 16;
        }
      ];
      center = [
        {type = "workspaces";}
      ];
      end = [
        {
          type = "sys_info";
          format = [
            "CPU {cpu_percent}%"
            "MEM {memory_percent}%"
          ];
          interval.cpu = 1;
        }
        {type = "volume";}
        {type = "clock";}
        {type = "tray";}
      ];
    };
    style = ''
      :root {
          --color-dark-primary: #1c1c1caa;
          --color-dark-secondary: #2d2d2daa;

          --color-border-dark: #776DE844;
          --color-border-light: #776DE822;

          --color-white: #fff;
          --color-active: #776DE8CC;
          --color-urgent: #8f0a0a;

          --gradient: linear-gradient(90deg, #6699CC19 35%, #CC99CC19 100%);

          --margin-lg: 1em;
          --margin-sm: 0.5em;
          --margin-xs: 0.25em;

          --size-xxl: 2.6em;
          --size-xl: 2.2em;
          --size-lg: 1.5em;
          --size-md: 16px;
      }
      #bar, popover, popover contents, calendar {
          background-color: var(--color-dark-primary);
      }

      button {
          padding-left: var(--margin-sm);
          padding-right: var(--margin-sm);
      }

      button:hover, button:active {
          background-color: var(--color-dark-secondary);
      }

      #end > * + * {
          margin-left: var(--margin-lg);
      }

      .sysinfo > * + * {
          margin-left: var(--margin-sm);
      }

      .clock {
          font-weight: bold;
      }

      .popup-clock .calendar-clock {
          font-size: 2.0em;
      }

      .popup-clock .calendar .today {
          background-color: var(--color-active);
      }

      .workspaces .item.visible {
          box-shadow: inset 0 -1px var(--color-white);
      }

      .workspaces .item.focused {
          box-shadow: inset 0 -1px var(--color-active);
          background-color: var(--color-dark-secondary);
      }

      .workspaces .item.urgent {
          background-color: var(--color-urgent);
      }

      .volume .source {
        margin-left: var(--margin-sm);
      }

      .popup-volume .device-box {
          padding-right: var(--margin-lg);
          margin-right: var(--margin-lg);
          border-right: 1px solid var(--color-border-light);
      }
    '';
  };
}
