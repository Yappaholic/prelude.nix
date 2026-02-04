{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "xml"
      "zig"
      "make"
      "cmake"
      "kotlin"
      "lua"
      "fish"
      "bash"
      "Kanagawa Themes"
    ];
    mutableUserKeymaps = true;
    userKeymaps = [
      {
        context = "Dock";
        bindings = {
          "ctrl-w h" = "workspace::ActivatePaneLeft";
          "ctrl-w l" = "workspace::ActivatePaneRight";
          "ctrl-w k" = "workspace::ActivatePaneUp";
          "ctrl-w j" = "workspace::ActivatePaneDown";
        };
      }
    ];
    userSettings = {
      assistant.enabled = false;
      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };
      auto_update = false;
      terminal = {
        copy_on_select = false;
        dock = "bottom";
        font_family = "Maple Mono NF";
        shell = "system";
        working_directory = "current_project_directory";
      };
      lsp = {
        rust-analyzer.binary.path = lib.getExe pkgs.rust-analyzer;
        nixd = {
          binary.path = lib.getExe pkgs.nixd;
          initialization_options.formatting.command = ["alejandra" "--quiet" "--"];
        };
        kotlin-language-server = {
          binary.path = lib.getExe pkgs.kotlin-language-server;
          settings.compiler.jvm.target = "25";
        };
        zls.binary.path = lib.getExe pkgs.zls;
      };
      languages.Nix.language_servers = ["nixd" "!nil"];
      vim_mode = true;
      base_keymap = "Emacs";
      disable_ai = true;
      load_direnv = "shell_hook";

      theme = {
        mode = "dark";
        light = "Kanagawa Lotus";
        dark = "Kanagawa Dragon";
      };
      ui_font_size = 16;
      ui_font_family = "Maple Mono NF";
      buffer_font_family = "Maple Mono NF";
      use_system_path_prompts = false;
      use_system_prompts = false;
      buffer_font_size = 16;
      hide_mouse = "on_typing_and_movement";
      relative_line_numbers = "enabled";
      toolbar = {
        breadcrumbs = true;
        quick_actions = true;
        selections_menu = false;
        agent_review = false;
        code_actions = false;
      };
      scrollbar.show = "never";
      minimap.show = "never";
      file_finder = {
        include_ignored = false;
      };
    };
  };
}
