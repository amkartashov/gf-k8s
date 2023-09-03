# GitOps repository for kubernetes cluster

## Cluster initialization

Single node cluster.

OS: Debian 11

Cluster created with kubeadm https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

## ArgoCD bootstrap

```bash

ssh-keygen -f .ssh/argocd.ioot.xyz
# add pub key .ssh/argocd.ioot.xyz.pub to https://github.com/amkartashov/gf-k8s/settings/keys/new

$ scripts/bootstrap.sh -k gullfaxi -e gullfaxi
```
