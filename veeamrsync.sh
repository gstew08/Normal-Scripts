#!/bin/bash

rsync -au --delete --progress /spare/share/Backups gareth@192.168.30.122:~/

if [ "$?" -eq "0" ]
then
echo $? > rsyncresult
else
echo $? > rsyncresult
fi

date +"%d-%m-%y %T" > backuprsyncdate
