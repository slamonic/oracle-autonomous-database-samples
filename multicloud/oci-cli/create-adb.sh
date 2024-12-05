# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# create autonomous database"
echo "##"
echo ""
# ensure you update the config file to match your deployment prior to running the deployment

source ./config

COMPARTMENT_OCID=`oci iam compartment list --all --region $REGION --query "data[?name=='$COMPARTMENT_NAME' && \"lifecycle-state\"=='ACTIVE'].id | [0]" --raw-output`

oci db autonomous-database create \
--region $REGION \
--compartment-id $COMPARTMENT_OCID \
--db-name $ADB_NAME \
--display-name $ADB_NAME \
--compute-model ECPU \
--compute-count 4 \
--is-auto-scaling-enabled true \
--data-storage-size-in-gbs 500 \
--is-auto-scaling-for-storage-enabled true \
--backup-retention-period-in-days 7 \
--db-workload OLTP \
--db-version 23ai \
--display-name $ADB_NAME \
--whitelisted-ips '["0.0.0.0/0"]' \
--is-mtls-connection-required false \
--admin-password $USER_PASSWORD