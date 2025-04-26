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

### Logging

You can configure logging of Stream connections by adding a `log_format` directive and a respective `access_log` directive. This can be done for streams as a whole through the nginx.conf or it can be done individually per stream.

### Manual Blocklist

If necessary, you can add a custom deny list by creating a .conf file with respective `deny` directives to block IPs from accessing a respective service. See nginx `ngx_http_access_module` documentation for more information on syntax and usage.

### SSL Certificate Sharing

If you are generating SSL certificates with SWAG and need to share them, it might be a little tricky due to the fact that the same /config directory in which the majority of the relevant data exists also includes the certificates. However, we can create a post cert renewal-hook that copies these files into another location so that we can simply share those in read-only format for other containers that might directly need the certificate files. The hooks directory is found in `/config/etc/letsencrypt/renewal-hooks/post/`

```sh
#!/usr/bin/with-contenv bash
# shellcheck shell=bash


CERT_SRC="/config/etc/letsencrypt/live/domain.name"
CERT_DEST="/shared-certs"

cp "${CERT_SRC}/fullchain.pem" "${CERT_DEST}/"
cp "${CERT_SRC}/privkey.pem" "${CERT_DEST}/"
```

This post-hook will copy the files from the standard folder where the certificates are created onto the directory mapped to a volume for sharing purposes.
