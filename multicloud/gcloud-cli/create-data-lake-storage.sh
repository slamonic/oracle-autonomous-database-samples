#!/bin/bash
# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# Create a Google Cloud Storage bucket"
echo "##"
echo ""
# ensure you update the config file to match your deployment prior to running the deployment

source config

echo "# Creating Google Cloud Storage bucket $STORAGE_ACCOUNT_NAME"
gcloud storage buckets create gs://$BUCKET_NAME --location=$REGION --default-storage-class=STANDARD

echo "# Uploading sample files"
echo "Support site files"
gcloud storage cp -r ../../sql/support-site gs://$BUCKET_NAME/support-site

echo "Sample data sets"
gcloud storage cp -r ../../sql/data gs://$BUCKET_NAME/data

echo "Done."
gcloud storage ls --long --recursive gs://$BUCKET_NAME

echo ""
echo "Bucket Name: $BUCKET_NAME" 
echo "Storage URL:"
echo "https://storage.googleapis.com/$BUCKET_NAME"
