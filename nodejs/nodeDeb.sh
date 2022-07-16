#!/bin/bash

# repo url:- https://github.com/jakbin/deb-scripts

version='v16.16.0'
if [[ -f 'node-'$version'-linux-x64.tar.xz' ]]; then
	echo "file node-$version-linux-x64.tar.xz already exits"
else
	wget 'https://nodejs.org/dist/'$version'/node-'$version'-linux-x64.tar.xz'
fi

tar -xvf node-$version-linux-x64.tar.xz
mkdir -p node-v16/usr
cp -r node-$version-linux-x64/* node-v16/usr
wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/nodejs/control'
mkdir node-v16/DEBIAN
cp control node-v16/DEBIAN/
dpkg -b node-v16
