{ ... }:
{
  home.file.".config/konsolerc" = {
    source = ./konsolerc;
    force = true;
  };

  home.file.".local/share/konsole/brooke.profile" = {
    source = ./brooke.profile;
    force = true;
  };

  home.file.".local/share/konsole/brooke-colors.colorscheme" = {
    source = ./brooke-colors.colorscheme;
    force = true;
  };
}
