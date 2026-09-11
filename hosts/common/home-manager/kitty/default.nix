{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      cursor_shape = "beam";
      cursor_trail = 1;
      cursor_trail_start_threshold = 0;
      confirm_os_window_close = 0;
      shell = "/run/current-system/sw/bin/zsh";

      font_family = "Hack Nerd Font Mono";
      font_size = "10.5";

      foreground = "#ecd5d8";
      background = "#142535";
      background_opacity = "0.5";

      selection_foreground = "#000000";
      selection_background = "#ecd5d8";

      color0  = "#142535";
      color1  = "#a56f87";
      color2  = "#d47889";
      color3  = "#e17d8e";
      color4  = "#7a8291";
      color5  = "#af8ea0";
      color6  = "#db99a6";
      color7  = "#ecd5d8";
      color8  = "#a59597";
      color9  = "#a56f87";
      color10 = "#d47889";
      color11 = "#e17d8e";
      color12 = "#7a8291";
      color13 = "#af8ea0";
      color14 = "#db99a6";
      color15 = "#ecd5d8";
    };
  };
}
