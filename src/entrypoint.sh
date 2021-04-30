#!/usr/bin/env bash

set -e
set -o pipefail

KUBECTL_VER=$2
if [[ "${KUBECTL_VER}" != "" ]]; then
  curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl \
  -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
fi

if [[ ! -e ~/.kube/config ]]; then
    mkdir -p ~/.kube
    touch ~/.kube/config
fi
out="$($3)"
echo $out > ~/.kube/config

echo ">>> Executing command <<<"
echo ""
echo ""

bash -c "set -e;  set -o pipefail; $1"