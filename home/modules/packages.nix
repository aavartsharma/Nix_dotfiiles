{ pkgs, ... }:
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
    home-manager
    wl-clipboard
    vlc
    zsh
    obsidian
    ntfs3g
  ];
}
