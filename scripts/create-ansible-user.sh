#! /bin/bash

useradd ansible
echo ansible:#ansible! | chpasswd

cp /etc/sudoers /etc/sudoers.bak
echo "%ansible  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
