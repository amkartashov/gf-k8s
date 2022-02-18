install ingress-nginx

```
$ helm dep update apps/system/ingress-nginx
$ kubectl --context=gullfaxi create namespace ingress-nginx
$ helm template ingress-nginx --namespace ingress-nginx apps/system/ingress-nginx | kubectl --context=gullfaxi --namespace ingress-nginx apply -f -
```

install cert-manager with cluster issuer

```
$ helm repo add jetstack https://charts.jetstack.io
$ helm dep update apps/system/cert-manager
$ kubectl --context=gullfaxi create namespace cert-manager
$ kubectl --context=gullfaxi label namespace cert-manager certmanager.k8s.io/disable-validation="true"
$ kubectl --context=gullfaxi apply --validate=false -f apps/system/cert-manager/templates/cert-manager.crds.yaml
$ helm template cert-manager --namespace cert-manager apps/system/cert-manager | kubectl --context=gullfaxi apply -f -
```

install argocd

```
$ kubectl --context=gullfaxi apply -k apps/argocd
```

add dex.github.clientId and dex.github.clientSecret into argo-secret

```
$ kubectl --context=gullfaxi -n argocd edit secret argocd-secret
```

add argocd public key as deploy key to gf-k8s repo

log into argocd

```
$ argocd login --grpc-web argocd.gorilych.ru
```

add repo

```
argocd --grpc-web repo add git@github.com:amkartashov/gf-k8s --ssh-private-key-path ~/argocd-key
```

create main app

```
$ argocd --grpc-web app create main \
    --dest-namespace argocd \
    --dest-server https://kubernetes.default.svc \
    --repo git@github.com:amkartashov/gf-k8s \
    --path main \
    --directory-recurse \
    --sync-policy automated \
    --self-heal --auto-prune
```
