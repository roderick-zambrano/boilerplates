# Kanboard

For more infromation, refer to the documentation for the `itzg/minecraft-server` container.

## Image

The image is the latest kanboard image available. Plugins can be enabled by setting the environment variable `PLUGIN_INSTALLER=true`.

The settings on this configuration allow for the creation of a simple Kanboard instance with persistent storage by using a database.

## Server Configurations

The ports used by default are 80 and 443. Port 80 is accessible, but only the port 443 successfully allows logging into the instances with a username.
The default administrative user is `admin` with the password being `admin` as well. Through this account, new users can be created with their respective username and password.
It is recommended to give lesser permissions to new accounts and also to change the default admin password to a stronger one.