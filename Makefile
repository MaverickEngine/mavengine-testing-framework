start:
	docker-compose up -d --build

healthcheck:
	docker-compose run --rm healthcheck

down:
	docker-compose down

install: start healthcheck

configure:
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm wp-auto-config

autoinstall: start
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm wp-auto-config

data: start
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm mysql-auto-data

content: start
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --build --rm wp-auto-content

playwright: start
	docker-compose -f docker-compose.yml -f wp-test.yml run --build --rm playwright

clean: down
	docker-compose down --volumes
	@echo "💥 Removing related folders/files..."
	@rm -rf  mysql/* wordpress/*
	@echo "Copying plugins..."
	@mkdir -p wordpress/wp-content/plugins
	@cp -r plugins/* wordpress/wp-content/plugins
	@echo "Copying themes..."
	@mkdir -p wordpress/wp-content/themes
	@cp -r themes/* wordpress/wp-content/themes

reset: clean

test: start
	docker-compose -f docker-compose.yml run --rm cypress