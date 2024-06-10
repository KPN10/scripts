#!/bin/bash

BASEIP='172.17.0';
rm -f ntpfound.log;
touch ntpfound.log;

for (( c=1; c<=254; c++ ))
do
   echo "Checking $BASEIP.$c";
   /usr/sbin/ntpdate -q $BASEIP.$c >> ntpcheck.log 2>&1
done

cat ntpcheck.log | grep 'time server' >> ntpfound.log;
cat ntpfound.log;

