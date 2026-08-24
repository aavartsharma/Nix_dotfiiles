{ pkgs, ... }:
{
  xdg.desktopEntries.logseqDB = {
    name = "Logseq";
    exec= "logseqDB --ozone-platform=x11";
    categories = [ "Education" ];
  };
  xdg.desktopEntries.drawio = {
    name = "Drawio";
    exec= "drawio --ozone-platform=x11";
    categories= [ "Graphics" ];
  };
  xdg.desktopEntries.obsidian = {
    name = "Obsidian";
    exec = "obsidian --ozone-platform=x11";
    categories = [ "Office" ];
  };
}
