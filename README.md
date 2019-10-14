# Helm + Python Dummy Server

An experimental project to use `helm` as deployment tool.
This just deploys a small dummy python server on possibly a
local cluster.

It uses microk8s as kube cluster.  
The default ingress plugin is `nginx`.

### Commands

```shell script
# snap dependecies
sudo snap install docker
sudo snap install microk8s --channel=1.15/stable --classic

# enable required microk8s plugins
microk8s.enable dns
microk8s.enable registry
microk8s.enable helm
microk8s.enable ingress

# modify docker config and restart
vi /etc/docker/daemon.json                               
{
    "insecure-registries" : ["localhost:32000"] 
}
sudo snap restart docker

# build and push images
docker build -t localhost:32000/python-app:0.1.0 .  # or make build-image
docker push localhost:32000/python-app:0.1.0        # or make push-image


# helm commands
helm package gahan-python-app-chart
helm install gahan-python-app-chart-0.1.7.tgz -n my-app
```

> Bonus: if you use `ngrok` for testing it out then don't forget to change `host` in `values.yaml` for ingress.