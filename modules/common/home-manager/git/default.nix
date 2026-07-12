{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "brookolli";
      email = "brookolli@proton.me";
    };
  };
}
