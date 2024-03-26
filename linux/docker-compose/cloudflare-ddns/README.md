# Cloudflare-DDNS

Simple Cloudflare DDNS service to update CNAME records in Cloudflare

## Server Configurations

Due to limitations (or a lack of knowledge on how to do this) regarding volumes, an external volume was created to host the config file, which is meant to be found in the root directory of the container. This is why a `bind` mount is used, to copy the details of the externally-defined config.json file into the container.
