#!/bin/bash
IFS=$'\n'

if [ ! $1 ]
then
        echo "No size given"
        exit 1
fi

# Get needed Size
SIZE=$1
# Get Disks
DISKS=`ls /dev/ | grep sd[a-z]$`
PARTITIONS=`ls /dev/ | grep sd[a-z][1-9]`
LVMPV=`pvscan | awk '{print $2}'| grep sd[a-z]$ | cut -d / -f 3`

for disk in $DISKS
do
error=0
        for partition in $PARTITIONS
        do
                partitiondisk=`echo $partition | cut -c 1-3`
                if [ $disk == $partitiondisk ]
                then
                        error=1
                fi
        done

        for pv in $LVMPV
        do
                if [ $disk == $pv ]
                then
                        error=1
                fi
        done

if [ $error == 0 ]
then
        disksize=`lsblk | grep $disk | awk '{ print $4 }'`
        diskfs=`lsblk -f | grep $disk | awk '{ print $2 }'`
        if [ "$disksize" == $SIZE ] && [ "$diskfs" == "" ]
        then
                USABLEDISK=(${USABLEDISK[@]}  $disk)
        fi
fi
done

for freedisk in ${USABLEDISK[@]}
do
        echo "/dev/$freedisk"
done
