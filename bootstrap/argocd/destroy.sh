#!/bin/sh

VALUES="values.yaml"

kubectl get ingress argocd-server --namespace argocd \
    || VALUES="values-seed.yaml"

helm template \
    --dependency-update \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    argocd . \
    | kubectl delete -n argocd -f -

