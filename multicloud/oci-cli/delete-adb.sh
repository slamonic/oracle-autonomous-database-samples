#!/bin/bash

# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

# ensure you update the config file to match your deployment prior to running the deployment

source ./config

# Ask for confirmation
echo "Are you sure you want to delete database '$ADB_NAME' in region '$REGION', compartment '$COMPARTMENT_NAME'?"
echo "Enter (y/n)"
read confirmation

if [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]]; then
    echo "Deleting Autonomous Database"
    COMPARTMENT_OCID=`oci iam compartment list --region $REGION --all --query "data[?name=='$COMPARTMENT_NAME' && \"lifecycle-state\"=='ACTIVE'].id | [0]" --raw-output`
    ADB_OCID=`oci db autonomous-database list --region $REGION --compartment-id $COMPARTMENT_OCID --query "data[?\"db-name\"=='$ADB_NAME' && \"lifecycle-state\"=='AVAILABLE'].id | [0]" --raw-output`
    
    oci db autonomous-database delete --region $REGION --force --autonomous-database-id $ADB_OCID --wait-for-state TERMINATED
else
    echo "Deletion cancelled. The database was not deleted."
fi