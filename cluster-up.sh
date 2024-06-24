#!/bin/bash

# Check if helmfile is installed
if ! command -v helmfile &> /dev/null; then
    echo "helmfile is not installed. Please install helmfile."
    exit 1
fi

# Check if helm is installed
if ! command -v helm &> /dev/null; then
    echo "helm is not installed. Please install helm."
    exit 1
fi

# Check if helm diff plugin is installed
if ! helm plugin list | grep -q diff; then
    echo "helm diff plugin is not installed. Please install helm diff plugin."
    exit 1
fi
# Check if kind is installed
if ! command -v kind &> /dev/null; then
    echo "kind is not installed. Please install kind."
    exit 1
fi

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "docker is not installed. Please install docker."
    exit 1
fi

# Check if docker daemon is running
if ! docker info &> /dev/null; then
    echo "docker daemon is not running. Please start the Docker daemon."
    exit 1
fi

# Check if cluster is already created
if kind get clusters | grep -q kind; then
    echo "Cluster already exists."
else
    # Create the cluster using kind
    kind create cluster --config cluster.yaml
fi

# Cluster readiness check
kubectl wait --for=condition=Ready pods --all --timeout=5m

# apply helmfile
helmfile apply --file helmfile

# Additional commands or configurations