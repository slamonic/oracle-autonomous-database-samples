# Ask for confirmation
source ./config
echo ""
echo "Deleting compute instance '$VM_NAME'"
gcloud compute instances delete $VM_NAME --zone $REGION-a 
