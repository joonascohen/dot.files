#!/usr/bin/env bash
# Run from the dot.files repo root to deploy all configs via stow.
# Usage: ./stow.sh          (deploy)
#        ./stow.sh -D        (undeploy)

set -euo pipefail

ACTION=${1:-}

PACKAGES=(
    alacritty
    cava
    doom
    fish
    hypr
    kitty
    matugen
    mpd
    ncmpcpp
    nvim
    rofi
    starfish
    swaync
    tmux
    wallpapers
    yazi
)

for pkg in "${PACKAGES[@]}"; do
    echo "stow $ACTION $pkg"
    stow --target="$HOME" $ACTION "$pkg"
done

echo "done"
