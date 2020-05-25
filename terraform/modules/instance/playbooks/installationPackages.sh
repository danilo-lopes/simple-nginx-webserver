#!/bin/bash

sudo yum repolist && \
sudo yum install epel-release -y && \
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y && \
sudo yum --disablerepo="*" --enablerepo="remi-safe" list php[7-9][0-9].x86_64 && \
sudo yum-config-manager --enable remi-php74 && \
sudo yum install ansible -y