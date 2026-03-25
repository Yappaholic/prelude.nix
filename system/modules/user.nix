{
  pkgs,
  inputs,
  additional-packages ? [],
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  yt-x = inputs.yt-x.packages.${system}.default;
  odin-git = inputs.odin-nightly.packages.${system}.default;
  ols-git = inputs.odin-nightly.packages.${system}.ols;
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
        clang-tools
        clang
        gopls
        gofumpt
        # Programming languages
        zig
        zls
        alejandra
        #bash-env-nushell
        nixd
        rustup
        #rust-analyzer
        #rustc
        #rustfmt
        #cargo
        #godot-mono
        odin-git
        ols-git
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
        grim
        slurp
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
