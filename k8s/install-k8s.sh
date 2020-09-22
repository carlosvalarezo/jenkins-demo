#!/bin/bash

echo "🛳 installing k8s"
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install -y kubelet kubeadm kubectl
