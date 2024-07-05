# EpicGames Free Games Node

## Requirements

- Cloudflare Account
  - Email
  - App API Token
  - Domain name
- Small amount of storage

## Setup

If the configuration file is set correctly and in the right location, the logs will show a login link. Follow this to log into your account.
Make sure that a persistent volume exists where the container can store login session information.

## Configuration


## Notes

ConfigMap cannot be used due to it sharing directory with the login session storage, since ConfigMap mapping turns the mapped volume into ReadOnly. Since the login session information is stored in said directory, the expected config.json file is simply provided as well.
