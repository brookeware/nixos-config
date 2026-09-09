{ ... }:
{
  home.file.".config/mango/monitors.conf" = {
    source = ./monitors.conf;
    force = true;
  };
}
