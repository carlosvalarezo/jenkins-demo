#!/bin/bash

echo "👨‍💻setting up EC2"
scp -i aws_k8s.pem aws_k8s.pem $MASTER:/home/ubuntu/certs/aws_k8s.pem
scp -i aws_k8s.pem ./scripts/start.sh $MASTER:/home/ubuntu/scripts/start.sh
ssh -i aws_k8s.pem $MASTER 'sh' '/home/ubuntu/scripts/start.sh'
