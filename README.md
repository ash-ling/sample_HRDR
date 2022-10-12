# Drone Harness CD Demo

## Setup Local Cluster

## Update `.drone.yml`

```shell
envsubst < .drone.tpl.yml >  .drone.yml
```

Ref: <https://k3d.io/v5.4.4/usage/registries/#testing-your-registry>

```shell
cd localCluster
./hack/setup.sh
```

## Building Application

Build Application using Drone CI extension,

```shell
git clone https://github.com/harness-apps/drone-ci-101
```

Import the project `java-hello-world` into Docker CI Extension. Edit the `.drone.yml` and update the container registry map the exposed port.

To find the exposed port run the following command,

```shell
docker ps --filter=name=${REGISTRY_NAME}
```
