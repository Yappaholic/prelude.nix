{
  inputs,
  pkgs,
  ...
}: {
  # Bootloader.
  boot = {
    loader.limine = {
      enable = true;
      efiSupport = true;
      enableEditor = true;
    };
    loader.efi.canTouchEfiVariables = true;
    binfmt.emulatedSystems = ["aarch64-linux"];
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;
  };
}
