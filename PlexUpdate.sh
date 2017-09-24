!/bin/bash

echo -n "Please enter the version of Plex: "
read plexversion
echo "Upgrading Plex to latest version"
echo "Downloading file"
sudo wget https://downloads.plex.tv/plex-media-server/$plexversion/plexmediaser_$plexversion""_amd64.deb
echo "File downloaded"
echo "Upgrading Plex"
sudo dkpg -i plexmediaserver_$plexversion""_amd64.deb
echo "Plex Upgraded"
echo "Removing update file"
sudo rm plexmediaserver_$plexversion""_amd64.deb
echo "File removed"
echo "Restarting..."
sudo reboot
