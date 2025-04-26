#!/bin/bash


echo Downloading dotnet SDK for linux...

mkdir dotnet.AppDir
cd dotnet.AppDir
wget https://builds.dotnet.microsoft.com/dotnet/Sdk/$1/dotnet-sdk-$1-linux$2.tar.gz
tar -xzvf dotnet-sdk-$1-linux$2.tar.gz
rm dotnet-sdk-$1-linux$2.tar.gz
chmod +x ./dotnet
mkdir -p usr/bin
cd usr/bin
ln -s ../../dotnet .
cd ../../../
wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage

cp AppRun dotnet.AppDir
chmod +x dotnet.AppDir/AppRun
cat /dev/null > None.png
cp None.png dotnet.AppDir

echo "[Desktop Entry]
Name=dotnet
Type=Application
Exec=dotnet
Categories=Utility
Icon=None
Comment= Dotnet $1 SDK and Runtime
Path=
Terminal=false
StartupNotify=false" > dotnet.desktop

cp dotnet.desktop dotnet.AppDir

ARCH=x86_64 ./appimagetool-x86_64.AppImage dotnet.AppDir

