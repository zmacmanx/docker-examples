
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

# You must have download the yaml file
kubectl create -f .\azure-vote-all-in-one-redis.yaml

kubectl get nodes

kubectl get pods --watch

kubectl get svc --watch

# Get the public ip and run a curl command or browers

# New Deployment
kubectl run --image=nginx myweb

# Get a list of the deployments
kubectl get deploy

# Get a list of the pods
kubectl get pods
 
# Get the pod for the new deployment
kubectl expose pod myweb-999d5fcbc-5sl67 --port=80 --target-port=80 --type=LoadBalancer

# Wait to see the new ip show up and notice the ip is added to the load balancer not a new load balancer
kubectl get svc --watch

az aks scale --resource-group=kubequest --name=kubequest --node-count 2

# Setup Cloud Health
kubectl config view --minify

# This was given to us from the cloud health website - it looks generated so you need to go to cloud health first.
# export CHT_API_TOKEN=5f08dcb47ddcb7ce652cfdc35b1503624ffb917f9b0f49b8
# export CHT_CLUSTER_NAME=Azure_Kubenetes
# kubectl create secret generic --namespace default --from-literal=api-token=$CHT_API_TOKEN --from-literal=cluster-name=$CHT_CLUSTER_NAME cloudhealth-config
# kubectl create -f kubernetes-collector-pod-template.yaml

