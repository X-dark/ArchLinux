#!/bin/bash

####
#
# quick script that takes all rpm in the current directory
# and delete the smaller version when several versions of 
# a same package exists
#
# Slow and not error-less
#
####

for file in *.rpm ; do
    regex='(.*)-[^-]+-[^-]+\.rpm'
    if [[ $file =~ $regex ]] ; then
        pkg_name=${BASH_REMATCH[1]}
        regex_same="$pkg_name-[^-]+-[^-]+\.rpm"
        for same_pkg in *.rpm ; do
            if [[ $same_pkg =~ $regex_same && `vercmp $file $same_pkg` -gt 0 ]] ; then
                rm $same_pkg
                echo $same_pkg removed
            fi
        done
    fi
done
