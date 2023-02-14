# Adding local plugins

If you want to add a plugin that is not available in the official plugin repository, you can add it to your local plugin directory. 

Then add the plugin to **WORDPRESS_PLUGINS** line in the .env file, space-separated, to auto-activate them when the Docker instance starts.

`WORDPRESS_PLUGINS="dailymaverick-plugin summary-engine"`