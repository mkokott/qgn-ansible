#! /bin/bash

TMP_DIRS=(/tmp/packages /tmp/conf)
PROVISION_HOME=/tmp/ansible

# creating ansible user with home directory /tmp/ansible
useradd ansible -b /tmp
echo ansible:#ansible! | chpasswd

# adding ansible user to sudoers & disable tty requirement for sudo
cp /etc/sudoers /etc/sudoers.bak
sed -i 's/Defaults[ tab]*requiretty/# &/g' /etc/sudoers
sed -i 's/Defaults[ tab]*!visiblepw/# &/g' /etc/sudoers
echo "%ansible  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# installing ansible package
yum -y install epel-release
yum -y install ansible

# setting up ssh env for ansible user
su - ansible -c "ssh-keygen -q -N \"\" -f /tmp/ansible/.ssh/id_rsa -t rsa -b 4096 -C \"ansible-provisioning\""
su - ansible -c "cat /tmp/ansible/.ssh/id_rsa.pub > /tmp/ansible/.ssh/authorized_keys"
su - ansible -c "chmod 700 /tmp/ansible/.ssh/authorized_keys"


# creating $PACKAGES_DIR to upload rpms and tar balls to
for _DIR in ${TMP_DIRS[@]}; do
    if [ -d $_DIR ]; then
        rm -rf $_DIR
    fi
    mkdir $_DIR
done
