#!/bin/bash

cd /tmp

sudo apt install -y python3-pip python3-dev

pip install --upgrade pip

pip install --upgrade --force-reinstall tensorflow==2.12.0

pip install --upgrade --force-reinstall torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

pip install --upgrade --force-reinstall jupyter

cd -
