{pkgs, ...}: {
  enable = true;
  inlayHints = true;
  servers = {
    # html.enable = true;
    # htmx.enable = true;
    nushell.enable = true;
    ts_ls.enable = true;
    # marksman.enable = true;
    gopls.enable = true;
    jsonls.enable = true;
    # yamlls.enable = true;
    nixd = {
      enable = true;
      # settings = {
      #   nixd = {
      #     nixpkgs.expr = "import <nixpkgs> { }";
      #     formatting.command = "alejandra";
      #     options = {
      #       nixos.expr = "(builtins.getFlake \"/home/savvy/.config/nixos\").nixosConfigurations.nixos.options";
      #       home_manager.expr = "(builtins.getFlake \"/home/savvy/.config/nixos\").homeConfigurations.savvy.options";
      #     };
      #   };
      # };
    };
    # lua_ls.enable = true;
    # eslint.enable = true;
    # cssls.enable = true;
    # csharp_ls.enable = true;
    # tailwindcss.enable = true;
    cmake.enable = true;
    clangd.enable = true;
    zls = {
      enable = true;
      package = null;
    };
    # intelephense = {
    #   enable = true;
    #   package = pkgs.intelephense;
    # };
    # volar = {
    #   enable = true;
    # };
    rust_analyzer = {
      enable = true;
      installRustc = false;
      installCargo = false;
    };
    ols = {
      enable = true;
      package = null;
    };
  };
}
