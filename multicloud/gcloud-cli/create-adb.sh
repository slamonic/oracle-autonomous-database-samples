#!/bin/bash

# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# create autonomous database"
echo "##"
echo ""
# ensure you update the config file to match your deployment prior to running the deployment

source ./config

# ADB requires the IDs of the networking components
 NETWORK_ID=`gcloud compute networks list --filter="name=$VPC_NETWORK_NAME" --format="get(id)"`
 
gcloud oracle-database autonomous-databases create $ADB_NAME \
    --location=$REGION \
    --display-name=$ADB_NAME \
    --database=$ADB_NAME \
    --network=$NETWORK_ID \
    --cidr=$SUBNET_DB_IP_RANGE \
    --admin-password=$USER_PASSWORD \
    --properties-compute-count=4 \
    --properties-data-storage-size-gb=500 \
    --properties-db-version=23ai \
    --properties-license-type=LICENSE_INCLUDED \
    --properties-db-workload=OLTP \
    --properties-is-storage-auto-scaling-enabled \
    --properties-is-auto-scaling-enabled \
    --async

