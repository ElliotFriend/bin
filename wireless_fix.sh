#!/bin/bash
# I have this really stupid wireless card in my desktop
# It's a Ralink chipset -- RT3062
# It really doesn't like to work with Linux (Ubuntu-based distros, at least, it appears)
# I've got the file in a safe location, and this is the
# process to make everything work.
# After this is done, you should reboot.
# Your wireless interface will now be called ra0, rather than wlan0

# reinstall linux headers, and some build tools
sudo apt-get install --reinstall linux-headers-$(uname -r) build-essential dkms

# Make sure that we have a directory to work in, and then cd there
if [ -d $HOME/Downloads/drivers ] ; then
    echo "directory exists, moving on"
else
    mkdir $HOME/Downloads/drivers
fi
cd $HOME/Downloads/drivers

# Download the driver file, untar it
wget http://elliot.voris.me/downloads/drivers/rt3062_prepared.tar.gz
mkdir rt3062_prepared
cd rt3062_prepared
tar --strip-components=1 -zxvf ../rt3062_prepared.tar.gz


# Install the newly downloaded driver
make
sudo make install

# Blacklist the old driver, so that we don't get in trouble
echo "blacklist rt2800pci" | sudo tee -a /etc/modprobe.d/blacklist.conf
