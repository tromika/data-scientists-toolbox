#!/bin/sh

echo "Installing RStudio Desktop";
sudo apt-get install gdebi-core
sudo apt-get install libapparmor1 
sudo apt-get install libjpeg62 
wget http://download1.rstudio.org/rstudio-0.98.1025-amd64.deb
sudo dpkg -i rstudio-0.98.1025-amd64.deb