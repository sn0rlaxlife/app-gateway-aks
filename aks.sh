#!/bin/bash
AKS_NAME='aks-west-prod'
RESOURCE_GROUP='aks-west-prod'
LOCATION='eastus' # The list of available regions may grow as we roll out to more preview regions
VM_SIZE='Standard_B4ms' # The size needs to be avail from your region - find this via az vm list-sizes --location eastus -o table

az group create --name $RESOURCE_GROUP --location $LOCATION
az aks create \
    --resource-group $RESOURCE_GROUP \
    --name $AKS_NAME \
    --location $LOCATION \
    --node-vm-size $VM_SIZE \
    --network-plugin azure \
    --enable-oidc-issuer \
    --enable-workload-identity \
    --generate-ssh-key
