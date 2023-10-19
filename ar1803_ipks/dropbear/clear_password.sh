#!/bin/sh

# Clear root password
awk -F: 'BEGIN{OFS=":"}/root/{gsub(/.*/,"",$2)}1' /etc/shadow > /etc/shadow.tmp
cat /etc/shadow.tmp > /etc/shadow
rm /etc/shadow.tmp