#!/bin/bash
echo "Deploying ALB Controller via Helm........"
RESOURCE_GROUP='aks-west-prod'
AKS_NAME='aks-west-prod'

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_NAME
helm install alb-controller oci://mcr.microsoft.com/application-lb/charts/alb-controller \
     --version 0.4.023971 \
     --set albController.podIdentity.clientID=$(az identity show -g $RESOURCE_GROUP -n azure-alb-identity --query clientId -o tsv)
