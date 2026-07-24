{
  pkgs,
  inputs,
  ...
}: let
  niri-config = import ./niri.nix {inherit pkgs inputs;};
in {
  programs = {
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
      enable = true;
      package = inputs.wrappers.wrappers.niri.wrap niri-config;
    };
    mango.enable = false;
    river.enable = false;
    xwayland = {
      enable = true;
    };

    # Shells
    zsh = {
      enable = true;
      loginShellInit = ''export PATH=/opt/bin:$PATH'';
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    };
    fish.enable = true;

    # Utilities
    nh = {
      enable = true;
      flake = "/home/savvy/.config/nixos";
    };

    # Misc
    java = {
      enable = false;
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
