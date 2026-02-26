{
  "$mainMod" = "SUPER";
  "$terminal" = "ghostty";
  "$browser" = "brave";
  "$menu" = "wmenu-run";
  "$logout" = "wlogout";

  env = [
    "XCURSOR_SIZE,12"
    "XCURSOR_THEME,Adwaita"
    "HYPRCURSOR_THEME,Adwaita"
    "HYPRCURSOR_SIZE,12"
  ];

  exec-once = [
    "swww-daemon"
    "swww img ~/Pictures/wallpaper.jpg"
    "ironbar"
  ];
  general = {
    gaps_in = 5;
    gaps_out = 5;

    border_size = 1;

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors;
    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    "col.inactive_border" = "rgba(595959aa)";

    # Set to true enable resizing windows by clicking and dragging on borders and gaps;
    resize_on_border = false;

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on;
    allow_tearing = false;

    layout = "hy3";
  };
  plugin.hy3 = {
    tabs = {
      blur = false;
      opacity = 1.0;
    };
    autotile = {
      enable = true;
    };
  };

  # https://wiki.hyprland.org/Configuring/Variables/#decoration
  decoration = {
    rounding = 5;

    # Change transparency of focused and unfocused windows;
    active_opacity = 1.0;
    inactive_opacity = 1.0;

    # https://wiki.hyprland.org/Configuring/Variables/#blur;
    blur = {
      enabled = true;
      size = 3;
      passes = 1;

      vibrancy = 0.1696;
    };
  };

  # https://wiki.hyprland.org/Configuring/Variables/#animations
  animations = {
    enabled = true;

    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
  dwindle = {
    pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true; # You probably want this
  };

  # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
  master = {
    new_status = "master";
  };

  # https://wiki.hyprland.org/Configuring/Variables/#misc
  misc = {
    force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
  };

  #############
  ### INPUT ###
  #############

  # https://wiki.hyprland.org/Configuring/Variables/#input
  input = {
    kb_layout = "us,ru";
    kb_variant = "colemak_dh_wide_iso,";
    kb_options = "ctrl:nocaps,grp:toggle";

    follow_mouse = 1;

    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

    repeat_delay = 200;
    repeat_rate = 50;
  };

  ###################
  ### KEYBINDINGS ###
  ###################

  # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
  bind = [
    "$mainMod, Return, exec, $terminal"
    "$mainMod, Q, hy3:killactive,"
    "$mainMod SHIFT, E, exit,"
    "$mainMod, E, exec, emacsclient -c"
    "$mainMod, M, exec, $logout"
    "$mainMod, F, fullscreen, 1"
    "$mainMod, P, togglefloating,"
    "$mainMod, Space, exec, $menu"

    "$mainMod, w, hy3:changegroup, toggletab"

    "$mainMod, h, hy3:movefocus, l"
    "$mainMod, l, hy3:movefocus, r"
    "$mainMod, k, hy3:movefocus, u"
    "$mainMod, j, hy3:movefocus, d"

    "$mainMod SHIFT, h, hy3:movefocus, l, visible"
    "$mainMod SHIFT, l, hy3:movefocus, r, visible"
    "$mainMod SHIFT, k, hy3:movefocus, u, visible"
    "$mainMod SHIFT, j, hy3:movefocus, d, visible"

    "$mainMod CONTROL, h, hy3:movewindow, l"
    "$mainMod CONTROL, l, hy3:movewindow, r"
    "$mainMod CONTROL, k, hy3:movewindow, u"
    "$mainMod CONTROL, j, hy3:movewindow, d"

    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"

    "$mainMod SHIFT, 1, hy3:movetoworkspace, 1"
    "$mainMod SHIFT, 2, hy3:movetoworkspace, 2"
    "$mainMod SHIFT, 3, hy3:movetoworkspace, 3"
    "$mainMod SHIFT, 4, hy3:movetoworkspace, 4"
    "$mainMod SHIFT, 5, hy3:movetoworkspace, 5"

    "$mainMod, S, togglespecialworkspace, 5"
    "$mainMod SHIFT, S, movetoworkspace, special:5"
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
  ];

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];

  # Ignore maximize requests from apps. You'll probably like this.
  windowrule = [
    "suppress_event maximize, match:class .*"

    # Fix some dragging issues with XWayland
    "no_focus true,match:class ^$,match:title ^$,match:xwayland 1,match:float 0,match:fullscreen 0,match:pin 0"

    # Smart gaps
    "border_size 0, match:float 0, match:workspace w[tv1]"
    "rounding 0, match:float 0, match:workspace w[tv1]"
    "border_size 0, match:float 0, match:workspace f[1]"
    "rounding 0, match:float 0, match:workspace f[1]"
  ];
  workspace = [
    "w[tv1], gapsout:0, gapsin:0"
    "f[1], gapsout:0, gapsin:0"
  ];
}
