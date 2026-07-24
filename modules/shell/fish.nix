{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "hydro";
        src = hydro.src;
      }
      {
        name = "fzf-fish";
        src = fzf-fish.src;
      }
      {
        name = "fishbang";
        src = fishbang.src;
      }
      {
        name = "done";
        src = done.src;
      }
      {
        name = "bass";
        src = bass.src;
      }
    ];
    shellAbbrs = {
      nhs = "nh os switch";
      nht = "nh os test";
      ff = "fastfetch";
      k = "kak";
      v = "nvim";
    };
    shellAliases = {
      ls = "eza --color=always --icons=always";
      ll = "eza -l --color=always --icons=always";
      la = "eza -la --color=always --icons=always";
    };
    loginShellInit = ''
      bass source /etc/profile
    '';
    shellInitLast = ''
      fish_add_path ~/.cargo/bin
      fish_add_path ~/go/bin
      fish_add_path ~/.config/emacs/bin
      set --export EDITOR nvim
      set --export MANPAGER "nvim +Man!"
      ${pkgs.nix-your-shell}/bin/nix-your-shell fish | source
      ${pkgs.devenv}/bin/devenv hook fish | source
    '';
  };
}
