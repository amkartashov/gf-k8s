===============================================================================
GitOps repository for kubernetes cluster
===============================================================================

Applications & Projects
===============================================================================

+-------------------------------------------------------------------------------------------------------------------------+
| Project                                                                                                                 |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Application                  | Description                                                    | Status                  |
+==============================+================================================================+=========================+
| `Default Project`_, **umbrella app-of-apps applications**                                                               |
+------------------------------+----------------------------------------------------------------+-------------------------+
| System_                      | System app of apps                                             | |system_status|         |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Apps_                        | Main app of apps                                               | |apps_status|           |
+------------------------------+----------------------------------------------------------------+-------------------------+
| `System Project`_, **cluster system applications**                                                                      |
+------------------------------+----------------------------------------------------------------+-------------------------+
| ArgoCD_                      | `GitOps tool for Kubernetes`_                                  | |argocd_status|         |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Cert-Manager_                | `Certificate Management`_                                      | |cert-manager_status|   |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Cilium_                      | `Cluster CNI plugin`_                                          | |cilium_status|         |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Grafana-Operator_            | `Grafana Operator`_                                            | |grafana-op_status|     |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Grafana_                     | Grafana                                                        | |grafana_status|        |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Ingress-Nginx_               | `Ingress Controller`_                                          | |ingress-nginx_status|  |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Kube-Api_                    | Kube API exposed via ingress                                   | |kube-api_status|       |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Kube-State-Metrics_          | `Kubernetes Metrics`_                                          | |ksm_status|            |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Local-Path-Provisioner_      | `Rancher Local-Path`_                                          | |local-path_status|     |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Victoria-Metrics-Operator_   | `Victoria Metrics Operator`_                                   | |vm-op_status|          |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Victoria-Metrics_            | `Victoria Metrics`_                                            | |vm_status|             |
+------------------------------+----------------------------------------------------------------+-------------------------+
| `Apps Project`_, **user level applications**                                                                            |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Oauth2-proxy_                | `Oauth2 Proxy`_                                                | |oauth2-proxy_status|   |
+------------------------------+----------------------------------------------------------------+-------------------------+
| SSHCT_                       | `Personal container with ssh`_                                 | |sshct_status|          |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Websites_                    | * https://a.ioot.xyz                                           | |websites_status|       |
|                              | * https://router.ioot.xyz                                      |                         |
+------------------------------+----------------------------------------------------------------+-------------------------+

.. _`Default Project`: https://argocd.ioot.xyz/applications?proj=default

.. _System: https://argocd.ioot.xyz/applications/argocd/system
.. |system_status| image:: https://argocd.ioot.xyz/api/badge?name=system&revision=true

.. _Apps: https://argocd.ioot.xyz/applications/argocd/apps
.. |apps_status| image:: https://argocd.ioot.xyz/api/badge?name=apps&revision=true

.. _`System Project`: https://argocd.ioot.xyz/applications?proj=system

.. _ArgoCD: https://argocd.ioot.xyz/applications/argocd/argocd
.. _GitOps tool for Kubernetes: https://argo-cd.readthedocs.io
.. |argocd_status| image:: https://argocd.ioot.xyz/api/badge?name=argocd&revision=true

.. _Cert-Manager: https://argocd.ioot.xyz/applications/argocd/cert-manager
.. _Certificate Management: https://cert-manager.io/
.. |cert-manager_status| image:: https://argocd.ioot.xyz/api/badge?name=cert-manager&revision=true

.. _Cilium: https://argocd.ioot.xyz/applications/argocd/cilium
.. _Cluster CNI plugin: https://github.com/cilium/cilium
.. |cilium_status| image:: https://argocd.ioot.xyz/api/badge?name=cilium&revision=true

.. _Ingress-Nginx: https://argocd.ioot.xyz/applications/argocd/ingress-nginx
.. _Ingress Controller: https://github.com/kubernetes/ingress-nginx
.. |ingress-nginx_status| image:: https://argocd.ioot.xyz/api/badge?name=ingress-nginx&revision=true

.. _Kube-State-Metrics: https://argocd.ioot.xyz/applications/argocd/kube-state-metrics
.. _Kubernetes Metrics: https://github.com/kubernetes/kube-state-metrics
.. |ksm_status| image:: https://argocd.ioot.xyz/api/badge?name=kube-state-metrics&revision=true

.. _Kube-Api: https://argocd.ioot.xyz/applications/argocd/kube-api
.. |kube-api_status| image:: https://argocd.ioot.xyz/api/badge?name=kube-api&revision=true

.. _Grafana-Operator: https://argocd.ioot.xyz/applications/argocd/grafana-operator
.. _Grafana Operator: https://github.com/grafana-operator/grafana-operator
.. |grafana-op_status| image:: https://argocd.ioot.xyz/api/badge?name=grafana-operator&revision=true

.. _Grafana: https://argocd.ioot.xyz/applications/argocd/grafana
.. |grafana_status| image:: https://argocd.ioot.xyz/api/badge?name=grafana&revision=true

.. _Local-Path-Provisioner: https://argocd.ioot.xyz/applications/argocd/local-path-provisioner
.. _Rancher Local-Path: https://github.com/rancher/local-path-provisioner
.. |local-path_status| image:: https://argocd.ioot.xyz/api/badge?name=local-path-provisioner&revision=true

.. _Victoria-Metrics-Operator: https://argocd.ioot.xyz/applications/argocd/victoria-metrics-operator
.. _Victoria Metrics Operator: https://github.com/VictoriaMetrics/operator
.. |vm-op_status| image:: https://argocd.ioot.xyz/api/badge?name=victoria-metrics-operator&revision=true

.. _Victoria-Metrics: https://argocd.ioot.xyz/applications/argocd/victoria-metrics
.. _Victoria Metrics: https://victoriametrics.com/
.. |vm_status| image:: https://argocd.ioot.xyz/api/badge?name=victoria-metrics&revision=true

.. _`Apps Project`: https://argocd.ioot.xyz/applications?proj=apps

.. _Oauth2-proxy: https://argocd.ioot.xyz/applications/argocd/oauth2-proxy
.. _Oauth2 Proxy: https://github.com/oauth2-proxy/oauth2-proxy
.. |oauth2-proxy_status| image:: https://argocd.ioot.xyz/api/badge?name=oauth2-proxy&revision=true

.. _SSHCT: https://argocd.ioot.xyz/applications/argocd/sshct
.. _Personal container with ssh: https://github.com/amkartashov/dockerfiles/tree/master/sshct
.. |sshct_status| image:: https://argocd.ioot.xyz/api/badge?name=sshct&revision=true

.. _Websites: https://argocd.ioot.xyz/applications/argocd/websites
.. |websites_status| image:: https://argocd.ioot.xyz/api/badge?name=websites&revision=true


Cluster initialization
===============================================================================

Single node cluster.

OS: Debian 11

Cluster created with kubeadm https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

ArgoCD bootstrap
-------------------------------------------------------------------------------

* Create ssh key for argocd, f.e. ``ssh-keygen -f .ssh/argocd.ioot.xyz``

* Add pub key .ssh/argocd.ioot.xyz.pub to https://github.com/amkartashov/gf-k8s/settings/keys/new

* Run bootstrap script ``scripts/bootstrap.sh -k gullfaxi -e gullfaxi``

* Add git repo:

  .. code-block:: bash

    argocd login --grpc-web argocd.ioot.xyz
    argocd repo add git@github.com:amkartashov/gf-k8s --ssh-private-key-path ~/.ssh/argocd.ioot.xyz


* Create new Oauth application https://github.com/settings/applications/new:

  * Application name: oauth2.ioot.xyz
  * Homepage URL: https://oauth2.ioot.xyz
  * Authorization callback URL: https://oauth2.ioot.xyz/oauth2/callback
  * Update oauth2-proxy client id, secret and cookie secret:

    .. code-block:: bash

      argocd app set argocd/oauth2-proxy --parameter config.clientID REPLACE
      argocd app set argocd/oauth2-proxy --parameter config.clientSecret REPLACE
      argocd app set argocd/oauth2-proxy --parameter config.cookieSecret `pwgen -1 32`

* Create new Oauth application https://github.com/settings/applications/new:

  * Application name: argocd.ioot.xyz
  * Homepage URL: https://argocd.ioot.xyz/
  * Authorization callback URL: https://argocd.ioot.xyz/api/dex/callback
  * Update dex client id and secret:

    .. code-block:: bash

      kubectl --context gullfaxi -n argocd patch secret argocd-secret \
      --patch='{"stringData": {
        "dex.github.clientId": "REPLACE",
        "dex.github.clientSecret": "REPLACE"
      }}'

* Create new Oauth application https://github.com/settings/applications/new:

  * Application name: grafana.ioot.xyz
  * Homepage URL: https://grafana.ioot.xyz/
  * Authorization callback URL: https://grafana.ioot.xyz/login/github
  * Update client secret and admin password:

    .. code-block:: bash

      argocd app set argocd/grafana --parameter githubClientSecret=REPLACE
      argocd app set argocd/grafana --parameter adminPassword=`pwgen -1 12`

* Remove secret ``kubectl --context gullfaxi -n argocd delete secret argocd-initial-admin-secret``.

Passing Sensitive Parameters in ArgoCD apps
===============================================================================

Used methods:

* manually creating K8s secrets

  F.e. this way is used to configure repo secret in argocd.

* manually updating K8s secrets

  F.e. this way is used to configure GitHub Oauth App client secret.

* modifying helm parameters in application

  F.e. this is done for Oauth2 Proxy application.

ArgoCD application types which can be used
===============================================================================

Directory Application
-------------------------------------------------------------------------------

Helm Applications
-------------------------------------------------------------------------------

Helm Application with Embedded Values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Helm Application with Values from Git
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Helm Application with Additional Manifests from Git
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

