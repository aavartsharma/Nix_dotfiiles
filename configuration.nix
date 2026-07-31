# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let 
    unstable = import <nixos-unstable> { };
    logseq-patch = pkgs.logseq.override {
       electron_39 = pkgs.electron_41;
    };
in 
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

   # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  # Set your time zone.
  time.timeZone = "Aisa/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aavart = {
    isNormalUser = true;
  	extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  	packages = with pkgs; [
      tree
    ];
   };

  programs.firefox.enable = true;
  programs.home-manager.enable = true;

  environment.systemPackages = with pkgs; [
     vim 
     wget
     btop
     git
     gcc
     python3
     kitty
     drawio
     kdePackages.kdeconnect-kde
     logisim-evolution
     fastfetch
     tmux
     #logseq-patch 
     syncthing
     yazi
     home-manager
     wl-clipboard
     vlc
     zsh
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
  
  system.stateVersion = "26.05"; 

}

