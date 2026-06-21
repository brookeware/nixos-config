{ config, pkgs, lib, inputs, ... }:

{
  home.username = "brookolli";
  home.homeDirectory = "/home/brookolli";

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

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

