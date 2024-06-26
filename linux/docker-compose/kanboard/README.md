# Kanboard

Kanban project management.

## Requirements

## Setup

## Configuration

## Notes

The default administrative user is `admin` with the password being `admin` as well. Through this account, new users can be created with their respective username and password. It is recommended to give lesser permissions to new accounts and also to change the default admin password to a stronger one upon first run.

Plugins can be enabled by setting the environment variable `PLUGIN_INSTALLER=true`.

The settings on this configuration allow for the creation of a simple Kanboard instance with persistent storage by using a database.

The ports used by default are 80 and 443. Port 80 is accessible, but only the port 443 successfully allows logging into the instances at all with a username.

To set up SMTP, you need to create a "config.php" file in the `data` volume. Instructions are in the official documentation. SMTP is the only option for the container version of Kanboard. Just in case, config.php must begin with <?php as PHP files must.
