#!/bin/bash
rand=$RANDOM
echo -n "$rand "
sleep $((RANDOM%1)).$((RANDOM % 10))
echo -n "$rand" | md5sum | head -c 16
echo " $*"
