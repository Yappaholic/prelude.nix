{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage (final: {
  pname = "kak-popup";
  version = "0.7.0";

  src = pkgs.fetchFromGitHub {
    owner = "enricozb";
    repo = "popup.kak";
    rev = "v${final.version}";
    hash = "sha256-/Nc5nUNXx/FPX/4mqqWQvN/F0NtX0ZhYyip3GzVpJcI=";
  };

  cargoHash = "sha256-YNXi8RgmC/r6Rx98e9hKgppvnXBi52UeiRdoXg2f9uY=";

  meta = {
    homepage = "https://github.com/enricozb/popup.kak";
    description = "Popup windows inside kakoune";
    mainProgram = "kak-popup";
    license = pkgs.lib.licenses.cc-by-10;
    maintainers = [];
  };
})
