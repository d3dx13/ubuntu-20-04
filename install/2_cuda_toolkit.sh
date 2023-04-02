#!/bin/bash

cd /tmp
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update -y
sudo apt-get -y install cuda
cd -

xdg-open https://developer.nvidia.com/login 2>/dev/null
while true; do
    read -p "Вы авторизовались? (y/n) " answer
    case $answer in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Пожалуйста, введите 'y' или 'n'.";;
    esac
done

xdg-open https://developer.nvidia.com/compute/cudnn/secure/8.6.0/local_installers/11.8/cudnn-linux-x86_64-8.6.0.163_cuda11-archive.tar.xz 2>/dev/null
while true; do
    read -p "cuDNN скачался? (y/n) " answer
    case $answer in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Пожалуйста, введите 'y' или 'n'.";;
    esac
done

cd $(xdg-user-dir DOWNLOAD)
tar -xvf cudnn-linux-x86_64-8.6.0.163_cuda11-archive.tar.xz
sudo cp cudnn-linux-x86_64-8.6.0.163_cuda11-archive/include/cudnn*.h /usr/local/cuda/include
sudo cp cudnn-linux-x86_64-8.6.0.163_cuda11-archive/lib/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
echo 'export PATH="/usr/local/cuda/bin:$PATH"' | cat - ~/.bashrc > temp && mv temp ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' | cat - ~/.bashrc > temp && mv temp ~/.bashrc
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"' | cat - ~/.bashrc > temp && mv temp ~/.bashrc
cd -

cd /usr/local/cuda/targets/x86_64-linux/lib
sudo ldconfig

sudo rm libcudnn.so
sudo rm libcudnn.so.8
sudo ln libcudnn.so.8.6.0 libcudnn.so.8
sudo ln libcudnn.so.8 libcudnn.so

sudo rm libcudnn_cnn_infer.so
sudo rm libcudnn_cnn_infer.so.8
sudo ln libcudnn_cnn_infer.so.8.6.0 libcudnn_cnn_infer.so.8
sudo ln libcudnn_cnn_infer.so.8 libcudnn_cnn_infer.so

sudo rm libcudnn_adv_infer.so
sudo rm libcudnn_adv_infer.so.8
sudo ln libcudnn_adv_infer.so.8.6.0 libcudnn_adv_infer.so.8
sudo ln libcudnn_adv_infer.so.8 libcudnn_adv_infer.so

sudo rm libcudnn_ops_infer.so
sudo rm libcudnn_ops_infer.so.8
sudo ln libcudnn_ops_infer.so.8.6.0 libcudnn_ops_infer.so.8
sudo ln libcudnn_ops_infer.so.8 libcudnn_ops_infer.so

sudo rm libcudnn_cnn_train.so
sudo rm libcudnn_cnn_train.so.8
sudo ln libcudnn_cnn_train.so.8.6.0 libcudnn_cnn_train.so.8
sudo ln libcudnn_cnn_train.so.8 libcudnn_cnn_train.so

sudo rm libcudnn_ops_train.so
sudo rm libcudnn_ops_train.so.8
sudo ln libcudnn_ops_train.so.8.6.0 libcudnn_ops_train.so.8
sudo ln libcudnn_ops_train.so.8 libcudnn_ops_train.so

sudo rm libcudnn_adv_train.so
sudo rm libcudnn_adv_train.so.8
sudo ln libcudnn_adv_train.so.8.6.0 libcudnn_adv_train.so.8
sudo ln libcudnn_adv_train.so.8 libcudnn_adv_train.so

sudo ldconfig
cd -