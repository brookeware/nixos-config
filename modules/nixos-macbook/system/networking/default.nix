{ config, ... }:
{
  networking.hostName = "nixos-macbook";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.firewall.checkReversePath = false;
}
