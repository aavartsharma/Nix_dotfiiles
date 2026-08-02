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

  time.timeZone = "Aisa/Kolkata";

  
  services.xserver.enable = true;
 
  users.users.aavart = {
    isNormalUser = true;
  	extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  	packages = with pkgs; [
      tree
    ];
  };

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

