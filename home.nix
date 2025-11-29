{
  pkgs,
  lib,
  inputs,
  ...
}: let
  system = "x86_64-linux";
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
    ./modules/programs/ghostty.nix
    ./modules/wm/mango.nix
    #./modules/programs/qutebrowser.nix
    #./modules/shell/zsh.nix
    inputs.mango.hmModules.mango
    inputs.zen-browser.homeModules.beta
  ];
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
    maple-mono.NF
  ];

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
    };
  };
  services = {
    gammastep = {
      enable = true;
      latitude = 56.0;
      longitude = 27.0;
      temperature = {
        day = 6500;
        night = 2500;
      };
    };
    wlsunset = {
      enable = false;
      sunrise = "06:30";
      sunset = "21:30";
      temperature = {
        day = 6500;
        night = 2500;
      };
    };
    hyprpaper = {
      enable = false;
      settings = {
        ipc = "on";
        splash = false;
        preload = ["~/Pictures/wallpaper.jpg"];
        wallpaper = ["DVI-I-1,~/Pictures/wallpaper.jpg"];
      };
    };
  };
  xsession = {
    windowManager = {
      herbstluftwm = import ./modules/wm/herbsluftwm/config.nix {pkgs = pkgs;};
    };
  };
  programs.zen-browser.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        plugins = with pkgs.hyprlandPlugins; [hy3];
        settings = import ./modules/wm/hyprland/config.nix;
        systemd.enable = true;
      };
      sway = {
        enable = true;
        package = null;
        checkConfig = false;
        config = import ./modules/wm/sway/config.nix {inherit lib;};
        extraConfig = ''
          layout_default_width 1.0
          layout_width [0.5, 0.8, 1.0]
          maximize_if_single true
        '';
      };
    };
  };

  programs.tmux = import ./modules/shell/tmux.nix {pkgs = pkgs;};

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
