# Nginx Proxy Manager

## Requirements

## Setup

Upon first run, you have to replace the default admin user and password. To do this, access the container through the external port mapped to :81.

## Configuration

## Notes

Every proxied host must be online for the container to start if it has been stopped. Without being able to reach a host, NPM will fail launching the nginx server, which looks like a loop that says "Starting nginx...", followed by the host causing the error when it is not found. If an entry is disabled however, this check will not fail or block the container from starting.

### LetsEncrypt

To enable SSL Certificates, you must successfully log into the Admin Panel and select the SSL Certificates page. Look up who is your DNS Provider and look up the respective instructions to let Nginx Proxy Manager handle the SSL Certificates through it. In Cloudflare for example, an API Key with `Zone DNS:Edit` permission is required, and the domain must be pointing to the external port mapped to :80 for this container. That way, the configuration done in the Admin Panel of port 81 can check if it succeeds to confirm correct setup.
