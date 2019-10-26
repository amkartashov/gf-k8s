

$ helm dep update apps/system/nginx-ingress
$ helm template --name nginx-ingress --namespace nginx-ingress apps/system/nginx-ingress | kubectl --context=gullfaxi --namespace nginx-ingress apply -f -

$ helm repoadd jetstack https://charts.jetstack.io
$ helm dep update apps/system/cert-manager
$ helm template --name cert-manager --namespace cert-manager apps/system/cert-manager | kubectl --context=gullfaxi --namespace cert-manager apply -f -

$ kubectl --context=gullfaxi apply -k apps/argocd
# add dex.github.clientId and dex.github.clientSecret into argo-secret
$ kubectl --context=gullfaxi -n argocd edit secret argocd-secret

(optional)
$ kubectl --context=gullfaxi apply -k apps/system/sealed-secrets
