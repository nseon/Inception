# Inception
*This project has been created as part of the 42 curriculum by nseon.*

# Description

## Overview
This project aims to introduce us to docker by implementing 3 services: nginx, mariadb and wordpress.

## Definitions
First of all let's explain what all of that is.

**Docker** is a software platform that allows you to build, test, and deploy applications quickly. It package an application and its dependencies into a image, which is then used to deploy a container.

An **image** is like a bluebrint of the application.

A **container** is like a VM but dedicated to one application only.

**Volumes** are persistent data stores for containers.
A Docker volume is fully managed by docker, instead of a Bind mount, which is managed by the host

A **Docker network (Bridge Network)** is a virtual and isolated communication layer that allows containers to have their own IP and talk to each other.
Unlike a **Host network**, which is not isolated meaning containers share the host's IP. They listen directly on the host's ports.

A **secret** is a file used to securely store sensitive data (passwords, API keys, certificates)

An **environment variable** is a dynamic value on your computer that can affect the behavior of processes running on the computer

## Details
In this project we have 3 containers, each containing a service:

**- Nginx (a web server software)**<br>
**Role**: It handles SSL/TLS encryption and serves static files.<br>
**Interaction**: When a user requests a PHP page, Nginx doesn't process it directly. Instead, it forwards the request to the WordPress container using the FastCGI protocol.

**- Wordpress (a content management system)**<br>
**Role**: It executes the PHP code to generate dynamic HTML content.<br>
**Interaction**: To build a page, WordPress needs data (posts, users, settings). It sends SQL queries to the MariaDB container.

**- Mariadb (a database management system)**:<br>
**Role**: It securely stores all persistent data for the website.<br>
**Interaction**: It is strictly isolated and only accepts connections from the WordPress container. It has no direct exposure to the external network.

# Instructions 

setup, build and start the containers
```
make
```

setup the .secret/ and the data/
```
make setup
```

build docker images
```
make build
```

start containers
```
make up
```

stop containers
```
make stop
```

delete containers
```
make down
```

delete persistent data
```
make clear
```

stop the containers, clear the data, rebuild images and restart containers
```
make re
```

# Ressources

>AI was used to improve understanding of certains concept and resolve some issues

Docker documentation: https://docs.docker.com/

Services documentation:<br>
	mariadb: https://mariadb.com/docs <br>
	wordpress: https://wordpress.org/documentation/ <br>
	nginx: https://nginx.org/en/docs/ <br>

nginx.conf: https://www.ionos.fr/digitalguide/hebergement/blogs/installer-wordpress-sur-nginx/

Volumes documentation: https://docs.docker.com/engine/storage/volumes/

FCGI: https://kubernetes.github.io/ingress-nginx/user-guide/fcgi-services/

Docker on alpine: https://oleks.ca/2025/10/13/installation-de-docker-sur-alpine-linux/
