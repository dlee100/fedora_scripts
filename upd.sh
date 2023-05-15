#!/usr/bin/env bash

all() {
    echo "Receiving signing keys from repos and updating packages ...";
    sudo dnf upgrade --refresh; 
    echo "DNF is up to date."; 
    sleep 2
    echo "Updating FLATPAK packages ..."; 
    sudo flatpak update; 
    echo "FLATPAK is up to date."
    sleep 2
    echo "Updating Firmware"
    sudo fwupdmgr get-devices 
    sudo fwupdmgr refresh --force 
    sudo fwupdmgr get-updates 
    sudo fwupdmgr update
    echo "Firmware is up to date."
    sleep 1
    echo "System updates completed."
}

allForce() {
    echo "Force updating DNF packages ...";
    sudo dnf update -y ; 
    echo "DNF is up to date FORCEFULLY.";
    echo "Force updating FLATPAK packages ..."; 
    sudo flatpak update -y ; 
    echo "FLATPAK is up to date FORCEFULLY."
    echo "Updating Firmware"
    sudo fwupdmgr get-devices 
    sudo fwupdmgr refresh --force 
    sudo fwupdmgr get-updates 
    sudo fwupdmgr update
    echo "Firmware is up to date."
    echo "Force update complete."
}

dnf() {
    sudo dnf update;
}

dnfForce() {
    sudo dnf update -y;
}

flatpak() {
    sudo flatpak update;
}

flatpakForce() {
    sudo flatpak update -y;
}

case "${1}" in
    all)
        all
    ;;
    all-force)
        allForce
    ;;
    dnf)
        dnf
    ;;
    dnf-force)
        dnfForce
    ;;
    flatpak)
        flatpak
    ;;
    flatpak-force)
        flatpakForce
    ;;
esac

