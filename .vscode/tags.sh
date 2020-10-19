#!/bin/bash
clear
echo "Starting Script"
git tag -l | while read t; do
    n=$(echo $t | sed "s/^\([0-9]\)/v\1/g")
    # echo $t -- $n
    if [[ "$n" != "$t" ]]; then
        echo "Does not Match $t -- $n"
        git tag $n $t
        git tag -d $t
    fi
done
echo "Do you wish to update refs/tags/*"
select yn in "Yes" "No"; do
    case $yn in
        Yes) git push --tags --prune origin refs/tags/*; break;;
        No) exit;;
    esac
done
