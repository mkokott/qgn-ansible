#! /bin/bash

userdel ansible
groupdel ansible

if [ -f /etc/sudoers.bak ]; then
  rm -f /etc/sudoers
  mv /etc/sudoers.bak /etc/sudoers
fi
