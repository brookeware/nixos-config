{ inputs, ... }:
{
  imports = [
    ./boot
    ./networking
    ./nvidia
    ./openrgb
    ./steam
    ./sunshine
    ./xdg-portal
    #./zen
  ];
}
