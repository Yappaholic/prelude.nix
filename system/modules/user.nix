{
  pkgs,
  inputs,
  additional-packages ? [],
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  helium = inputs.helium.packages.${system}.default;
  kak-popup = import ../../modules/programs/kak-popup.nix {inherit pkgs;};
in {
  # My user account
  users.users.savvy = {
    isNormalUser = true;
    description = "Nixyy";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "kvm" "adbusers" "pipewire" "video" "seat"];
    packages = with pkgs;
      additional-packages
      ++ [
        # Programming languages
        gcc16
        alejandra
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
        zig
        zls

        # Window managers and desktop
        ## X11
        i3status-rust
        rofi
        dunst
        xmobar
        ## Other
        jay
        river
        wl-tray-bridge
        awww
        wlsunset
        noctalia
        helium
        protonup-rs
        alacritty
        foot
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
        kak-popup
        emacs-lsp-booster
        neovim

        # CLI tools
        devenv
        nix-your-shell
        #gitu
        jujutsu
        zellij
        btop
        onefetch
        fastfetch
        bat
        xclip
        xsel
        xdotool
        xset
        setxkbmap
        dust
        tldr
        fzf
        fd
        tmux
        jq
        ripgrep
        yazi
      ];
  };
}
