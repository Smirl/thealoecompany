# The Aloe Company

This is a simple single page website for The Aloe Company, a forever living
products distributor.

## Deployment

Deployment is to a kubernetes cluster. A few steps need to be done including
secret and service account set up. There are also manual deployment steps for
reference.

## Secrets

The following secrets need to be in the deployment namespace.

    kubectl create ns thealoecompany
    kubectl create secret docker-registry registry.smirlwebs.com --docker-server=registry.smirlwebs.com --docker-username=XXXXX --docker-password=XXXXXXX --docker-email=smirlie@googlemail.com
    
    kubectl create secret generic amplify --from-literal=api_key=XXXXXXXX

### Manually
To deploy build the docker image, being sure to change the version:

    docker build -t registry.smirlwebs.com/smirl/thealoecompany:1.0.2 .

Login to the cluster:

    doctl kubernetes cluster kubeconfig save ...
    kubectl ns thealoecompany

If not already created, add the secrets from the steps above.

Then apply to kubernetes, again remember to change the version and commit:

    helm2 template ./deploy/chart --name thealoecompany --namespace thealoecompany --set version=1.0.15 --set BaseURL=thealoecompany.com > output.yaml
    kubectl apply -f output.yaml
