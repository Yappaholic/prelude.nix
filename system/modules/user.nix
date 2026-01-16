{
  pkgs,
  inputs,
  additional-packages ? [],
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  yt-x = inputs.yt-x.packages.${system}.default;
in {
  # My user account
  users.users.savvy = {
    isNormalUser = true;
    description = "Nixyy";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs;
      additional-packages
      ++ [
        # Programming languages
        clang
        ccls
        zig
        zls
        haskell-language-server
        alejandra
        odin
        ols
        go
        gopls
        gofumpt
        bun
        jdt-language-server
        typescript-language-server
        vscode-langservers-extracted
        #bash-env-nushell
        nixd
        rust-analyzer
        rustc
        cargo
        #godot-mono
        man-pages
        man-pages-posix
        evil-helix

        # Window managers and desktop
        ## X11
        polybar
        feh
        xclip
        ## Other
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
        discord

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
