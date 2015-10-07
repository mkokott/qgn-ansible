#! /bin/bash

MARIADB_SERVER=http://nyc2.mirrors.digitalocean.com/mariadb/mariadb-10.0.19/yum/centos6-amd64/rpms/MariaDB-10.0.19-centos6-x86_64-server.rpm
wget $MARIADB_SERVER -O ../packages/mariadb-server.rpm
