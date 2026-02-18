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
    extraGroups = ["networkmanager" "wheel" "kvm" "adbusers"];
    packages = with pkgs;
      additional-packages
      ++ [
        clang
        clang-tools
        gopls
        gofumpt
        # Programming languages
        zig
        zls
        alejandra
        odin
        ols
        #bash-env-nushell
        nixd
        rust-analyzer
        rustc
        rustfmt
        cargo
        #godot-mono
        man-pages
        man-pages-posix

        # Window managers and desktop
        ## X11
        #polybar
        #feh
        #xclip
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
        #youtube-music
        vesktop
        wmenu

        # Editors
        kakoune
        kakoune-lsp
        kak-tree-sitter-unwrapped
        emacs-lsp-booster

        # CLI tools
        nix-your-shell
        nurl
        #gitu
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
