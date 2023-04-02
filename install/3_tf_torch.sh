#!/bin/bash

cd /tmp

pip install tensorflow==2.12.0

pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

cd -
