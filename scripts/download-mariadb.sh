#! /bin/bash

MARIADB_COMPAT=http://nyc2.mirrors.digitalocean.com/mariadb/mariadb-10.0.21/yum/centos6-amd64/rpms/MariaDB-10.0.21-centos6-x86_64-compat.rpm
MARIADB_COMMON=http://nyc2.mirrors.digitalocean.com/mariadb/mariadb-10.0.21/yum/centos6-amd64/rpms/MariaDB-10.0.21-centos6-x86_64-common.rpm
MARIADB_CLIENT=http://nyc2.mirrors.digitalocean.com/mariadb/mariadb-10.0.21/yum/centos6-amd64/rpms/MariaDB-10.0.21-centos6-x86_64-client.rpm
MARIADB_SERVER=http://nyc2.mirrors.digitalocean.com/mariadb/mariadb-10.0.21/yum/centos6-amd64/rpms/MariaDB-10.0.21-centos6-x86_64-server.rpm

wget $MARIADB_COMPAT -O ../packages/mariadb-compat.rpm
wget $MARIADB_COMMON -O ../packages/mariadb-common.rpm
wget $MARIADB_CLIENT -O ../packages/mariadb-client.rpm
wget $MARIADB_SERVER -O ../packages/mariadb-server.rpm
