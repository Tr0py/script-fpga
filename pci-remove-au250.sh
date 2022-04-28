#!/bin/bash

pci_remove() {
    VENDOR=$1
    DEVICE=$2
    PCIEDEVICE=`lspci -d $VENDOR:$DEVICE | sed -e "s/ .*//"`
    echo "hotplugging device: $PCIEDEVICE"
    # remove device, if it exists
    if [ -n "$PCIEDEVICE" ]; then
        sudo sh -c "echo 1 >/sys/bus/pci/devices/0000:$PCIEDEVICE/remove"
    fi
}

pci_remove 10EE 5004
pci_remove 10EE 5005
