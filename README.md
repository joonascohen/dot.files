# My dotfiles
> Mainly used for Arch Linux, but can be used for Ubuntu/Pop as well

Once Arch Linux is installed:
1. Pull this repo with `git clone https://github.com/joonascohen/dot.files`
2. Once finished, download packages with `sudo pacman -S <- archpkglist.txt`
3. Stow dotfiles to relevant folders with `stow *`
4. Install oh-my-zsh and relevant plugins
5. Make sure the correct LSP Servers are installed through mason in the Lazyvim configuration
- Python: pyright
- Markdown: marksman

# TODO
- Find the transparency options for hiding active window
  - Picom
