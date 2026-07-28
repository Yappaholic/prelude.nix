{
  inputs,
  pkgs,
  ...
}: {
  # Bootloader.
  boot = {
    kernelParams = ["zfs_force=1" "zfs.zfs_arc_max=1073741824" "zfs.zfs_arc_min=536870912"];
    loader.limine = {
      enable = true;
      efiSupport = true;
      enableEditor = true;
    };
    loader.efi.canTouchEfiVariables = true;
    binfmt.emulatedSystems = ["aarch64-linux"];
    kernelPackages = pkgs.linuxPackages_cachyos;

    zfs = {
      package = pkgs.zfs_cachyos;
      forceImportRoot = false;
    };
  };
  services.zfs = {
    autoSnapshot = {
      enable = true;
      frequent = 0;
      hourly = 0;
      weekly = 3;
      monthly = 0;
    };
    trim = {
      enable = true;
    };
    autoScrub.enable = true;
  };
}
