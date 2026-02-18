{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true;
    };

    # Window Managers
    hyprland.enable = false;
    sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      extraOptions = ["--unsupported-gpu"];
      extraPackages = with pkgs; [
        i3status-rust
        autotiling-rs
        swayidle
      ];
    };
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    mango.enable = true;
    xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };

    # Shells
    zsh = {
      enable = false;
      loginShellInit = ''export PATH=/opt/bin:$PATH'';
    };
    fish.enable = true;

    # Utilities
    nh = {
      enable = true;
      flake = "/home/savvy/.config/nixos";
    };

    # Misc
    java = {
      enable = true;
      package = pkgs.jdk25;
    };
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gtk2;
      enableSSHSupport = true;
    };
  };
}
