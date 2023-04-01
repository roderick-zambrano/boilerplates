# Docker Compose Files

The following collection of directories host files meant to be functional states of configurations for multiple docker containers.

These configurations are mainly stored in `TOML` format, so every directory will have a respective `config.toml` file, but they are subsequently converted into `docker-compose.yml` files with a format converter.

This makes configuration easier to read and modify, while enabling them to be used with docker compose.

These compose files are meant to facilitate Stack creation in Portainer.

Some directories might include additional files required for setup, be it ENV files with examples, or assistive scripts, among other things.

# TOML Reference

TODO: TOML to YAML visual converstion guide