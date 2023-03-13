# ros_noetic_on_jammy
Scripts for installing ROS Noetic on Ubuntu 22.04. Tested with default gcc-11.

## Usage
### Add ROS2 source (ROS1 dropped support for Ubuntu 22.04)
```
sudo apt-get update && sudo apt-get install -y curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt-get/sources.list.d/ros2.list > /dev/null
sudo apt-get update
```
### Install basic dependencies
```
sudo apt-get install -y python3-rosdep python3-rosinstall-generator python3-vcstools python3-vcstool build-essential python3-numpy
sudo pip3 install -U rosdep rosinstall_generator vcstool
sudo pip3 install --upgrade setuptools
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
```
### Clone this repo and run installation script
Please edit packages.txt first if you want to customize ROS packages. (And update this repo if necessary) You may also run `./install.sh <your_packages.txt>` to import from a custom package list.
```
git clone https://github.com/tinkerfuroc/ros_noetic_on_jammy
cd ros_noetic_on_jammy
./install.sh
```
You should watch carefully for any errors in this stage due to network reason. If any error occurs, simply run install.sh again.

**You may continue to the next step to install build dependencies in another terminal parallel to this (and hopefully save some time).**
### Install build dependencies
```
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libccd-dev libfltk1.3-dev libqhull-dev libbullet-dev libsdl1.2-dev libsdl-image1.2-dev libpcl-dev gazebo libgazebo-dev
sudo apt-get install -y libboost-all-dev uuid-dev python3-nose google-mock libgtest-dev libbz2-dev libgpgme-dev libssl-dev python3-coverage libboost-program-options-dev python3-psutil python3-opengl python3-pygraphviz python3-pydot qt5-qmake sbcl libapr1-dev libaprutil1-dev libboost-regex-dev liblog4cxx-dev python3-matplotlib libpyside2-dev libshiboken2-dev pyqt5-dev python3-pyqt5 python3-pyqt5.qtsvg python3-pyside2.qtsvg python3-sip-dev shiboken2 lm-sensors graphviz python3-paramiko python3-pycryptodome python3-gnupg python3-defusedxml python3-pyqt5.qtopengl libcurl4-openssl-dev libpoco-dev libogre-1.9-dev libassimp-dev libogre-1.9.0v5 libyaml-cpp-dev libgl1-mesa-dev libglu1-mesa-dev libqt5opengl5 libqt5opengl5-dev libopencv-dev python3-opencv python3-pykdl tango-icon-theme liborocos-kdl-dev libtinyxml-dev libtinyxml2-dev liburdfdom-headers-dev python3-numpy python3-empy libboost-filesystem-dev libboost-thread-dev python3-pygraphviz python3-pygraphviz python3-mock libboost-date-time-dev libboost-system-dev liburdfdom-dev libboost-chrono-dev libboost-dev libqt5core5a libqt5gui5 libqt5widgets5 qtbase5-dev  libconsole-bridge-dev liblz4-dev python3-pyqt5.qtwebkit exfatprogs
```
### Compile
```
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release
```
and wait a while for all packages to compile. If you add some packages later and want to build incrementally, use:
```
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --only-pkg-with-deps <package 1> <package 2> ...
```
Some packages may consume >16G RAM to build in parallel. If you run into `Killed signal terminated program cc1plus` errors, try increasing SWAP partition size.
### Add environment script with terminal startup
bash:
```
echo "source ~/ros_noetic_on_jammy/install_isolated/setup.bash" >> ~/.bashrc
```
zsh:
```
echo "source ~/ros_noetic_on_jammy/install_isolated/setup.zsh" >> ~/.zshrc
```
