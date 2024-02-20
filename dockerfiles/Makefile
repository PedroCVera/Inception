DOCKER_COMPOSE := docker compose -f srcs/docker-compose.yml
NGINX_DOCKERFILE := srcs/requirements/nginx/Dockerfile


up:
	mkdir -p /home/inception/data/mysql
	mkdir -p /home/inception/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

down:
	${DOCKER_COMPOSE} down

prune:
	docker volume rm srcs_db srcs_wp
	docker system prune -a
	rm -rf /home/inception/data/mysql /home/inception/data/wordpress
	mkdir /home/inception/data/mysql /home/inception/data/wordpress

logs:
	docker compose -f srcs/docker-compose.yml logs

PHONY: build up down
