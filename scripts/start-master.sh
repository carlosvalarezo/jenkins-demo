#!/bin/bash

echo "📦 installing packages"
apt-get update
apt-get install -qy apt-transport-https && \
        curl && \
        docker.io && \
        git

echo "😸 pulling code"
git clone https://github.com/carlosvalarezo/demo-opa.git
cd
./demo-opa/k8s/install-k8s.sh
./demo-opa/k8s/create-master.sh
