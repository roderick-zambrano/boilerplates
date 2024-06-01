# YJ Container

This container is being listed here for personal reference purposes. Since config files are written in TOML format due to personal preference but the Docker compose standard is of YAML configuration files, this application is incredibly useful.

## Usage

The recommended usage for this application is the following:

```bash
docker run --rm -i sclevine/yj -ty < origin-toml-file.toml > target-yaml-file.yml
```

Upon execution, this spins up a single-run, temporary `sclevine/yj` container with the `-ty` flag, which will take a TOML file as input and output it as a YAML file. After the process is completed, the container is deleted due to the included `--rm` flag for docker. Note: Since the program requires STDIN, the `-i` docker flag is used.

To simplify calling this process, and in a standard form, it is possible to create a predetermined `bash` function using the line above to abbreviate the process into a single call, such as `ty` for example.

An example of such `bash` function is the following:


```bash
ty() {
    default_config_file=${1:-config.toml}
    docker run --rm -i sclevine/yj -ty < ${1:-$default_config_file} > docker-compose.yml
}
# Take any config.toml file in the current directory and convert it to yaml.
# Optional parameter: toml file with a different name
```

On the other hand,

```bash
yt() {
    default_compose_file=${1:-docker-compose.yml}
    docker run --rm -i sclevine/yj -yt < ${1:-$default_compose_file} > decomposed.toml
}
# Take any docker-compose file in the current directory and convert it to TOML.
# Optional parameter: yml file with a different name
```

This can be added to `~/.bashrc` to be called upon from anywhere with your local user.
