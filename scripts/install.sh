#!/usr/bin/env bash

set -o errexit

KUBECTL=1.18.9
KUSTOMIZE=3.8.4
HELM=3.3.4


echo "downloading kubectl ${KUBECTL}"
curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
-o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

echo "downloading kustomize ${KUSTOMIZE}"
curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE}/kustomize_v${KUSTOMIZE}_linux_amd64.tar.gz | \
tar xz && mv kustomize /usr/local/bin/kustomize

echo "downloading helm ${HELM}"
curl -sSL https://get.helm.sh/helm-v${HELM}-linux-amd64.tar.gz | \
tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64

kubectl version --client
kustomize version
helm version
