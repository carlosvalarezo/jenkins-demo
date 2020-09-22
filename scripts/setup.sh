#!/bin/bash

echo "👨‍💻setting up EC2 master"
scp -i ./resources/aws_k8s.pem ./resources/aws_k8s.pem $USERNAME@$MASTER_NODE:/home/ubuntu/certs/aws_k8s.pem
scp -i ./resources/aws_k8s.pem ./scripts/start-master.sh $USERNAME@$MASTER_NODE:/home/ubuntu/scripts/start-master.sh
scp -i ./resources/aws_k8s.pem ./env.sh $USERNAME@$MASTER_NODE:/home/ubuntu/scripts/env.sh
scp -i ./resources/aws_k8s.pem ./k8s/tests-communication.sh $USERNAME@$MASTER_NODE:/home/ubuntu/scripts/tests-communication.sh
ssh -i ./resources/aws_k8s.pem $USERNAME@$MASTER_NODE 'sh' '/home/ubuntu/scripts/start-master.sh'
echo "👨‍ EC2 master working"

echo "👨‍💻setting up EC2 node"
scp -i ./resources/aws_k8s.pem ./scripts/start-node.sh $USERNAME@$WORKER_NODE:/home/ubuntu/scripts/start-node.sh
ssh -i ./resources/aws_k8s.pem $USERNAME@$WORKER_NODE 'sh' '/home/ubuntu/scripts/start-node.sh'
echo "👨‍ EC2 node working"
