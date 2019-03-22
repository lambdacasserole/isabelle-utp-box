#!/bin/bash 

# Install desktop system.
add-apt-repository -y ppa:gnome3-team/gnome3
apt-get update -y
apt-get install -y gnome-shell ubuntu-gnome-desktop
apt-get upgrade -y

# Install guest additions.
wget https://download.virtualbox.org/virtualbox/6.0.4/VBoxGuestAdditions_6.0.4.iso
sudo mkdir /media/GuestAdditionsISO
sudo mount -o loop VBoxGuestAdditions_6.0.4.iso /media/GuestAdditionsISO

# Install build tools.
apt-get install -y make
apt-get install -y gcc

# Install Isabelle
wget http://isabelle.in.tum.de/dist/Isabelle2018_app.tar.gz
tar -xzf Isabelle2018_app.tar.gz

# Install UTP
wget http://github.com/isabelle-utp/utp-main/archive/master.tar.gz
tar -xzf master.tar.gz

# Install TeXLive
apt-get install -y texlive-full
