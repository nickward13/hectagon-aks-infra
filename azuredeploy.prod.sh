#!/bin/sh
az group create --name hectagon-aks --location "centralus"
#az group deployment create --resource-group hectagon-aks --template-file azuredeploy.json --parameters @azuredeploy.parameters.prod.json
az aks create --resource-group hectagon-aks --name hectagonk8s2 --node-count 1 --generate-ssh-keys
az aks get-credentials --resource-group=hectagon-aks --name=hectagonk8s2
kubectl create -f aspnetcoreapp.yml
kubectl get service aspnetcoreapp --watch

