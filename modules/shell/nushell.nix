{pkgs, ...}: let
in {
  programs.nushell = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      k = "kak";
      nhs = "nh os switch";
      nht = "nh os test";
      ff = "fastfetch";
      of = "onefetch";
    };
    environmentVariables = {
      EDITOR = "kak";
      SKIM_DEFAULT_COMMAND = "fd --type f -E node_modules -E bundle";
    };
    extraConfig = ''
      source ~/.config/nushell/login.nu
      $env.PATH = $env.PATH | append "/opt/bin" | append "~/go/bin" | append "~/.cargo/bin"
      mkdir ($nu.data-dir | path join "vendor/autoload")
      ${pkgs.starship}/bin/starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
    extraLogin = ''
      $env.__GLX_VENDOR_LIBRARY_NAME = "nvidia"
      $env.LIBVA_DRIVER_NAME = "nvidia"
      $env.NVD_BACKEND = "direct"
      $env.LSP_USE_PLISTS = "true"
    '';
  };
}
