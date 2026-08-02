{ config, pkgs, ...}:

{
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
    programs.git = {
    	enable = true;
	username = "aavartsharma";
	userEmail = "rockstarfan0369@gmail.com";
    };
}

