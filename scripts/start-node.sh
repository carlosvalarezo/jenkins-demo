#!/bin/bash

echo "📦 installing packages"
sudo apt-get update
sudo apt-get install -qy apt-transport-https && \
        curl && \
        docker.io && \
        git

echo "😸 pulling code"
sudo git clone https://github.com/carlosvalarezo/demo-opa.git
sudo ./demo-opa/k8s/install-k8s.sh
sudo ./demo-opa/k8s/create-node.sh
