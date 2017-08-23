#!/bin/bash
echo
read -r -p "Warning! Are you sure to migrate [102]? [y/n]: " response1
response=$response1

if [[ $response =~ ^(yes|y)$ ]]
then
    echo
    echo "Migrate [102] From pve01 to pve02(me)..."
    echo
    pvecm expected 1
    
    ## copy vm config from pve01 to pve02, then you can start it.
    mv /etc/pve/nodes/pve01/qemu-server/102.conf \
    /etc/pve/nodes/pve02/qemu-server/

    # del repl conf, u need setting again.    
    rm /etc/pve/replication.cfg

    echo
else
    echo
    echo "Cancel."
    echo
fi