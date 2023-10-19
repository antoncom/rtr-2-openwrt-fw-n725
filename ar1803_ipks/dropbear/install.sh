#!/bin/sh


# Unpack IPK files and place unpacked files to shadow root
cd ./ipk
files="$(ls)"
[ -z "$files" ] && return 0

adb shell "$(echo 'mkdir -p /data/bitcord/root')"
adb shell "$(echo 'mkdir -p /data/bitcord/index')"

for file in $files; do
  comm_1="tar zxpvf /data/bitcord/ipk/$file -C /data/bitcord/root"
  comm_2="cd /data/bitcord/root && tar -xzf data.tar.gz"
  #comm_3="tar -t data.tar.gz"
  #comm_4="rm /data/bitcord/root/*.gz; rm /data/bitcord/root/debian-binary;"
  adb shell "$( echo $comm_1)" > /dev/null
  adb shell "$( echo $comm_2)" > /dev/null
  #adb shell "$( echo $comm_3)" > /dev/null
  #adb shell "$( echo $comm_4)" > /dev/null
done




#adb shell "$(cat ../clear_password.sh)"