{pkgs, ...}: {
  services = {
    flatpak.enable = true;
    # X config
    xserver = {
      enable = true;
      exportConfiguration = false;
      displayManager.session = [
        {
          manage = "window";
          name = "leftwm";
          start = ''exec dbus-launch leftwm'';
        }
      ];
      xkb = {
        layout = "us,ru";
        options = "grp:toggle,ctrl:nocaps";
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
      settings = {
        path = "/run/current-system/sw/bin:/opt/bin";
      };
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
