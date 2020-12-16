#!/usr/bin/env bash
KUBECTL_ARG=${1:-apply}
export $(egrep -v '^#' .env | xargs)
set -euo pipefail

docker run -it --rm \
    --net host \
    -v "${KUBECONFIG:-${HOME}/.kube/config}":/home/kumactl/.kube/config \
    kong-docker-kuma-docker.bintray.io/kumactl:${KUMA_VERSION} \
    kumactl  install metrics | kubectl "$KUBECTL_ARG" -f -