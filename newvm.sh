#!/bin/bash

##create/modify/remove a VM with fault tolerance and options##

##change directory to /hdd##
cd /path/to/vm_folder

echo -n "Would you like to run a VM (y/n?)"
read answer4
if echo "$answer4" | grep -iq "^y" ;then
 echo "which VM would you like to run?: "
 read start
 echo "now running $start"
 VBoxManage startvm "$start" --type headless
else
   echo -n "Do you want to create a VM (y/n)?"
   read answer
   if echo "$answer" | grep -iq "^y" ;then
   
    ##ask for inputs to create the vm##
    #name of VM#
     echo "Please enter name of VM: "
     read input_variable
     echo "You entered: $input_variable"

    #memory size#
     echo "please enter memory size (1024 = 1GB)"
     read   mem
     echo "you entered: $mem"
     
     ##disk size##
     echo "please enter size of disk (10000 = 10GB)"
     read disk
     echo "you entered: $disk"

    #Number of IDE Controller#
     echo "Please enter IDE Number"
     read number
     echo "You entered: IDE Controller$number"

    #Path of iso #
     echo "Please enter Path of ISO"
     read path
     echo "You entered: $path"

        echo "$input_variable with $mem RAM $dsik HDD IDE$number ISO located at $path"

    ##enter all the variables and create the vm##
     VBoxManage createvm --name "$input_variable" --register
     VBoxManage modifyvm "$input_variable" --memory $mem --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 p2p1 --vrde on
     VBoxManage createhd --filename $input_variable.vdi --size $disk #10000 = 10GB
     VBoxManage storagectl "$input_variable" --name "IDE Controller$number" --add ide
     VBoxManage storageattach "$input_variable" --storagectl "IDE Controller$number" --port 0 --device 0 --type hdd --medium /home/gareth/vm/$input_variable.vdi
     VBoxManage storageattach "$input_variable" --storagectl "IDE Controller$number" --port 1 --device 0 --type dvddrive --medium $path

   else echo -n "Would you like to modify a VM (y/n)?"
    read answer2
     if echo "$answer2" | grep -iq "^y" ;then
        echo "please enter name of VM"
        read VM
        echo "What would you like to modify?"
        read Mod
        VBoxManage modifyvm "$VM" $Mod
      else  echo -n "Would you like to delete a VM (y/n)?"
      read answer3
          if echo "$answer3" | grep -iq "^y" ;then
             echo "please enter name of VM"
             read VM2
             VBoxManage unregistervm "$VM2" --delete     
            else
             echo waste
       fi
     fi
    echo bye
  fi
fi


        


