## Install


Kubernetes
https://kubernetes.io/docs/tasks/tools/
Argocd
https://argo-cd.readthedocs.io/en/stable/getting_started/


## Run Kubernetes


Start local Kubernetes
```
minikube start
```


Forward port to argocd and open in browser localhost:8080
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```


Find admin password and login in argocd as admin
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```


## Create service


Build docker image
```
docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag docker-repository/svc-nodejs:0.0.1 .
```


Push docker image
```
docker push docker-repository/svc-nodejs:0.0.1
```


Specify your image in deployment.yaml file and create app with Kubernetes
```
kubectl apply -f application.yaml 
```


## Run with docker


Run with docker cli
```
docker run --rm -it -p 127.0.0.1:3000:3000 docker-repository/svc-nodejs:0.0.1
```


Run with docker cli using docker-compose.yaml file
```
docker compose --env-file .env up --build
```
