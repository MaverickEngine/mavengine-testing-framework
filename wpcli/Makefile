install: configure plugins theme

configure:

	@echo "⚙️ Configuring Wordpress parameters..."
	wp core install \
		--url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
		--title="$(WORDPRESS_WEBSITE_TITLE)" \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL}

	wp option update siteurl ${WORDPRESS_WEBSITE_URL}
	wp rewrite structure $(WORDPRESS_WEBSITE_POST_URL_STRUCTURE)

plugins:

	@echo "🔌 Installing standard plugins..."
	@for plugin in "classic-editor fakerpress query-monitor"; do \
		wp plugin install $$plugin --activate; \
	done
	@echo "🔌 Plugins installed"
	@wp plugin list
	@echo "🔌 Activating plugins..."
	@for plugin in $(WORDPRESS_PLUGINS); do \
		wp plugin activate $$plugin; \
	done

theme:

	@echo "🔌 Installing theme..."
	@wp theme activate $(WORDPRESS_THEME)
	@echo "🔌 Theme installed"