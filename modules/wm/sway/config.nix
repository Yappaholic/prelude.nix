{lib}: let
  menu = "wmenu-run";
  browser = "zen";
  mod = "Mod4";
  terminal = "kitty";
in {
  modifier = "Mod4";
  defaultWorkspace = "workspace number 1";
  input = {
    "*" = {
      xkb_variant = "colemak_dh_wide_iso,";
      xkb_options = "grp:toggle,ctrl:nocaps";
      xkb_layout = "us,ru";
      repeat_rate = "30";
      repeat_delay = "200";
    };
  };
  output = {
    DVI-I-1 = {
      bg = "~/Pictures/wallpaper.jpg fill";
      resolution = "1920x1080";
      scale = "1.0";
      adaptive_sync = "off";
    };
  };
  up = "k";
  down = "j";
  left = "h";
  right = "l";
  bindkeysToCode = true;
  keybindings = lib.mkOptionDefault {
    #Apps
    "${mod}+Return" = "exec ${terminal}";
    "${mod}+Space" = "exec ${menu}";
    "${mod}+t" = "exec ${browser}";
    "${mod}+e" = "exec emacsclient -c";
    # System
    "${mod}+q" = "kill";
    "${mod}+d" = "layout stacking";
    "${mod}+Shift+c" = "reload";
    "${mod}+Shift+minus" = "move scratchpad";
    "${mod}+minus" = "scratchpad show";
    "${mod}+r" = "cycle_size h next";
    "${mod}+o" = "jump";
  };

  gaps = {
    smartGaps = true;
    smartBorders = "no_gaps";
    inner = 4;
    outer = 4;
  };
  bars = [
    {
      fonts = {
        names = ["Maple Mono NF"];
        size = 11.0;
      };
      colors = {
        statusline = "#ffffff";
        background = "#323232";
        inactiveWorkspace = {
          background = "#323232";
          border = "#323232";
          text = "#5c5c5c";
        };
      };
      mode = "dock";
      position = "top";
      statusCommand = "i3status-rs";
    }
  ];
  startup = [
    {command = "systemctl --user start gammastep";}
  ];
}
