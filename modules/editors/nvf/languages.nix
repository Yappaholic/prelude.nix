{pkgs, ...}: {
  enableTreesitter = true;
  enableExtraDiagnostics = true;
  purescript.enable = true;
  nix = {
    enable = true;
    lsp = {
      server = "nixd";
      package = pkgs.nixd;
    };
    format.enable = true;
  };
  clang = {
    enable = true;
    dap = {
      enable = true;
      debugger = "lldb-vscode";
    };
  };
  rust = {
    enable = true;
    dap.enable = true;
    format.enable = true;
    lsp = {
      package = ["rust-analyzer"];
    };
  };
  tailwind = {
    enable = true;
  };
  zig = {
    enable = true;
    dap.enable = true;
    dap.debugger = "lldb-vscode";
  };
  markdown.enable = true;
  ts = {
    enable = true;
    format.type = "biome";
    format.package = pkgs.biome;
  };
  html = {
    enable = true;
  };
  css = {
    enable = true;
    format = {
      enable = true;
      type = "biome";
      package = pkgs.biome;
    };
  };
  go = {
    enable = true;
    format.enable = true;
    dap.enable = true;
  };
  bash.enable = true;
  php.enable = true;
  haskell = {
    enable = true;
    dap.enable = false;
  };
}
