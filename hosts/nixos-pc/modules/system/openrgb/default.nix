{ config, pkgs, ... }:
{
  services.udev.packages = [ pkgs.openrgb ];
  boot.kernelModules = [ "i2c-dev" ];
  hardware.i2c.enable = true;
  services.hardware.openrgb.enable = true;
}
