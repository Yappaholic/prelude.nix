{
  enable = true;
  appearance = {
    nerd_font_variant = "normal";
    use_nvim_cmp_as_default = true;
  };
  completion = {
    accept = {
      auto_brackets = {
        enabled = true;
        semantic_token_resolution = {
          enabled = false;
        };
      };
    };
    documentation = {
      auto_show = true;
    };
  };
  keymap = {
    preset = "default";
  };
  signature = {
    enabled = true;
  };
  sources = {
    cmdline = [];
    providers = {
      default = [
        "path"
        "lsp"
        "buffer"
        "snippets"
      ];
      buffer = {
        enabled = true;
        score_offset = -7;
      };
      lsp = {
        enabled = true;
        fallbacks = [];
      };
      snippets.enabled = true;
      path.enabled = true;
    };
  };
}
