# GitOps ArgoCD-based HomeLab Development Environment

Fully automated Kubernetes and GitOps setup to host my important services at home.

Note: We can use GitHub repos (`APPS repos`) and GitHub Actions (GitOps CI) to build docker images. Once CI execution is done, the artifact will be pushed (push containers images to docker registry & setup images tags in this `INFRA repo` apps folder: helm charts or k8s manifests + kustomize) and ArgoCD will be taking care of the CD -> Ref: https://github.com/adavarski/ArgoCD-GitOps-playground

Read the [Docs](https://adavarski.github.io/homelab) for technical details.

## Hardware

HP server:
- CPU: `8 x Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz`
- RAM: `16GB`
- SSD: `512GB`
- Server IP: `192.168.1.99`

## Getting Started

Clone the repository:

```sh
$ git clone https://github.com/adavarski/homelab
```

## Dependencies

- [Go Task](https://taskfile.dev/installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [k3d](https://k3d.io/#installation) 

 Note: repo Docs -> Install [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/#latest) including [image processing dependencies](https://squidfunk.github.io/mkdocs-material/setup/dependencies/image-processing)

```
### Go Task example (Go Task is like GNU make, but better)
$ sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
$ task --list-all
task: Available tasks for this project:
* bootstrap:                           
* dev:                                 
* dev:cleanup:                         
* scripts:argocd-admin-password: 
* scripts:grafana-admin-password:
```

## Develop

### Bootstrap

Run the task `dev` to fully bootstrap the development environment.

```bash
$ task dev
```

After waiting ~5 minutes we should be able to reach the hosted services at `https://*.192.168.1.99.nip.io`, for example at [http://argocd.192.168.1.99.nip.io](https://argocd.192.168.1.99.nip.io).

Warning "Caveats"

    - No persistent storage

### Explore

Get access to secrets by using some task scripts:

```bash
$ task scripts:argocd-admin-password
$ task scripts:grafana-admin-password

$ kubectl get ing --all-namespaces
NAMESPACE    NAME                                    CLASS   HOSTS                            ADDRESS      PORTS   AGE
argocd       argocd-ingress                          nginx   argocd.192.168.1.99.nip.io       172.28.0.2   80      99m
monitoring   monitoring-grafana                      nginx   grafana.192.168.1.99.nip.io      172.28.0.2   80      93m
element      element-elementweb                      nginx   chat.192.168.1.99.nip.io         172.28.0.2   80      93m
excalidraw   excalidraw                              nginx   draw.192.168.1.99.nip.io         172.28.0.2   80      93m
monitoring   monitoring-kube-prometheus-prometheus   nginx   prometheus.192.168.1.99.nip.io   172.28.0.2   80      93m

```

#### Screenshots

Browser: 
- ArgoCD: http://argocd.192.168.1.99.nip.io:8888
- Prometheus: http://prometheus.192.168.1.99.nip.io:8888
- Grafana: http://grafana.192.168.1.99.nip.io:8888

| ArgoCD |
| :--: |
| ![ArgoCD dashboard screenshot](docs/images/homelab-argocd.png) |


## Clean up

Run the task `dev:cleanup` to clean up (delete the local test Kubernetes cluster)

```bash
$ task dev:cleanup
```

