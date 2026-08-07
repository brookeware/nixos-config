{ config, pkgs, lib, inputs, ... }:

{
  home.username = "brooke";
  home.homeDirectory = "/home/brooke";

  home.file.".config" = {
    source = ./dotfiles/.config;
    recursive = true;
  };

  home.file.".local/share" = {
    source = ./dotfiles/.local/share;
    recursive = true;
  };

  home.file."Wallpapers" = {
    source = ../../../../../assets/wallpapers;
    recursive = true;
  };

#  home.packages = with pkgs; [
#  ];

  programs.zen-browser.enable = true;

  home.pointerCursor = {
    enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  home.stateVersion = "26.05";
}

