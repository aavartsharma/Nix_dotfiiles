{ pkgs, ... }: {
  services.xserver = {
     enable = true;
  };
 
  specialisation.plasma.configuration = {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
