#!/bin/bash
sudo apt-get update
sudo apt-get install fluidsynth
sudo apt-get install python3 python3-dev python3-pip

# Installing Conda
if [[ ! -e "conda_install.sh" ]];
then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda_install.sh
	chmod +x conda_install.sh
    bash conda_install.sh
fi
source ~/.zshrc
source ~/.bashrc

conda create -n cuda python=3.6 anaconda numpy scipy matplotlib
source activate cuda

conda install pytorch torchvision cuda80 -c soumith
pip install tqdm librosa pretty_midi

