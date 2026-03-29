{
  pkgs,
  lib,
  ...
}: let
  lsp = import ./lsp.nix {pkgs = pkgs;};
  dap-lldb = import ./dap.nix {pkgs = pkgs;};
  conform-nvim = import ./conform.nix;
  blink-cmp = import ./blink.nix;
in {
  inherit lsp;
  inherit blink-cmp;
  dap = {
    enable = true;
    luaConfig.post = ''
      local dap, dapui = require("dap"),require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    '';
  };
  inherit dap-lldb;
  dap-ui.enable = true;
  dap-virtual-text.enable = true;
  orgmode.enable = true;
  neorg = {
    enable = true;
    settings = {
      load = {
        "core.concealer" = {
          config = {
            icon_preset = "varied";
          };
        };
        "core.defaults" = {
          __empty = null;
        };
      };
    };
    telescopeIntegration.enable = true;
  };
  lsp-format.enable = true;
  telescope.enable = true;
  which-key.enable = true;
  tmux-navigator = {
    enable = true;
    settings.no_mappings = 0;
    keymaps = [
      {
        action = "left";
        key = "<M-h>";
      }
      {
        action = "right";
        key = "<M-l>";
      }
      {
        action = "up";
        key = "<M-k>";
      }
      {
        action = "down";
        key = "<M-j>";
      }
    ];
  };
  oil = {
    enable = true;
    settings = {
      keymaps = {
        "CR" = "actions.select";
        "<C-c>" = "actions.close";
        "<C-l>" = "actions.refresh";
        "q" = "actions.close";
        "#" = "actons.cd";
        "g." = "actions.toggle_hidden";
      };
      view_options = {
        show_hidden = true;
      };
    };
  };
  neogit.enable = true;
  project-nvim = {
    enable = true;
    enableTelescope = true;
    settings = {
      detection_methods = ["lsp" "pattern"];
      patterns = [".git" "package.json" ".editorconfig" "Cargo.toml"];
    };
  };
  treesitter = {
    enable = true;
    settings = {
      ensureInstalled = [
        "cpp"
        "c"
        "odin"
        "markdown"
        "zig"
        "typescript"
        "rust"
        "make"
        "cmake"
        "meson"
        "json"
        "yaml"
        "haskell"
        "ocaml"
      ];
      highlight = {
        enable = true;
      };
      indent.enable = true;
    };
  };
  luasnip.enable = true;
  web-devicons.enable = true;
  inherit conform-nvim;
  # cmp = {
  #   enable = true;
  #   autoEnableSources = true;
  #   settings.sources = [
  #     {name = "nvim_lsp";}
  #     {name = "path";}
  #     {name = "buffer";}
  #   ];
  #   settings.mapping = {
  #     __raw = ''
  #       cmp.mapping.preset.insert({
  #         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  #         ['<C-f>'] = cmp.mapping.scroll_docs(4),
  #         ['<C-o>'] = cmp.mapping.confirm({select = true}),
  #         ['<C-c>'] = cmp.mapping.abort(),
  #       })
  #     '';
  #   };
  # };
  dashboard.enable = true;
  nvim-autopairs.enable = true;
  harpoon = {
    enable = true;
    enableTelescope = true;
  };
  lualine.enable = true;
  nvim-surround.enable = true;
  todo-comments.enable = true;
  trouble.enable = true;
}
