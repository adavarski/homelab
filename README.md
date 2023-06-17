# Adavarski Homelab :sailboat:

Fully automated Kubernetes and GitOps setup to host my important services at home.

Read the [docs](https://adavarski.github.io/homelab) for technical details.

## Hardware

- Dell Inspiron 7580
    - CPU: `8 x Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz`
    - RAM: `16GB`
    - SSD: `128GB`
    - HDD: `1TB`

Install:
- kubectl
- go-task
- k3d
- helm

```
### install tasks (better than GNU make)
sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  9634  100  9634    0     0  70321      0 --:--:-- --:--:-- --:--:-- 70321
go-task/task info checking GitHub for latest tag
go-task/task debug http_download https://github.com/go-task/task/releases/latest
go-task/task info found version: 3.26.0 for v3.26.0/linux/amd64
go-task/task debug downloading files into /tmp/tmp.NZlTHzebrR
go-task/task debug http_download https://github.com/.../v3.26.0/task_linux_amd64.tar.gz
go-task/task debug http_download https://github.com/.../download/v3.26.0/task_checksums.txt
go-task/task info installed /usr/local/bin/task
```

## Screenshots

| ArgoCD |
| :--: |
| ![ArgoCD dashboard screenshot](docs/images/argocd.png) |

| Lens |
| :--: |
| ![Lens (Kubernetes dashboard screenshot)](docs/images/lens.png) |

## Apps

<table>
    <tr>
        <th>Logo</th> <th>Name</th> <th>Description</th>
    </tr>
    <tr>
        <td><img src="https://raw.githubusercontent.com/toboshii/hajimari/main/assets/logo.png" width="48">
        <td><a href="https://hajimari.io">Hajimari</a></td>
        <td>Simplistic startpage for Kubernetes services</td>
    </tr>
    <tr>
        <td><img src="https://docs.excalidraw.com/img/logo.svg" width="48">
        <td><a href="https://docs.excalidraw.com">Excalidraw</a></td>
        <td>Online whiteboard</td>
    </tr>
</table>
