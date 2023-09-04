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
| Ingress-Nginx_               | `Ingress Controller`_                                          | |ingress-nginx_status|  |
+------------------------------+----------------------------------------------------------------+-------------------------+
| Local-Path-Provisioner_      | `Rancher Local-Path`_                                          | |local-path_status|     |
+------------------------------+----------------------------------------------------------------+-------------------------+
| `Apps Project`_, **user level applications**                                                                            |
+------------------------------+----------------------------------------------------------------+-------------------------+

.. _`Default Project`: https://argocd.ioot.xyz/applications?proj=default
.. _`System Project`: https://argocd.ioot.xyz/applications?proj=system
.. _`Apps Project`: https://argocd.ioot.xyz/applications?proj=apps

.. _System: https://argocd.ioot.xyz/applications/argocd/system
.. |system_status| image:: https://argocd.ioot.xyz/api/badge?name=system&revision=true

.. _Apps: https://argocd.ioot.xyz/applications/argocd/apps
.. |apps_status| image:: https://argocd.ioot.xyz/api/badge?name=apps&revision=true

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

.. _Local-Path-Provisioner: https://argocd.ioot.xyz/applications/argocd/local-path-provisioner
.. _Rancher Local-Path: https://github.com/rancher/local-path-provisioner
.. |local-path_status| image:: https://argocd.ioot.xyz/api/badge?name=local-path-provisioner&revision=true


Cluster initialization
===============================================================================

Single node cluster.

OS: Debian 11

Cluster created with kubeadm https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

ArgoCD bootstrap
-------------------------------------------------------------------------------

* Create ssh key for argocd, f.e. `ssh-keygen -f .ssh/argocd.ioot.xyz`

* Add pub key .ssh/argocd.ioot.xyz.pub to https://github.com/amkartashov/gf-k8s/settings/keys/new

* Run bootstrap script `scripts/bootstrap.sh -k gullfaxi -e gullfaxi`

* Add git repo:

  .. code-block:: bash

    argocd login --grpc-web argocd.ioot.xyz
    argocd repo add git@github.com:amkartashov/gf-k8s --ssh-private-key-path ~/.ssh/argocd.ioot.xyz


* Create new Oauth application <https://github.com/settings/applications/new>:

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

* Remove secret ``kubectl --context gullfaxi -n argocd delete secret argocd-initial-admin-secret``.

Passing Sensitive Parameters in ArgoCD apps
===============================================================================

Used methods:

* manually creating K8s secrets (f.e. this way is used to configure repo secret in argocd)
* manually updating K8s secrets (f.e. this way is used to configure GitHub Oauth App client secret)
* modifying helm parameters in application

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

