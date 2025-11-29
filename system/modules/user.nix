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
      ty
      ruff
      alejandra
      odin
      ols
      go
      gopls
      gofumpt
      bun
      typescript-language-server
      vscode-langservers-extracted
      #bash-env-nushell
      nixd
      gcc15
      rustup
      clang-tools
      #godot-mono
      man-pages
      man-pages-posix

      # Editors and text
      kakoune-unwrapped
      kakoune-lsp

      # Window managers and desktop
      kitty
      ghostty
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
      youtube-music
      vesktop
      wmenu

      # CLI tools
      nix-your-shell
      nurl
      gitu
      pass-wayland
      bc
      mpv
      yt-dlp
      yt-x
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
