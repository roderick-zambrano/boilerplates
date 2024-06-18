# SWAG

## Requirements

- Cloudflare account (if DNS through Cloudflare)
- Knowledge of Cloudflare API auth (global or scoped)
- Cloudflare Tokens (might need multiple)
- Knowledge of Fail2Ban configuration
- Knowledge of Nginx configuration


## Setup

This setup assumes that the certificate challenge is DNS, through Cloudflare. It also assumes that Fail2Ban is used through blocking in Cloudflare as well.

1. Set up the initial environment variables
2. Run the container for the first time
3. Find relevant .ini file in dns-conf directory and supply the necessary information (token, credentials, emails, etc)
4. Validate file permissions to 600
5. Configure fail2ban
  - Review default configuration/customize to your preference
  - Review available filters/customize your own filters
  - Review available actions/customize your own actions
6. Customize default nginx host/configure custom proxy hosts

## Configuration

## Notes
