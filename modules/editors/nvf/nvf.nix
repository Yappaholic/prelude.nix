{pkgs, ...}: let
  languages = import ./languages.nix {inherit pkgs;};
  lsp = import ./lsp.nix;
  keymaps = import ./keymaps.nix;
in {
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim = {
        inherit keymaps;
        inherit languages;
        inherit lsp;
        extraPlugins = import ./plugins.nix {inherit pkgs;};
        package = pkgs.neovim-unwrapped;
        enableLuaLoader = true;
        theme = {
          enable = true;
        };
        options = {
          autoindent = false;
          shiftwidth = 2;
          tabstop = 2;
        };
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<C-o>";
            close = "<C-c>";
            next = "<C-n>";
            previous = "<C-p>";
          };
        };
        autopairs.nvim-autopairs.enable = true;
        dashboard.dashboard-nvim.enable = true;
        notes.todo-comments.enable = true;
        snippets.luasnip.enable = true;
        binds.whichKey = {
          enable = true;
        };
        debugger = {
          nvim-dap = {
            enable = true;
            ui = {
              enable = true;
              autoStart = true;
            };
          };
        };
        undoFile.enable = true;
        visuals.nvim-web-devicons.enable = true;
        ui = {
          noice.enable = true;
          smartcolumn = {
            enable = true;
            setupOpts.colorcolumn = "80";
          };
        };
        utility.oil-nvim.enable = true;
        navigation.harpoon = {
          enable = true;
          mappings = {
            file1 = "<M>1";
            file2 = "<M>2";
            file3 = "<M>3";
            file4 = "<M>4";
            listMarks = "<C-e>";
            markFile = "<leader>a";
          };
        };
      };
    };
  };
}
