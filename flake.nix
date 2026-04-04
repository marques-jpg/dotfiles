{
  description = "NixOS system by marques-jpg";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
	url = "github:0xc000022070/zen-browser-flake";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    
    firefox-addons = {
	url = "github:osipog/nix-firefox-addons";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
	url = "github:Gerg-L/spicetify-nix";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
	url = "github:ryantm/agenix";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
	  system = "x86_64-linux";
	  specialArgs = { inherit inputs; };
	  modules = [
	    ./hosts/nixos/configuration.nix
	    inputs.agenix.nixosModules.default
	    home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.extraSpecialArgs = { inherit inputs; };
		home-manager.users.marques = import ./home/marques/home.nix;
	    }
	  ];
	};
	laptop = nixpkgs.lib.nixosSystem {
	  system = "x86_64-linux";
	  specialArgs = { inherit inputs; };
	  modules = [
	    ./hosts/laptop/configuration.nix
	    inputs.agenix.nixosModules.default
	    home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
		home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users.marques = import ./home/marques/home.nix;
	    }
	  ];
	};
    };
  };
}
