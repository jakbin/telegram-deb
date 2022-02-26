#!/bin/bash

# repo url:- https://github.com/jakbin/deb-scripts
wget 'https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz'
tar -xvf node-v16.14.0-linux-x64.tar.xz
mkdir -p node-v16/usr
cp -r node-v16.14.0-linux-x64/* node-v16/usr
wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/nodejs/control'
mkdir node-v16/DEBIAN
cp control node-v16/DEBIAN/
dpkg -b node-v16