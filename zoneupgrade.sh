#!/usr/bin/env sh

zones=`vmadm list | grep ' OS ' | cut -c 1-36`

screen -dmS "zoneUpgrade"

count=0
for uuid in $zones; do
    screen -S "zoneUpgrade" -X screen
    screen -S "zoneUpgrade" -p $count -X stuff "zlogin $uuid;$(printf \\r)"
    sleep .25
    screen -S "zoneUpgrade" -p $count -X stuff "pkgin up; pkgin fug;$(printf \\r)"
    count=$((count+1))
done
