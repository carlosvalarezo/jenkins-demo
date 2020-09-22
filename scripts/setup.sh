#!/bin/bash

echo "👨‍💻setting up EC2 master"
ssh -i ./resources/aws_k8s.pem $EC2_USER@$MASTER_NODE 'mkdir' '/home/ubuntu/scripts'
ssh -i ./resources/aws_k8s.pem $EC2_USER@$MASTER_NODE 'mkdir' '/home/ubuntu/certs'
scp -i ./resources/aws_k8s.pem ./scripts/create-user.sh $EC2_USER@$MASTER_NODE:/home/ubuntu/scripts/create-user.sh
ssh -i ./resources/aws_k8s.pem $EC2_USER@$MASTER_NODE 'sh' '/home/ubuntu/scripts/create-user.sh'
scp -i ./resources/aws_k8s.pem ./k8s/tests-communication.sh $EC2_USER@$MASTER_NODE:/home/ubuntu/scripts/tests-communication.sh
scp -i ./resources/aws_k8s.pem ./resources/aws_k8s.pem $EC2_USER@$MASTER_NODE:/home/ubuntu/certs/aws_k8s.pem
scp -i ./resources/aws_k8s.pem ./scripts/start-master.sh $EC2_USER@$MASTER_NODE:/home/ubuntu/scripts/start-master.sh
scp -i ./resources/aws_k8s.pem ./env.sh $EC2_USER@$MASTER_NODE:/home/ubuntu/scripts/env.sh
scp -i ./resources/aws_k8s.pem ./k8s/tests-communication.sh $EC2_USER@$MASTER_NODE:/home/ubuntu/scripts/tests-communication.sh
ssh -i ./resources/aws_k8s.pem $EC2_USER@$MASTER_NODE 'sh' '/home/ubuntu/scripts/start-master.sh'
echo "👨‍ EC2 master working"

echo "👨‍💻setting up EC2 node"
ssh -i ./resources/aws_k8s.pem $EC2_USER@$WORKER_NODE 'mkdir' '/home/ubuntu/scripts'
scp -i ./resources/aws_k8s.pem ./scripts/create-user.sh $EC2_USER@$WORKER_NODE:/home/ubuntu/scripts/create-user.sh
ssh -i ./resources/aws_k8s.pem $EC2_USER@$WORKER_NODE 'sh' '/home/ubuntu/scripts/create-user.sh'
scp -i ./resources/aws_k8s.pem ./scripts/start-node.sh $EC2_USER@$WORKER_NODE:/home/ubuntu/scripts/start-node.sh
ssh -i ./resources/aws_k8s.pem $EC2_USER@$WORKER_NODE 'sh' '/home/ubuntu/scripts/start-node.sh'
echo "👨‍ EC2 node working"
