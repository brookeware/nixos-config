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
    source = ../../../assets/wallpapers;
    recursive = true;
  }

  home.packages = with pkgs; [
    jq
    btop
    (discord.override {
      withVencord = true;
    })
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

    # Temporary workaround until the Lutris build issue is fixed
    (pkgs.lutris.override {
      # Intercept buildFHSEnv to modify target packages
      buildFHSEnv = args: pkgs.buildFHSEnv (args // {
        multiPkgs = envPkgs:
          let
            # Fetch original package list
            originalPkgs = args.multiPkgs envPkgs;

            # Disable tests for openldap
            customLdap = envPkgs.openldap.overrideAttrs (_: { doCheck = false; });
          in
          # Replace broken openldap with the custom one
          builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [ customLdap ];
      });
    })
  ];

  wayland.windowManager.mango = {
    enable = true;
  };

  programs.zen-browser.enable = true;

  home.stateVersion = "26.05";
}

