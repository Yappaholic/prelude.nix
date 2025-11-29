{
  pkgs,
  inputs,
  ...
}: {
  services = {
    flatpak.enable = true;
    # X config
    xserver = {
      enable = true;
      exportConfiguration = false;
      xkb = {
        layout = "us,ru";
        options = "grp:toggle,ctrl:nocaps";
      };
      windowManager.qtile = {
        enable = true;
        package = inputs.qtile.packages.${pkgs.system}.qtile;
        extraPackages = python313Packages:
          with python313Packages; [
            pulsectl-asyncio
          ];
      };
      windowManager.xmonad = {
        enable = false;
        enableContribAndExtras = true;
        config = null;
        enableConfiguredRecompile = true;
        haskellPackages = pkgs.haskell.packages.ghc984;
        ghcArgs = ["-O2" "-fllvm"];
      };
    };

    # Change dbus implementation (still don't know what it does)
    dbus = {
      implementation = "broker";
    };
    # TUI display manager
    displayManager.ly = {
      enable = true;
    };

    # Emacs with packages and daemon
    emacs = {
      enable = false;
      install = true;
      package = with pkgs; (
        (emacsPackagesFor emacs-pgtk).emacsWithPackages (
          epkgs: [epkgs.vterm]
        )
      );
    };

    # Sound server
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    # Need for authentication
    pcscd.enable = true;
  };
}
