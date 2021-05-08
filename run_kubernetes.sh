#!/usr/bin/env bash


# Step 1:
# This is your Docker ID/path
dockerpath=shikhas/demowebsite:1

# Step 2
# Run the Docker Hub container with kubernetes
minikube kubectl -- create deployment demowebsite-app --image=docker.io/shikhas/demowebsite:1


# Step 3:
# List kubernetes pods
minikube kubectl -- get pods
export POD_NAME=$(minikube kubectl -- get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
#echo name of the pod
echo Name of the Pod: $POD_NAME

# Step 4:
# Forward the container port to a host
minikube kubectl -- expose deployment/demowebsite-app --type="NodePort" --port 8090
minikube kubectl -- port-forward pod/$POD_NAME 8090:80

