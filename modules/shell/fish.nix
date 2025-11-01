{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "hydro";
        src = hydro.src;
      }
      {
        name = "sponge";
        src = sponge.src;
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
    ];
    shellAbbrs = {
      nhs = "nh os switch";
      nht = "nh os test";
      ls = "eza --color=always --icons=always";
      la = "eza -la --color=always --icons=always";
      k = "kak";
      v = "nvim";
    };
    shellInitLast = ''
      fish_add_path ~/.cargo/bin
      fish_add_path ~/go/bin
      fish_add_path ~/.config/emacs/bin
    '';
  };
}
