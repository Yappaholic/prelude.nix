{
  pkgs,
  lib,
  config,
  ...
}: let
  #system = pkgs.stdenv.hostPlatform.system;
in {
  home.username = "savvy";
  home.homeDirectory = "/home/savvy";
  home.stateVersion = "24.05";
  imports = [
    #./modules/editors/helix.nix
    ./modules/util/other.nix
    ./modules/util/gtk.nix
    #./modules/shell/nushell.nix
    ./modules/shell/fish.nix
    #./modules/programs/ghostty.nix
    #./modules/programs/waybar.nix
    #./modules/wm/mango.nix
    #./modules/editors/zed.nix
    #./modules/programs/qutebrowser.nix
    #./modules/shell/zsh.nix
    #inputs.mango.hmModules.mango
    #inputs.zen-browser.homeModules.beta
  ];
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
    maple-mono.NF
    noto-fonts
  ];

  services = {
    wlsunset = {
      enable = true;
      sunrise = "07:30";
      sunset = "21:30";
      temperature = {
        day = 6500;
        night = 2500;
      };
    };
    # gammastep = {
    #   enable = true;
    #   latitude = 56.0;
    #   longitude = 27.0;
    #   temperature = {
    #     day = 6500;
    #     night = 2500;
    #   };
    # };
  };
  # xsession = {
  #   windowManager = {
  #     herbstluftwm = import ./modules/wm/herbsluftwm/config.nix {pkgs = pkgs;};
  #   };
  # };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  wayland = {
    windowManager = {
      hyprland = {
        enable = false;
        settings = import ./modules/wm/hyprland/config.nix {inherit pkgs;};
        plugins = with pkgs; [
          hyprlandPlugins.hy3
        ];
        systemd.enable = true;
      };
      sway = {
        enable = false;
        package = null;
        checkConfig = false;
        config = import ./modules/wm/sway/config.nix {inherit lib config;};
        extraConfig = ''
          animation_duration_ms 250
          corner_radius 4
          blur_xray disable
        '';
      };
    };
  };

  # programs.tmux = import ./modules/shell/tmux.nix {pkgs = pkgs;};

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  #home.shell.enableZshIntegration = true;
  home.shell.enableFishIntegration = true;

  home.file.".cargo/config.toml".text = ''
    [target.'cfg(target_os = "linux")']
    rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]
  '';

  programs.home-manager.enable = true;
}
