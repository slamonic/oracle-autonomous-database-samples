#!/bin/bash
# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# Create an object storage bucket with sample data"
echo "##"
echo ""
# ensure you update the config file to match your deployment prior to running the deployment

source config

echo "# Creating bucket $BUCKET_NAME"
COMPARTMENT_OCID=`oci iam compartment list --region $REGION --all --query "data[?name=='$COMPARTMENT_NAME' && \"lifecycle-state\"=='ACTIVE'].id | [0]" --raw-output`

oci os bucket create --region $REGION --compartment-id $COMPARTMENT_OCID --name $BUCKET_NAME 

echo "# Uploading sample files"

echo "Example support site files"
oci os object bulk-upload --region $REGION --bucket-name $BUCKET_NAME --src-dir ../../sql/support-site --prefix "support-site/" --overwrite

echo "Example data files"
oci os object bulk-upload --region $REGION --bucket-name $BUCKET_NAME --src-dir ../../sql/data --prefix "data/" --overwrite

echo "Done."
echo ""
echo "Uploaded files:"
oci os object list --region $REGION --bucket-name $BUCKET_NAME --query 'data[*].{Name:"name", "Size":"size"}' --output table

echo ""
echo "Region: $REGION"
echo "Bucket: $BUCKET_NAME" 
echo "Storage URL prefix:"
NAMESPACE=`oci os ns get --query "data" --raw-output` 
echo "https://$NAMESPACE.objectstorage.$REGION.oci.customer-oci.com/n/$NAMESPACE/b/$BUCKET_NAME/o"
echo ""
