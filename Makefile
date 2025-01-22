all:
	make build
	make up

build:
	mkdir -p  /home/root_user/data/wf
	mkdir -p  /home/root_user/data/db

	sudo chown -R 1000:1000 /home/root_user/data/wf
	sudo chmod -R 775 /home/root_user/data/wf


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
