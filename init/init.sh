#! /bin/bash
podman machine start
kind create cluster
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=./creds.txt -o yaml --dry-run=client > secret.yaml
kubectl apply -f secret.yaml
sleep 20
kubectl apply -f provider.yaml
sleep 10
kubectl apply -f provider-config.yaml