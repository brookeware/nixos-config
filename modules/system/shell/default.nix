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
}
