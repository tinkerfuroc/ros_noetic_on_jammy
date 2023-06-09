#!/bin/bash
INPUT="${1:-packages.txt}"
# import all repos
mkdir -p src
while read p; do
	echo "importing $p"
	rosinstall_generator $p --rosdistro noetic --deps --tar | vcs import src
done < $INPUT
# patch log4cxx
sudo patch -N -r - /usr/include/log4cxx/boost-std-configuration.h boost-std-configuration.patch > /dev/null
# checkout rosconsole special branch
[ ! -f noetic-2204.tar.gz ] && wget https://github.com/tinkerfuroc/rosconsole/archive/refs/tags/noetic-2204.tar.gz
tar zxf noetic-2204.tar.gz
cp -r rosconsole-noetic-2204/* src/rosconsole/
rm -rf rosconsole-noetic-2204

