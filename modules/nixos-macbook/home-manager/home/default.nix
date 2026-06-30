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
    source = ../../../../assets/wallpapers;
    recursive = true;
  };

  home.packages = with pkgs; [
    jq
    btop
    vesktop
    feishin
    dunst
    waybar
    awww
    wofi
    grim
    slurp
    waypaper
    fastfetch
    hyfetch
    pfetch
    prismlauncher
    hyprpolkitagent
    grimblast
    wl-clipboard
    kdePackages.kate
    kakoune
    mpv
    vlc
    kdePackages.ark
    kdePackages.systemsettings
    kdePackages.gwenview
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    obs-studio
    cava
    tty-clock
    cmus
    cmake
    lxqt.pavucontrol-qt
    vesktop
    protonvpn-gui
  ];

  programs.zen-browser.enable = true;

  home.pointerCursor = {
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

