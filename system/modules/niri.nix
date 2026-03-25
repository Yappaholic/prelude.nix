{pkgs, ...}: {
  inherit pkgs;
  settings = {
    input = {
      keyboard = {
        repeat-rate = 30;
        repeat-delay = 300;
        xkb = {
          layout = "us,ru";
          variant = "colemak_dh_wide_iso,";
          options = "grp:toggle, ctrl:nocaps";
        };
        numlock = null;
      };
      focus-follows-mouse = null;
    };
    cursor = {
      xcursor-size = 24;
      xcursor-theme = "Adwaita";
      hide-when-typing = null;
      hide-after-inactive-ms = 1000;
    };
    layout = {
      tab-indicator = {
        position = "left";
        width = 4;
        gap = 4;
        place-within-column = null;
        inactive-color = "#181818";
        active-color = "#ffffff";
      };
      gaps = 8;
      center-focused-column = "on-overflow";
      preset-column-widths = [
        {
          proportion = 0.5;
        }
        {
          proportion = 0.8;
        }
        {
          proportion = 1.0;
        }
      ];
      default-column-width.proportion = 0.5;
      focus-ring = {
        width = 4;
        active-color = "#DCA561";
        inactive-color = "#505050";
      };
    };
    hotkey-overlay.skip-at-startup = null;
    screenshot-path = "~/Pictures/Screenshot/Screenshot from %Y-%m-%d %H-%M.png";
    binds = {
      "Mod+Shift+Slash".show-hotkey-overlay = null;
      "Mod+Ctrl+E".spawn-sh = "emacsclient -c";
      "Mod+Return".spawn = "ghostty";
      "Mod+Space".spawn-sh = "${pkgs.noctalia-shell}/bin/noctalia-shell ipc call launcher toggle";
      "Mod+O".toggle-overview = null;
      "Mod+Q".close-window = null;

      "Mod+H ".focus-column-left = null;
      "Mod+J ".focus-window-down = null;
      "Mod+K ".focus-window-up = null;
      "Mod+L ".focus-column-right = null;

      "Mod+U ".focus-workspace-down = null;
      "Mod+I ".focus-workspace-up = null;

      "Mod+Shift+U".move-workspace-down = null;
      "Mod+Shift+I".move-workspace-up = null;

      "Mod+1".focus-workspace = 1;
      "Mod+2".focus-workspace = 2;
      "Mod+3".focus-workspace = 3;
      "Mod+4".focus-workspace = 4;
      "Mod+5".focus-workspace = 5;
      "Mod+6".focus-workspace = 6;
      "Mod+7".focus-workspace = 7;
      "Mod+8".focus-workspace = 8;
      "Mod+9".focus-workspace = 9;

      "Mod+Ctrl+1".move-column-to-workspace = 1;
      "Mod+Ctrl+2".move-column-to-workspace = 2;
      "Mod+Ctrl+3".move-column-to-workspace = 3;
      "Mod+Ctrl+4".move-column-to-workspace = 4;
      "Mod+Ctrl+5".move-column-to-workspace = 5;
      "Mod+Ctrl+6".move-column-to-workspace = 6;
      "Mod+Ctrl+7".move-column-to-workspace = 7;
      "Mod+Ctrl+8".move-column-to-workspace = 8;
      "Mod+Ctrl+9".move-column-to-workspace = 9;

      "Mod+Shift+h".consume-or-expel-window-left = null;
      "Mod+Shift+l".consume-or-expel-window-right = null;

      "Mod+R".switch-preset-column-width = null;
      "Mod+F".maximize-column = null;
      "Mod+Shift+F".fullscreen-window = null;
      "Mod+Ctrl+F".expand-column-to-available-width = null;
      "Mod+C".center-column = null;

      "Mod+Minus".set-column-width = "-10%";
      "Mod+Equal".set-column-width = "+10%";
      "Mod+Shift+Minus".set-window-height = "-10%";
      "Mod+Shift+Equal".set-window-height = "+10%";
      "Mod+W".toggle-column-tabbed-display = null;

      "Mod+Y".screenshot = null;
      "Mod+Shift+E".quit = null;
      "Mod+E".spawn-sh = "${pkgs.noctalia-shell}/bin/noctalia-shell ipc call sessionMenu toggle";
    };
    xwayland-satellite.path = pkgs.lib.getExe pkgs.xwayland-satellite;
    spawn-at-startup = [
      (pkgs.lib.getExe pkgs.noctalia-shell)
      "systemctl --user restart gammastep"
    ];
  };
}
