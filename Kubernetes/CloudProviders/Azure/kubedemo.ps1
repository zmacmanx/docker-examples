
#
# Confirm that the you have access to the container service
#
az provider register -n Microsoft.ContainerService

#
# Create resource group
#
az group create --name kube --location eastus

#
# List the resource groups
#
az group list

#
# Create the AKS cluster.  This will take about 10 minutes
#
az aks create --generate-ssh-keys --resource-group kube --node-count 3 --name kube

#
# List the aks cluster
#
az aks list

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