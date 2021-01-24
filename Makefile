default: install db open

install:
	docker-compose build
	docker-compose up -d
	sleep 5
	docker-compose exec php composer install
	docker-compose exec php bin/console assets:install --symlink public/

db:
	docker-compose exec php php bin/console doctrine:schema:create
	docker-compose exec php php bin/console doctrine:fixtures:load -n

open:
	open http://localhost:8080/
	open http://localhost:8081/

start: up
up:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

rebuild:
	docker-compose stop
	docker-compose up -d
	sleep 5
	make db
