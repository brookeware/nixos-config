{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
  ];

  # Time zone
  time.timeZone = "US/Central";

  # Locale
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

  # Enable Macbook Touch Bar
  hardware.apple.touchBar = {
    enable = true;
    package = pkgs.tiny-dfr;
  };

  # Window manager
  programs.mango.enable = true;
  
  # Screen locking
  security.pam.services.swaylock = {};

  # Create user
  users.users.brooke = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install system packages
  environment.systemPackages = with pkgs; [
    brightnessctl
    btop
    darkly
    kdePackages.ark
    kdePackages.breeze
    kdePackages.breeze.qt5
    kdePackages.breeze-icons
    kdePackages.dolphin
    kdePackages.konsole
    libreoffice-qt6-fresh
    swaylock
    swayidle
    vim
  ];

  # Set LibreOffice to use QT UI
  environment.sessionVariables = rec {
    SAL_USE_VCLPLUGIN="qt6";
  };

  # Enable services
  services = {
    xserver.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    libinput.enable = true;
    openssh.enable = true;
  };

  # Install fonts
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.hack
  ];

  system.stateVersion = "25.11";
}
