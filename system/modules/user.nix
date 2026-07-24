{
  pkgs,
  inputs,
  additional-packages ? [],
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  yt-x = inputs.yt-x.packages.${system}.default;
  waterfox = inputs.waterfox.packages.${system}.waterfox-bin;
  noctalia = inputs.noctalia.packages.${system}.default;
in {
  # My user account
  users.users.savvy = {
    isNormalUser = true;
    description = "Nixyy";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "kvm" "adbusers" "pipewire" "video"];
    packages = with pkgs;
      additional-packages
      ++ [
        # Programming languages
        clang
        alejandra
        python3
        #bash-env-nushell
        nixd
        rustup
        #rust-analyzer
        #rustc
        #rustfmt
        #cargo
        #godot-mono
        man-pages
        man-pages-posix
        luaPackages.fennel
        fnlfmt
        idris2
        idris2Packages.idris2Lsp

        # Window managers and desktop
        ## X11
        rofi
        dunst
        xmobar
        ## Other
        noctalia
        waterfox
        protonup-qt
        alacritty
        telegram-desktop

        #softmaker-office
        #corefonts
        #vistafonts
        #viber
        xdg-utils
        #youtube-music
        vencord

        # Editors
        kakoune
        kakoune-lsp
        kak-tree-sitter-unwrapped
        emacs-lsp-booster
        neovim

        # CLI tools
        devenv
        nix-your-shell
        nurl
        #gitu
        jujutsu
        bc
        mpv
        yt-dlp
        yt-x
        btop
        onefetch
        fastfetch
        bat
        feh
        xclip
        xsel
        xdotool
        xset
        setxkbmap
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
