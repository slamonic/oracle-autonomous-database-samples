#!/bin/bash
# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

# ensure you update the config file to match your deployment prior to running the deployment

source config

echo "##"
echo "# Delete data lake storage bucket $BUCKET_NAME"
echo "##"
echo ""

# Ask for confirmation
echo ""
echo "Are you sure you want to delete the bucket '$BUCKET_NAME' in region '$REGION' and compartment '$COMPARTMENT_NAME'? All containers and files will be deleted!"
echo "Enter (y/n)"
read confirmation

if [[ $confirmation == [yY] || $confirmation == [yY][eE][sS] ]]; then
    oci os bucket delete --region $REGION --bucket-name $BUCKET_NAME --force --empty    
else
    echo "Deletion cancelled."
fi 