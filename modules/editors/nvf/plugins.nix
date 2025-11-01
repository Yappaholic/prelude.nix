{pkgs, ...}: let
  ashen-package = pkgs.vimUtils.buildVimPlugin {
    name = "ashen";
    src = pkgs.fetchFromGitHub {
      owner = "ficd0";
      repo = "ashen.nvim";
      rev = "main";
      hash = "sha256-yC9V58zieE8YvEuAnJhEOgONrudUJgQFqC59cKo97/g=";
    };
  };
in {
  ashen = {
    package = ashen-package;
    setup = "require('ashen').setup({})";
  };
}
