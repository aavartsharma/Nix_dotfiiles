{ config, lib, pkgs, ... }:
{
  imports = [
    import ../aavart/hardware-configuration.nix      
  ];
  time.timezone = "Asia/Kolkata";
  networking.hostname="silica";
  system.stateVersion = "26.05";
}
