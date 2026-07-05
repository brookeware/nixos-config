{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  # Time zone
  time.timeZone = "America/Chicago";

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

  # Users
  users.users = {
    "brooke" = {
      isNormalUser = true;
      description = "brooke";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        git
      ];
    };

    "wawacreate" = {
      isNormalUser = true;
      description = "wawacreate";
      extraGroups = [ 
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        openjdk21
      ];
    };
  };

  # Swap file
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GiB
  }];

  # Enable nginx
  services.nginx = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install system packages
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    fastfetch
    tmux
    btop
  ];
 
  # Enable Jellyfin server
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  system.stateVersion = "26.05";
}
