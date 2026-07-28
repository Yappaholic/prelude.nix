{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Set modern swap with 150% value ov RAM
  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 150;
    algorithm = "zstd";
  };
  # Disable IPV6 and use Google nameservers
  networking = {
    hostId = "5c032492";
    enableIPv6 = false;
    #nameservers = ["8.8.8.8" "8.8.8.4"];
    networkmanager.enable = true;
  };

  # Scanner support
  hardware.sane = {
    enable = true;
  };

  # Enable man pages
  documentation.dev.enable = true;

  # Add ChaoticNyx and use cache.nixos.org proxy
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      # Force substituters to disallow cache.nixos.org
      substituters = lib.mkForce [
        "https://nyx-cache.chaotic.cx/" # chaotic nyx
        "https://nixos-cache-proxy.cofob.dev" # nixpkgs proxy
        "https://install.determinate.systems" # determinate nix
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
      ];
    };
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Screensharing and filepickers on wayland
  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    wlr.enable = lib.mkForce true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  # Share xkb config with terminal
  console.useXkbConfig = true;

  # For pipewire sessions
  security.rtkit.enable = true;

  # Auto-decrypt for gnome-keyring
  security.pam.services.login.enableGnomeKeyring = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    #neovim-git
    git
    home-manager
    python3
  ];
  environment.shells = with pkgs; [
    nushell
  ];
  environment.extraInit = ''
    export WLR_DRM_RENDERER=vulkan
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export QT_QPA_PLATFORM=wayland
    export SWAY_UNSUPPORTED_GPU=1

    export SDL_VIDEODRIVER=wayland
  '';
}
