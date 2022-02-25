#!/bin/bash

wget 'https://github.com/telegramdesktop/tdesktop/releases/download/v3.5.2/tsetup.3.5.2.tar.xz'

tar -xvf tsetup.3.5.2.tar.xz

mkdir -p telegram/usr/bin

cp -r Telegram/Telegram telegram/usr/bin
mv telegram/usr/bin/Telegram telegram/usr/bin/telegram

wget 'https://raw.githubusercontent.com/jakbin/deb-scripts/main/telegram/control'

mkdir telegram/DEBIAN

cp control telegram/DEBIAN/

dpkg -b telegram