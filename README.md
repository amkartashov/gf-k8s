# GitOps repository for kubernetes cluster

## Cluster initialization

Single node cluster.

OS: Debian 11

Cluster created with kubeadm https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

## ArgoCD bootstrap

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

## ArgoCD Projects

* `default`: for app-of-apps
* `system`: for cluster system apps, like monitoring + argocd itself
* `apps`: for user level applications
