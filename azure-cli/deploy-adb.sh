# ensure you update the config file to match your deployment prior to running the deployment

source ./config

az oracle-database autonomous-database create \
--location $LOCATION \
--autonomousdatabasename $ADB_NAME \
--resource-group $RESOURCE_GROUP \
--subnet-id $SUBNET_ID \
--display-name $ADB_NAME \
--compute-model ECPU \
--compute-count 2 \
--cpu-auto-scaling true \
--data-storage-size-in-gbs 500 \
--license-model BringYourOwnLicense \
--db-workload OLTP \
--db-version 23ai \
--character-set AL32UTF8 \
--ncharacter-set AL16UTF16 \
--vnet-id $VNET_ID \
--regular \
--admin-password