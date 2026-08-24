{ homeStateVersion, inputs, pkgs_unstable, ... }: {
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    ../../modules/applications.nix
    ../../modules/bash.nix
    ../../modules/userSetting.nix
    ../../modules/git.nix 
    ../../modules/packages.nix
    ../../modules/setting.nix
    ../../modules/packages.nix
  ];

  home = {
    username = "aavart";
    homeDirectory = "/home/aavart";
    stateVersion = "26.05";
  };
  userSettings = {
    name="aavartsharma";
    email="rockstarfan0369@gmail.com";
  };
  
  programs.home-manager.enable = true;
  programs.firefox.enable= true;
  programs.nvchad={
    enable= true;
  };
  programs.bash = {
    enable = true;
    shellAliases={
      logseq= "logseqDB --ozone-platform=x11";
    };
  };
}
