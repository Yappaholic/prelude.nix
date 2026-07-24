{
  pkgs,
  inputs,
  ...
}: let
  noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  inherit pkgs;
  settings = {
    xwayland-satellite.path = pkgs.lib.getExe pkgs.xwayland-satellite;
    prefer-no-csd = _: {};

    input = {
      keyboard = {
        repeat-rate = 30;
        repeat-delay = 300;
        xkb = {
          layout = "us,ru";
          variant = "colemak_dh_wide_iso,";
          options = "grp:toggle, ctrl:nocaps";
        };
        numlock = _: {};
      };
      focus-follows-mouse = _: {};
    };
    cursor = {
      xcursor-size = 24;
      xcursor-theme = "Adwaita";
      hide-when-typing = _: {};
      hide-after-inactive-ms = 1000;
    };
    layout = {
      tab-indicator = {
        position = "left";
        width = 4;
        gap = 4;
        place-within-column = _: {};
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
      default-column-width.proportion = 1.0;
      focus-ring = {
        width = 4;
        active-color = "#DCA561";
        inactive-color = "#505050";
      };
    };
    hotkey-overlay.skip-at-startup = _: {};
    screenshot-path = "~/Pictures/Screenshot/Screenshot from %Y-%m-%d %H-%M.png";
    binds = {
      "Mod+Shift+Slash".show-hotkey-overlay = _: {};
      "Mod+Ctrl+E".spawn-sh = "emacsclient -c";
      "Mod+Return".spawn = "${pkgs.lib.getExe pkgs.foot}";
      "Mod+Space".spawn-sh = "${pkgs.lib.getExe noctalia} msg panel-toggle launcher";
      "Mod+O".toggle-overview = _: {};
      "Mod+Q".close-window = _: {};

      "Mod+H".focus-column-left = _: {};
      "Mod+J".focus-window-down = _: {};
      "Mod+K".focus-window-up = _: {};
      "Mod+L".focus-column-right = _: {};

      "Mod+U".focus-workspace-down = _: {};
      "Mod+I".focus-workspace-up = _: {};

      "Mod+Shift+U".move-workspace-down = _: {};
      "Mod+Shift+I".move-workspace-up = _: {};

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

      "Mod+Shift+h".consume-or-expel-window-left = _: {};
      "Mod+Shift+l".consume-or-expel-window-right = _: {};

      "Mod+R".switch-preset-column-width = _: {};
      "Mod+F".maximize-column = _: {};
      "Mod+Shift+F".fullscreen-window = _: {};
      "Mod+Ctrl+F".expand-column-to-available-width = _: {};
      "Mod+C".center-column = _: {};

      "Mod+Minus".set-column-width = "-10%";
      "Mod+Equal".set-column-width = "+10%";
      "Mod+Shift+Minus".set-window-height = "-10%";
      "Mod+Shift+Equal".set-window-height = "+10%";
      "Mod+W".toggle-column-tabbed-display = _: {};

      "Mod+Y".screenshot = _: {};
      "Mod+Shift+E".quit = _: {};
    };
    spawn-at-startup = [
      (pkgs.lib.getExe noctalia)
      "systemctl --user restart gammastep"
    ];
  };
}
