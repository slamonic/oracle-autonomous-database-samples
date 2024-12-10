#!/bin/bash

# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# Delete VPC network $VPC_NETWORK_NAME"
echo "##"
echo ""

# ensure you update the config file to match your deployment prior to running the deployment
source config

# Ask for confirmation
echo "Are you sure you want to delete the VPC Network '$VPC_NETWORK_NAME'?"
echo "Enter (y/n):"
read confirmation

if [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]]; then
    # Deleting firewall rules
    echo "Deleting firewall rules for $VPC_NETWORK_NAME"
    gcloud compute firewall-rules delete $VPC_FIREWALL_INGRESS_NAME --quiet  
    gcloud compute firewall-rules delete $VPC_FIREWALL_EGRESS_NAME --quiet

    # Delete the subnet
    echo "Deleting client subnet $SUBNET_CLIENT_NAME in $VPC_NETWORK_NAME"
    gcloud compute networks subnets delete $SUBNET_CLIENT_NAME --quiet

    # Deleting the network
    echo "Deleting network $VPC_NETWORK_NAME"
    gcloud compute networks delete $VPC_NETWORK_NAME --quiet  

    if [ $? -eq 0 ]; then
        echo "Resource group '$VPC_NETWORK_NAME' has been successfully deleted."
    fi
else
    echo "Deletion cancelled."
fi


