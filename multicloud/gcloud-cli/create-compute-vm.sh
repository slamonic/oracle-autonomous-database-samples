#!/bin/bash
# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# create compute vm"
echo "##"
echo ""

# ensure you update the config file to match your deployment prior to running the deployment
source ./config

## Create a windows vm
echo "Creating compute instance $VM_NAME"

gcloud compute instances create $VM_NAME \
    --image-family $VM_IMAGE_FAMILY \
    --image-project windows-cloud \
    --machine-type e2-standard-4 \
    --zone $REGION-a \
    --network $VPC_NETWORK_NAME \
    --network-tier=PREMIUM \
    --subnet $SUBNET_CLIENT_NAME \
    --boot-disk-size 50GB \
    --boot-disk-type pd-ssd \
    --enable-display-device \
    --tags=bastion 

## Create it's password
echo "Resetting the password for $VM_NAME"
gcloud compute reset-windows-password $VM_NAME --zone=$REGION-a

