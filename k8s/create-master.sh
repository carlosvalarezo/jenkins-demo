#!/bin/bash
echo "😺 creating k8s master"
source /home/ubuntu/scripts/env.sh
ssh -i ./resources/aws_k8s.pem $EC2_USER@$MASTER_NODE 'mkdir' '/home/ubuntu/worker_node'

JOIN=$(kubeadm init --pod-network-cidr=10.244.0.0/16)

sudo echo $JOIN > /etc/kubernetes/join.conf

scp -i /home/ubuntu/certs/aws_k8s.pem /etc/kubernetes/join.conf $EC2_USER@$WORKER_NODE:/home/ubuntu/worker_node/join.conf

export KUBECONFIG=/etc/kubernetes/admin.conf

sudo kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml

sudo mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "🥳 k8s master created"
