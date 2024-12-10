#!/bin/bash
# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

echo ""
echo "##"
echo "# show autonomous database info"
echo "##"
echo ""

# ensure you update the config file to match your deployment prior to running the deployment
source ./config
echo ""
gcloud oracle-database autonomous-databases describe $ADB_NAME --location=$REGION --format="table(database,properties.dbWorkload, properties.state, properties.computeCount,properties.dataStorageSizeGb)"

echo ""
echo "JDBC Connection string:"
# The string containing multiple descriptions
DESCRIPTIONS=`gcloud oracle-database autonomous-databases describe $ADB_NAME --location=$REGION --format="value(properties.connectionStrings.profiles.value)"`

# Extract the "HIGH" description specifically
CONN_STR=$(echo "$DESCRIPTIONS" | awk -F ';' '{
    for (i=1; i<=NF; i++) {
        if ($i ~ /_high\./) {
            print $i
            exit
        }
    }
}')


#CONN_STR=${CONN_STR#?}  # Remove first character
#CONN_STR=${CONN_STR%?}  # Remove last character
CONN_STR=jdbc:oracle:thin:@$CONN_STR
echo $CONN_STR
echo ""
