{
  lib,
  config,
}: let
  menu = "rofi -show drun";
  mod = "Mod4";
  terminal = "foot";
  cfg = config.wayland.windowManager.sway;
  up = cfg.config.up;
  down = cfg.config.down;
  left = cfg.config.left;
  right = cfg.config.right;
in {
  modifier = "Mod4";
  defaultWorkspace = "workspace number 1";
  input = {
    "*" = {
      xkb_variant = "colemak_dh_wide_iso,";
      xkb_options = "grp:toggle,ctrl:nocaps";
      xkb_layout = "us,ru";
      repeat_rate = "25";
      repeat_delay = "250";
    };
  };
  output = {
    DVI-I-1 = {
      bg = "~/Pictures/wall.jpg fill";
      resolution = "1920x1080";
      scale = "1.0";
    };
  };
  bindkeysToCode = true;
  keybindings = lib.attrsets.filterAttrsRecursive (bind: value: ! (lib.strings.hasInfix "${cfg.config.modifier}+Shift" bind)) (lib.mkOptionDefault {
    #{}ps
    "${mod}+Return" = "exec ${terminal}";
    "${mod}+space" = "exec ${menu}";
    "${mod}+e" = "exec emacsclient -c";
    "${mod}+q" = "kill";

    "${mod}+w" = "layout stacking";
    "${mod}+Shift+c" = "reload";
    "${mod}+Shift+minus" = "move scratchpad";
    "${mod}+minus" = "scratchpad show";

    "${mod}+Ctrl+${left}" = "move left";
    "${mod}+Ctrl+${right}" = "move right";
    "${mod}+Ctrl+${up}" = "move up";
    "${mod}+Ctrl+${down}" = "move down";

    "${mod}+${left}" = "focus left";
    "${mod}+${right}" = "focus right";
    "${mod}+${up}" = "focus up";
    "${mod}+${down}" = "focus down";

    "${mod}+Ctrl+1" = "move container to workspace number 1";
    "${mod}+Ctrl+2" = "move container to workspace number 2";
    "${mod}+Ctrl+3" = "move container to workspace number 3";
    "${mod}+Ctrl+4" = "move container to workspace number 4";
    "${mod}+Ctrl+5" = "move container to workspace number 5";
    "${mod}+Ctrl+6" = "move container to workspace number 6";
    "${mod}+Ctrl+7" = "move container to workspace number 7";
    "${mod}+Ctrl+8" = "move container to workspace number 8";

    "${mod}+Shift+${left}" = "resize shrink width 10px";
    "${mod}+Shift+${right}" = "resize grow width 10px";
    "${mod}+Shift+${up}" = "resize shrink height 10px";
    "${mod}+Shift+${down}" = "resize grow height 10px";
  });

  modes = {};

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
        background = "#268bd2";
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
    {command = "autotiling-rs";}
    {command = "dunst";}
  ];
}
