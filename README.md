# Nix_dotfiiles

```
nixos-config/
├── flake.nix
├── flake.lock
├── hosts/
│   ├── desktop/
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   │   └── disks.nix
│   │   └── boot.nix
│   ├── laptop/
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   └── server/
│       ├── default.nix
│       └── hardware-configuration.nix
├── modules/
│   ├── desktop/
│   │   ├── gnome.nix
│   │   ├── kde.nix
│   ├── fonts/
│   │   └── defalt.nix
│   ├── services/
│   │   ├── ssh.nix
│   │   ├── docker.nix
│   │   └── tailscale.nix
│   ├── hardware/
|   |   |── bluetooth.nix
│   │   ├── printing.nix
│   │   └── sound.nix
├   |── development/
│   │   ├── rust.nix
│   │   ├── python.nix
│   │   └── node.nix
│   └── common.nix
├── users/
│   ├── alice.nix
│   └── bob.nix
├── pkgs/
│   ├── my-script/ 
│   ├── patched-firefox/
│   └── default.nix
├── overlays/
│   └── default.nix
|── home/
    ├── users/ 
        ├── alice/
            ├── default.nix
            ├── ssh.nix
        ├── bob/          
            ├── default.nix
    └── common.nix
    ├── default.nix
    └── modules/ 
        └── git.nix
        ├── shell.nix
        └── neovim.nix
        └── firefox.nix

```
