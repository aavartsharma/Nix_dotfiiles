{ config, pkgs, inputs, ...}:

{
  imports = [ inputs.nix4nvchad.homeManagerModules.default ];
  home.username = "aavart";
  home.homeDirectory = "/home/aavart";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  programs.firefox.enable= true;
  programs.bash={
	  enable = true;
	  shellAliases = {
	    btw = "echo 'I use nixos'";
	  };
  };
  programs.nvchad={
    enable= true;
  };
  programs.git ={
    enable =true;
    settings = {
      user = {
        name  = "aavartsharma";
        email = "rockstarfan0369@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}

