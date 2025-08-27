# Docker Compose Files

The following collection of directories host files meant to be functional states of configurations for multiple docker containers.

These configurations are mainly stored in `TOML` format, so every directory will have a respective `config.toml` file, but they are subsequently converted into `docker-compose.yml` files with a format converter.

This makes configuration easier to read and modify, while enabling them to be used with docker compose.

These compose files are meant to facilitate Stack creation in any service that may benefit from using docker compose.

Some directories might include additional files required for setup, be it ENV files with examples, or assistive scripts, among other things.

## Notes

To share a host system's localtime, bind a volume for `/etc/localtime:/etc/localtime`. In some cases, for example images based on musl-libc, setting `TZ: "America/Panama"` is required instead.

### Network

Manually setting docker networks can be very helpful when two or more containers are supposed to communicate with each other. Through docker compose, a container or specific service within a compose file can be linked to a network. By using a top-level "networks", the entire stack (elements within the same docker compose file) will be within reach of the network, but only when including such networks under a specific container's "networks" list will a respective container actually gain direct access to said network.

To keep a bit of a standard and to differentiate hostnames/container names from network names, all network names will include underscores instead of hyphens.

To create an external network, the following command can be used:

```
docker network create -d bridge --attachable network_name
```

### Persistent Storage and Volumes

It is recommended that docker volumes are used instead of static bind mounts, but in case volume data needs to be copied to another location instead of the local docker volume storage directory, the following command can be used to extract the data stored in a volume and compress it into a tarball.

```
docker run --rm --volumes-from container-name -v $(pwd):/backup busybox tar cvf /backup/compressed.tar target_path_in_container
```

It is important to note that the tarball will hold the original directory structure found inside of the container, and it will be reflected just the same upon extraction.

To extract a volume compressed into a tarball, the following command can be used:

```
docker run --rm --volumes-from container-name -v $(pwd):/backup busybox sh -c "cd /backup && tar xvf /backup/compressed.tar --strip 1"
```

### Log Errors

If logs show the following error:
```
error from daemon in stream: Error grabbing logs: invalid character ‘\x00’ looking for beginning of value
```
The log file is probably corrupted. You can simply rebuild the container to overwrite the log file.

## Private Registries

Some services such as watchtower or Dockge that you may use to pull an image from private repositories or repositories that require authentication will fail until you configure authentication for them. To solve this issue, try using these suggested commands in your host machine:

```
TOKEN=GenerateFreshPATForThis
echo "$TOKEN" | docker login private.registry.com -u target_username --password-stdin
```

This creates a `/home/user/.docker/config.json` file that can then be bound as a readonly volume/file into the containers that require it. Make sure to check the documentation of the service or app you're hosting to set it up correctly.

## Container Permission Errors

Sometimes, some containers might show issues regarding writing to a file within the container itself. These are things to do to check possible causes:

- Validate if the container needs a mapped volume and if the mapping exists.
- Validate the permissions so that the container can r/w/rw as needed.
- Reload the docker service and restart it. `systemctl reload docker && systemctl restart docker`
- Reload the systemctl daemon. `systemctl daemon-reload`


## TOML Reference

TODO: TOML to YAML visual conversion guide
