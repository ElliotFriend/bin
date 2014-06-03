#!/bin/bash

# I have this really stupid wireless card in my desktop
# It's a Ralink chipset -- RT3062
# It really doesn't like to work with Linux (Ubuntu-based distros,
# at least, it appears)
# I've got the file in a safe location, and this is the
# process to make everything work.
# After this is done, you should reboot.
# Your wireless interface will now be called ra0, rather than wlan0
# Keep your source directory, after a kernel update, you'll have to recompile
# and reinstall the driver

## If you're having trouble downloading the driver from below, follow these
## instructions:
###############
## Download the driver package from the Ralink website:
##	http://www.mediatek.com/_en/07_downloads/01-1_windowsDetail.php?sn=5019
## Extract the package into $HOME/drivers/rt3062_prepared
## and change into the new directory
## Modify os/linux/config.mk and set:
##	HAS_WPA_SUPPLICANT=y
##	HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y
## Save and follow along with the rest of the script


DRIVER_DIR=$HOME/drivers
SOURCE_DIR=$DRIVER_DIR/rt3062_prepared

# Make sure that we have a directory to work in, and then cd there
if [ -d $DRIVER_DIR ] ; then
    echo "drivers directory exists"
else
    echo "making drivers directory"
    mkdir $DRIVER_DIR
fi
echo "changing to drivers directory"
cd $DRIVER_DIR

# If the source directory doesn't exist, download the file and extract it
if [ -d $SOURCE_DIR ] ; then
    # otherwise, just cd there
    echo "source directory exists"
    echo "changing to source directory"
    cd $SOURCE_DIR
    echo "re-installing"
    sudo make clean
    sudo make
    sudo make install
else
    echo "downloading source archive"
    wget http://download.elliotfriend.com/drivers/rt3062_prepared.tar.gz
    mkdir $SOURCE_DIR
    echo "changing to source directory"
    cd $SOURCE_DIR
    echo "extracting driver source code"
    tar --strip-components=1 -zxvf ../rt3062_prepared.tar.gz
    echo "installing"
    # make and install the driver
    sudo make
    sudo make install
fi

# If the old driver is not blacklisted, do it
if grep -q "blacklist rt2800pci" /etc/modprobe.d/blacklist.conf
then
    echo "old driver already blacklisted"
else
    sudo echo "blacklist rt2800pci" | sudo tee -a /etc/modprobe.d/blacklist.conf
fi

# Modprobe the new driver
echo "probing for the new driver"
sudo modprobe rt3562sta

echo "all done. enjoy your internets"
