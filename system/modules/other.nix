{
  inputs,
  lib,
  pkgs,
  ...
}: let
  neovim-git = inputs.neovim-nightly.packages.${pkgs.system}.default;
in {
  # Set modern swap with 150% value ov RAM
  zramSwap = {
    enable = true;
    priority = 10;
    algorithm = "lz4";
    memoryPercent = 150;
  };
  # Disable IPV6 and use Google nameservers
  networking = {
    enableIPv6 = false;
    nameservers = ["8.8.8.8" "8.8.8.4"];
    networkmanager.enable = true;
  };

  # Enable man pages
  documentation.dev.enable = true;

  # Add ChaoticNyx and use cache.nixos.org proxy
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = lib.mkForce [
        "https://nixos-cache-proxy.cofob.dev"
        "https://chaotic-nyx.cachix.org"
      ];
      trusted-public-keys = [
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    neovim-git
    git
    home-manager
  ];
}
