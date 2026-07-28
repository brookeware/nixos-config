{ config, pkgs, ... }:
{  
   xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          max_fps = 60;
          chooser_type = "dmenu";
          chooser_cmd = "${pkgs.wofi}/bin/wofi --show dmenu";
        };
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [ "wlr" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.Inhibit" = [ "none" ];
      };
      wlroots = {
      };
    };
  };
}
