#!/bin/bash

# Install dependencies and change shell to zsh
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install linux-image-extra-`uname -r`
sudo apt-get install nvidia-cuda-toolkit

# Download driver which is currently supported by amazon
if [[ ! -e "nvidia_driver.run" ]];
then
	echo "Downloading NVIDIA 367.27 driver"
	wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.27/NVIDIA-Linux-x86_64-367.27.run -O nvidia_driver.run
	echo "Installing NVIDIA 367.27 driver"
	sudo chmod +x nvidia_driver.run
	sudo sh nvidia_driver.run
else
	echo "nvidia_driver.run already exists"
fi

# Download CUDA 8.0
if [[ ! -e "cuda_8.0.run" ]];
then
	echo "Downloading CUDA"
	wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run -O cuda_8.0.run
	echo "Installing CUDA"
	sudo chmod +x cuda_8.0.run
	mkdir -p extracts
	sudo sh cuda_8.0.run --extract=`pwd`/extracts
	sudo chmod +x ./extracts/*
	sudo sh ./extracts/cuda-linux64-rel-8.0.61-21551265.run
else
	echo "cuda_8.0.run already exists"
fi

# Install CUDNN
echo "Installing CUDNN"
tar xf cudnn-8.0.tgz
sudo cp cuda/lib64/* /usr/local/cuda/lib64/
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/
echo -e "export CUDA_HOME=/usr/local/cuda\nexport PATH=\$PATH:\$CUDA_HOME/bin\nexport LD_LIBRARY_PATH=\$LD_LINKER_PATH:\$CUDA_HOME/lib64" | tee -a ~/.bashrc ~/.zshrc

# Cleanup
echo "Cleaning up..."
sudo rm -rf cuda cuda_8.0.run extracts nvidia_driver.run
