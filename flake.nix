{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    yt-x = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    qtile = {
      url = "github:qtile/qtile";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango.url = "github:DreamMaoMao/mangowc";
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    chaotic,
    mango,
    ...
  } @ inputs: let
    system = "x86-64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.mirl = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {inherit inputs;};
      modules = [
        ./system/desktop.nix
        home-manager.nixosModules.home-manager
        mango.nixosModules.mango
        chaotic.nixosModules.default
        {
          home-manager.useUserPackages = true;
          home-manager.users.savvy = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };
    homeConfigurations.savvy = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        {
          extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };
    #Custom ISO
    nixosConfigurations.customIso = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./modules/iso/configuration.nix
      ];
    };
  };
}
