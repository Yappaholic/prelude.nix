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
    ./modules/editors/helix.nix
    ./modules/util/other.nix
    ./modules/util/gtk.nix
    ./modules/shell/nushell.nix
    #./modules/shell/zsh.nix
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
    wlsunset = {
      enable = true;
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
        enable = false;
        package = null;
        config = import ./modules/wm/sway/config.nix {lib = lib;};
        extraConfig = ''
          blur enable
          blur_xray disable
          blur_passes 3
          blur_radius 3
          default_dim_inactive 0.1
        '';
      };
    };
  };
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "hydro";
        src = hydro.src;
      }
      {
        name = "sponge";
        src = sponge.src;
      }
      {
        name = "fzf-fish";
        src = fzf-fish.src;
      }
      {
        name = "fishbang";
        src = fishbang.src;
      }
      {
        name = "done";
        src = done.src;
      }
    ];
    shellAbbrs = {
      nhs = "nh os switch";
      nht = "nh os test";
      ls = "eza --color=always --icons=always";
      la = "eza -la --color=always --icons=always";
      k = "kak";
      v = "nvim";
    };
    shellInitLast = ''
      fish_add_path ~/.cargo/bin
      fish_add_path ~/go/bin
      fish_add_path ~/.config/emacs/bin
    '';
  };

  programs.tmux = import ./modules/shell/tmux.nix {pkgs = pkgs;};

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
