#!/bin/bash
groupadd ubuntu
useradd -g ubuntu -G admin -s /bin/bash -d /home/ubuntu ubuntu
mkdir -p /home/ubuntu
sudo cp -r /root/.ssh /home/ubuntu/.ssh
sudo chown -R ubuntu:ubuntu /home/ubuntu
sudo cat /etc/sudoers
sudo echo "ubuntu ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# create .kube/config
sudo mkdir -p ~ubuntu/.kube
sudo cp -i /etc/kubernetes/admin.conf ~ubuntu/.kube/config
sudo chown ubuntu:ubuntu ~ubuntu/.kube/config
