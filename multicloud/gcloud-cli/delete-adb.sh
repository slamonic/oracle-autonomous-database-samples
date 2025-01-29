#!/bin/bash

# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

# ensure you update the config file to match your deployment prior to running the deployment

source ./config

# Ask for confirmation
echo "Are you sure you want to delete database '$ADB_NAME' in region '$REGION'?"
echo "Enter (y/n):"
read confirmation

if [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]]; then
    echo "Deleting Autonomous Database"
    gcloud oracle-database autonomous-databases delete $ADB_NAME --location=$REGION --quiet
  
else
    echo "Deletion cancelled. The database was not deleted."
fi