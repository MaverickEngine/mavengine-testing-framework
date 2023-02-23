# MavEngine Docker Environment

Quicky start a Wordpress environment for testing MavEngine plugins against the Daily Maverick website.

## Quick Start

```bash
make clean          # Remove all containers and volumes, prepare wp-content directory
make autoinstall    # Install Wordpress and all the plugins and themes, create admin user
make data           # Install any data in the /data directory
make content        # Generate fake content for the website
make playwright     # Run the test suite
```

## Requirements

1. Docker
2. Docker Compose
3. GNU Make

## Usage

### .env

The `.env` file contains the following variables:

- COMPOSE_PROJECT_NAME: The name of the project. This will be used as the database name. It must be lower-case, no spaces and no invalid path chars.
- DATABASE_PASSWORD: The password for the database user. (Default: password)
- DATABASE_USER: The username for the database user. (Default: root)
- WORDPRESS_WEBSITE_TITLE: The title of the website.
- WORDPRESS_WEBSITE_URL: The URL of the website. (Default: http://localhost:8080)
- WORDPRESS_WEBSITE_URL_WITHOUT_HTTP: The URL of the website without the http:// prefix. (Default: localhost:8080)
- WORDPRESS_WEBSITE_POST_URL_STRUCTURE: The URL structure for posts. (Default: /blog/%postname%/)
- WORDPRESS_ADMIN_USER: The username for the admin user. (Default: admin)
- WORDPRESS_ADMIN_PASSWORD: The password for the admin user. (Default: admin)
- WORDPRESS_ADMIN_EMAIL: The email address for the admin user. (Default: info@mavengine.com)
- WORDPRESS_VERSION: The version of Wordpress to use. (Default: 6.1.1-php8.1-apache)
- MARIADB_VERSION: The version of MariaDB to use. (Default: latest)
- PHPMYADMIN_VERSION: The version of phpMyAdmin to use. (Default: latest)
- PHPMYADMIN_PORT: The port to use for phpMyAdmin. (Default: 8181)
- WORDPRESS_PORT: The port to use for Wordpress. (Default: 8080)
- WORDPRESS_DATA_DIR: The directory to use for the Wordpress data. (Default: ./wordpress)
- WAIT_BEFORE_HOSTS: The number of seconds to wait before checking if the Wordpress and MariaDB containers are running. (Default: 5)
- WAIT_AFTER_HOSTS: The number of seconds to wait after checking if the Wordpress and MariaDB containers are running. (Default: 5)
- WAIT_HOSTS_TIMEOUT: The number of seconds to wait for the Wordpress and MariaDB containers to start. (Default: 300)
- WAIT_SLEEP_INTERVAL: The number of seconds to wait between checks to see if the Wordpress and MariaDB containers are running. (Default: 10)
- WAIT_HOST_CONNECT_TIMEOUT: The number of seconds to wait for a connection to the Wordpress and MariaDB containers. (Default: 5)
- WORDPRESS_PLUGINS: A list of plugins to install, separated by spaces. If they are not in the `/plugins` directory, they will be downloaded from the Wordpress plugin repository.
- WORDPRESS_ARTICLES: The number of articles to generate.
- WORDPRESS_READERS: The number of readers to generate.
- WORDPRESS_AUTHORS: The number of authors to generate.
- WORDPRESS_THEME: The Wordpress theme to activate. If it is not in the `/themes` directory, it will be downloaded from the Wordpress theme repository.

### Makefile

The Makefile contains a number of commands to help you get started.

#### make clean

This will remove all containers and volumes. It also prepares the `wp-content` directory for a fresh install with themes from the `/themes` directory and plugins from the `/plugins` directory. Place any themes and plugins you want to test in the `/themes` and `/plugins` directories respectively.

#### make autoinstall

This will install Wordpress and all the plugins and themes in the `/plugins` and `/themes` directories respectively.

#### make data

This installs any data in the `/data` directory into the database. The files need to be *.sql files. The files will be imported in alphabetical order.

#### make content

This will generate content for the website. It will generate the number of articles, readers and authors specified in the `.env` file.

### make playwright

This will run the test suite using Playwright. The test suite is located in the `/tests/playwright` directory.

## Accessing Wordpress from the host machine

You need to add `wordpress` (or whatever value you assigned to the Wordpress site) to your /etc/hosts file. The IP address is 127.0.0.1. You can then access Wordpress at http://wordpress.

```
127.0.0.1 wordpress
```

## Accessing phpMyAdmin from the host machine

You can access phpMyAdmin at http://localhost:8181. The default username is `root` and the default password is `password`.