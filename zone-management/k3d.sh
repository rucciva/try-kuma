#!/usr/bin/env bash
export $(egrep -v '^#' .env | xargs)
set -euo pipefail

k3d cluster create try-kuma -i rancher/k3s:v1.19.5-k3s1

kubectl create namespace kuma-system

helm repo add kuma https://kumahq.github.io/charts
helm install kuma \
    --namespace kuma-system \
    --set controlPlane.mode=remote \
    --set controlPlane.zone=management \
    --set ingress.enabled=true \
    --set controlPlane.kdsGlobalAddress=grpcs://${HOST_IP_ADDRESS}:5685 \
    kuma/kuma

docker run -it --rm \
    --net host \
    -v "${KUBECONFIG:-${HOME}/.kube/config}:"/home/kumactl/.kube/config \
    kong-docker-kuma-docker.bintray.io/kumactl:${KUMA_VERSION} \
    kumactl install dns | kubectl apply -f -