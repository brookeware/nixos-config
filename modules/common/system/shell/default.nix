{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "gnzh";
    };

    shellAliases = {
      "nrs" = "sudo nixos-rebuild switch";
    };
  };

  users.defaultUserShell = pkgs.zsh;

  # Fix for running bash scripts with the #/bin/bash header
  systemd.tmpfiles.rules = [
    "L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
  ];
}
