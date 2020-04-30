#!/bin/bash

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.42.42.100 controlnode.naren.com controlnode
172.42.42.101 worker1.naren.com worker1
172.42.42.102 worker2.naren.com worker2
EOF

# Install docker from Docker-ce repository
echo "[TASK 2] Install docker container engine"
yum install -y -q yum-utils device-mapper-persistent-data lvm2 > /dev/null 2>&1
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo > /dev/null 2>&1
yum install -y -q docker-ce >/dev/null 2>&1

# Enable docker service
echo "[TASK 3] Enable and start docker service"
systemctl enable docker >/dev/null 2>&1
systemctl start docker

# Enable ssh password authentication
echo "[TASK 4] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# insatll ansible 
echo "[TASK 5] install ansible"
yum install epel-release -y
yum install ansible -y

# install git ,tree
echo "[TASK 6] install other softwares"
yum install git tree -y

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc
