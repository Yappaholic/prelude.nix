# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: let
  modules = {
    user = import ./modules/user.nix {
      inherit pkgs;
      inherit inputs;
      additional-packages = with pkgs; [
        lutris
        protonup-qt
        wineWow64Packages.waylandFull
        gamescope
      ];
    };
  };
in {
  imports = [
    # Split configuration
    ./modules/boot.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/other.nix
    # Include hardware scan
    ./hardware-desktop.nix
    modules.user
    # Use home-manager
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "mirl"; # Define your hostname.

  boot.loader.limine.extraEntries = ''
    /Windows
    protocol: efi
    path: uuid(4d96f285-5db8-11f0-95ec-1c1b0d09ace4):/EFI/Microsoft/Boot/bootmgfw.efi
    /Gentoo
    protocol: linux
    path: uuid(1f4a26c9-dd2c-43f9-a0a1-5d715198851c):/boot/linux-6.18.1-bzImage
    module_path: uuid(1f4a26c9-dd2c-43f9-a0a1-5d715198851c):/boot/linux-6.18.1-initrd
    cmdline: root=UUID=4971dfa0-d2ad-45ea-b22f-7da1f5afd963 rootfstype=btrfs rw nvidia-drm.fbdev=1
  '';
  services.xserver = {
    xkb.variant = "colemak_dh_wide_iso,";
    videoDrivers = ["nvidia"];
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [libvdpau-va-gl];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
