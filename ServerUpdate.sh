#!/bin/bash

echo "Getting Update"
sudo apt-get update
echo "Updated"
echo "Getting Upgrade"
sudo apt-get -y upgrade
echo "Upgraded"
echo "Getting Dist-Upgrade"
sudo apt-get -y dist-upgrade
echo "Dist Upgraded"
echo "Powering Off VM To Prevent VM Corruption On Reboot"
sudo VBoxManage controlvm "PC1" poweroff
echo "VM Powered Off"
echo "Rebooting Server"
echo "Goodbye!"
sudo reboot
