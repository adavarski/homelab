# Development Environment

## Getting Started

Clone the repository and checkout the development branch

```sh
git clone https://github.com/adavarski/homelab
```

## Dependencies

=== "Generic"

    - Homelab
        - [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
        - [Go Task](https://taskfile.dev/installation)
        - [k3d](https://k3d.io/#installation) (only needed for development)

    - Docs
        - Install [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/#latest) including [image processing dependencies](https://squidfunk.github.io/mkdocs-material/setup/dependencies/image-processing)

## Develop

### Bootstrap

Run the task `dev` to fully bootstrap the development environment.

```bash
task dev
```

After waiting ~15 minutes you should be able to reach the hosted services at `https://*.192.168.1.99.nip.io`, for example at [http://argocd.127-0-0-1.nip.io](https://argocd.127-0-0-1.nip.io).

Warning "Caveats"

    - No persistent storage


### Explore

Get access to secrets by using some task scripts:

```bash
task scripts:argocd-admin-password
```

## Clean up

Run the task `dev:cleanup` to clean up (delete the local test Kubernetes cluster)

```bash
task dev:cleanup
```
