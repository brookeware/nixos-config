{ ... }:
{
  home.file.".config/mango" = {
    source = ./mango;
    recursive = true;
    force = true;
  };
}
