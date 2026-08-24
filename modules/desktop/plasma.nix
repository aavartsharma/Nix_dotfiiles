{ pkgs, ... }: {
  services = {
    xserver.enable= true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
  # this create an additional genration
  #specialisation.plasma.configuration = {
  #  services.xserver.enable = true;
  #  services.displayManager.sddm.enable = true;
  #  services.displayManager.sddm.wayland.enable = true;
  #  services.desktopManager.plasma6.enable = true;
  #};
}
