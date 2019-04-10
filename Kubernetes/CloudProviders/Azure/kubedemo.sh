#!bash


# Variables
RESOURCE_GROUP_NAME=kubedemo
TARGET_REGION=eastus
KUBE_CLUSTER_NAME=kube

# Create resource group
#
az.cmd group create --name ${RESOURCE_GROUP_NAME} --location ${TARGET_REGION}

#
# List the resource groups
#
# az.cmd group list

#
# Create the AKS cluster.  This will take about 10 minutes
#
az.cmd aks create --generate-ssh-keys --resource-group ${RESOURCE_GROUP_NAME} --node-count 1 --name ${KUBE_CLUSTER_NAME}

#
# List the aks cluster
#
az.cmd aks list

exit 0

#
# Get the information to require to access
#
az aks get-credentials --resource-group=kube --name=kube 

az aks install-cli

az aks list

kubectl version

kubectl get cs

kubectl cluster-info

kubectl get nodes
