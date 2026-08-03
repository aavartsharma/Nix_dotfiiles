{ config, pkgs, ... }:

{
  programs.git.settings = {
    enable = true;

    user.name = config.userSettings.name;
    user.email = config.userSettings.email;

    extraConfig = {
      init.defaultBranch = "main";
    };

    lfs.enable = true;
  };
}
