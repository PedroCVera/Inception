DOCKER_COMPOSE := docker compose -f srcs/docker-compose.yml
NGINX_DOCKERFILE := srcs/requirements/nginx/Dockerfile


up:
	mkdir -p /home/inception/data/mysql
	mkdir -p /home/inception/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

down:
	${DOCKER_COMPOSE} down

PHONY: build up down
