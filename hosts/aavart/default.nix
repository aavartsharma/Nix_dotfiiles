# this file has host specfic 
{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstables> {};
  systemPackages = import ../../../modules/desktop/packages.nix ;
in 
{
  imports= 
  [
    ./hardware-configuration.nix
    ../../modules/desktop/plasma.nix
    ../../modules/fonts/default.nix
    ../../modules/hardware/audio.nix
    ../../modules/bootloader.nix
    ../../modules/networkmanager.nix
    ../../modules/zram.nix
  ];

  environment.systemPackages = with pkgs; [
       
  ] ++ systemPackages;

  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 6d";
  };
  networking.hostname ="laptop";
  system.stateVersion = "26.05"; 

}
