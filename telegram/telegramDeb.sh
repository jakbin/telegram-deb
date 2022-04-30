#!/bin/bash

# repo url:- https://github.com/jakbin/deb-scripts

version='3.7.3'
if [[ -f 'tsetup.'$version'.tar.xz' ]]; then
	echo "file tsetup.$version.tar.xz already exits"
else
	wget 'https://github.com/telegramdesktop/tdesktop/releases/download/v'$version'/tsetup.'$version'.tar.xz'
fi

tar -xvf tsetup.$version.tar.xz
mkdir -p telegram/usr/bin
cp -r Telegram/Telegram telegram/usr/bin
mv telegram/usr/bin/Telegram telegram/usr/bin/telegram
if [[ -f 'share.zip' ]]; then
	echo "share.zip file already exits"
else
	wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/telegram/share.zip'
fi
unzip share.zip
cp -R share telegram/usr/
if [[ -f 'control' ]]; then
	echo "control file already exits"
else
	wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/telegram/control'
fi
mkdir telegram/DEBIAN
cp control telegram/DEBIAN/
dpkg -b telegram