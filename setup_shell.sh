#!/bin/bash

sudo apt-get update
sudo apt-get install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chsh -s /usr/bin/zsh ubuntu
