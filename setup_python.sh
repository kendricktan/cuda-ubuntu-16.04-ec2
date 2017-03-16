#!/bin/bash
sudo apt-get update
sudo apt-get install python3 python3-dev python3-pip

# Installing Conda
if [[ ! -e "conda_install.sh" ]];
then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda_install.sh
	sudo chmod +x conda_install.sh
    sudo bash conda_install.sh
fi

# Create
conda create -n cuda python=3.6 anaconda numpy scipy matplotlib
conda install -c soumith pytorch=0.1.10
