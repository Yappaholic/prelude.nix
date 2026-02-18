{
  pkgs,
  modulesPath,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  ghostty-git = inputs.ghostty.packages.${system}.default;
in {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    inputs.nixvim.nixosModules.nixvim
    ../editors/nixvim/nixvim.nix
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  environment.systemPackages = with pkgs; [
    #firefox
    git
    nodejs_latest
    bun
    autotiling-rs
    zed-editor
    fish
    kotatogram-desktop
    btop
    fastfetch
    wl-clipboard
    nerd-fonts.jetbrains-mono
    prettierd
    tealdeer
    ghostty-git
    wmenu
  ];
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    wrapperFeatures.gtk = true;
  };
  hardware.graphics.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
