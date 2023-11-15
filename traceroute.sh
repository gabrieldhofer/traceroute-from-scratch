#!/bin/bash

TTL=1
HOST="${1}"
while true;
do
    RESPONSE=$(ping -c 1 -t "${TTL}" "${HOST}")
    IP=$(
        echo "${RESPONSE}" | 
        grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}) icmp_seq' | 
        grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
    )
    if [[ $RESPONSE == *"Time to live"* ]]; then
        echo "Hop #${TTL}: IP=${IP}";
    else
        echo "Hop #${TTL}:"
        ping -c 1 "${HOST}"
        printf "\n\n"
        printf "*******************************************************************\n"
        printf "*                           COMPARE                               *\n"
        printf "*******************************************************************\n"
        printf "\n\n"
        traceroute "${HOST}"
        break
    fi
    sleep 0.5
    TTL=$((TTL + 1))
done
