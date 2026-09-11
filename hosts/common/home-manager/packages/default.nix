{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    btop
    vesktop
    feishin
    fastfetch
    hyfetch
    prismlauncher
    wl-clipboard
    kdePackages.kate
    mpv
    vlc
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    obs-studio
    cmake
    lxqt.pavucontrol-qt
    flameshot
    krita
    libreoffice-qt6-fresh
  ];
}
