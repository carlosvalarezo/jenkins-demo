#!/bin/bash

echo "🤓installing support packages & docker"
apt-get update
apt-get install -y apt-transport-https \
        curl \
        docker.io

echo "🐳 setting up docker"
systemctl enable docker
systemctl status docker
systemctl start docker

echo "🛳 installing k8s"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt-get install -y kubelet kubeadm kubectl
