COMPOSE = docker-compose -f ./srcs/docker-compose.yml

up:
	@$(COMPOSE) up --build -d

down:
	@$(COMPOSE) down

stop:
	@$(COMPOSE) stop

start:
	@$(COMPOSE) start

status:
	@docker ps

clean:
	@$(COMPOSE) down -v

fclean: clean
	@docker system prune -af

re: fclean up