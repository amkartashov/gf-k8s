Kubernetes deployments and related
==================================

Collection of k8s resources for deployment of different applications on self-hosted k8s cluster.

Note: passwords in these files are used only at deployment stage and changed manually afterwards.

* router-ingress.yaml

  Proxy for router web ui

* k8s-dashboard-ingress.yaml

  Ingress rule for Kubernetes dashboard

* mysql.yaml and postgres.yaml

  Database resources

* confluence.yaml
* jira.yaml
* gitea.yaml
* SSH service

  Used as jump server, as development box (has golang an python, git), as management server for docker and k8s, etc

  SSHct/ - docker image (from debian 9) for container with SSH service, which starts tmux

  sshct.yaml - set of k8s resources for SSH service.

* SSH service with openvpn client

  Similar to SSH service, but not exposed and accessible only within cluster.

  Has 2 containers, the first one is for SSH (from SSHct docker image), another one is for OpenVPN (from dperson/openvpn-client cloned image)

  vpnct.yaml describes the deployment and service.

* torxy.yaml

  Tor/Privoxy service based on https://github.com/rdsubhas/docker-tor-privoxy-alpine
