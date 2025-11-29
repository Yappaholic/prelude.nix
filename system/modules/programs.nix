{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-cachyos_x86_64_v3
        proton-ge-custom
      ];
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true;
    };

    # Window Managers
    hyprland.enable = true;
    sway = {
      enable = false;
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
      enable = false;
      package = pkgs.niri_git;
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
    java.enable = true;
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gtk2;
      enableSSHSupport = true;
    };
  };
}
