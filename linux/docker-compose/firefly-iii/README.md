# Firefly III

## Requirements


## Setup

These steps presume a 4-container stack.

For the core container:
1. Generate a secure APP_KEY
2. Make sure that you set up the correct vaules corresponding to the DB container
  - DB_CONNECTION
  - DB_HOST
  - DB_PORT
  - DB_DATABASE
  - DB_USERNAME
  - DB_PASSWORD
3. Generate a secure STATIC_CRON_TOKEN corresponding to the cron container
4. Match APP_ENV to importer container

For the DB container:
1. Match variables with values defined in core container
  - MYSQL_USER
  - MYSQL_PASSWORD
  - MYSQL_DATABASE

For the importer container
1. FIREFLY_III_URL should match stack name/hostname/container name
2. Match APP_ENV to core container

For the cron container
1. In the command, make sure that the API call token matches the STATIC_CRON_TOKEN in the core container.
NOTE: Escape the `"` accordingly in the cron job format, the `\"` are required.

## Configuration

## Notes

To test that the CRON container is successfully configured, you can run the following command with your own static CRON token:

```
wget -qO- http://firefly-core:8080/api/v1/cron/STATIC_CRON_TOKENValue
```

This enables recurring transactions to function as expected.

Some mobile apps exist that require the generation of tokens within the core app. this can be done through the UI in your Account Settings.
