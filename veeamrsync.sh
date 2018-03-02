#!/bin/bash

rsync -au --delete --progress="sshpass -p 'cat .passfile' ssh -o StrictHostKeyChecking=no -l name" /source/path/ destination/path

if [ "$?" -eq "0" ]
then
echo $? > rsynctvresult
else
echo $? > rsynctvresult
fi

date +"%d-%m-%y %T" >> rsynctvresult

