{pkgs, ...}: {
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      # Window effect
      blur=0
      blur_layer=0
      blur_optimized=1
      blur_params_num_passes = 2
      blur_params_radius = 5
      blur_params_noise = 0.02
      blur_params_brightness = 0.9
      blur_params_contrast = 0.9
      blur_params_saturation = 1.2

      shadows = 0
      layer_shadows = 0
      shadow_only_floating = 1
      shadows_size = 10
      shadows_blur = 15
      shadows_position_x = 0
      shadows_position_y = 0
      shadowscolor= 0x000000ff

      border_radius=6
      no_radius_when_single=1
      focused_opacity=1.0
      unfocused_opacity=0.9

      # Animation Configuration(support type:zoom,slide)
      # tag_animation_direction: 0-horizontal,1-vertical
      animations=1
      layer_animations=1
      animation_type_open=slide
      animation_type_close=slide
      animation_fade_in=1
      animation_fade_out=1
      tag_animation_direction=1
      zoom_initial_ratio=0.3
      zoom_end_ratio=0.8
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8
      animation_duration_move=500
      animation_duration_open=400
      animation_duration_tag=350
      animation_duration_close=800
      animation_duration_focus=0
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1
      animation_curve_focus=0.46,1.0,0.29,1

      # Scroller Layout Setting
      scroller_structs=20
      scroller_default_proportion=1.0
      scroller_focus_center=0
      scroller_prefer_center=0
      edge_scroller_pointer_focus=1
      scroller_default_proportion_single=1.0
      scroller_proportion_preset=0.5,0.8,1.0

      # Master-Stack Layout Setting
      new_is_master=0
      default_mfact=0.50
      default_nmaster=1
      smartgaps=1

      # Overview Setting
      hotarea_size=10
      enable_hotarea=1
      ov_tab_mode=0
      overviewgappi=5
      overviewgappo=30

      # Misc
      no_border_when_single=1
      axis_bind_apply_timeout=100
      focus_on_activate=1
      inhibit_regardless_of_visibility=0
      sloppyfocus=1
      warpcursor=1
      focus_cross_monitor=0
      focus_cross_tag=0
      enable_floating_snap=0
      snap_distance=30
      cursor_size=24
      drag_tile_to_tile=1

      # keyboard
      repeat_rate=25
      repeat_delay=200
      numlockon=0
      xkb_rules_layout=us,ru
      xkb_rules_variant=colemak_dh_wide_iso,
      xkb_rules_options=grp:toggle,ctrl:nocaps

      # Trackpad
      # need relogin to make it apply
      disable_trackpad=0
      tap_to_click=1
      tap_and_drag=1
      drag_lock=1
      trackpad_natural_scrolling=0
      disable_while_typing=1
      left_handed=0
      middle_button_emulation=0
      swipe_min_threshold=1

      # mouse
      # need relogin to make it apply
      mouse_natural_scrolling=0

      # Appearance
      gappih=5
      gappiv=5
      gappoh=10
      gappov=10
      scratchpad_width_ratio=0.8
      scratchpad_height_ratio=0.9
      borderpx=4
      rootcolor=0x201b14ff
      bordercolor=0x444444ff
      focuscolor=0xc9b890ff
      maximizescreencolor=0x89aa61ff
      urgentcolor=0xad401fff
      scratchpadcolor=0x516c93ff
      globalcolor=0xb153a7ff
      overlaycolor=0x14a57cff

      # layout support:
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tagrule=id:1,layout_name:scroller
      tagrule=id:2,layout_name:tile
      tagrule=id:3,layout_name:tile
      tagrule=id:4,layout_name:tile
      tagrule=id:5,layout_name:tile
      tagrule=id:6,layout_name:tile
      tagrule=id:7,layout_name:tile
      tagrule=id:8,layout_name:tile
      tagrule=id:9,layout_name:tile

      # Key Bindings
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none

      # reload config
      binds=SUPER+SHIFT,c,reload_config

      # menu and terminal
      binds=SUPER,space,spawn, wmenu-run
      binds=SUPER,Return,spawn,ghostty

      # exit
      binds=SUPER,m,quit
      binds=SUPER,q,killclient,

      # switch window focus
      binds=SUPER,Tab,focusstack,next
      binds=SUPER,h,focusdir,left
      binds=SUPER,l,focusdir,right
      binds=SUPER,k,focusdir,up
      binds=SUPER,j,focusdir,down

      # swap window
      binds=SUPER+CTRL,k,exchange_client,up
      binds=SUPER+CTRL,j,exchange_client,down
      binds=SUPER+CTRL,h,exchange_client,left
      binds=SUPER+CTRL,l,exchange_client,right

      # switch window status
      binds=SUPER,o,toggleoverview,
      binds=SUPER,backslash,togglefloating,
      binds=SUPER,a,togglemaximizescreen,
      binds=SUPER,f,togglefullscreen,
      binds=SUPER+SHIFT,f,togglefakefullscreen,
      binds=SUPER,i,minimized,
      binds=SUPER+SHIFT,I,restore_minimized
      binds=SUPER,z,toggle_scratchpad

      # scroller layout
      binds=SUPER,r,switch_proportion_preset,

      # switch layout
      binds=SUPER,n,switch_layout

      binds=SUPER,1,view,1,0
      binds=SUPER,2,view,2,0
      binds=SUPER,3,view,3,0
      binds=SUPER,4,view,4,0
      binds=SUPER,5,view,5,0
      binds=SUPER,6,view,6,0
      binds=SUPER,7,view,7,0
      binds=SUPER,8,view,8,0
      binds=SUPER,9,view,9,0

      # tag: move client to the tag and focus it
      # tagsilent: move client to the tag and not focus it
      # binds=SUPER,1,tagsilent,1
      binds=SUPER+CTRL,1,tag,1,0
      binds=SUPER+CTRL,2,tag,2,0
      binds=SUPER+CTRL,3,tag,3,0
      binds=SUPER+CTRL,4,tag,4,0
      binds=SUPER+CTRL,5,tag,5,0
      binds=SUPER+CTRL,6,tag,6,0
      binds=SUPER+CTRL,7,tag,7,0
      binds=SUPER+CTRL,8,tag,8,0
      binds=SUPER+CTRL,9,tag,9,0

      # resizewin
      binds=CTRL+SUPER,Up,resizewin,+0,-50
      binds=CTRL+SUPER,Down,resizewin,+0,+50
      binds=CTRL+SUPER,Left,resizewin,-50,+0
      binds=CTRL+SUPER,Right,resizewin,+50,+0

      # Mouse Button Bindings
      # NONE mode key only work in ov mode
      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize
      mousebind=NONE,btn_left,toggleoverview,1
      mousebind=NONE,btn_right,killclient,0

      # layer rule
      layerrule=animation_type_open:zoom,layer_name:rofi
      layerrule=animation_type_close:zoom,layer_name:rofi
    '';
    autostart_sh = ''
      waybar &
      systemctl --user start gammastep &
      ${pkgs.swww}/bin/swww-daemon
      ${pkgs.swww}/bin/swww img ~/Pictures/wallpaper.png
    '';
  };
}
