#!/bin/bash
# Copyright (c) 2025 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# show autonomous database info"
echo "##"
echo ""

# ensure you update the config file to match your deployment prior to running the deployment
source ./config

# Function to check if a command was successful
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed"
        exit 1
    fi
}

COMPARTMENT_OCID=`oci iam compartment list --region $REGION --all --query "data[?name=='$COMPARTMENT_NAME' && \"lifecycle-state\"=='ACTIVE'].id | [0]" --raw-output`
check_command "Getting compartment OCID for $COMPARTMENT_NAME"

ADB_OCID=`oci db autonomous-database list --region $REGION --compartment-id $COMPARTMENT_OCID --query "data[?\"db-name\"=='$ADB_NAME' && (\"lifecycle-state\"=='AVAILABLE' || \"lifecycle-state\"=='STOPPED')].id | [0]" --raw-output`

check_command "Getting Autonomous Database OCID for $ADB_NAME in region $REGION and compartment $COMPARTMENT_NAME"

if [ -z "$ADB_OCID" ]; then
    echo "Autonomous Database '$ADB_NAME' is NOT FOUND or STOPPED in region '$REGION' and compartment '$COMPARTMENT_NAME'"
    echo ""
    exit 1
fi

CONN_STR=`oci db autonomous-database get --region $REGION --autonomous-database-id $ADB_OCID --query 'data."connection-strings".profiles[?type=="high"].value | [0]' --raw-output`

echo ""
echo "Region: $REGION"
echo "Compartment: $COMPARTMENT_NAME" 
oci db autonomous-database get --region $REGION --autonomous-database-id $ADB_OCID --query 'data.{Name:"display-name", "Compute Count":"compute-count", "Storage (GB)":"data-storage-size-in-gbs", Workload:"db-workload", State:"lifecycle-state"}' --output table
echo ""
echo "JDBC Connection string:"
CONN_STR=jdbc:oracle:thin:@$CONN_STR
echo $CONN_STR
echo ""