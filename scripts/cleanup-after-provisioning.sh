#! /bin/bash

PACKAGES_DIR=/tmp/packages

# remove temporary directory for rpms and tar balls
if [ -d $PACKAGES_DIR ]; then
    
    rm -rf $PACKAGES_DIR
fi

# remove ansible installation
yum -y erase ansible
yum -y erase epel-release

# reset sudoers file
if [ -f /etc/sudoers.bak ]; then
  rm -f /etc/sudoers
  mv /etc/sudoers.bak /etc/sudoers
fi

# delete ansible user, home directory & mailbox
userdel ansible
if [ -d /tmp/ansible ]; then
    rm -rf /tmp/ansible
fi
if [ -d /var/spool/mail ]; then
    rm -rf /var/spool/mail/
fi
