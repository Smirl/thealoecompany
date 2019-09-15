#!/bin/sh

helm template ./deploy/chart --name thealoecompany --namespace thealoecompany --set version=$VERSION --set BaseURL=thealoecompany.com > output.yaml
cat output.yaml
kubectl apply -f output.yaml
