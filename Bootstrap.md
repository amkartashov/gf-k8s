
create namespaces

```
$ kubectl --context=gullfaxi apply main/templates/namespace-*.yaml
```

install nginx-ingress

```
$ helm dep update apps/system/nginx-ingress
$ helm template --name nginx-ingress --namespace nginx-ingress apps/system/nginx-ingress | kubectl --context=gullfaxi --namespace nginx-ingress apply -f -
```

install cert-manager with cluster issuer

```
$ helm repo add jetstack https://charts.jetstack.io
$ helm dep update apps/system/cert-manager
$ helm template --name cert-manager --namespace cert-manager apps/system/cert-manager | kubectl --context=gullfaxi --namespace cert-manager apply -f -
```

install argocd

```
$ kubectl --context=gullfaxi apply -k apps/argocd
```

add dex.github.clientId and dex.github.clientSecret into argo-secret
add gitPrivateKey

```
$ kubectl --context=gullfaxi -n argocd edit secret argocd-secret
```

add argocd public key as deploy key to gf-k8s repo

log into argocd

```
$ argocd login argocd-grpc.gorilych.ru 
```

create main app

```
$ argocd app create main \
    --dest-namespace argocd \
    --dest-server https://kubernetes.default.svc \
    --repo git@github.com:gorilych/gf-k8s.git \
    --path main \
    --sync-policy automated \
    --self-heal --auto-prune
```
