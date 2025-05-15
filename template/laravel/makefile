SHELL := /bin/bash

ifeq (,$(wildcard .env))
$(shell cp .env.example .env)
endif

include .env

IMAGE_NAME=${PROJECT_NAME}:web-dev
CONTAINER_NAME=${PROJECT_NAME}-web-dev
PORT=8001
DOCKER_EXEC=docker exec -it $(CONTAINER_NAME)

start:
	@if [ ! "$$(docker ps -a -q -f name=$(CONTAINER_NAME))" = "" ]; then \
		echo "Removendo container antigo..."; \
		docker rm -f $(CONTAINER_NAME); \
	fi

	docker build -t $(IMAGE_NAME) .
	docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)
	docker exec -it $(CONTAINER_NAME) php artisan key:generate
	@if [ ! -d vendor ]; then \
		echo "Copiando pasta vendor..."; \
		docker cp $(CONTAINER_NAME):/var/www/vendor ./vendor; \
	else \
		echo "Pasta vendor já existe."; \
	fi
	@if [ ! -f .env ]; then \
		echo "Copiando arquivo .env..."; \
		docker cp $(CONTAINER_NAME):/var/www/.env ./.env; \
	else \
		echo "Arquivo .env já existe."; \
	fi
	docker rm -f $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME)
	mkdir -p storage/certificates

bash:
	$(DOCKER_EXEC) bash

model:
	$(DOCKER_EXEC) php artisan make:model $(name)

controller:
	$(DOCKER_EXEC) php artisan make:controller $(name)

command:
	$(DOCKER_EXEC) php artisan make:command $(name)

migration:
	$(DOCKER_EXEC) php artisan make:migration $(name)

seeder:
	$(DOCKER_EXEC) php artisan make:seeder $(name)

route-list:
	$(DOCKER_EXEC) php artisan route:list $(name)

route-list-api:
	$(DOCKER_EXEC) php artisan route:list --path=api $(name)

migrate:
	$(DOCKER_EXEC) php artisan migrate

migrate-rollback:
	$(DOCKER_EXEC) php artisan migrate:rollback

migrate-fresh:
	$(DOCKER_EXEC) php artisan migrate:fresh --seed

migrate-status:
	$(DOCKER_EXEC) php artisan migrate:status

seed:
	$(DOCKER_EXEC) php artisan db:seed

composer-install:
	$(DOCKER_EXEC) composer install

app-key:
	$(DOCKER_EXEC) php artisan key:generate