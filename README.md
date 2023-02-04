## Install


Kubernetes
https://kubernetes.io/docs/tasks/tools/
Argocd
https://argo-cd.readthedocs.io/en/stable/getting_started/


## Run local


Start local Kubernetes
```
minikube start
```


Forward port to argocd and open in browser `localhost:8080`
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```


Find admin password with `kubectl` and login in `argocd` as admin
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```


## Create nodejs service


Build docker image
```
docker build -t my-repository/svc-nodejs:0.0.1 .
```
**NOTE**
`my-repository` is docker repository


Push docker image
```
docker push my-repository/svc-nodejs:0.0.1
```


Create app with Kubernetes
```
kubectl apply -f application.yaml 
```