> [!WARNING]
> Do NOT use this configuration without modifying it to use on your own machine or your system may become unbootable

# nixos-config
This is my personal multiple-host NixOS config that I currently use daily for both my main PC and M1 Macbook Pro. It has been my main way of teaching myself functional programming and the Nix programming language. This configuration uses flakes and Home-Manager, and is designed for a balance of both aesthetics and functionality.

## Hosts
| Host                               | Kernel        |
| ---------------------------------- | ------------- |
| nixos-pc                           | x86_64-linux  |
| nixos-macbook                      | aarch64-linux |
| nixos-server (not implemented yet) | x86_64-linux  |

Credit to [nixos-apple-silicon](https://github.com/nix-community/nixos-apple-silicon/) for providing resources for using NixOS on ARM-based Macs

## Components
| Component           | Name                                                                          |
| ------------------- | ----------------------------------------------------------------------------- |
| Window Manager      | [MangoWM](https://github.com/mangowm/mango)                                   |
| Status Bar          | [Waybar](https://github.com/Alexays/Waybar)                                   |
| File Manager        | [Dolphin](https://github.com/KDE/dolphin)                                     |
| Editor              | [Neovim](https://neovim.io/)                                                  |
| Terminal            | [Konsole](https://github.com/KDE/konsole)                                     |
| Shell               | [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) |
| Resource Monitor    | [btop](https://github.com/aristocratos/btop)                                  |
| Web Browser         | [Zen](https://github.com/zen-browser/desktop)                                 |
| Launcher            | [Wofi](https://github.com/SimplyCEO/wofi)                                     |
| Notification Daemon | [Dunst](https://github.com/dunst-project/dunst)                               |
| Boot                | [Systemd-Boot](https://github.com/systemd/systemd)                            |

## Screenshots
![Floating Windows](assets/screenshots/preview1.png)
![Tiled Windows](assets/screenshots/preview2.png)
![Wofi](assets/screenshots/preview3.png)

## To Do List
- ~~Restructure for multiple hosts~~
- Add configuration for host "nixos-server"
- Declaratively install Zen browser with a set of extensions and settings
- Write a more extensive Nixvim configuration
- Convert dotfiles to native Nix where possible
- Cleanup and reorganizing
