{
  config,
  pkgs,
  inputs,
  lib,
}: {
  imports = [
    # Split configuration
    ./modules/boot.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/other.nix
    ./modules/user.nix
    # Include hardware scan
    ./hardware-laptop.nix
    # Use home-manager
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "mirl"; # Define your hostname.

  services = {
    thermald.enable = true;
    tlp = {
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
    xserver = {
      xkb.variant = "colemak_dh_wide,";
      videoDrivers = ["modesetting"];
    };
  };
  chaotic.mesa-git.enable = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };
}
