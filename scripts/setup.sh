#!/bin/bash

echo "👨‍💻setting up EC2"
scp -i aws_k8s.pem aws_k8s.pem $USERNAME@$MASTER:/home/ubuntu/certs/aws_k8s.pem
scp -i aws_k8s.pem ./scripts/start.sh $USERNAME@$MASTER:/home/ubuntu/scripts/start.sh
ssh -i aws_k8s.pem $USERNAME@$MASTER 'sh' '/home/ubuntu/scripts/start.sh'
