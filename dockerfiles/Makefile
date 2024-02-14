DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml
NGINX_DOCKERFILE := srcs/requirements/nginx/Dockerfile

build:
	${DOCKER_COMPOSE} build

up:
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

PHONY: build up down
