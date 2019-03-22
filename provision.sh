#!/bin/bash 

TARGET_USER="vagrant"
HOME_DIR="/home/${TARGET_USER}"

# Go to default user's home directory.
cd "${HOME_DIR}"

# Install desktop system.
add-apt-repository -y ppa:gnome3-team/gnome3
apt-get update -y
apt-get install -y gnome-shell ubuntu-gnome-desktop
apt-get upgrade -y

# Install guest additions.
wget https://download.virtualbox.org/virtualbox/6.0.4/VBoxGuestAdditions_6.0.4.iso
mkdir /media/GuestAdditionsISO
mount -o loop VBoxGuestAdditions_6.0.4.iso /media/GuestAdditionsISO
/media/GuestAdditionsISO/VBoxLinuxAdditions.run -- --force

# Install build tools.
apt-get install -y make
apt-get install -y gcc

# Install Isabelle/HOL.
wget http://isabelle.in.tum.de/dist/Isabelle2018_app.tar.gz
tar -xzf ./Isabelle2018_app.tar.gz
rm ./Isabelle2018_app.tar.gz
mv Isabelle2018 isabelle-hol
ln -s ${HOME_DIR}/isabelle-hol/bin/isabelle /usr/bin/isabelle

# Install Isabelle/UTP.
wget http://github.com/isabelle-utp/utp-main/archive/master.tar.gz
tar -xzf ./master.tar.gz
rm ./master.tar.gz
mv utp-main-master isabelle-utp
cp /vagrant/run_isabelle_utp_bare.sh ./run_isabelle_utp_bare.sh
echo "${HOME_DIR}/isabelle-utp/bin/utp-jedit UTP" >> ./run_isabelle_utp_bare.sh
ln -s ${HOME_DIR}/run_isabelle_utp_bare.sh /usr/bin/isabelle-utp-ide

# Install TeXLive.
apt-get install -y texlive-full

# Give ownership to default user.
chown ${TARGET_USER}:${TARGET_USER} -R ${HOME_DIR}
