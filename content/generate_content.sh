#!/bin/sh
echo "Loading fixtures"

# This script is used to generate the content for the WordPress site.
wp package install https://github.com/MaverickEngine/wp-cli-fixtures/archive/refs/heads/main.zip
wp fixtures delete
wp fixtures load --file=/data/fixtures.yml