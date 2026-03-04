#!/bin/sh

mariadb-install-db --datadir=/var/lib/mysql

exec mariadbd
