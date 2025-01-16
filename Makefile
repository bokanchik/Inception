all:
	make build
	make up

build:
	mkdir -p  /home/${USER}/data/wf
	mkdir -p  /home/${USER}/data/db
	docker compose -f srcs/docker-compose.yml build

up:
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose -f srcs/docker-compose.yml down

ps:
	docker compose -f srcs/docker-compose.yml ps

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

.PHONY : all build up down clean ps
