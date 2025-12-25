# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Split configuration
    ./modules/boot.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/other.nix
    ./modules/user.nix
    # Include hardware scan
    ./hardware-desktop.nix
    # Use home-manager
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "mirl"; # Define your hostname.

  boot.loader.limine.extraEntries = ''
    /Windows
    protocol: efi
    path: uuid(4d96f285-5db8-11f0-95ec-1c1b0d09ace4):/EFI/Microsoft/Boot/bootmgfw.efi
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
