{
  description = "eikster-dk's dotfiles written in nix";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, darwin, catppuccin, determinate, ... }@inputs: {
    darwinConfigurations."eikster-mbp" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/mbp-private/darwin.nix
      ];
    };
    darwinConfigurations."eikster-ftg" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        determinate.darwinModules.default
        ./hosts/mbp-work/darwin.nix
      ];
    };
    homeConfigurations = {
      "eikster@eikster-mbp" = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          catppuccin.homeManagerModules.catppuccin
          ./hosts/mbp-private/home.nix
        ];
      };
      "eikftg@eikster-ftg" = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          catppuccin.homeManagerModules.catppuccin
          ./hosts/mbp-work/home.nix
        ];
      };
    };
    nixosConfigurations = {
      nixbook = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        system = "x86_64-linux";
        modules = [
          ./hosts/nixbook/config.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users."eikster" = {
              imports = [
                ./hosts/nixbook/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
        ];
      };
    };
  };
}
