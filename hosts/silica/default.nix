{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix      
    ../../modules/desktop/plasma.nix
    ../../modules/fonts/default.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/bootloader.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/networkmanager.nix
    ../../modules/hardware/zram.nix
  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    pkgs.home-manager     
  ];

  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 6d";
  };

  time.timeZone = "Asia/Kolkata";
  networking.hostName="silica";
  system.stateVersion = "26.05";
}
