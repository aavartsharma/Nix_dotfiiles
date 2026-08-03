{ ... }: {
  programs.bash={
	  enable = true;
	  shellAliases = {
	    btw = "echo 'I use nixos'";
	  };
  };
}
