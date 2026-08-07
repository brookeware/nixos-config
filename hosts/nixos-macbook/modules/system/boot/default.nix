{ config, ... }:
{
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };

  boot.loader.efi.canTouchEfiVariables = false;
  boot.kernel.sysctl."vm.mmap_rnd_bits" = 31;

  boot.extraModprobeConfig = ''
    options hid_apple iso_layout=0
  '';
}
