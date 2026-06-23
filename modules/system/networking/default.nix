{ config, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.firewall.checkReversePath = false;

  networking.firewall = {
    allowedTCPPorts = [
      53317
    ];
    allowedUDPPorts = [
      53317
    ];
  };
}

