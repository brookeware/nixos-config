{ config, pkgs, lib, inputs, ... }:

{
  home.username = "brookolli";
  home.homeDirectory = "/home/brookolli";

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

  home.packages = with pkgs; [
    
    (discord.override {
      withVencord = true;
    })

    heroic
    lutris
  ];

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

  programs.zen-browser.enable = true;

  home.stateVersion = "26.11";
}

