#!/bin/bash
# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/


# ensure you update the config file to match your deployment prior to running the deployment

source config
echo "Sample files:"
oci os object list --region $REGION --bucket-name $BUCKET_NAME --query 'data[*].{Name:"name", "Size":"size"}' --output table

echo ""
echo "Region: $REGION"
echo "Bucket: $BUCKET_NAME" 
echo "Storage URL prefix:"
NAMESPACE=`oci os ns get --query "data" --raw-output` 
echo "https://$NAMESPACE.objectstorage.$REGION.oci.customer-oci.com/n/$NAMESPACE/b/$BUCKET_NAME/o"
echo ""

