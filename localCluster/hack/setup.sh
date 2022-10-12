#!/usr/bin/env bash

set -euxo pipefail

docker network create --opt "com.docker.network.driver.mtu=1450"\
   "${DOCKER_NETWORK_NAME}" || true

drone exec --trusted --env-file=.envrc --network="${DOCKER_NETWORK_NAME}"

# # Verify registry
docker pull nginx:latest
docker tag nginx:latest "${REGISTRY_NAME}.localhost:${REGISTRY_HOST_PORT}/nginx:latest"
docker push  "${REGISTRY_NAME}.localhost:${REGISTRY_HOST_PORT}/nginx:latest"

# # Kubernetes
kubectl create ns test
kubectl create -n test deployment hello-server --image="harness-cd-demo-registry.localhost/nginx:latest"
kubectl rollout status -n test deployment.apps/hello-server --timeout=30s
kubectl delete -n test deployment hello-server

chmod 0700 "$KUBECONFIG"