#!/bin/bash

echo "Deploying Application Gateway for Containers into Virtual Networks containing AKS Cluster"
AKS_NAME='aks-west-prod'
RESOURCE_GROUP='aks-west-prod'

MC_RESOURCE_GROUP=$(az aks show --name $AKS_NAME --resource-group $RESOURCE_GROUP --query "nodeResourceGroup" -o tsv)
CLUSTER_SUBNET_ID=$(az vmss list --resource-group $MC_RESOURCE_GROUP --query '[0].virtualMachineProfile.networkProfile.networkInterfaceConfigurations[0].ipConfigurations[0].subnet.id' -o tsv)
read -d '' VNET_NAME VNET_RESOURCE_GROUP VNET_ID <<< $(az network vnet show --ids $CLUSTER_SUBNET_ID --query '[name, resourceGroup, id]' -o tsv)

echo "Sleep for 60 seconds to gather details......."
sleep 60

SUBNET_ADDRESS_PREFIX='10.0.59.0/24'
ALB_SUBNET_NAME='subnet-alb' #can't be restricted names such as reserved (i.e GatewaySubnet, AzureFirewallSubnet, AzureBastionSubnet)
VNET_RESOURCE_GROUP='aks-west-prod'
VNET_NAME='aks-virtualnetwork-west'

az network vnet subnet create \
  --resource-group $VNET_RESOURCE_GROUP \
  --vnet-name $VNET_NAME \
  --name $ALB_SUBNET_NAME \
  --address-prefixes $SUBNET_ADDRESS_PREFIX \
  --delegations 'Microsoft.ServiceNetworking/trafficControllers'
ALB_SUBNET_ID=$(az network vnet subnet show --name $ALB_SUBNET_NAME --resource-group $VNET_RESOURCE_GROUP --vnet-name $VNET_NAME --query '[id]' --output tsv)
