# restaurant-ordering-system

- To set up environmental variables in your local environment, rename `backend/.env.example` to `backend/.env` with updated variables.

- To start the frontend and backend containers.  

```
docker-compose up
```

- To rebuild new images without using the cache.

```
docker-compose down
docker-compose build --no-cache
docker-compose up
```