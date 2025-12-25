{inputs, ...}: {
  # Bootloader.
  boot = {
    loader.limine = {
      enable = true;
      efiSupport = true;
      enableEditor = true;
    };
    loader.efi.canTouchEfiVariables = true;
    binfmt.emulatedSystems = ["aarch64-linux"];
    kernelPackages = inputs.cachyos-kernel.legacyPackages.x86_64-linux.linuxPackages-cachyos-latest-lto;
  };
}
