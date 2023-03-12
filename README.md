# ros_noetic_on_jammy
Scripts for installing ROS Noetic on Ubuntu 22.04

## Usage
### Add ROS2 source (ROS1 dropped support for Ubuntu 22.04)
```
sudo apt update && sudo apt install curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
```
### Install dependencies
```
sudo apt-get install python3-rosdep python3-rosinstall-generator python3-vcstools python3-vcstool build-essential python3-numpy
sudo pip3 install -U rosdep rosinstall_generator vcstool
sudo pip3 install --upgrade setuptools
sudo apt install build-essential
sudo apt install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libccd-dev libfltk1.3-dev libqhull-dev libbullet-dev libsdl1.2-dev libsdl-image1.2-dev libpcl-dev gazebo libgazebo-dev
sudo apt install libboost-all-dev uuid-dev python3-nose google-mock libgtest-dev libbz2-dev libgpgme-dev libssl-dev python3-coverage libboost-program-options-dev python3-psutil python3-opengl python3-pygraphviz python3-pydot qt5-qmake sbcl libapr1-dev libaprutil1-dev libboost-regex-dev liblog4cxx-dev python3-matplotlib libpyside2-dev libshiboken2-dev pyqt5-dev python3-pyqt5 python3-pyqt5.qtsvg python3-pyside2.qtsvg python3-sip-dev shiboken2 lm-sensors graphviz python3-paramiko python3-pycryptodome python3-gnupg python3-defusedxml python3-pyqt5.qtopengl libcurl4-openssl-dev libpoco-dev libogre-1.9-dev libassimp-dev libogre-1.9.0v5 libyaml-cpp-dev libgl1-mesa-dev libglu1-mesa-dev libqt5opengl5 libqt5opengl5-dev libopencv-dev python3-opencv python3-pykdl tango-icon-theme liborocos-kdl-dev libtinyxml-dev libtinyxml2-dev liburdfdom-headers-dev python3-numpy python3-empy libboost-filesystem-dev libboost-thread-dev python3-pygraphviz python3-pygraphviz python3-mock libboost-date-time-dev libboost-system-dev liburdfdom-dev libboost-chrono-dev libboost-dev libqt5core5a libqt5gui5 libqt5widgets5 qtbase5-dev  libconsole-bridge-dev liblz4-dev python3-pyqt5.qtwebkit exfatprogs
```
### Clone this repo and run installation script
Please edit packages.txt first if you want to add custom ROS packages. (And update this repo if necessary)
```
git clone https://github.com/tinkerfuroc/ros_noetic_on_jammy
cd ros_noetic_on_jammy
./install.sh
```
### Compile
If all above have succeeded, run:
```
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release
```
and wait a while for all packages to compile.
### Add environment script to .bashrc
```
echo "source ~/ros_catkin_ws/install_isolated/setup.bash" >> ~/.bashrc
```
