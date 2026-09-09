{ ... }:
{
  home.file.".config/noctalia/noctalia-config.toml" = {
    source = ./noctalia-config.toml;
    force = true;
  };

  home.file.".config/noctalia/notification.wav" = {
    source = ./notification.wav;
    force = true;
  };

  home.file.".config/noctalia/volume.wav" = {
    source = ./volume.wav;
    force = true;
  };

  home.file.".config/noctalia/palettes" = {
    source = ./palettes;
    force = true;
    recursive = true;
  };

  home.file.".local/state/noctalia/.setup-complete" = {
    source = ./.setup-complete;
    force = true;
  };
}
