#! /bin/bash
podman machine start
kind create cluster
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
kubectl apply -f secret.yaml
sleep 20
kubectl apply -f provider.yaml
sleep 10
kubectl apply -f provider-config.yaml