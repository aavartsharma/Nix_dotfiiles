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
    mkHost = { hostname, username}:
      nixpkgs.lib.nixosSystem {
	      system = system_arch;
		    specialArgs = { 
          inherit inputs; 
        };
	    	modules = [ 
	        ./hosts/${hostname}/default.nix
          ./hosts/${hostname}/hardware-configuration.nix
		      home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
		    	    extraSpecialArgs = { 
                inherit inputs; 
              };
		    	    users.${username} = import ./home/users/${username}/default.nix;
            };
		      }
	    	];
	    };
  in {
	  nixosConfigurations = {
  	  aavart = mkHost {
        hostname = "aavart";
        username = "aavart";
      };
	    silica = mkHost {
        hostname = "silica";
        username = "aavart";
      };
    };
    homeConfigurations.aavart = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
      };
      modules = [
        ./home/users/aavart/default.nix
      ];
    };
  };
}
