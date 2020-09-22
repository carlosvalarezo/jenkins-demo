#!/bin/bash
echo "😺 creating k8s master"
source /home/ubuntu/scripts/env.sh

hostnamectl set-hostname k8s-master

JOIN=$(kubeadm init --pod-network-cidr=10.244.0.0/16)

echo $JOIN > /etc/kubernetes/join.conf

scp -i /home/ubuntu/certs/aws_k8s.pem /etc/kubernetes/join.conf $USERNAME@$WORKER_NODE:/home/ubuntu/worker_node/join.conf

export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml

mkdir -p $HOME/.kube

cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

chown $(id -u):$(id -g) $HOME/.kube/config

echo "🥳 k8s master created"
