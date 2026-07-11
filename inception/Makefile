COMPOSE = docker compose -f ./srcs/docker-compose.yml

up:
	$(COMPOSE) up --build -d #--b: reconstruire les image quand tu veus lancer le conteneur

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

start:
	$(COMPOSE) start

status:
	docker ps

clean:
	$(COMPOSE) down -v

fclean: clean
	docker system prune -af 

re: fclean up