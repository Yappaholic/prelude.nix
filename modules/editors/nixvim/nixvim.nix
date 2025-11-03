{
  lib,
  pkgs,
  ...
}: let
  keymaps = import ./keymaps.nix;
  opts = import ./opts.nix;
  plugins = import ./plugins.nix {
    lib = lib;
    pkgs = pkgs;
  };
in {
  programs.nixvim = {
    enable = true;
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin
        {
          name = "vim-solarized8";
          src = pkgs.fetchFromGitHub {
            owner = "lifepillar";
            repo = "vim-solarized8";
            tag = "v1.5.1-neovim";
            sha256 = "sha256-CngMHSYlZnfFwS0mAbNKahVrx9gKaD4MVZjRAsJtO3A=";
          };
        })
    ];
    globals.mapleader = " ";
    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
    clipboard.providers.wl-copy = {
      enable = false;
      package = pkgs.wl-clipboard;
    };
    clipboard.providers.xclip = {
      enable = true;
      package = pkgs.xclip;
    };
    colorschemes = {
      melange.enable = false;
      kanagawa = {
        enable = true;
        settings = {
          compile = true;
          terminalColors = true;
          theme = "wave";
        };
      };
    };
    inherit opts;
    inherit plugins;
    inherit keymaps;
  };
}
