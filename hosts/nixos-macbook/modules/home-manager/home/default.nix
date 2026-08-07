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

  home.packages = with pkgs; [
    awww
    blockbench
    btop
    cava
    cmake
    cmus
    dunst
    fastfetch
    feishin
    grim
    grimblast
    hyfetch
    hyprpolkitagent
    jq
    kakoune
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.kate
    kdePackages.kio
    kdePackages.kio-admin
    kdePackages.kio-extras
    kdePackages.kio-fuse
    lxqt.pavucontrol-qt
    mpv
    obs-studio
    pfetch
    prismlauncher
    proton-vpn
    slurp
    tty-clock
    vesktop
    vesktop
    vlc
    waybar
    waypaper
    wl-clipboard
    wofi
  ];

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

