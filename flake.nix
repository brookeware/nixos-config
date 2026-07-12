# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    qtengine = {
      url = "github:kossLAN/qtengine";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@ { self, nixpkgs, mangowm, home-manager, nixvim, qtengine, zen-browser, ... }: {
    nixosConfigurations = {
      nixos-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos-pc/configuration.nix
          ./modules/nixos-pc/system
          ./modules/common/system

          mangowm.nixosModules.mango
          qtengine.nixosModules.default

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.brookolli = import ./modules/nixos-pc/home-manager;

              sharedModules = [
                nixvim.homeModules.nixvim
                mangowm.hmModules.mango
                zen-browser.homeModules.twilight
              ];
            };
          }
        ];
      };

      nixos-macbook = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";

        modules = [
          ./hosts/nixos-macbook/configuration.nix
          ./modules/nixos-macbook/system
          ./modules/common/system

          mangowm.nixosModules.mango
          qtengine.nixosModules.default

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.brooke = import ./modules/nixos-macbook/home-manager;

              sharedModules = [
                nixvim.homeModules.nixvim
                mangowm.hmModules.mango
                zen-browser.homeModules.twilight
              ];
            };
          }
        ];
      };

      nixos-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos-server/configuration.nix
        ];
      };
    };
  };
}
