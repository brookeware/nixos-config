{ config, pkgs, ... }:
{
  # Time zone
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable MangoWM
   programs.mango.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.brookolli = {
    isNormalUser = true;
    description = "brookolli";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Environment variables
  environment.sessionVariables = rec {
    NIXOS_OZONE_WL="1";
    WLR_DRM_NO_ATOMIC=1;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Install system packages
  environment.systemPackages = with pkgs; [
    btop
    cudatoolkit
    darkly
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.konsole
    kdePackages.breeze
    kdePackages.breeze.qt5
    kdePackages.breeze-icons 
    vim 
  ];

  services = {
    xserver.enable = true;
    openssh.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    flatpak.enable = true;
  };

  # Enable graphics 
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  system.stateVersion = "25.05";
}
