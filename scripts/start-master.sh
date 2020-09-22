#!/bin/bash

echo "📦 installing packages"
sudo apt-get update
sudo apt-get install -qy apt-transport-https && \
        curl && \
        docker.io && \
        git

echo "😸 pulling code"
rm -rf demo-opa
git clone https://github.com/carlosvalarezo/demo-opa.git
./demo-opa/k8s/install-k8s.sh
./demo-opa/k8s/create-master.sh
