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
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
	  nix4nvchad = {
	    url = "github:nix-community/nix4nvchad";
	    inputs.nixpkgs.follows = "nixpkgs";
	  };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixpkgs-unstable, ... }: 
  let 
    system_arch = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system_arch};
    pkgs_unstable = nixpkgs-unstable.legacyPackages.${system_arch};
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
                inherit pkgs_unstable;
              };
		    	    users.${username} = import ./home/users/${username}/default.nix;
            };
		      }
	    	];
	    };
  in {
	  nixosConfigurations = {
  	  laptop = mkHost {
        hostname = "laptop";
        username = "aavart";
      };
	    silica = mkHost {
        hostname = "silica";
        username = "aavart";
      };
    };
    #homeConfigurations.aavart = home-manager.lib.homeManagerConfiguration {
    #  inherit pkgs;
    #  extraSpecialArgs = {
    #    inherit inputs;
    #    inherit pkgs_unstable;
    #  };
    #  modules = [
    #    ./home/users/aavart/default.nix
    #  ];
    #};
  };
}
