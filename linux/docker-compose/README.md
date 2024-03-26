# Docker Compose Files

The following collection of directories host files meant to be functional states of configurations for multiple docker containers.

These configurations are mainly stored in `TOML` format, so every directory will have a respective `config.toml` file, but they are subsequently converted into `docker-compose.yml` files with a format converter.

This makes configuration easier to read and modify, while enabling them to be used with docker compose.

These compose files are meant to facilitate Stack creation in any service that may benefit from using docker compose.

Some directories might include additional files required for setup, be it ENV files with examples, or assistive scripts, among other things.

## Notes

To share a host system's localtime, bind a volume for `/etc/localtime:/etc/localtime`. In some cases, for example images based on musl-libc, setting `TZ: "America/Panama"` is required.

### Network

Manually setting docker networks can be very helpful when two or more containers are supposed to communicate with each other. Through docker compose, a container or specific service within a compose file can be linked to a network. By using a top-level "networks", the entire stack (elements within the same docker compose file) will be within reach of the network, but only when including such networks under a specific container's "networks" list will a respective container actually gain direct access to said network.

To keep a bit of a standard and to differentiate hostnames/container names from network names, all network names will include underscores instead of hyphens.

## TOML Reference

TODO: TOML to YAML visual conversion guide
