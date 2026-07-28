{
  pkgs,
  inputs,
  ...
}: let
  niri-config = import ./niri.nix {inherit pkgs inputs;};
  system = pkgs.stdenv.hostPlatform.system;
  swayfx-git = inputs.swayfx.packages.${system}.default.overrideAttrs (final: prev: {
    passthru = {
      providedSessions = ["sway"];
    };
  });
in {
  programs = {
    # Window Managers
    hyprland.enable = false;
    sway = {
      enable = true;
      package = swayfx-git;
      wrapperFeatures.gtk = true;
      extraOptions = ["--unsupported-gpu"];
      extraPackages = pkgs.lib.mkForce [
        pkgs.i3status-rust
        pkgs.autotiling-rs
      ];
    };
    niri = {
      enable = true;
      package = inputs.wrappers.wrappers.niri.wrap niri-config;
    };
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
