{ config, pkgs, inputs, ...}:

{
    imports = [ inputs.nix4nvchad.homeManagerModules.default ];
    home.username = "aavart";
    home.homeDirectory = "/home/aavart";
    programs.git.enable = true;
    home.stateVersion = "26.05";
    programs.bash={
	enable = true;
	shellAliases = {
	    btw = "echo 'I use nixos'";
	};
    };
    programs.nvchad={
    	enable= true;
    };
}

