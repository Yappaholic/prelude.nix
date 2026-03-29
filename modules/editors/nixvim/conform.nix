{
  enable = true;
  settings = {
    format_on_save = {
      lsp_fallback = "fallback";
      timeout_ms = 500;
    };
    notify_on_error = true;

    formatters_by_ft = {
      css = ["prettierd"];
      html = ["prettierd"];
      json = ["prettierd"];
      tsx = ["prettierd"];
      jsx = ["prettierd"];
      typescript = ["prettierd"];
      javascript = ["prettierd"];
      markdown = ["prettierd"];
      nix = ["alejandra"];
      rust = ["rustfmt"];
      odin = ["odinfmt"];
    };
  };
}
