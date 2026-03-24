# User Documentation

## Services & utility

This setup contains everything needed to run a basic WordPress website.
It uses MariaDB as the database and Nginx as the web server.

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

You can check the status of the containers with the followinf command, if it is Up, it means their are running
```
docker ps
```

To access the website:
```https://<host_ip>/``` or ```nseon.42.fr```
 
To access the WordPress admin panel:
```https://<host_ip>/wp-admin```
