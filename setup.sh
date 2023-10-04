#!/bin/bash
sudo apt upgrade && sudo apt update
sudo apt install git
git clone https://github.com/joonascohen/dot.files.github
cd dot.files
xargs -a pkglist.txt sudo apt install
