#!/bin/bash

cd /tmp

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y build-essential cmake pkg-config unzip yasm git checkinstall

sudo apt install -y libjpeg-dev libpng-dev libtiff-dev

sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libavresample-dev
sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install -y libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt install -y libfaac-dev libmp3lame-dev libvorbis-dev

sudo apt install -y libopencore-amrnb-dev libopencore-amrwb-dev

sudo apt-get install -y libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils
cd -
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd -

# sudo cp ../modules/videoio/include/opencv2/videoio/videoio_c.h /usr/include/x86_64-linux-gnu/sys
# sudo ln /usr/include/x86_64-linux-gnu/sys/videoio_c.h /usr/include/x86_64-linux-gnu/sys/videoio.h


sudo apt-get install -y libgtk-3-dev

sudo apt-get install -y python3-numpy
sudo apt-get install -y python3-dev python3-pip
sudo apt install -y python3-testresources

sudo apt-get install -y libtbb-dev

sudo apt-get install -y libatlas-base-dev gfortran

sudo apt-get install -y libprotobuf-dev protobuf-compiler
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

sudo apt-get install -y opencl-headers

sudo apt-get install -y libgtkglext1 libgtkglext1-dev

cd /tmp
rm -rf opencv*
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.6.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.6.0.zip
unzip opencv.zip
unzip opencv_contrib.zip

cd opencv-4.6.0
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_C_COMPILER=/usr/bin/gcc-9 \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D INSTALL_C_EXAMPLES=ON \
-D CUDA_nppi_LIBRARY=True \
-D WITH_TBB=ON \
-D BUILD_TIFF=ON \
-D WITH_FFMPEG=ON \
-D BUILD_TBB=ON \
-D WITH_CUDA=ON \
-D BUILD_opencv_cudacodec=OFF \
-D ENABLE_FAST_MATH=1 \
-D CUDA_FAST_MATH=1 \
-D WITH_CUBLAS=1 \
-D WITH_QT=OFF \
-D WITH_OPENGL=OFF \
-D WITH_GSTREAMER=ON \
-D WITH_V4L=ON \
-D WITH_LIBV4L=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_PC_FILE_NAME=opencv.pc \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_PYTHON3_INSTALL_PATH=/usr/lib/python3/dist-packages \
-D PYTHON_EXECUTABLE=/usr/bin/python3 \
-D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-4.6.0/modules \
-D BUILD_EXAMPLES=ON \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=ON \
-D CUDNN_LIBRARY=/usr/local/cuda/lib64/libcudnn.so.8.6.0 \
-D CUDNN_INCLUDE_DIR=/usr/local/cuda/include  \
-D BUILD_NEW_PYTHON_SUPPORT=ON \
-D BUILD_opencv_python3=TRUE \
-D CUDNN_VERSION=8.6.0 \
-D CUDA_ARCH_BIN=8.6 ..

NUM_JOBS=$(nproc)
make -j$NUM_JOBS
sudo make -j$NUM_JOBS install
sudo ldconfig

cd -
