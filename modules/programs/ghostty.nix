{
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    systemd.enable = true;
    settings = {
      theme = "Tomorrow Night Burns";
      font-size = 16;
      font-family = "Maple Mono NF";
      shell-integration-features = true;
      confirm-close-surface = false;
      window-decoration = false;
      window-padding-balance = true;
      gtk-titlebar = false;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = true;
      bold-is-bright = true;
      link-url = true;
      focus-follows-mouse = true;
      keybind = [
        "alt+n=new_tab"
        "alt+j=next_tab"
        "alt+k=previous_tab"
        "alt+c=reload_config"
        "alt+x=close_surface"

        "alt+1=unbind"
        "alt+2=unbind"
        "alt+3=unbind"
        "alt+4=unbind"

        "alt+digit_1=unbind"
        "alt+digit_2=unbind"
        "alt+digit_3=unbind"
        "alt+digit_4=unbind"
      ];
    };
  };
}
