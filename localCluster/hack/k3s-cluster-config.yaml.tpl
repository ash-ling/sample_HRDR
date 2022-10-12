apiVersion: k3d.io/v1alpha4
kind: Simple
metadata:
  name: ${K3D_CLUSTER_NAME}
servers: 1
image: rancher/k3s:v1.24.3-k3s1
network: ${DOCKER_NETWORK_NAME}
registries:
  create: 
    name: ${REGISTRY_NAME}
    host: "0.0.0.0"
    hostPort: "${REGISTRY_HOST_PORT}"
  config: |
    mirrors:
      "${REGISTRY_NAME}.localhost":
        endpoint:
          - http://host.k3d.internal:5001