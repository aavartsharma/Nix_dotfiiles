{ config, lib, pkgs, ... }:
{
  users.users.aavart = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      tree
    ];
  };
}
