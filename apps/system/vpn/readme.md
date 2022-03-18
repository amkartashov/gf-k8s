# Vpn client daemonset

Based on

<https://garunski.medium.com/openvpn-and-minikube-25511099f8de>

<https://github.com/garunski/open-vpn-connect-chart/>

VPN configuration files are from <https://support.fastestvpn.com/download/openvpn-tcp-udp-config-files/>

After installation, it's needed to create `vpn-creds` secret with:

```bash
$ cat <<-EOF > creds
username
password
EOF

$ kubectl --context=gullfaxi --namespace vpn \
    create secret generic vpn-creds \
    --from-file=creds=./creds
```

To disable:

```bash
kubectl --context=gullfaxi label nodes gullfaxi vpn-
```

To enable:

```bash
kubectl --context=gullfaxi label nodes gullfaxi vpn=""
```
