{
    description = "First flake";

    inputs = {
	nixpkgs = {
	    url= "github:NixOS/nixpkgs/nixos-26.05";
	};
	home-manager= {
	    url = "github:nix-community/home-manager/release-26.05";
	    inputs.nixpkgs.follows= "nixpkgs";
	};
	nix4nvchad = {
	    url = "github:nix-community/nix4nvchad";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let 
    	system_arch = "x86_64-linux";
    in {
	nixosConfigurations = {
  	    aavart = nixpkgs.lib.nixosSystem {
	        system = system_arch;
		specialArgs = {inherit inputs; };
	    	modules = [ 
	            ./configuration.nix 
		    ./hardware-configuration.nix
		    home-manager.nixosModules.home-manager {
		    	home-manager.extraSpecialArgs = { inherit inputs; };
		    	home-manager.users.aavart = import ./home.nix;
		    }
	    	];
	    };
        };
	homeConfigurations.amper= home-manager.lib.homeManagerConfiguration {
	    pkgs= nixpkgs.legacyPackages.${system_arch};
	    modules = [ ./home.nix ];
	};
    };
}
