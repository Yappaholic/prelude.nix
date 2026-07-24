{...}: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.devenv = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.starship = {
    enable = false;
    enableNushellIntegration = true;
  };
  programs.nix-your-shell = {
    enable = true;
    enableZshIntegration = true;
  };
  # programs.oh-my-posh = {
  #   enable = true;
  #   #enableNushellIntegration = true;
  #   enableZshIntegration = true;
  #   useTheme = "pure";
  # };
}
