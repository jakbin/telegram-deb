#!/bin/bash

# repo url:- https://github.com/jakbin/deb-scripts

version='4.5.3'

if [ -f 'tsetup.'$version'.tar.xz' ]; then
	echo "file tsetup.$version.tar.xz already exits"
else
	wget 'https://github.com/telegramdesktop/tdesktop/releases/download/v'$version'/tsetup.'$version'.tar.xz'
fi

tar -xvf tsetup.$version.tar.xz
mkdir -p telegram-$version/usr/bin
cp -r Telegram/Telegram telegram-$version/usr/bin
mv telegram-$version/usr/bin/Telegram telegram-$version/usr/bin/telegram

if [ -f 'share.zip' ]; then
	echo "share.zip file already exits"
else
	wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/telegram/share.zip'
fi

unzip share.zip
cp -R share telegram-$version/usr/

if [ -f 'control' ]; then
	echo "control file already exits"
else
	wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/telegram/control'
fi

mkdir telegram-$version/DEBIAN
cp control telegram-$version/DEBIAN/
dpkg -b telegram-$version
rm -rf telegram-$version
rm -rf Telegram
rm -rf share
