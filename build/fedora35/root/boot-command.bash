#!/usr/bin/env bash

if [ "$(whoami)" == "root" ]; then

  HOSTIPRESOLVCONF="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
  cp /etc/hosts /etc/hosts.old
  grep -v crc /etc/hosts > /etc/hosts.tmp
  grep crc /etc/hosts | awk -v newip=${HOSTIPRESOLVCONF} '{ $1=newip; print}' >> /etc/hosts.tmp
  mv /etc/hosts.tmp /etc/hosts

else

sudo bash /boot-command.bash

fi

