## GitOps ArgoCD-based HomeLab Development Environment

Fully automated Kubernetes and GitOps setup to host my important services at home.

Note: K3s is a lightweight K8s distribution. K3d is a wrapper to run K3s in Docker. K3d/K3s are especially good for development and CI purposes.


Note: We can use GitHub repos (`APPS repos`) and GitHub Actions (GitOps CI) to build docker images. Once CI execution is done, the artifact will be pushed (push containers images to docker registry & setup images tags in this `INFRA repo` apps folder: helm charts or k8s manifests + kustomize) and ArgoCD will be taking care of the CD -> Ref: https://github.com/adavarski/ArgoCD-GitOps-playground && https://github.com/adavarski/k3d-GH-Actions &&  https://github.com/adavarski/gitops-k3d-tekton-argocd (example using Tekton to build/test/push docker images)

Note: Renovate watches this Git repository and creates pull requests (PRs) when it finds updates to Docker images, Helm charts, and other dependencies. 

Read the [Docs](https://adavarski.github.io/homelab) for technical details.

## Development Environment

devops server IP: `192.168.1.99`

### Getting Started

Clone the repository:

```sh
$ git clone https://github.com/adavarski/homelab
```

### Dependencies

- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Go Task](https://taskfile.dev/installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [k3d](https://k3d.io/#installation) 

 Note: repo Docs -> Install [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/#latest) including [image processing dependencies](https://squidfunk.github.io/mkdocs-material/setup/dependencies/image-processing)

```
### Go Task installation (Go Task as a more modern iteration of the Makefile utility)
$ sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
```

### Develop

#### Bootstrap

Run the task `dev` to fully bootstrap the development environment.

```bash
$ task dev
```

After waiting ~5 minutes we should be able to reach the hosted services at `http://*.192.168.1.99.nip.io:8888`, for example at [http://argocd.192.168.1.99.nip.io:8888](https://argocd.192.168.1.99.nip.io:8888).

Warning "Caveats"

    - No persistent storage

#### Explore

Get access to secrets by using some task scripts:

```bash
$ task --list-all
task: Available tasks for this project:
* bootstrap:                           
* dev:                                 
* dev:cleanup:                         
* scripts:argocd-admin-password: 
* scripts:grafana-admin-password:
$ task scripts:argocd-admin-password
$ task scripts:grafana-admin-password
```
Ingresses:

```bash
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
| Prometheus |
| ![Grafana dashboard screenshot](docs/images/homelab-prometheus.png) |
| Grafana |
| ![Grafana dashboard screenshot](docs/images/homelab-grafana.png) |

Note: We can import the example Dashboard for Argo CD. The dashboard can be found in the GitHub repository of the Argo CD project at https://github.com/argoproj/argo-cd/blob/master/examples/dashboard.json.

 ![Grafana dashboard screenshot](docs/images/homelab-grafana-argocd-dashboard.png) 

### Clean up

Run the task `dev:cleanup` to clean up (delete the local test Kubernetes cluster)

```bash
$ task dev:cleanup
```

