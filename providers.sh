#!/bin/bash

echo "Installing the following - Azure Container Service/Network/Network Function/Service Networking"

az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Network
az provider register --namespace Microsoft.NetworkFunction
az provider register --namespace Microsoft.ServiceNetworking

echo "Installing Azure CLI Extensions......"

az extension add --name alb
