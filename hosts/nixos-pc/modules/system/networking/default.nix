{ config, ... }:
{
  networking.hostName = "nixos-pc";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.firewall.checkReversePath = false;

  networking.firewall = {
    allowedTCPPorts = [
      53317
      25566
    ];
    allowedUDPPorts = [
      53317
      25566
    ];
  };
}

