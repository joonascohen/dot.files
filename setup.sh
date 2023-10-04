#!/bin/bash
sudo apt upgrade && sudo apt update
sudo apt install git openssh-server
xargs -a pkglist.txt sudo apt install
