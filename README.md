Kubernetes deployments and related
==================================

Collection of k8s resources for deployment of different applications on self-hosted k8s cluster.

Note: passwords in these files are used only at deployment stage and changed manually afterwards.

* router-ingress.yaml

  Proxy for router web ui

* mysql.yaml and postgres.yaml

  Database resources

* confluence.yaml
* jira.yaml
* gitea.yaml
* Seafile

  SeafileCT/ - common docker image ccnet, seafile and seahub

  seafile.yaml - set of resources for seafile.

  Pod consists of 4 containers: ccnet, seaf, seahub and seahubstatic (on nginx image).

  One init container is used to install/upgrade.

* SSH service

  Used as jump server, as development box (has golang an python, git), as management server for docker and k8s, etc

  SSHct/ - docker image (from debian 9) for container with SSH service, which starts tmux

  sshct.yaml - set of k8s resources for SSH service.

