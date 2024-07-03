## Development in docker-compose

- To start the frontend and backend containers.

```
cd deployment/docker-compose
docker-compose up
```

- To rebuild new images without using the cache.

```
docker-compose down
docker-compose build --no-cache
docker-compose up
```

## Environment variables management
- `.env` files that are used for backend and frontend image build will be replaced by `env` variables in the k8s`frontend.yaml` \
  and `backend.yaml` files.
- local development - Makefile
- production - CI/CD pipeline

## Minikube
```
minikube start
minikube dashboard
minikube stop
minikube delete

minikube addons enable heapster
minikube addons open heapster
minikube addons enable ingress
```
