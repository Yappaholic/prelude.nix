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
      oxocarbon.enable = true;
      kanagawa = {
        enable = false;
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
