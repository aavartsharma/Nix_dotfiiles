{
    description = "First flake";

    inputs = {
	nixpkgs = {
	    url= "github:Nixos/nixpkgs/nixos-unstable";
	};
    };

    outputs = { self, nixpkgs, ... }: 
    {
	nixosConfigurations = {
  	    aavart = nixpkgs.lib.nixosSystem {
	     	system = "x86_64-linux";
		modules = [ 
		    ./configuration.nix 
		    ./hardware-configuration.nix
		];
	    };
	};
    };
}
