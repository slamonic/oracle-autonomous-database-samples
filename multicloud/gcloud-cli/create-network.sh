#!/bin/bash
# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# deploy network"
echo "##"
echo ""
# ensure you update the config file to match your deployment prior to running the deployment
source ./config

# Create a VPC
gcloud compute networks create $VPC_NETWORK_NAME --subnet-mode=custom

gcloud compute networks subnets create $SUBNET_CLIENT_NAME \
    --network=$VPC_NETWORK_NAME \
    --region=$REGION \
    --range=$SUBNET_CLIENT_IP_RANGE \
    --enable-flow-logs \
    --enable-private-ip-google-access

gcloud compute firewall-rules create $VPC_FIREWALL_INGRESS_NAME \
    --direction=INGRESS \
    --priority=1000 \
    --network=$VPC_NETWORK_NAME \
    --action=ALLOW \
    --rules=tcp:22,tcp:80,tcp:443,tcp:1522,tcp:3389 \
    --source-ranges=0.0.0.0/0 \
    --description="Allow SSH, HTTP, HTTPS, Autonomous DB, and RDP access"
    --target-tags=bastion

gcloud compute firewall-rules create $VPC_FIREWALL_EGRESS_NAME \
    --direction=EGRESS \
    --priority=1000 \
    --network=$VPC_NETWORK_NAME \
    --action=ALLOW \
    --rules=tcp:22,tcp:80,tcp:443,tcp:1522,tcp:3389 \
    --destination-ranges=0.0.0.0/0 \
    --target-tags=bastion
