{
  pkgs,
  inputs,
  ...
}: let
  system = "x86_64-linux";
  yt-x = inputs.yt-x.packages.${system}.default;
in {
  # My user account
  users.users.savvy = {
    isNormalUser = true;
    description = "Nixyy";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      # Programming languages
      alejandra
      #bash-env-nushell
      nixd
      clang
      rustup
      clang-tools
      #godot-mono
      man-pages
      man-pages-posix

      # Editors and text
      kakoune-unwrapped
      kakoune-lsp

      # Window managers and desktop
      #feh
      #gammastep
      #rofi
      #picom-pijulius
      #polybarFull
      #polybar-pulseaudio-control
      kitty
      #leftwm
      #leftwm-config
      #leftwm-theme
      #xmobar
      #xdotool
      #trayer
      waybar
      wlsunset
      wl-clipboard
      swww
      telegram-desktop
      wlogout
      #softmaker-office
      #corefonts
      #vistafonts
      #viber
      xdg-utils
      qutebrowser
      youtube-music
      wmenu
      yt-x

      # CLI tools
      nix-your-shell
      nurl
      gitu
      pass-wayland
      bc
      mpv
      yt-dlp
      btop
      onefetch
      fastfetch
      bat
      xclip
      xsel
      dust
      tealdeer
      fzf
      fd
      tmux
      jq
      ripgrep
      yazi
    ];
  };
}
