setup:
	@mkdir -p srcs/.secrets
	@if [ ! -f srcs/.secrets/db_password.txt ]; then \
		echo "secret" > srcs/.secrets/db_password.txt; \
	fi
	@if [ ! -f srcs/.secrets/wp_admin.txt ]; then \
		printf "nseon\npassword\nnseon@gmail.com\n" > srcs/.secrets/wp_admin.txt; \
	fi
	@if [ ! -f srcs/.secrets/wp_user.txt ]; then \
		printf "njooris\npassword\nnjooris@gmail.com\n" > srcs/.secrets/wp_user.txt; \
	fi
	@mkdir -p ~/data/db_data ~/data/wp_data

build:
	cd srcs ; docker compose build

up:
	cd srcs/ ; docker compose up -d

stop:
	cd srcs; docker compose stop

down:
	cd srcs/ ; docker compose down -v

clear:
	sudo rm -rf ~/data/db_data/* ~/data/wp_data/*

re: down build up
