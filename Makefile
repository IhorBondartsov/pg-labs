DB_USER ?= postgres
DB_PASSWORD ?= changeme
DB_HOST ?= localhost
DB_PORT ?= 5432

# DATABASE
recreate_database:
	psql postgresql://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/postgres -f ./course/higher_education_institution.sql

add_data_to_database:
	psql postgresql://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/postgres -f ./course/insert.sql

# DOCKER
dc-postgres:
	docker-compose -f postgre.yaml up --build

dc-down:
	docker-compose -f postgre.yaml  down

#
docker_compose_restart: dc-down dc-postgres recreate_database

run_test:
	docker-compose -f postgre.yaml up --build -d
	make create_db_for_test
	make integration_test
	docker-compose -f postgre.yaml down



.PHONY: race_test build