{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";
    fastSyntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    history.ignoreAllDups = true;
    zsh-abbr = {
      enable = true;
      abbreviations = {
        nht = "nh os test";
        nhs = "nh os switch";
        v = "nvim";
        k = "kak";
      };
    };
    initContent = lib.mkOrder 1500 ''
      #export QT_QPA_PLATFORM="wayland";
      export LIBVA_DRIVER_NAME="nvidia"
      export __GLX_VENDOR_LIBRARY_NAME="nvidia"
      export NVD_BACKEND="direct"
      export ELECTRON_OZONE_PLATFORM_HINT="auto"
      source ~/.p10k.zsh
    '';
  };
}
