#!/bin/bash

TTL=1
while true;
do
  RESPONSE=$(ping -c 1 -t "${TTL}" google.com)
  IP=$(
    echo "${RESPONSE}" | 
    grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}) icmp_seq' | 
    grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
  if [[ $RESPONSE == *"Time to live"* ]]; then
    echo "Hop #${TTL}: IP=${IP}";
  else
    echo "DONE"
    break
  fi
  sleep 1
  TTL=$((TTL + 1))
done
