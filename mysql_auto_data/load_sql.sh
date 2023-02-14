#!/bin/sh

for filename in /data/*.sql; do
    echo "Loading $filename"
    echo "mysql -u $WORDPRESS_DB_USER -p $WORDPRESS_DB_PASSWORD -h $WORDPRESS_DB_HOST $WORDPRESS_DB_NAME < $filename"
    mysql -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -h"$WORDPRESS_DB_HOST" $WORDPRESS_DB_NAME < "$filename"
done

echo "Done loading SQL files"