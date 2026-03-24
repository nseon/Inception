# Developper Documentation

## Prerequisites

You have to install:

- Docker
- Make

## Start and stop the project

First you need to run this command to create env/ & .secrets/ files
```
make setup
```
next, you have to configure them, it contains usernames and passwords.<br>

When its done, build you images with
```
make build
```
To start the services
```
make up
```
To stop the services
```
make stop
```

## Useful Docker Commands

```
docker ps # List running containers
docker logs <container_name> # Show container logs
docker images # List images
docker exec -it <container> sh # Exec a shell in a container
```

## Useful Docker Compose Commands

```
docker compose build # Build service images
docker compose up # Start and create containers if needed
docker compose down # Stop containers
docker compose down -v # Remove containers and associated volumes
```

## Data Persistence

Data is stored using bind mounts.

- MariaDB stores its database data in a directory on the host
- WordPress shares files with Nginx through a bind-mounted directory

All data is located on the host in `/home/nseon/data/`. Since bind mounts are directly linked to the host filesystem, the data persists even if containers are removed.
