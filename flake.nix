{
  description = "First flake";

  inputs = {
	  nixpkgs = {
	    url= "github:NixOS/nixpkgs/nixos-26.05";
	  };
	  home-manager= {
	    url = "github:nix-community/home-manager";
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
    home = ./home.nix;
  in {
	  nixosConfigurations = {
  	  aavart = nixpkgs.lib.nixosSystem {
	      system = system_arch;
		    specialArgs = { 
          inherit inputs; 
        };
	    	modules = [ 
	        ./hosts/aavart 
		      home-manager.nixosModules.home-manager {
		    	  home-manager.extraSpecialArgs = { inherit inputs; };
		    	  home-manager.users.aavart = import home;
		      }
	    	];
	    };

	    silica = nixpkgs.lib.nixosSystem {
	    	system = system_arch;
		     modules = [ 
		      ./configuration.nix
		      ./hardware-configuration.nix
		     ];
	    };
    };
	  
	  homeConfigurations.amper= home-manager.lib.homeManagerConfiguration {
	    pkgs= nixpkgs.legacyPackages.${system_arch};
	    modules = [ home ];
	  };
  };
}
