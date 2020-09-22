#!/bin/bash
echo "😺 creating k8s-node"
JOIN_COMMAND=$(cat /home/ubuntu/worker_node/join.conf)
sh $JOIN_COMMAND
