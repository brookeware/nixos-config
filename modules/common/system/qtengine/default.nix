{ config, ... }:
{
  environment.sessionVariables = rec {
    QT_STYLE_OVERRIDE="darkly";
  };

  programs.qtengine = {
    enable = true;
  
    config = {
      theme = {
        colorScheme = ./brooke.colors;
        iconTheme = "breeze-dark";
        style = "darkly";

        font = {
          family = "Sans Serif";
          size = 10;
          weight = -1;
        };

        fontFixed = {
          family = "Sans Serif";
          size = 10;
          weight = -1;
        };
      };

      misc = {
        singleClickActivate = false;
        menusHaveIcons = true;
        shortcutsForContextMenus = true;
      };
    };
  };
}
