{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    ohMyZsh = {
      enable = true;
      theme = "gnzh";
    };

    shellAliases = {
      "nrs" = "sudo nixos-rebuild switch --flake ~/nixos-config --impure";
      "nfu" = "nix flake update --flake ~/nixos-config";
    };
  };

  users.defaultUserShell = pkgs.zsh;

  # Fix for running bash scripts with the #/bin/bash header
  systemd.tmpfiles.rules = [
    "L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
  ];
}
