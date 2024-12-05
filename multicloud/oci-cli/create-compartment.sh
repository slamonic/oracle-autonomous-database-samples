# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# create a compartment"
echo "##"
echo ""
# ensure you update the config file to match your deployment prior to running the deployment
source ./config

oci iam compartment create --region $REGION --compartment-id $TENANCY_OCID --name "$COMPARTMENT_NAME" --description "Created by oracle-autonomous-database-samples"