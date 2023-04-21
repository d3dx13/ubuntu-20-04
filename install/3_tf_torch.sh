#!/bin/bash

cd /tmp

pip3 install --upgrade --force-reinstall tensorflow==2.12.0

pip3 install --upgrade --force-reinstall torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

cd -
