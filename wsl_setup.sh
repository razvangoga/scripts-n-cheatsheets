#! /bin/sh

#sudo

apt-get update
apt-get upgrade

#make symlink to work folder
ln -s /mnt/d/_work/ ~/w

#misc tools
apt-get install git

#python3
apt-get install python3
apt-get install python3-pip
pip3 install --upgrade pip
pip3 install pip