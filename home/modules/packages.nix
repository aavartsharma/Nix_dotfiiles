{ pkgs, ... }:
let
  logseqDB = import ../../pkgs/logseqDB/default.nix  { inherit pkgs; };
in 
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Destop apps
    # CLI utils
    # Coding stuff
    # WM stuff
    # Other
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
    wl-clipboard
    vlc
    zsh
    obsidian
    ntfs3g
    logseqDB
  ];
}
