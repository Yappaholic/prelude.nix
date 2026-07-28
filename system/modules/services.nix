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
      windowManager.oxwm = {
        enable = false;
        package = inputs.oxwm.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      windowManager.qtile = {
        enable = false;
        package = inputs.qtile.packages.${pkgs.stdenv.hostPlatform.system}.qtile;
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
      };
    };

    # Change dbus implementation (still don't know what it does)
    dbus = {
      implementation = "broker";
    };
    # TUI display manager
    displayManager.sessionPackages = [
      pkgs.jay
      pkgs.river
    ];

    # Emacs with packages and daemon
    emacs = {
      enable = false;
      install = false;
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
      wireplumber.enable = true;
    };

    # Need for authentication
    pcscd.enable = true;

    printing = {
      enable = true;
      drivers = with pkgs; [hplipWithPlugin];
      cups-pdf.enable = true;
    };
    # Scx scheduler
    scx = {
      enable = true;
      scheduler = "scx_bpfland";
      extraArgs = ["-m all"];
      package = pkgs.scx.rustscheds;
    };
    # Secret service
    gnome.gnome-keyring.enable = true;
  };
}
