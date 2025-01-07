
all:
	make build
	make up

build:
	mkdir -p ~/data/wf
	mkdir -p ~/data/db
	docker compose -f srcs/docker-compose.yml build

up:
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

.PHONY : all build up down clean
