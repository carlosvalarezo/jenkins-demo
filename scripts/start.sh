#!/bin/bash

echo "📦 installing packages"
apt-get update
apt-get install -qy git

echo "😸 pulling code"
git clone https://github.com/carlosvalarezo/demo-opa.git
cd demo-opa
./k8s/install-k8s.sh
./k8s/create-master
./k8s/create-node
