# My dotfiles
> Arch Linux — Hyprland/Wayland, fish, neovim

## New machine setup

1. Clone: `git clone https://github.com/joonascohen/dot.files`
2. Install packages:
   ```
   sudo pacman -S - < pkglist/pkgs-native.txt
   yay -S - < pkglist/pkgs-aur.txt
   ```
3. Deploy configs: `cd dot.files && ./stow.sh`

## Updating the package list

```
pacman -Qqen > pkglist/pkgs-native.txt
pacman -Qqem > pkglist/pkgs-aur.txt
```
