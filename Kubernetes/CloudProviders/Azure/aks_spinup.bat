#
# Register the container service for use.
# az provider show -n Microsoft.ContainerService will show register
#
az provider register -n Microsoft.ContainerService

# Create a resource group to contain all the entities going forward
# Using the Eastern United States datacenter
#
az group create --name rg-kubedemo-aks --location eastus

#
# The following with establish the cluster name and size with the type of keys
# needed to communicate between the entities.  Node the resource group is being 
# used to contain all the billing and components together.
#
az aks create --resource-group rg-kubedemo-aks --name kc-kubedemo-aks --node-count 1 --generate-ssh-keys

#
# Install the package for command line control of the kube cluster
#
az aks install-cli

#
#
#
# ak aks get-credentials --resource-group rg-kubedemo-aks --name kc-kubedemo-aks
az aks get-credentials --resource-group rg-kubedemo-aks --name kc-kubedemo-aks

#
#
#
kubectl get cs
kubectl cluster-info

kubectl create -f azure_vote.yml
kubectl get po --watch
kubectl get srv --watch

kubectl run --image nginx myweb
kubectl get deploy
kubectl get pods

#
# Need the name of the pod that you get from kubectl get pods.  You are going to use that
# name to open access to the application through the LoadBalancer.
#
kubectl expose pod myweb-190417145-0sgv4 --port 80 --target-port 80 --type LoadBalancer

# List services running on the cluster
kubectl get svc

az aks scale --resource-group <resource group> --name <cluster name> --node-count <node count>

# Upgrade the cluster version
#
az aks upgrade --resource-group <resource group> --name <cluster name> --kubernetes-version <kubernetes version>



