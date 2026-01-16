{...}: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    # enableNushellIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
  programs.starship = {
    enable = false;
    enableNushellIntegration = true;
  };
  # programs.oh-my-posh = {
  #   enable = true;
  #   #enableNushellIntegration = true;
  #   enableZshIntegration = true;
  #   useTheme = "pure";
  # };
}
