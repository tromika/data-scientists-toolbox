#!/bin/sh

echo "Installing Sublime-Tex-3";

sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get -y install sublime-text-installer
sudo mkdir /home/vagrant/.config/sublime-text-3/Packages/User

sudo wget -O "/home/vagrant/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"
