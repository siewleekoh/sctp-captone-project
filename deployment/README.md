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


