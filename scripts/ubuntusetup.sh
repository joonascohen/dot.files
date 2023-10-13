#!/bin/bash
sudo apt install git
git clone github.com/joonascohen/dot.files
sudo apt upgrade && sudo apt update
sudo apt install openssh-server
xargs -a ubuntupkglist.txt sudo apt install
