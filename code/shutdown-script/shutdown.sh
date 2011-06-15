#!/bin/bash

gxmessage -center -buttons "Cancel:42,Close session:0,Reboot:2,Shutdown:3" -default "Close session" -timeout 60 What do you want ?
retval=$?
if [ $retval -eq 0 ] ; then
    pkill xmonad;
elif [ $retval -eq 2 ] ; then
    sudo shutdown -r now;
elif [ $retval -eq 3 ] ; then
    sudo shutdown -h now
#else
    #echo "do nothing";
fi

