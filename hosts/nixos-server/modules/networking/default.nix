{ config, ... }:
{
  networking.hostName = "nixos-server";
  networking.networkmanager.enable = true;

  # Open firewall ports
  networking.firewall.allowedTCPPorts = [
    25565
    42420
  ];

  networking.firewall.allowedUDPPorts = [
    25565
    42420
  ];
}
