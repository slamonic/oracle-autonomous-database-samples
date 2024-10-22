# Oracle Database@Azure: Create an Autonomous Database
The steps below show how to create an Autonomous Database using the Azure CLI. You will need to [install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/) prior to running thru this example.

Run the examples below at a command prompt.

> [!NOTE]
> See the [details for onboarding Autonomous Database](https://learn.microsoft.com/en-us/azure/oracle/oracle-db/onboard-oracle-database)

## Deploy your Autonomous Database
Start by logging into Azure:
```bash
az login 
```

Edit the [config file](./config) based on your deployment. These variables will be used by the Azure CLI. 
```bash
LOCATION="eastus"
RESOURCE_GROUP="resource-group-name-goes-here"
VNET_ID="vnet-resource-name-goes-here"  
SUBNET_ID="subnet-resource-name-goes-here" 
ADB_NAME="adb-name-goes-here"
```
The VNET and SUBNET IDs must be fully qualified IDs. For example:
* **VNET_ID=**`"/subscriptions/99d4fb0e-ac2.../resourceGroups/your-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet"`
* **SUBNET_ID=**`"/subscriptions/99d4fb0e-ac2.../resourceGroups/your-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet"`

After updating the config file, create a new Autonomous Database by running [`./deploy-adb.sh`](./deploy-adb.sh) from the command line. You can also modify other database properties by editing the deployment script.

The script will prompte you for the Autonomous Database **ADMIN** user password. Enter a complex password.

After a few minutes, review your newly created database:
```bash
az oracle-database autonomous-database show \
--autonomousdatabasename $ADB_NAME \
--resource-group $RESOURCE_GROUP
```

## Delete an Autonomous Database
You can run the following command to an Autonomous Database:

```bash
az oracle-database autonomous-database delete \
--autonomousdatabasename $ADB_NAME \
--resource-group $RESOURCE_GROUP \
--no-wait false
```



<hr>
Copyright (c) 2024 Oracle and/or its affiliates.<br>
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/
