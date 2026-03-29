[
  {
    action = "<cmd>Oil<CR>";
    key = "<leader>p.";
    options.desc = "Open file explorer";
  }
  {
    action = "<cmd>Neogit<CR>";
    key = "<leader>gg";
    options.desc = "Git";
  }
  {
    action = "<cmd>term<CR>";
    key = "<leader>oT";
    options.desc = "Open terminal";
  }

  # LSP related
  {
    action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    key = "<leader>k";
    options.desc = "Hover definition";
  }
  {
    action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
    key = "gD";
    options.desc = "Go to declaration";
  }
  {
    action = "<cmd>lua vim.lsp.buf.definition()<CR>";
    key = "gd";
    options.desc = "Go to definition";
  }
  {
    action = "<cmd>Trouble diagnostics toggle<CR>";
    key = "<leader>dd";
    options.desc = "Diagnostics";
  }

  # DAP
  {
    action = "<cmd>lua require'dap'.toggle_breakpoint()<CR>";
    key = "<leader>db";
    options.desc = "Add breakpoint";
  }
  {
    action = "<cmd>lua require'dap'.continue()<CR>";
    key = "<leader>dr";
    options.desc = "Launch debug";
  }
  {
    action = "<cmd>lua require'dap'.step_over()<CR>";
    key = "<leader>ds";
    options.desc = "Step over";
  }
  {
    action = "<cmd>lua require'dap'.step_into()<CR>";
    key = "<leader>di";
    options.desc = "Step into";
  }

  # Telescope
  {
    action = "<cmd>Telescope find_files<CR>";
    key = "<leader>ff";
    options.desc = "Find files";
  }
  {
    action = "<cmd>Telescope live_grep<CR>";
    key = "<leader>lg";
    options.desc = "Live grep";
  }
  {
    action = "<cmd>Telescope projects<CR>";
    key = "<leader>fp";
    options.desc = "Find projects";
  }

  # Stop highlighting
  {
    action = "<cmd>noh<CR>";
    key = "<C-g>";
    options.desc = "Stop hightlighting";
  }

  # Harpoon
  {
    action.__raw = "function() require'harpoon':list():add() end";
    key = "<leader>a";
    options.desc = "Add harpoon";
  }
  {
    action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    key = "<leader>h";
    options.desc = "Show harpoons";
  }
  {
    action.__raw = "function() require'harpoon':list():select(1) end";
    key = "<M-1>";
  }
  {
    action.__raw = "function() require'harpoon':list():select(2) end";
    key = "<M-2>";
  }
  {
    action.__raw = "function() require'harpoon':list():select(3) end";
    key = "<M-3>";
  }
  {
    action.__raw = "function() require'harpoon':list():select(4) end";
    key = "<M-4>";
  }
]
