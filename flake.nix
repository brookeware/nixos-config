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
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qtengine = {
      url = "github:kossLAN/qtengine";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = inputs@ { self, nixpkgs, mangowm, home-manager, nixvim, qtengine, zen-browser, ... }:
    let
      system = "x86_64-linux";
      inherit (nixpkgs) lib;
    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        modules = [
          ./configuration.nix
	  ./hardware-configuration.nix
	  ./modules/system

          mangowm.nixosModules.mango
	  qtengine.nixosModules.default

	  home-manager.nixosModules.home-manager {
	    home-manager = {
	      useGlobalPkgs = true;
	      useUserPackages = true;
	      users.brookolli = import ./modules/home-manager;

	      sharedModules = [
                nixvim.homeModules.nixvim
		mangowm.hmModules.mango
		zen-browser.homeModules.twilight
	      ];
	    };
	  }
        ];
      };
    };
}
