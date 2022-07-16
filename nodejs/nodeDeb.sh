#!/bin/bash

# repo url:- https://github.com/jakbin/deb-scripts

version='v16.16.0'

if [ -f 'node-'$version'-linux-x64.tar.xz' ]; then
	echo "file node-$version-linux-x64.tar.xz already exits"
else
	wget 'https://nodejs.org/dist/'$version'/node-'$version'-linux-x64.tar.xz'
fi

tar -xvf node-$version-linux-x64.tar.xz
mkdir -p node-$version/usr
cp -r node-$version-linux-x64/* node-$version/usr

rm node-$version/usr/LICENSE
rm node-$version/usr/README.md

if [ -f 'control' ]; then
	echo "control file already exits"
else
	wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/nodejs/control'
fi

mkdir node-v16/DEBIAN
cp control node-v16/DEBIAN/
dpkg -b node-v16
