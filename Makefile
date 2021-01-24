default: install db

install:
	docker-compose build
	docker-compose up -d
	sleep 5
	docker-compose exec php composer install
	docker-compose exec php php bin/console assets:install \–symlink public/

db:
	docker-compose exec php php bin/console doctrine:schema:create
	docker-compose exec php php bin/console doctrine:fixtures:load

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
