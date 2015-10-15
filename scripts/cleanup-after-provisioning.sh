#! /bin/bash

# remove all temporary directories
TMP_DIRS=(/tmp/packages /tmp/conf)
for _DIR in ${TMP_DIRS[@]}; do
    if [ -d $_DIR ]; then
        rm -rf $_DIR
    fi
done

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
