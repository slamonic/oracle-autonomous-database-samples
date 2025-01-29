#!/bin/bash
# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/


# ensure you update the config file to match your deployment prior to running the deployment

source config

echo ""
gcloud storage ls --long --recursive gs://$BUCKET_NAME

echo ""
echo "Bucket Name: $BUCKET_NAME" 
gcloud storage hmac list
echo "Storage URL:"
echo "https://storage.googleapis.com/$BUCKET_NAME"
echo ""

