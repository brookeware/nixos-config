{ pkgs, ... }:
{
  programs.nixvim = {
      enable = true;
      defaultEditor = true;
      
      colorschemes.base16 = {
        enable = true;
        colorscheme = {
          base00 = "#142535";
          base01 = "#0e1924";
          base02 = "#283645";
          base03 = "#627484";
          base04 = "#798fa3";
          base05 = "#ecd5d8";
          base06 = "#9a9bb3";
          base07 = "#c5c8e6";
          base08 = "#d47889";
          base09 = "#ecab8e";
          base0A = "#f3bca3";
          base0B = "#829ab0";
          base0C = "#747c8a";
          base0D = "#db99a6";
          base0E = "#af8ea0";
          base0F = "#bb838e";
	};
      }; 

      plugins = {
        lualine.enable = true;
        nvim-tree = {
          enable = true;
          openOnSetupFile = true;
	};
        web-devicons.enable = true;
        bufferline.enable = true;
        nvim-web-devicons.enable = true;
        gitsigns-nvim.enable = true;
        vim-suda.enable = true;
	guess-indent.enable = true;
      };

      opts = {
        # Line numbers
        number = true;
        relativenumber = false;

        # Search behavior
        ignorecase = true;
        smartcase = true;
        hlsearch = false;
      };

      autoCmd = [
        
      ];
  };
}
