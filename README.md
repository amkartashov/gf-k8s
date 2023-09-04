# GitOps repository for kubernetes cluster

## Applications&Projects

|  Application   | Description | Status |
|----------------|-------------|--------|
|**[`default`](https://argocd.ioot.xyz/applications?proj=default), umbrella app-of-apps**|
| [System](https://argocd.ioot.xyz/applications/argocd/system) | System app of apps |![status](https://argocd.ioot.xyz/api/badge?name=system&revision=true)|
| [Apps](https://argocd.ioot.xyz/applications/argocd/apps) | Main app of apps |![status](https://argocd.ioot.xyz/api/badge?name=apps&revision=true)|
|**[`system`](https://argocd.ioot.xyz/applications?proj=system), cluster system apps**|
| [ArgoCD](https://argocd.ioot.xyz/applications/argocd/argocd) | [GitOps tool for Kubernetes](https://argo-cd.readthedocs.io) |![status](https://argocd.ioot.xyz/api/badge?name=argocd&revision=true)|
| [Cilium](https://argocd.ioot.xyz/applications/argocd/cilium) | [Cluster CNI plugin](https://github.com/cilium/cilium) |![status](https://argocd.ioot.xyz/api/badge?name=cilium&revision=true)|
| [Nginx Ingress Controller](https://argocd.ioot.xyz/applications/argocd/ingress-nginx) | [Ingress Controller](https://github.com/kubernetes/ingress-nginx) |![status](https://argocd.ioot.xyz/api/badge?name=ingress-nginx&revision=true)|
| [Cert Manager](https://argocd.ioot.xyz/applications/argocd/cert-manager) | [Certificate Management](https://cert-manager.io/) |![status](https://argocd.ioot.xyz/api/badge?name=cert-manager&revision=true)|
|**[`apps`](https://argocd.ioot.xyz/applications?proj=apps), user level applications**|

## Cluster initialization

Single node cluster.

OS: Debian 11

Cluster created with kubeadm https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

### ArgoCD bootstrap

* Create ssh key for argocd, f.e. `ssh-keygen -f .ssh/argocd.ioot.xyz`

* Add pub key .ssh/argocd.ioot.xyz.pub to https://github.com/amkartashov/gf-k8s/settings/keys/new

* Run bootstrap script `scripts/bootstrap.sh -k gullfaxi -e gullfaxi`

* Add git repo:
  ```
  argocd login --grpc-web argocd.ioot.xyz
  argocd repo add git@github.com:amkartashov/gf-k8s --ssh-private-key-path ~/.ssh/argocd.ioot.xyz
  ```

* Create new Oauth application <https://github.com/settings/applications/new>:
  * Application name: argocd.ioot.xyz
  * Homepage URL: https://argocd.ioot.xyz/
  * Authorization callback URL: https://argocd.ioot.xyz/api/dex/callback
  * Update dex client id and secret:
    ```
    kubectl --context gullfaxi -n argocd patch secret argocd-secret \
    --patch='{"stringData": {
      "dex.github.clientId": "REPLACE",
      "dex.github.clientSecret": "REPLACE"
    }}'
    ```

* Remove secret `kubectl --context gullfaxi -n argocd delete secret argocd-initial-admin-secret`.

## Passing Sensitive Parameters in ArgoCD apps

Used methods:

* manually creating K8s secrets (f.e. this way is used to configure repo secret in argocd)
* manually updating K8s secrets (f.e. this way is used to configure GitHub Oauth App client secret)
* modifying helm parameters in application

## ArgoCD application types which can be used

### ArgoCD Directory Application

### ArgoCD Helm Applications

#### ArgoCD Helm Application with Embedded Values

#### ArgoCD Helm Application with Values from Git

#### ArgoCD Helm Application with Additional Manifests from Git

